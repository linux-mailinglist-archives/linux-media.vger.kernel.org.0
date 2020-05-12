Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523691CEF07
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 10:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgELIYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 04:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgELIYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 04:24:32 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8A0C061A0C;
        Tue, 12 May 2020 01:24:31 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id s9so10293394eju.1;
        Tue, 12 May 2020 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WZmVui63+MZYLGPVMsrYodiyTMhn5xAQUNHMSEpC2WI=;
        b=MfDT8qi45fn3WeCOk2o2t1xYrODuFq3GU+SCCBAWPM2h92+F0KrixpsWHdinUycHmp
         cpvfFmAD+jhqDkkHYWt5Q8cpPEtpVISDTn+fL0txmPjkOFCBhOzA0wcA7xEM///jyCPo
         uwm9RP8IhF+DrMIYEyho+wdOOP8Bp+dRlyrWozPG9P+y5mwanSSevRhmbr/Zcxm6ZCYM
         FG5nskHyavZGHLuX2BeFh1x1xuTXz9NsnKLG/IzAwrXKQ1J3sgROOq4fgIy4zzVWqp3a
         s3mfLkPWMs8+OTrvEBzEwmUog+hIMGUlfQuFbPgJKByrLRdTy95BMayQjTGNRuEujeOp
         Ughw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WZmVui63+MZYLGPVMsrYodiyTMhn5xAQUNHMSEpC2WI=;
        b=hyvqMms0FZyjNve0Nq1CoVGKho6lcS4K1Xu5m/NvT8voHNGE5OyJne0A82BhR3lrT4
         fWn/A9qwou8VIaUoR/NJ+9cd2l33EatpakX3EqXk2Erk1rLpCaxMgknNh7OZPN5JXnIu
         GHYY88jeOwD8ninR8n3XToBypGkLudw9b4aOI/+i7QO+2w/lEvMM5GO43sR2072Sj376
         3P3Q5exbjDyYCFIg064rmewzKyOC+C6R4quxc851PeEUzaqoLMgiJqeqCMWGr8OBCAbt
         DYbEur5kZX0gMRla3SgeshspIAYjUgh0TMQ+AA770A9P715391Fur+YTrJhuH+3RLceo
         Z5wA==
X-Gm-Message-State: AGi0PuZIAib1PLiZF8sCsCJ1C6eYGi01v2vKG/hZ270HgiHx9JuIcNsA
        QZrdO3edrOeZ2K1lPh1DARdg6kgOJjU81y3SfQ8=
X-Google-Smtp-Source: APiQypJ6waQrIqdkBNJiYUFTObsy0HOkI967DYuTmDn/95XvGxRe4QaE7sdEQou1ZWkFZkf4jCo6DOQgEKsAM3GPd/s=
X-Received: by 2002:a17:906:2799:: with SMTP id j25mr8522291ejc.369.1589271870256;
 Tue, 12 May 2020 01:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200505082055.2843847-1-noltari@gmail.com> <20200512065111.716801-1-noltari@gmail.com>
 <20200512091637.198dd0c2@xps13> <50E32C0E-7485-4180-A072-F7F1CFB45B06@gmail.com>
 <20200512093451.4cde5384@xps13>
In-Reply-To: <20200512093451.4cde5384@xps13>
From:   =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date:   Tue, 12 May 2020 10:24:16 +0200
Message-ID: <CAKR-sGe7OKYmjiPHK1eLO0P1nLoerMRm_OcUkt9Ay3GtFeTA=w@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        Vignesh R <vigneshr@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Miqu=C3=A8l,


El mar., 12 may. 2020 a las 9:34, Miquel Raynal
(<miquel.raynal@bootlin.com>) escribi=C3=B3:
>
> Hi =C3=81lvaro,
>
> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Tue, 12 May=
 2020
> 09:24:32 +0200:
>
> > Hi Miqu=C3=A8l
> >
> > > El 12 may 2020, a las 9:16, Miquel Raynal <miquel.raynal@bootlin.com>=
 escribi=C3=B3:
> > >
> > > Hi =C3=81lvaro,
> > >
> > > =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Tue, 12=
 May 2020
