Return-Path: <linux-media+bounces-5838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE65861B75
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 19:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF6928C319
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 18:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874561420C1;
	Fri, 23 Feb 2024 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JjTxSyqq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDFB13EFEF
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 18:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708712463; cv=none; b=W6VCzWEQW8IEIpaH2RpPt5h6hV/elNzw5sWk61BoBg/QYFpPyf2/9bXlXLQmfCaoL2+fjQr2hzIPI3gvHkJ+GhsYzjDRn1vpK8RLynj71IiG+C9d6jMgGzS4QW0rzJ2Hd3AZSg5ggbKqb2qfGvqcqdTU6amO5zy3pADRFjYu59E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708712463; c=relaxed/simple;
	bh=+ngMKMs0XzgAKnzKx7qh8xM9qoo80XhqDMBX3NpvnIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZMkwjX2G6zwaTKRDv8zgd3Aflc9MvnwGxJGgatOL6bqgzkdct1pjhg+PFEx8lJhyL/stxpGnesHFFLH7FCMjJ9/2CPung1sc9AveLzCAtVId9T6Qapc3SLu/gzsP2YEGG5LwhMMJmgtvQNuhqE6GG7hqtPJGImMagkXeD2zC7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JjTxSyqq; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c18f4ebf69so167161b6e.1
        for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708712460; x=1709317260; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCF508lwVPTo8oB7h6nqE/4K0qnMF7z+eTDyqnzvqFE=;
        b=JjTxSyqqlJVx8RFcVoA+ueNfc9ruCn4ZnsVm8qed3tkVjtW2nsaGc01xmMXL1ZH0rm
         +irFannm2GVop1f2VR5/CM9yfhmosmqvX3v3MHMrp8fJmfIauvJfGYQ/yQt5cf4xnw5k
         Lr5JdJxjJSeqQMNdEPCVQf70IVe2BQnk1/Dx5s8APAly3wltlhA/0PmUpqrrLW31i1g6
         Dsds1t6KQoBOaZpEaWKVFDfln1dXqmjs6HzqY7aTOAs9xisZYCdzZ7Atu+9dNSteSZY9
         4ZdmLd6qGIdzS1mLJJGEv6ocNXChJSlrqwvd46wCkqgb4mal+LhfW8BvWUWhFN/1qlC9
         Z9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708712460; x=1709317260;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCF508lwVPTo8oB7h6nqE/4K0qnMF7z+eTDyqnzvqFE=;
        b=OsE1mmzmSo0Hqo+978ZwPptEKOJl+60fWXJtfZqbRP2hd0/OPZTrBjqvh2i0rN5nMi
         uMvUm63bKPY7LGVQ5FzFv0zhyUhh1iIRAjGFkZ+ksejj3duAD92kHDqpXam4zrka6Qym
         MVKWTzEfStOIkPGIerOw16ljDy+shYPmNMqOtrrcD13eb1W/omAzU1fSWHB4EAnLXIft
         mJz5FPXltu+LiGdX/vvvaUY6C4pMlDF6usJG+WLkV9mtvANQlULE+eLlq5Rice+mQMw8
         LZUPehd00xxODq+9NlAocRCfUBp31JuQGTntpBSFmF1LyxTeln/zDQhKRTyuvIJJC7p3
         aIlw==
X-Forwarded-Encrypted: i=1; AJvYcCXgHWP3yNPPHz36ts3T5KrXlca1hxlfmXj6sfDs7X3V8xHIWsNI/kP5Sp+FrUUzhs8lQklerd1ElggBnS5/k8iCIeFWEG0l0pcJYbI=
X-Gm-Message-State: AOJu0YxKSHEEQHDOKU7w8340p7GtNo0Ly7/BF7IUymRti7ISES1y9TFn
	ZuFVwiqzG37PuhZqYfZWwn8qAeZ1vtwraqWdSkNe8LEhavxHfXkt5BJcPNzgVjslTaReXuVbwyO
	N
