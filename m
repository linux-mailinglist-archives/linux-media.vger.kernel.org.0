Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CEB1CEDFA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgELHYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgELHYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:24:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09430C061A0C;
        Tue, 12 May 2020 00:24:40 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id h4so20536421wmb.4;
        Tue, 12 May 2020 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=khsQQ8VJ5Tff/i0Hz7O7BvH/fLbHsQV/p8Ig95SYjfQ=;
        b=iQf4epHsIwHxz7PfeY0em2LSHNzVAwJ2pQuTSG8uKJX0aFXEAasTOm4Gg8Gtkeaaq0
         8tACOKLWsS6MKyahxI2JVwspVhOPfeCHJwnKF33sQ9VEUrFm/6lek+ESZQwlycVuIeS6
         jPGVIzzrjDu3DuABwRSFRz0mBAMjxzPZS2I4AO7uQZRJidSQPdVpF491vYMg1di/aMO1
         drJVi75PJCN3l5ib5azwGJUTGfM2XiMmIosH2Hc2Dv1PXfZiQySSSJjlM0W2TnbHk3Y4
         8p6Z5CRFadd8IHFXdMKQdVoUeCw0PBqx61isncR/LcvGKa5RoXYTmUOD/4uYeBwfoccv
         dGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=khsQQ8VJ5Tff/i0Hz7O7BvH/fLbHsQV/p8Ig95SYjfQ=;
        b=K99Bf2+EJIxjXzkxjivD2y68je5ukI9nBrQTsAzLwU9Ah183mTn/wtVv+DJgD59Uoy
         p6S1gX/DA/5GKk8nnMvBZjIeRNMk7C9EWZhMUh2OBmgYFzbMNFGiayuWUtLMEZz2i8RJ
         x+J6RK4yvqmurI4/+4hqrzV11bjQgdcWwgYtisLFmf3z60suJsX5kD8vQGfJZqnl5QEW
         k//f1veQsTDak4WxEsHMJDJkH8xOHFUATxDBabNLLpEKx0wRYdElWLNIuYiicgCH3MuT
         hrReMK7J9szBCTRi5AucPP0np9PRlih5p6S9R52phKF1BVVuyLm/TeBpARd8UfK2Q0Iw
         Q/dg==
X-Gm-Message-State: AGi0Pub7A8fblwcimSAyvw63Woo+bVnpxtBBnwG+Dljtg/JH90acOO0c
        Evn2l663WzcD1XqpjJgNHfs=
X-Google-Smtp-Source: APiQypIFnh+o15hlQrsxwXRceIh6hJrYLP6JuLHt0SOBNmVimCpRbRykx+o1oAaPDyDdVdqAO+a3IQ==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr38204462wmc.83.1589268278210;
        Tue, 12 May 2020 00:24:38 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id v124sm30170851wme.45.2020.05.12.00.24.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 00:24:37 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512091637.198dd0c2@xps13>
Date:   Tue, 12 May 2020 09:24:32 +0200
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <50E32C0E-7485-4180-A072-F7F1CFB45B06@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
 <20200512065111.716801-1-noltari@gmail.com> <20200512091637.198dd0c2@xps13>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Miqu=C3=A8l

> El 12 may 2020, a las 9:16, Miquel Raynal <miquel.raynal@bootlin.com> =
escribi=C3=B3:
>=20
> Hi =C3=81lvaro,
>=20
> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Tue, 12 =
May 2020
> 08:51:11 +0200:
>=20
>> The current code checks that the whole OOB area is erased.
>> This is a problem when JFFS2 cleanmarkers are added to the OOB, since =
it will
>> fail due to the usable OOB bytes not being 0xff.
>> Correct this by only checking that data and ECC bytes aren't 0xff.
>>=20
>> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page =
bitflips")
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> v3: Fix commit log and merge nand_check_erased_ecc_chunk calls.
>> v2: Add Fixes tag
>>=20
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 19 ++++++++++++++-----
>> 1 file changed, 14 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index e4e3ceeac38f..80fe01f03516 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -2018,8 +2018,9 @@ static int brcmnand_read_by_pio(struct mtd_info =
*mtd, struct nand_chip *chip,
>> static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>> 		  struct nand_chip *chip, void *buf, u64 addr)
>> {
>> +	struct mtd_oob_region oobecc;
>> 	int i, sas;
>> -	void *oob =3D chip->oob_poi;
>> +	void *oob;
>> 	int bitflips =3D 0;
>> 	int page =3D addr >> chip->page_shift;
>> 	int ret;
>> @@ -2035,11 +2036,19 @@ static int =
brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>> 	if (ret)
>> 		return ret;
>>=20
>> -	for (i =3D 0; i < chip->ecc.steps; i++, oob +=3D sas) {
>> +	for (i =3D 0; i < chip->ecc.steps; i++) {
>> 		ecc_chunk =3D buf + chip->ecc.size * i;
>> -		ret =3D nand_check_erased_ecc_chunk(ecc_chunk,
>> -						  chip->ecc.size,
>> -						  oob, sas, NULL, 0,
>> +
>> +		if (mtd->ooblayout->ecc(mtd, i, &oobecc)) {
>=20
> Please use the mtdcore.c's helpers
> (mtd_ooblayout_set/get_data/free/ecc/bytes).
>=20
> Also, what are you trying to discriminate with the return code of the
> function? Shouldn't this function "always" work?

Just making sure it doesn=E2=80=99t return an ERANGE in case =
chip->ecc.size doesn=E2=80=99t match the sections from =
mtd->ooblayout->ecc, which shouldn=E2=80=99t happen, so I think we can =
remove that...

>=20
>> +			oob =3D NULL;
>> +			oobecc.length =3D 0;
>> +		} else {
>> +			oob =3D chip->oob_poi + oobecc.offset;
>> +		}
>> +
>> +		ret =3D nand_check_erased_ecc_chunk(ecc_chunk, =
chip->ecc.size,
>> +						  oob, oobecc.length,
>> +						  NULL, 0,
>> 						  chip->ecc.strength);
>=20
> As I told you, this helper takes "maid data" then "spare area" then
> "ecc bytes". The names are pretty important here as you want to avoid
> checking the spare OOB bytes on purpose, so maybe you could have more
> meaningful names and call "ecc" instead of "oob" the ecc region?

Actually I thought you meant the commit log, not the code itself...

>=20
>> 		if (ret < 0)
>> 			return ret;
>=20
>=20
> Thanks,
> Miqu=C3=A8l

Regards,
=C3=81lvaro.

