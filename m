Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3951CEDFD
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgELH0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgELH0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:26:31 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E31C061A0C;
        Tue, 12 May 2020 00:26:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e1so74755wrt.5;
        Tue, 12 May 2020 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gbPBxfMa1nptvQGMmZJZG7FYjOnjT5ftZuQZQ9k/QJ4=;
        b=lUkNo5DXhGx8+9zxaahYEiv6fa4sQ8jIdyIO0d5Yu4B5m9DgdTAtzg/h2oN9rcMUnd
         YpLPMk7/ICVqibbbWDImFLd4xp0NO3jMao0LlmSjYcFDtN4Zbu9sq9rkFZqbi4Rr1E0x
         e+KFWsi9vSZDVS0SXOyHPSqVAhjQymnBN8cvh81l39ZU34JgaiukwmJK9Asr1B5d62ZB
         GdW+T2NgDeZOyhsX9VJhOuwyLEDkoXUpMfMnnuDjf+iSkY++NllTkhy1/t4EW22q2qN8
         FttlwYdgjckL4Sj2rn/KEXZof5Euiy70Cobgeag3PknKUPw9UQ9pRVvrFI6/Oyatw7fO
         4a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gbPBxfMa1nptvQGMmZJZG7FYjOnjT5ftZuQZQ9k/QJ4=;
        b=IvDWLbuoROz5XP2UmaEjD77O/wesE8BAi2jhLvvqSfyjSPFok301Tsk92h+PG2DZsl
         WUkK0BTC1OOHxK2jn/FMM9yratmokMTrLXrzzgGh5yHr8rSimB1tjslYMc7iFsnrOM6s
         09+eD1Fd8v3sVMv4CTUZaNEIYqQyMic1YjqRJqCtM/e8izSCAJsq977Z/+jtEgeOlofC
         Z7dMMT4CnlcY9f0FHdJSPjPT00ZPcBSZV0DdpS797ZoBmMRzqOLZjjCYQLiJaAWHYJK1
         gy0elgJ1f2ZOcsrXnd8VFoian2goVT9ylhzaxKw+ckKLIL9cfu8VA0b594+a+P0LhCDM
         K8qQ==
X-Gm-Message-State: AGi0PubOopPhoMNm+x4dO5GsRmiuFakotKS/Igv3pHv+kHltleigQ3lK
        cdAjjXXR6X5PpZRVYDKaOeI=
X-Google-Smtp-Source: APiQypLbjYDF9zrKDc3vZ8Hb+TPGob1psFPW6L8iFmpDLgvz/GLPZb0yfprZn2dX1uY3hKrzvIR13g==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr23323393wrq.14.1589268388254;
        Tue, 12 May 2020 00:26:28 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id a81sm23626585wmh.7.2020.05.12.00.26.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 00:26:27 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512091958.0d153319@xps13>
Date:   Tue, 12 May 2020 09:26:23 +0200
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <461FD58F-ACD5-4158-BC0B-8C73C53D5C0D@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com> <20200512090844.21bcaf22@xps13>
 <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
 <20200512091958.0d153319@xps13>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Miqu=C3=A8l,