X-Google-Smtp-Source: AGHT+IHfE6pi/juDaKFayaPLWAeQow5Su0jTMsBvmKjC15XFfTkgyDXqgKF7jsUGw+p2rkrKu4Iq/w==
X-Received: by 2002:a05:6808:1190:b0:3c1:35f2:ecb9 with SMTP id j16-20020a056808119000b003c135f2ecb9mr592431oil.49.1708712460632;
        Fri, 23 Feb 2024 10:21:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id o3-20020ac87c43000000b0042e68d98c53sm495021qtv.54.2024.02.23.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 10:21:00 -0800 (PST)
Message-ID: <8cd8e8cc64458b93cd25b1f44a2a143e60084499.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: chips-media: wave5: Convert to platform
 remove callback returning void
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee
	 <jackson.lee@chipsnmedia.com>, linux-media@vger.kernel.org, 
	kernel@pengutronix.de
Date: Fri, 23 Feb 2024 13:20:59 -0500
In-Reply-To: <f88a238f96215aef5a05d9d532c199eaea82883e.camel@ndufresne.ca>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
	 <dfcaf3d23ea35655d8b3a9254ee00f40c20c95c4.1708692946.git.u.kleine-koenig@pengutronix.de>
	 <f88a238f96215aef5a05d9d532c199eaea82883e.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 23 f=C3=A9vrier 2024 =C3=A0 13:19 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi,
>=20
> maybe its already been discussed but ...
>=20
> Le vendredi 23 f=C3=A9vrier 2024 =C3=A0 13:59 +0100, Uwe Kleine-K=C3=B6ni=
g a =C3=A9crit=C2=A0:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling b=
y
> > returning an error code. However the value returned is ignored (apart
> > from emitting a warning) and this typically results in resource leaks.
> >=20
> > To improve here there is a quest to make the remove callback return
> > void. In the first step of this quest all drivers are converted to
> > .remove_new(), which already returns void. Eventually after all drivers
> > are converted, .remove_new() will be renamed to .remove().

Please ignore my comment, sorry for the noise.

Nicolas

> >=20
> > Trivially convert this driver from always returning zero in the remove
> > callback to the void returning variant.
> >=20
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/media/platform/chips-media/wave5/wave5-vpu.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/dri=
vers/media/platform/chips-media/wave5/wave5-vpu.c
> > index 0d90b5820bef..1b3df5b04249 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > @@ -250,7 +250,7 @@ static int wave5_vpu_probe(struct platform_device *=
pdev)
> >  	return ret;
> >  }
> > =20
> > -static int wave5_vpu_remove(struct platform_device *pdev)
> > +static void wave5_vpu_remove(struct platform_device *pdev)
> >  {
> >  	struct vpu_device *dev =3D dev_get_drvdata(&pdev->dev);
> > =20
> > @@ -262,8 +262,6 @@ static int wave5_vpu_remove(struct platform_device =
*pdev)
> >  	v4l2_device_unregister(&dev->v4l2_dev);
> >  	wave5_vdi_release(&pdev->dev);
> >  	ida_destroy(&dev->inst_ida);
> > -
> > -	return 0;
> >  }
> > =20
> >  static const struct wave5_match_data ti_wave521c_data =3D {
> > @@ -283,7 +281,7 @@ static struct platform_driver wave5_vpu_driver =3D =
{
> >  		.of_match_table =3D of_match_ptr(wave5_dt_ids),
> >  		},
> >  	.probe =3D wave5_vpu_probe,
> > -	.remove =3D wave5_vpu_remove,
> > +	.remove_new =3D wave5_vpu_remove,
>=20
> What if we have another screw up ? remove_new_new ? Why not just remove t=
he int
> across the tree instead ? Or perhaps its a two step plane ?
>=20
> Nicolas
>=20
> >  };
> > =20
> >  module_platform_driver(wave5_vpu_driver);
>=20


