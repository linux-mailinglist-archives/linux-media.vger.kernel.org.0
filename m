Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D831F87C1
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 10:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgFNIxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 04:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgFNIxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 04:53:14 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D99C03E969;
        Sun, 14 Jun 2020 01:53:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l11so14053133wru.0;
        Sun, 14 Jun 2020 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=b3VS3PUglWU05RRagqbS4YBCgN8jvE9wxE1b+IXwJg8=;
        b=k1x2oowRu/p8CYe184hdaKdH+WgpxyUJ+jcROT3XOzPxfk63JicjMP0IKR7jvEyDAw
         Sxd5owQsw6RlmbM3iPX3sSjx8esbZCIHtyF2ogc95RQ59bQlh7gnnLgmpi2GmzBdZEYC
         FH6UaRk6pgJGIEaTAV5EeFUGYkdygxAaCzRTypJOs9WFFMal2nQp5dofFTBwncbNNssJ
         hTvnGpfAxTDSdJR+rdutMx+YbXIy7br3FJwdq2jwAPVjUJptN2+9Q4TfWZcf+i6tJtVp
         J5G1q8tIRGXWd2aO5tgrKVFmv+KC9ZfnNaLdkFKMriKWZ4U24jOiXKe6OMrttXyexFbV
         8OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=b3VS3PUglWU05RRagqbS4YBCgN8jvE9wxE1b+IXwJg8=;
        b=LI7CCxRvhKFU7Fc9qOVdjy4OLPSmNjvPOPY+94mTHXQqITJoz1fWaJCzPejwnxqiUs
         MIfxLHpOPnZMaPHq+RxERl9BjgJpMGsyM1X2KhVMsMSzeX9gOJm6pX6KaKMB9qOnDH5q
         Oa+j1ACU8Toq0T+DnePab4O9RL+S/q5Dj1y9qGWARbueib2tCZ0bf8zFOI97eO6aES6m
         CA/BrePmgz4fRqTaz4k2GKf4cAq6/4jRyj6CvmstOqEJvj6yfwps4SGFr83bX0M3G7Jm
         6xVDf3lSiFirb1xuC5Ogq/Ca/83D3cZCmJkofDv8ob6dcvoxPlnz3yb6gXN7ZHQuWtOo
         7TEw==
X-Gm-Message-State: AOAM533nI//rfpZxc3jtTvhVeZYTB6hg+SXWWM6CgIhzkwSe27vNASh3
        fZefk1IdLxccQfMVeUkDmGc=
X-Google-Smtp-Source: ABdhPJwag0K1c4bIfKfdV5Sosa1eJtMO6AXiUBSa7TKSTvQPQAtg9gRn6k313b/GxQynhhh9WGndBA==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr23136233wrq.310.1592124790802;
        Sun, 14 Jun 2020 01:53:10 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id a81sm18162266wmd.25.2020.06.14.01.53.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jun 2020 01:53:10 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAC=U0a0=7UHY2fH+2HS5hbxThe9rYvqTKggFJP4mm-5ib52dtA@mail.gmail.com>
Date:   Sun, 14 Jun 2020 10:53:09 +0200
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
Message-Id: <F9D394A3-43EC-4E61-B4CA-C113C4516FB1@gmail.com>
References: <20200605170720.2478262-1-noltari@gmail.com>
 <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
 <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
 <CAC=U0a0=7UHY2fH+2HS5hbxThe9rYvqTKggFJP4mm-5ib52dtA@mail.gmail.com>
To:     Kamal Dasu <kdasu.kdev@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kamal,

