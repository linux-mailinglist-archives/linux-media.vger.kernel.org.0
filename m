Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EA71F83D9
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 17:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgFMPQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 11:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgFMPQm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 11:16:42 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D28C03E96F;
        Sat, 13 Jun 2020 08:16:41 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id i1so11441064ils.11;
        Sat, 13 Jun 2020 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6fNrHRViBCmNMN6HkRzSmxJVnPWhBWv7Mu2Mxbxlp0M=;
        b=vHy2fGLcFLCbtpWWqJFnA1jlrFHl9io1ENiI+4kIfLPPcXyTE9Hq7EPUfMAFW79n65
         Qq+Pa7/+I8v8X57833OggvQM5WR27MlUEytmGK7bYEVVWTQGx0ae7YCr43Qsg++tUVtT
         ViUpKBrZ4pVg15Fj0MSCs1VEjFReakkIGylbGnjRdtU61qJ8uONU5V6mWhMcCZRZ6KgY
         kFatsN4gylTALbe7rmPmZIbU69GbMHwdLdGAp0cMJXsri2+7RC3JkL3Vj9M9cRnQwkFN
         5VvHfvZsXm10BqId4h71EQi+5PuNvKdENELyETs2965/b+naooHWB4WadicGKFsKnsBe
         FYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6fNrHRViBCmNMN6HkRzSmxJVnPWhBWv7Mu2Mxbxlp0M=;
        b=JLp2bgPXxfH6JAanzVZ4pg6tPXaV4MYcJGhxZ8ZqQoQAw0A38yIPRHq0pkjMvu+ZSk
         b8asjWW+jfmOLlFg96qheYQpcJb60D07Ah0wnngipAOp8DFznylKCmuXso5XJMUsA6sx
         s52xV1jci2QK4ygjp7tMQVJpjhdi/dNRFbf/zq653iT104DjiElRNRl/oFHgMjqeIrbW
         tZ5Tqqq7KkAxpUYcmLLlCht81ESAzyovvTecEbug7WySXfm2DWPJHSjms/r1au0JrUbQ
         31s2G0lCLg/lKgbvblqa9Gib18dWj8jBVf032Pf5qit4ZXtYlii0rKeFzztNcHxwfEei
         ZHzg==
X-Gm-Message-State: AOAM530jUylp6vEMbx4kODlrOnrRDduQ0kqo0aPooA9oC/hsB6WmgUKM
        LJT75ow7g0aKKA3niBKKCRjleAqNTPBtgzvvBkQ=
X-Google-Smtp-Source: ABdhPJxTvor6HLoEX1aH1Eqdwj9rApUr3ZkZUyfZRSr0Qhpp27x1XuOodUoa4HJv5dNmCae5bwJEXluoVvWPft0xTNQ=
X-Received: by 2002:a92:d704:: with SMTP id m4mr17667878iln.248.1592061399726;
 Sat, 13 Jun 2020 08:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200605170720.2478262-1-noltari@gmail.com> <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
 <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
In-Reply-To: <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Sat, 13 Jun 2020 11:16:28 -0400
Message-ID: <CAC=U0a0=7UHY2fH+2HS5hbxThe9rYvqTKggFJP4mm-5ib52dtA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Brian Norris <computersforpeace@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        "R, Vignesh" <vigneshr@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Alvaro,


On Sat, Jun 13, 2020 at 5:01 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Hi Kamal,
>
> > El 12 jun 2020, a las 20:47, Kamal Dasu <kdasu.kdev@gmail.com> escribi=
=C3=B3:
> >
> > On Fri, Jun 5, 2020 at 1:07 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>
> >> MTD_OPS_AUTO_OOB is writting OOB with ECC enabled, which changes all E=
CC bytes
> >> from an erased page to 0x00 when JFFS2 cleanmarkers are added with mtd=
-utils.
> >>         | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
> >> 00000800  ff ff 19 85 20 03 00 00  00 00 00 00 08 ff ff ff
> >>
> >> However, if OOB is written with ECC disabled, the JFFS2 cleanmarkers a=
re
> >> correctly written without changing the ECC bytes:
> >>         | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
> >> 00000800  ff ff 19 85 20 03 ff ff  ff 00 00 00 08 ff ff ff
> >
> > Both brcmand_write_oob_raw() and brcmnand_write_oob() use
> > brcmnand_write() that uses PROGRAM_PAGE cmd, means also programs data
> > areas and ECC when enabled  is always calculated on DATA+OOB.  since
>
> Are you sure about that? I think that HW ECC is only calculated for DATA,=
 not for OOB.
