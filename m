Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2C31CEE34
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgELHe7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 May 2020 03:34:59 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:16017 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729166AbgELHe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:34:58 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 89D90240013;
        Tue, 12 May 2020 07:34:52 +0000 (UTC)
Date:   Tue, 12 May 2020 09:34:51 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased
 pages
Message-ID: <20200512093451.4cde5384@xps13>
In-Reply-To: <50E32C0E-7485-4180-A072-F7F1CFB45B06@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
        <20200512065111.716801-1-noltari@gmail.com>
        <20200512091637.198dd0c2@xps13>
        <50E32C0E-7485-4180-A072-F7F1CFB45B06@gmail.com>
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

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Tue, 12 May 2020
09:24:32 +0200:

> Hi Miquèl
> 
> > El 12 may 2020, a las 9:16, Miquel Raynal <miquel.raynal@bootlin.com> escribió:
> > 
> > Hi Álvaro,
> > 
> > Álvaro Fernández Rojas <noltari@gmail.com> wrote on Tue, 12 May 2020
> > 08:51:11 +0200:
> >   
> >> The current code checks that the whole OOB area is erased.
> >> This is a problem when JFFS2 cleanmarkers are added to the OOB, since it will
> >> fail due to the usable OOB bytes not being 0xff.
> >> Correct this by only checking that data and ECC bytes aren't 0xff.
> >> 
> >> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
> >> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> >> ---
> >> v3: Fix commit log and merge nand_check_erased_ecc_chunk calls.
> >> v2: Add Fixes tag
> >> 
> >> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 19 ++++++++++++++-----
> >> 1 file changed, 14 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >> index e4e3ceeac38f..80fe01f03516 100644
> >> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >> @@ -2018,8 +2018,9 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
> >> static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
> >> 		  struct nand_chip *chip, void *buf, u64 addr)
> >> {
> >> +	struct mtd_oob_region oobecc;
> >> 	int i, sas;
> >> -	void *oob = chip->oob_poi;
> >> +	void *oob;
> >> 	int bitflips = 0;
> >> 	int page = addr >> chip->page_shift;
> >> 	int ret;
> >> @@ -2035,11 +2036,19 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
> >> 	if (ret)
> >> 		return ret;
> >> 
> >> -	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
> >> +	for (i = 0; i < chip->ecc.steps; i++) {
> >> 		ecc_chunk = buf + chip->ecc.size * i;
> >> -		ret = nand_check_erased_ecc_chunk(ecc_chunk,
> >> -						  chip->ecc.size,
> >> -						  oob, sas, NULL, 0,
> >> +
> >> +		if (mtd->ooblayout->ecc(mtd, i, &oobecc)) {  
> > 
> > Please use the mtdcore.c's helpers
> > (mtd_ooblayout_set/get_data/free/ecc/bytes).
> > 
> > Also, what are you trying to discriminate with the return code of the
> > function? Shouldn't this function "always" work?  
> 
> Just making sure it doesn’t return an ERANGE in case chip->ecc.size doesn’t match the sections from mtd->ooblayout->ecc, which shouldn’t happen, so I think we can remove that...

The style we prefer for error checking is:

	ret = function();
	if (ret)
		do someting;

instead of:

	if (function())

Anyway, I really don't know if it can happen or not. I suppose it does.
What I don't understand is your "oob = chip->oob_poi + oobecc.offset".
If you expect an error, then you should not update this pointer, right?

Don't you need to use 2 * i instead of i here? Following your other
contribution, sections are distributed like "data/ecc/data/ecc/etc".

> 
> >   
> >> +			oob = NULL;
> >> +			oobecc.length = 0;
> >> +		} else {
> >> +			oob = chip->oob_poi + oobecc.offset;
> >> +		}
> >> +
> >> +		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
> >> +						  oob, oobecc.length,
> >> +						  NULL, 0,
> >> 						  chip->ecc.strength);  
> > 
> > As I told you, this helper takes "maid data" then "spare area" then
> > "ecc bytes". The names are pretty important here as you want to avoid
> > checking the spare OOB bytes on purpose, so maybe you could have more
> > meaningful names and call "ecc" instead of "oob" the ecc region?  
> 
> Actually I thought you meant the commit log, not the code itself...

No problem ;) I meant both actually, And I think you should name the
oob pointer ecc_bytes.

> 
> >   
> >> 		if (ret < 0)
> >> 			return ret;  
> > 
> > 
> > Thanks,
> > Miquèl  
> 
> Regards,
> Álvaro.
> 




Thanks,
Miquèl
