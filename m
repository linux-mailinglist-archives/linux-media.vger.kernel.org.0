Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EC91CEE5C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgELHlU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 May 2020 03:41:20 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:59683 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgELHlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:41:20 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2440920000F;
        Tue, 12 May 2020 07:41:13 +0000 (UTC)
Date:   Tue, 12 May 2020 09:41:12 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob
 layout
Message-ID: <20200512094112.0b9c3403@xps13>
In-Reply-To: <461FD58F-ACD5-4158-BC0B-8C73C53D5C0D@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
        <20200512060023.684871-1-noltari@gmail.com>
        <20200512060023.684871-3-noltari@gmail.com>
        <20200512090844.21bcaf22@xps13>
        <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
        <20200512091958.0d153319@xps13>
        <461FD58F-ACD5-4158-BC0B-8C73C53D5C0D@gmail.com>
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
09:26:23 +0200:

> Hi Miquèl,
> 
> > El 12 may 2020, a las 9:19, Miquel Raynal <miquel.raynal@bootlin.com> escribió:
> > 
> > Hi Álvaro,
> > 
> > Álvaro Fernández Rojas <noltari@gmail.com> wrote on Tue, 12 May 2020
> > 09:12:10 +0200:
> >   
> >> Hi Miquel,
> >> 
> >> I also had a hard time understanding your email.
> >> It was quite misleading.
> >>   
> >>> El 12 may 2020, a las 9:08, Miquel Raynal <miquel.raynal@bootlin.com> escribió:
> >>> 
> >>> Hi Álvaro,
> >>> 
> >>> Álvaro Fernández Rojas <noltari@gmail.com> wrote on Tue, 12 May 2020
> >>> 08:00:23 +0200:
> >>>   
> >>>> The current code generates 8 oob sections:
> >>>> S1	1-5
> >>>> ECC	6-8
> >>>> S2	9-15
> >>>> S3	16-21
> >>>> ECC	22-24
> >>>> S4	25-31
> >>>> S5	32-37
> >>>> ECC	38-40
> >>>> S6	41-47
> >>>> S7	48-53
> >>>> ECC	54-56
> >>>> S8	57-63
> >>>> 
> >>>> Change it by merging continuous sections:
> >>>> S1	1-5
> >>>> ECC	6-8
> >>>> S2	9-21
> >>>> ECC	22-24
> >>>> S3	25-37
> >>>> ECC	38-40
> >>>> S4	41-53
> >>>> ECC	54-56
> >>>> S5	57-63
> >>>> 
> >>>> Fixes: ef5eeea6e911 ("mtd: nand: brcm: switch to mtd_ooblayout_ops")    
> >>> 
> >>> Sorry for leading you the wrong way, actually this patch does not
> >>> deserve a Fixes tag.    
> >> 
> >> Do I need to resend this again?
> >> Looks like no matter what I do it’s always wrong...  
> > 
> > Please don't give up! It is normal to work back and forth with the
> > community. I need the patch to be clear and bug-free so I ask you to
> > make changes and ask questions, that's how it works. But all your
> > patches are enhancing this driver so please keep posting!
> >   
> >>   
> >>>   
> >>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> >>>> ---
> >>>> v3: invert patch order
> >>>> v2: keep original comment and fix correctly skip byte 6 for small-page nand
> >>>> 
> >>>> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 37 ++++++++++++------------
> >>>> 1 file changed, 18 insertions(+), 19 deletions(-)
> >>>> 
> >>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>>> index 1c1070111ebc..0a1d76fde37b 100644
> >>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>>> @@ -1100,33 +1100,32 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
> >>>> 	struct brcmnand_cfg *cfg = &host->hwcfg;
> >>>> 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
> >>>> 	int sectors = cfg->page_size / (512 << cfg->sector_size_1k);
> >>>> +	u32 next;
> >>>> 
> >>>> -	if (section >= sectors * 2)
> >>>> +	if (section > sectors)
> >>>> 		return -ERANGE;
> >>>> 
> >>>> -	oobregion->offset = (section / 2) * sas;
> >>>> +	next = (section * sas);
> >>>> +	if (section < sectors)
> >>>> +		next += 6;
> >>>> 
> >>>> -	if (section & 1) {
> >>>> -		oobregion->offset += 9;
> >>>> -		oobregion->length = 7;
> >>>> +	if (section) {
> >>>> +		oobregion->offset = ((section - 1) * sas) + 9;
> >>>> 	} else {
> >>>> -		oobregion->length = 6;
> >>>> -
> >>>> -		/* First sector of each page may have BBI */
> >>>> -		if (!section) {
> >>>> -			/*
> >>>> -			 * Small-page NAND use byte 6 for BBI while large-page
> >>>> -			 * NAND use bytes 0 and 1.
> >>>> -			 */
> >>>> -			if (cfg->page_size > 512) {
> >>>> -				oobregion->offset += 2;
> >>>> -				oobregion->length -= 2;
> >>>> -			} else {
> >>>> -				oobregion->length--;
> >>>> -			}
> >>>> +		/*
> >>>> +		 * Small-page NAND use byte 6 for BBI while large-page
> >>>> +		 * NAND use bytes 0 and 1.
> >>>> +		 */
> >>>> +		if (cfg->page_size > 512) {
> >>>> +			oobregion->offset = 2;
> >>>> +		} else {
> >>>> +			oobregion->offset = 0;
> >>>> +			next--;    
> >>> 
> >>> This next-- seems very strange, can you explain?    
> >> 
> >> In this case next will be 6 (which is the first ECC byte).
> >> However, for small page NANDs byte 5 is reserved for BBT, so we want next to be 5 only in this case.  
> > 
> > That's clear, please add a comment there then.  
> 
> Isn’t “Small-page NAND use byte 6 for BBI while large-page NAND use bytes 0 and 1.” enough?
> Do we really need a specific comment before next--?

Given the time it took me to understand these lines, I'd say : "no" :)

Just give more information in your main comment, explaining than in one
case the reserved bytes are at the beginning (enlarging the offset)
while in the other case it is at the end, so reducing the section.

> 
> >   
> >>   
> >>>   
> >>>> 		}
> >>>> 	}
> >>>> 
> >>>> +	oobregion->length = next - oobregion->offset;
> >>>> +
> >>>> 	return 0;
> >>>> }
> >>>>   
> >>> 
> >>> 
> >>> Thanks,
> >>> Miquèl    
> >> 
> >> Regards,
> >> Álvaro.  
> > 
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
