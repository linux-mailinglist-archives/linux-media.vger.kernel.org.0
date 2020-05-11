Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FB31CE0D5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 18:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgEKQni convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 12:43:38 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:42981 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbgEKQni (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 12:43:38 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5F4CC200003;
        Mon, 11 May 2020 16:43:34 +0000 (UTC)
Date:   Mon, 11 May 2020 18:43:33 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] nand: brcmnand: correctly verify erased pages
Message-ID: <20200511184333.20d5a560@xps13>
In-Reply-To: <20200505082055.2843847-1-noltari@gmail.com>
References: <20200504092943.2739784-1-noltari@gmail.com>
        <20200505082055.2843847-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Álvaro,

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Tue,  5 May 2020
10:20:55 +0200:

> The current code checks that the whole OOB area is erased.
> This is a problem when JFFS2 cleanmarkers are added to the OOB, since it will
> fail due to the usable OOB bytes not being 0xff.
> Correct this by only checking that the ECC aren't 0xff.
> 
> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
> 

This extra space between the Fixes tag and your SoB should be removed

> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v2: Add Fixes tag
> 
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index e4e3ceeac38f..546f0807b887 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2018,6 +2018,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>  static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>  		  struct nand_chip *chip, void *buf, u64 addr)
>  {
> +	struct mtd_oob_region oobecc;
>  	int i, sas;
>  	void *oob = chip->oob_poi;
>  	int bitflips = 0;
> @@ -2035,11 +2036,24 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>  	if (ret)
>  		return ret;
>  
> -	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
> +	for (i = 0; i < chip->ecc.steps; i++) {
>  		ecc_chunk = buf + chip->ecc.size * i;
> -		ret = nand_check_erased_ecc_chunk(ecc_chunk,
> -						  chip->ecc.size,
> -						  oob, sas, NULL, 0,
> +
> +		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
> +						  NULL, 0, NULL, 0,
> +						  chip->ecc.strength);
> +		if (ret < 0)
> +			return ret;
> +
> +		bitflips = max(bitflips, ret);
> +	}
> +
> +	for (i = 0; mtd->ooblayout->ecc(mtd, i, &oobecc) != -ERANGE; i++)
> +	{
> +		ret = nand_check_erased_ecc_chunk(NULL, 0,
> +						  oob + oobecc.offset,
> +						  oobecc.length,
> +						  NULL, 0,
>  						  chip->ecc.strength);
>  		if (ret < 0)
>  			return 

If I understand correctly, the cleanmarker is in the "available OOB
area", which is somewhere in the OOB area between the bad block marker
and the ECC bytes. I think that checking the data buffer and the ECC
area only is enough and we can probably leave the remaining spare OOB
area.

But instead of calling nand_check_erased_ecc_chunk twice, just call:

    nand_check_erased_ecc_chunk(data, datalen, ecc, ecclen, NULL, 0,
                                strength); 

And also please clarify your commit log: you are not "just checking the
ECC bytes" but you are checking both the main area and the ECC bytes.


Thanks,
Miquèl
