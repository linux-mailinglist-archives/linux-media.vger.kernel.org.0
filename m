Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91B11CE088
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 18:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgEKQeJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 12:34:09 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41663 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbgEKQeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 12:34:09 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D7F1F20009;
        Mon, 11 May 2020 16:34:02 +0000 (UTC)
Date:   Mon, 11 May 2020 18:34:01 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] nand: brcmnand: improve hamming oob layout
Message-ID: <20200511183401.2ef8b037@xps13>
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
        <20200504185945.2776148-1-noltari@gmail.com>
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

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Mon,  4 May 2020
20:59:44 +0200:

> The current code generates 8 oob sections:
> S1	1-5
> ECC	6-8
> S2	9-15
> S3	16-21
> ECC	22-24
> S4	25-31
> S5	32-37
> ECC	38-40
> S6	41-47
> S7	48-53
> ECC	54-56
> S8	57-63
> 
> Change it by merging continuous sections:
> S1	1-5
> ECC	6-8
> S2	9-21
> ECC	22-24
> S3	25-37
> ECC	38-40
> S4	41-53
> ECC	54-56
> S5	57-63
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v2: keep original comment and fix correctly skip byte 6 for small-page nand
> 
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 34 +++++++++++++-----------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index e4e3ceeac38f..767343e0e6e7 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -1100,30 +1100,32 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
>  	struct brcmnand_cfg *cfg = &host->hwcfg;
>  	int sas = cfg->spare_area_size << cfg->sector_size_1k;
>  	int sectors = cfg->page_size / (512 << cfg->sector_size_1k);
> +	u32 next;
>  
> -	if (section >= sectors * 2)
> +	if (section > sectors)
>  		return -ERANGE;
>  
> -	oobregion->offset = (section / 2) * sas;
> +	next = (section * sas);
> +	if (section < sectors)
> +		next += 6;
>  
> -	if (section & 1) {
> -		oobregion->offset += 9;
> -		oobregion->length = 7;
> +	if (section) {
> +		oobregion->offset = ((section - 1) * sas) + 9;
>  	} else {
> -		oobregion->length = 6;
> -
> -		/* First sector of each page may have BBI */
> -		if (!section) {
> -			/*
> -			 * Small-page NAND use byte 6 for BBI while large-page
> -			 * NAND use byte 0.
> -			 */
> -			if (cfg->page_size > 512)
> -				oobregion->offset++;
> -			oobregion->length--;
> +		/*
> +		 * Small-page NAND use byte 6 for BBI while large-page
> +		 * NAND use byte 0.
> +		 */
> +		if (cfg->page_size > 512) {
> +			oobregion->offset = 1;
> +		} else {
> +			oobregion->offset = 0;
> +			next--;
>  		}
>  	}
>  
> +	oobregion->length = next - oobregion->offset;
> +
>  	return 0;
>  }
>  

I'm fine with the two patches but could you please invert the order and
add Fixes: + Cc: stable tags on both? on "fix hamming oob layout"
please? This way the fix is valid on older versions of the driver an
can be backported easily.

Thanks,
Miquèl
