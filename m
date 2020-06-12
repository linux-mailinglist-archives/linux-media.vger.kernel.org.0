Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8DA1F7D1E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgFLSru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLSrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:47:49 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2093C03E96F;
        Fri, 12 Jun 2020 11:47:49 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id x189so2239329iof.9;
        Fri, 12 Jun 2020 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LZDy9XcI4N1lUd1gGa7ISl9lwNSdZf1QWRf62wPMnVw=;
        b=S2x9dGEHkOnJf+7GpQkXBNyZgMb+NG5lpVqGB+F8ObbicBblcPnt1Zj0z2T2BJN1ak
         BE5tyB3SXO/vcPpoE1SV0kY1Hyiuhx8BaCvyI4y2wl5zVlTziIxk6WAAGlfkyrGWK2Ab
         ZJmk91KRA2HRL5FDYwjDYXfdoxwSeDYU2+fZ5Z8Mkt+x8+aREd4LyXa1focAkMeBM167
         RGDhyMr0dOAIZK/jg79jEb+znkyhK/DuF8F1TzcM7Ak+2abPElSzvfEwgLwHRZ/tiXLT
         XcVd6vAWGmnp9IO5dm4LC11qH4Ycso5wykJuil7n4kQNX5Uq5tVU5q/eYugeOmAWp9i4
         NGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LZDy9XcI4N1lUd1gGa7ISl9lwNSdZf1QWRf62wPMnVw=;
        b=Wugerj51NeCUivMnRVXoyO0tDkrZ+JBGsATk6DIN0w1zDfuLheiMC9ryCHlh38vdDW
         3Pr+jyo7D9n/ToGOr5DSczfFM6uPjCJpOG+yILvgwxCpKOWwqRQmropefAmNt8A1Xdtw
         x0apvtMYr/MJBjAwVPORLsWqacQAX0dEzjZnSCodvKWuUlH3RIgR7+Qvb6EXAvorZP9W
         4xwsYa9VwNApTKspcOdCHDv7tsnQA3FC040F9//kptPv+ONBnnkEM58c+CA2Dz0hrAGT
         tAZp/XqexR8scpsjgeVD2PmunY8prQGesgSRYdx5zfsB2Ffx/0lGQXiu6Z1HtTGqym2t
         kxBg==
X-Gm-Message-State: AOAM531gW2iZA1E/vlRn3Vh6cGKQ2YfEoFcl72i65Lt0qLkY4VEppCfa
        9SKzIwvEajfeOefJ1SUGmaeN5eBuZ+5v//ce428=
X-Google-Smtp-Source: ABdhPJzfRaFPvLx+fMxGrt+I4C3SRFJHleONaqg7i4IvAGQ6aQvoRRGtLFcMRTSg9k7ZAk6Yl7tZSKL1xoRRRuVrgIQ=
X-Received: by 2002:a05:6602:1601:: with SMTP id x1mr15442631iow.129.1591987668271;
 Fri, 12 Jun 2020 11:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200605170720.2478262-1-noltari@gmail.com>
In-Reply-To: <20200605170720.2478262-1-noltari@gmail.com>
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Fri, 12 Jun 2020 14:47:37 -0400
Message-ID: <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
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

On Fri, Jun 5, 2020 at 1:07 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
>
> MTD_OPS_AUTO_OOB is writting OOB with ECC enabled, which changes all ECC =
bytes
> from an erased page to 0x00 when JFFS2 cleanmarkers are added with mtd-ut=
ils.
>          | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
> 00000800  ff ff 19 85 20 03 00 00  00 00 00 00 08 ff ff ff
>
> However, if OOB is written with ECC disabled, the JFFS2 cleanmarkers are
> correctly written without changing the ECC bytes:
>          | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
> 00000800  ff ff 19 85 20 03 ff ff  ff 00 00 00 08 ff ff ff

Both brcmand_write_oob_raw() and brcmnand_write_oob() use
brcmnand_write() that uses PROGRAM_PAGE cmd, means also programs data
areas and ECC when enabled  is always calculated on DATA+OOB.  since
in both cases we only want to modify OOB, data is always assumed to be
0xffs (means erased state). So as far as this api always is used on
the erased page it should be good. Are the sub-pages/oob areas read by
jffs2  also read without ecc enabled?. Just want to be sure that it
does not break any other utilities like nandwrite.

>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/=
raw/brcmnand/brcmnand.c
> index 8f9ffb46a09f..566281770841 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2279,13 +2279,6 @@ static int brcmnand_write_page_raw(struct nand_chi=
p *chip, const uint8_t *buf,
>         return nand_prog_page_end_op(chip);
>  }
>
> -static int brcmnand_write_oob(struct nand_chip *chip, int page)
> -{
> -       return brcmnand_write(nand_to_mtd(chip), chip,
> -                             (u64)page << chip->page_shift, NULL,
> -                             chip->oob_poi);
> -}
> -
>  static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
>  {
>         struct mtd_info *mtd =3D nand_to_mtd(chip);
> @@ -2642,7 +2635,7 @@ static int brcmnand_init_cs(struct brcmnand_host *h=
ost, struct device_node *dn)
>         chip->ecc.write_oob_raw =3D brcmnand_write_oob_raw;
>         chip->ecc.read_oob_raw =3D brcmnand_read_oob_raw;
>         chip->ecc.read_oob =3D brcmnand_read_oob;
> -       chip->ecc.write_oob =3D brcmnand_write_oob;
> +       chip->ecc.write_oob =3D brcmnand_write_oob_raw;
>
>         chip->controller =3D &ctrl->controller;
>
> --
> 2.26.2
>