> > > 08:51:11 +0200:
> > >
> > >> The current code checks that the whole OOB area is erased.
> > >> This is a problem when JFFS2 cleanmarkers are added to the OOB, sinc=
e it will
> > >> fail due to the usable OOB bytes not being 0xff.
> > >> Correct this by only checking that data and ECC bytes aren't 0xff.
> > >>
> > >> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitfl=
ips")
> > >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > >> ---
> > >> v3: Fix commit log and merge nand_check_erased_ecc_chunk calls.
> > >> v2: Add Fixes tag
> > >>
> > >> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 19 ++++++++++++++-----
> > >> 1 file changed, 14 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/=
nand/raw/brcmnand/brcmnand.c
> > >> index e4e3ceeac38f..80fe01f03516 100644
> > >> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > >> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > >> @@ -2018,8 +2018,9 @@ static int brcmnand_read_by_pio(struct mtd_inf=
o *mtd, struct nand_chip *chip,
> > >> static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
> > >>              struct nand_chip *chip, void *buf, u64 addr)
> > >> {
> > >> +  struct mtd_oob_region oobecc;
> > >>    int i, sas;
> > >> -  void *oob =3D chip->oob_poi;
> > >> +  void *oob;
> > >>    int bitflips =3D 0;
> > >>    int page =3D addr >> chip->page_shift;
> > >>    int ret;
> > >> @@ -2035,11 +2036,19 @@ static int brcmstb_nand_verify_erased_page(s=
truct mtd_info *mtd,
> > >>    if (ret)
> > >>            return ret;
> > >>
> > >> -  for (i =3D 0; i < chip->ecc.steps; i++, oob +=3D sas) {
> > >> +  for (i =3D 0; i < chip->ecc.steps; i++) {
> > >>            ecc_chunk =3D buf + chip->ecc.size * i;
> > >> -          ret =3D nand_check_erased_ecc_chunk(ecc_chunk,
> > >> -                                            chip->ecc.size,
> > >> -                                            oob, sas, NULL, 0,
> > >> +
> > >> +          if (mtd->ooblayout->ecc(mtd, i, &oobecc)) {
> > >
> > > Please use the mtdcore.c's helpers
> > > (mtd_ooblayout_set/get_data/free/ecc/bytes).

Ok, I will use mtd_ooblayout_ecc function.

> > >
> > > Also, what are you trying to discriminate with the return code of the
> > > function? Shouldn't this function "always" work?
> >
> > Just making sure it doesn=E2=80=99t return an ERANGE in case chip->ecc.=
size doesn=E2=80=99t match the sections from mtd->ooblayout->ecc, which sho=
uldn=E2=80=99t happen, so I think we can remove that...
>
> The style we prefer for error checking is:
>
>         ret =3D function();
>         if (ret)
>                 do someting;
>
> instead of:
>
>         if (function())
>
> Anyway, I really don't know if it can happen or not. I suppose it does.
> What I don't understand is your "oob =3D chip->oob_poi + oobecc.offset".
> If you expect an error, then you should not update this pointer, right?

After switching to mtd_ooblayout_ecc, error checking isn't needed anymore.

>
> Don't you need to use 2 * i instead of i here? Following your other
> contribution, sections are distributed like "data/ecc/data/ecc/etc".

No, we're checking ECC bytes in the OOB, not about usable bytes in the
OOB area, which is what my other patch changes.

>
> >
> > >
> > >> +                  oob =3D NULL;
> > >> +                  oobecc.length =3D 0;
> > >> +          } else {
> > >> +                  oob =3D chip->oob_poi + oobecc.offset;
> > >> +          }
> > >> +
> > >> +          ret =3D nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.=
size,
> > >> +                                            oob, oobecc.length,
> > >> +                                            NULL, 0,
> > >>                                              chip->ecc.strength);
> > >
> > > As I told you, this helper takes "maid data" then "spare area" then
> > > "ecc bytes". The names are pretty important here as you want to avoid
> > > checking the spare OOB bytes on purpose, so maybe you could have more
> > > meaningful names and call "ecc" instead of "oob" the ecc region?
> >
> > Actually I thought you meant the commit log, not the code itself...
>
> No problem ;) I meant both actually, And I think you should name the
> oob pointer ecc_bytes.
>
> >
> > >
> > >>            if (ret < 0)
> > >>                    return ret;
> > >
> > >
> > > Thanks,
> > > Miqu=C3=A8l
> >
> > Regards,
> > =C3=81lvaro.
> >
>
>
>
>
> Thanks,
> Miqu=C3=A8l

Regards,
=C3=81lvaro.