> El 12 may 2020, a las 9:19, Miquel Raynal <miquel.raynal@bootlin.com> =
escribi=C3=B3:
>=20
> Hi =C3=81lvaro,
>=20
> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Tue, 12 =
May 2020
> 09:12:10 +0200:
>=20
>> Hi Miquel,
>>=20
>> I also had a hard time understanding your email.
>> It was quite misleading.
>>=20
>>> El 12 may 2020, a las 9:08, Miquel Raynal =
<miquel.raynal@bootlin.com> escribi=C3=B3:
>>>=20
>>> Hi =C3=81lvaro,
>>>=20
>>> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Tue, =
12 May 2020
>>> 08:00:23 +0200:
>>>=20
>>>> The current code generates 8 oob sections:
>>>> S1	1-5
>>>> ECC	6-8
>>>> S2	9-15
>>>> S3	16-21
>>>> ECC	22-24
>>>> S4	25-31
>>>> S5	32-37
>>>> ECC	38-40
>>>> S6	41-47
>>>> S7	48-53
>>>> ECC	54-56
>>>> S8	57-63
>>>>=20
>>>> Change it by merging continuous sections:
>>>> S1	1-5
>>>> ECC	6-8
>>>> S2	9-21
>>>> ECC	22-24
>>>> S3	25-37
>>>> ECC	38-40
>>>> S4	41-53
>>>> ECC	54-56
>>>> S5	57-63
>>>>=20
>>>> Fixes: ef5eeea6e911 ("mtd: nand: brcm: switch to =
mtd_ooblayout_ops") =20
>>>=20
>>> Sorry for leading you the wrong way, actually this patch does not
>>> deserve a Fixes tag. =20
>>=20
>> Do I need to resend this again?
>> Looks like no matter what I do it=E2=80=99s always wrong...
>=20
> Please don't give up! It is normal to work back and forth with the
> community. I need the patch to be clear and bug-free so I ask you to
> make changes and ask questions, that's how it works. But all your
> patches are enhancing this driver so please keep posting!
>=20
>>=20
>>>=20
>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>> ---
>>>> v3: invert patch order
>>>> v2: keep original comment and fix correctly skip byte 6 for =
small-page nand
>>>>=20
>>>> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 37 =
++++++++++++------------
>>>> 1 file changed, 18 insertions(+), 19 deletions(-)
>>>>=20
>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>> index 1c1070111ebc..0a1d76fde37b 100644
>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>> @@ -1100,33 +1100,32 @@ static int =
brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
>>>> 	struct brcmnand_cfg *cfg =3D &host->hwcfg;
>>>> 	int sas =3D cfg->spare_area_size << cfg->sector_size_1k;
>>>> 	int sectors =3D cfg->page_size / (512 << cfg->sector_size_1k);
>>>> +	u32 next;
>>>>=20
>>>> -	if (section >=3D sectors * 2)
>>>> +	if (section > sectors)
>>>> 		return -ERANGE;
>>>>=20
>>>> -	oobregion->offset =3D (section / 2) * sas;
>>>> +	next =3D (section * sas);
>>>> +	if (section < sectors)
>>>> +		next +=3D 6;
>>>>=20
>>>> -	if (section & 1) {
>>>> -		oobregion->offset +=3D 9;
>>>> -		oobregion->length =3D 7;
>>>> +	if (section) {
>>>> +		oobregion->offset =3D ((section - 1) * sas) + 9;
>>>> 	} else {
>>>> -		oobregion->length =3D 6;
>>>> -
>>>> -		/* First sector of each page may have BBI */
>>>> -		if (!section) {
>>>> -			/*
>>>> -			 * Small-page NAND use byte 6 for BBI while =
large-page
>>>> -			 * NAND use bytes 0 and 1.
>>>> -			 */
>>>> -			if (cfg->page_size > 512) {
>>>> -				oobregion->offset +=3D 2;
>>>> -				oobregion->length -=3D 2;
>>>> -			} else {
>>>> -				oobregion->length--;
>>>> -			}
>>>> +		/*
>>>> +		 * Small-page NAND use byte 6 for BBI while large-page
>>>> +		 * NAND use bytes 0 and 1.
>>>> +		 */
>>>> +		if (cfg->page_size > 512) {
>>>> +			oobregion->offset =3D 2;
>>>> +		} else {
>>>> +			oobregion->offset =3D 0;
>>>> +			next--; =20
>>>=20
>>> This next-- seems very strange, can you explain? =20
>>=20
>> In this case next will be 6 (which is the first ECC byte).
>> However, for small page NANDs byte 5 is reserved for BBT, so we want =
next to be 5 only in this case.
>=20
> That's clear, please add a comment there then.

Isn=E2=80=99t =E2=80=9CSmall-page NAND use byte 6 for BBI while =
large-page NAND use bytes 0 and 1.=E2=80=9D enough?
Do we really need a specific comment before next--?

>=20
>>=20
>>>=20
>>>> 		}
>>>> 	}
>>>>=20
>>>> +	oobregion->length =3D next - oobregion->offset;
>>>> +
>>>> 	return 0;
>>>> }
>>>>=20
>>>=20
>>>=20
>>> Thanks,
>>> Miqu=C3=A8l =20
>>=20
>> Regards,
>> =C3=81lvaro.
>=20
>=20
>=20
> Thanks,
> Miqu=C3=A8l

Regards,
=C3=81lvaro.