> The fact that we=E2=80=99re not writing any DATA seems to be the problem =
that is changing all ECC bytes to 0x00.
>

Only true for 1-bit hamming code on early controller versions.  For
BCH algorithms both data+oob are covered. And the controller driver
intentionally does not implement a spare area program cmd, even for
OOB writes. Also BRCMNAND_ACC_CONTROL_PARTIAL_PAGE=3D0 (when present)
does not allow for spare areas only writes.

> > in both cases we only want to modify OOB, data is always assumed to be
> > 0xffs (means erased state). So as far as this api always is used on
> > the erased page it should be good. Are the sub-pages/oob areas read by
> > jffs2  also read without ecc enabled?. Just want to be sure that it
> > does not break any other utilities like nandwrite.
>
> No, sub-pages/oob areas read by JFFS2 with ECC enabled.
> I don=E2=80=99t think this breaks anything at all, since I tested nandwri=
te with OOB enabled and everything was written perfectly.
>

Going by the commit message you are assuming 1-bit hamming  code, that
is the only exception on early version controllers where only data was
covered for ecc calculations when enabled.
Which version of the controller are you using  ?. Did you test with
BCH-4 or any BCH ?.

> BTW, I tried another approach that forced MTD_OPS_AUTO_OOB to be written =
as raw OOB, but it was rejected:
> http://patchwork.ozlabs.org/project/linux-mtd/patch/20200504094253.274110=
9-1-noltari@gmail.com/
> https://lkml.org/lkml/2020/5/4/215
>

Are there any other use cases other than jffs2 where only oob needs to
be modified ?. But surely intentionally disabling ecc instead of
forcing it is the way, but I am not sure it will still work for other
BCH algorithms though where both data and oob are covered.

> >
> >>
> >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >> ---
> >> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +--------
> >> 1 file changed, 1 insertion(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/na=
nd/raw/brcmnand/brcmnand.c
> >> index 8f9ffb46a09f..566281770841 100644
> >> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >> @@ -2279,13 +2279,6 @@ static int brcmnand_write_page_raw(struct nand_=
chip *chip, const uint8_t *buf,
> >>        return nand_prog_page_end_op(chip);
> >> }
> >>
> >> -static int brcmnand_write_oob(struct nand_chip *chip, int page)
> >> -{
> >> -       return brcmnand_write(nand_to_mtd(chip), chip,
> >> -                             (u64)page << chip->page_shift, NULL,
> >> -                             chip->oob_poi);
> >> -}
> >> -
> >> static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
> >> {
> >>        struct mtd_info *mtd =3D nand_to_mtd(chip);
> >> @@ -2642,7 +2635,7 @@ static int brcmnand_init_cs(struct brcmnand_host=
 *host, struct device_node *dn)
> >>        chip->ecc.write_oob_raw =3D brcmnand_write_oob_raw;
> >>        chip->ecc.read_oob_raw =3D brcmnand_read_oob_raw;
> >>        chip->ecc.read_oob =3D brcmnand_read_oob;
> >> -       chip->ecc.write_oob =3D brcmnand_write_oob;
> >> +       chip->ecc.write_oob =3D brcmnand_write_oob_raw;
> >>
> >>        chip->controller =3D &ctrl->controller;
> >>
> >> --
> >> 2.26.2
> >>
>
> Best regards,
> =C3=81lvaro.