> El 13 jun 2020, a las 17:16, Kamal Dasu <kdasu.kdev@gmail.com> =
escribi=C3=B3:
>=20
> Alvaro,
>=20
>=20
> On Sat, Jun 13, 2020 at 5:01 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Hi Kamal,
>>=20
>>> El 12 jun 2020, a las 20:47, Kamal Dasu <kdasu.kdev@gmail.com> =
escribi=C3=B3:
>>>=20
>>> On Fri, Jun 5, 2020 at 1:07 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>>>=20
>>>> MTD_OPS_AUTO_OOB is writting OOB with ECC enabled, which changes =
all ECC bytes
>>>> from an erased page to 0x00 when JFFS2 cleanmarkers are added with =
mtd-utils.
>>>>        | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
>>>> 00000800  ff ff 19 85 20 03 00 00  00 00 00 00 08 ff ff ff
>>>>=20
>>>> However, if OOB is written with ECC disabled, the JFFS2 =
cleanmarkers are
>>>> correctly written without changing the ECC bytes:
>>>>        | BBI |   JFFS2   |   ECC   |   JFFS2   | Spare  |
>>>> 00000800  ff ff 19 85 20 03 ff ff  ff 00 00 00 08 ff ff ff
>>>=20
>>> Both brcmand_write_oob_raw() and brcmnand_write_oob() use
>>> brcmnand_write() that uses PROGRAM_PAGE cmd, means also programs =
data
>>> areas and ECC when enabled  is always calculated on DATA+OOB.  since
>>=20
>> Are you sure about that? I think that HW ECC is only calculated for =
DATA, not for OOB.
>> The fact that we=E2=80=99re not writing any DATA seems to be the =
problem that is changing all ECC bytes to 0x00.
>>=20
>=20
> Only true for 1-bit hamming code on early controller versions.  For
> BCH algorithms both data+oob are covered. And the controller driver
> intentionally does not implement a spare area program cmd, even for
> OOB writes. Also BRCMNAND_ACC_CONTROL_PARTIAL_PAGE=3D0 (when present)
> does not allow for spare areas only writes.
>=20
>>> in both cases we only want to modify OOB, data is always assumed to =
be
>>> 0xffs (means erased state). So as far as this api always is used on
>>> the erased page it should be good. Are the sub-pages/oob areas read =
by
>>> jffs2  also read without ecc enabled?. Just want to be sure that it
>>> does not break any other utilities like nandwrite.
>>=20
>> No, sub-pages/oob areas read by JFFS2 with ECC enabled.
>> I don=E2=80=99t think this breaks anything at all, since I tested =
nandwrite with OOB enabled and everything was written perfectly.
>>=20
>=20
> Going by the commit message you are assuming 1-bit hamming  code, that
> is the only exception on early version controllers where only data was
> covered for ecc calculations when enabled.
> Which version of the controller are you using  ?. Did you test with
> BCH-4 or any BCH ?.

All my devices use hamming ECC, even the ones with controller version =
v4.0 (BCM63268), which should also support BCH.
Therefore I need to stick with hamming ECC if I want the bootloader to =
be able to boot the kernel.

However, I should get a new device with BCH in a few days.
I=E2=80=99ll do more tests once I get it, but if BCH also covers OOB, =
then we could conditionally force write_oob to RAW only if hamming is =
configured.

>=20
>> BTW, I tried another approach that forced MTD_OPS_AUTO_OOB to be =
written as raw OOB, but it was rejected:
>> =
http://patchwork.ozlabs.org/project/linux-mtd/patch/20200504094253.2741109=
-1-noltari@gmail.com/
>> https://lkml.org/lkml/2020/5/4/215
>>=20
>=20
> Are there any other use cases other than jffs2 where only oob needs to
> be modified ?. But surely intentionally disabling ecc instead of
> forcing it is the way, but I am not sure it will still work for other
> BCH algorithms though where both data and oob are covered.

I=E2=80=99ll test this and report back once I get my new device.

>=20
>>>=20
>>>>=20
>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>> ---
>>>> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +--------
>>>> 1 file changed, 1 insertion(+), 8 deletions(-)
>>>>=20
>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>> index 8f9ffb46a09f..566281770841 100644
>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>> @@ -2279,13 +2279,6 @@ static int brcmnand_write_page_raw(struct =
nand_chip *chip, const uint8_t *buf,
>>>>       return nand_prog_page_end_op(chip);
>>>> }
>>>>=20
>>>> -static int brcmnand_write_oob(struct nand_chip *chip, int page)
>>>> -{
>>>> -       return brcmnand_write(nand_to_mtd(chip), chip,
>>>> -                             (u64)page << chip->page_shift, NULL,
>>>> -                             chip->oob_poi);
>>>> -}
>>>> -
>>>> static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
>>>> {
>>>>       struct mtd_info *mtd =3D nand_to_mtd(chip);
>>>> @@ -2642,7 +2635,7 @@ static int brcmnand_init_cs(struct =
brcmnand_host *host, struct device_node *dn)
>>>>       chip->ecc.write_oob_raw =3D brcmnand_write_oob_raw;
>>>>       chip->ecc.read_oob_raw =3D brcmnand_read_oob_raw;
>>>>       chip->ecc.read_oob =3D brcmnand_read_oob;
>>>> -       chip->ecc.write_oob =3D brcmnand_write_oob;
>>>> +       chip->ecc.write_oob =3D brcmnand_write_oob_raw;
>>>>=20
>>>>       chip->controller =3D &ctrl->controller;
>>>>=20
>>>> --
>>>> 2.26.2
>>>>=20
>>=20
>> Best regards,
>> =C3=81lvaro.

