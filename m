Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F441F8223
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 11:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgFMJCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 05:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgFMJCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 05:02:00 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6B1C03E96F;
        Sat, 13 Jun 2020 02:01:59 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l26so9956567wme.3;
        Sat, 13 Jun 2020 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=VkuzFvdlM+WfXelz0UOaKXXxDWlDEXZOnTOaISWqbKw=;
        b=EqxjKs52NJHgtFyMhVSpqyD3PWJhDN0rsx9hl9lfVFcvJr+NZbRIbchujrGGh2XBck
         9awQrTW+DlyZH33L2UJ6aUDn/Yq1eW03/p3QtsmvU6BHqFNWLuDyISfNURMv4T1xu+/L
         i1DnEzknJBrzz9JEFbmUP58rdiWlwJabZ0eTE0mMNzFXCSLDjlQseWhDJ+9Wz+iPH1WB
         C9wQ6L31HVmuAyXjurZEDjBlveAorSw9USDN+i3KnWA0HCJ4G4s459EcUn5gvgV2/gos
         JzM4Ikb16/00TpGZCdrn5ZBd6JDaWXNZ1sVcgWFYuzage+9DOBUQp9ZBnSdhIx9e4A6X
         gUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=VkuzFvdlM+WfXelz0UOaKXXxDWlDEXZOnTOaISWqbKw=;
        b=BF6SeHzKoz+KruWQypyM23KAdIjNEYr2pAh02pNrusPTo21jLLF4NjtTjJ/V1B3Fkc
         i/nAbCFAEGWPb9YJzKzbQM3THFivbB1kH3Ojjsj3egSeER5YEyAb4mNbjWdoE5wPM6l/
         u/wbd0AQYG7Tfe3BB8lpiOjb5K3d34015iTRxJY5tqBZ93VBT+k+zDi3/qU98bcBouPo
         xWHC473dQLgA8xfCV4NJDUXNPzNdEEbjYymOTIqLg+n/0O/GINAaZ3aK01dcEoRAcdjY
         kuOEOjvOer3HqM0Wbu9Vszf3IJ8u8GkBgKEvLImrCIGxroyhKxWFHhC9o1UGniq6IQwG
         FJgA==
X-Gm-Message-State: AOAM533ST54FwT8sv7YEnt1Q8ya0ILjZrNt82BcyE4t7MVyHCLixe8rO
        pucPUgo1LAgpbDcgS/WnbvI=
X-Google-Smtp-Source: ABdhPJwu3rED1GP9pmDiBAlCpcu0C6Z5OC80/BR0W/RoDA2qCmKIZfNB+8MGMX4d7gHqRTyItrE7ig==
X-Received: by 2002:a1c:2d83:: with SMTP id t125mr3122985wmt.187.1592038918000;
        Sat, 13 Jun 2020 02:01:58 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id b143sm5746659wme.20.2020.06.13.02.01.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 02:01:57 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
Date:   Sat, 13 Jun 2020 11:01:56 +0200
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
References: <20200605170720.2478262-1-noltari@gmail.com>
 <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
To:     Kamal Dasu <kdasu.kdev@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kamal,

> El 12 jun 2020, a las 20:47, Kamal Dasu <kdasu.kdev@gmail.com> =
escribi=C3=B3:
>=20
> On Fri, Jun 5, 2020 at 1:07 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>=20
>> MTD_OPS_AUTO_OOB is writting OOB with ECC enabled, which changes all =
ECC bytes
>> from an erased page to 0x00 when JFFS2 cleanmarkers are added with =
mtd-utils.
>>         | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
>> 00000800  ff ff 19 85 20 03 00 00  00 00 00 00 08 ff ff ff
>>=20
>> However, if OOB is written with ECC disabled, the JFFS2 cleanmarkers =
are
>> correctly written without changing the ECC bytes:
>>         | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
>> 00000800  ff ff 19 85 20 03 ff ff  ff 00 00 00 08 ff ff ff
>=20
> Both brcmand_write_oob_raw() and brcmnand_write_oob() use
> brcmnand_write() that uses PROGRAM_PAGE cmd, means also programs data
> areas and ECC when enabled  is always calculated on DATA+OOB.  since

Are you sure about that? I think that HW ECC is only calculated for =
DATA, not for OOB.
The fact that we=E2=80=99re not writing any DATA seems to be the problem =
that is changing all ECC bytes to 0x00.

> in both cases we only want to modify OOB, data is always assumed to be
> 0xffs (means erased state). So as far as this api always is used on
> the erased page it should be good. Are the sub-pages/oob areas read by
> jffs2  also read without ecc enabled?. Just want to be sure that it
> does not break any other utilities like nandwrite.

No, sub-pages/oob areas read by JFFS2 with ECC enabled.
I don=E2=80=99t think this breaks anything at all, since I tested =
nandwrite with OOB enabled and everything was written perfectly.

BTW, I tried another approach that forced MTD_OPS_AUTO_OOB to be written =
as raw OOB, but it was rejected:
=
http://patchwork.ozlabs.org/project/linux-mtd/patch/20200504094253.2741109=
-1-noltari@gmail.com/
https://lkml.org/lkml/2020/5/4/215

>=20
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +--------
>> 1 file changed, 1 insertion(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index 8f9ffb46a09f..566281770841 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -2279,13 +2279,6 @@ static int brcmnand_write_page_raw(struct =
nand_chip *chip, const uint8_t *buf,
>>        return nand_prog_page_end_op(chip);
>> }
>>=20
>> -static int brcmnand_write_oob(struct nand_chip *chip, int page)
>> -{
>> -       return brcmnand_write(nand_to_mtd(chip), chip,
>> -                             (u64)page << chip->page_shift, NULL,
>> -                             chip->oob_poi);
>> -}
>> -
>> static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
>> {
>>        struct mtd_info *mtd =3D nand_to_mtd(chip);
>> @@ -2642,7 +2635,7 @@ static int brcmnand_init_cs(struct =
brcmnand_host *host, struct device_node *dn)
>>        chip->ecc.write_oob_raw =3D brcmnand_write_oob_raw;
>>        chip->ecc.read_oob_raw =3D brcmnand_read_oob_raw;
>>        chip->ecc.read_oob =3D brcmnand_read_oob;
>> -       chip->ecc.write_oob =3D brcmnand_write_oob;
>> +       chip->ecc.write_oob =3D brcmnand_write_oob_raw;
>>=20
>>        chip->controller =3D &ctrl->controller;
>>=20
>> --
>> 2.26.2
>>=20

Best regards,
=C3=81lvaro.=
