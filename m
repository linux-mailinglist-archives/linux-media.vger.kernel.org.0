Return-Path: <linux-media+bounces-36519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D747AF0D9C
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 10:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A541C23E7D
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B23236454;
	Wed,  2 Jul 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keWQnS7Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1C211F;
	Wed,  2 Jul 2025 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444021; cv=none; b=QAyWWQVq65vX5b7fsMeHr9stbLRvBei2ejWZphkUA7fDUUCF+CSjkNqYczqvtXjAFJQf6xyA0Kui4Eg9I+w3nbJRiBm3in/+BCHT/+tUnvJzXhF++/Xz1NL+Yfr9wZDA3zc7uNWPcu3/w6bgXs6HS+bgrVf167G2AfP12BlTYlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444021; c=relaxed/simple;
	bh=rpo2ESDt1LMwF1P1AS+ULFy50jeEECnVqLiyEcJOcUI=;
	h=From:Content-Type:Mime-Version:Subject:Date:References:To:
	 In-Reply-To:Message-Id; b=V0qt7qAboaGythh/eAKKJEnBpbFFxOvk8lGaR6YPOJ34XSXok3I2OG7CPXBlHLdGvPIXANnb+L1Mx/FRVlp+J+AsvcYsh8ce9r8Xxd2fU9cmK91dsEUySJZ8ucpdrGzpc5Y9DnCW3XEs6KtFA6SQKpXpVtwPWhTD/s6+Ig6w93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keWQnS7Q; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso7706526e87.1;
        Wed, 02 Jul 2025 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751444016; x=1752048816; darn=vger.kernel.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpo2ESDt1LMwF1P1AS+ULFy50jeEECnVqLiyEcJOcUI=;
        b=keWQnS7QOr9OI9lTAUUIwiigfZCW7/6LeteLaUMBc8M3iNet/wrtKBaMQsyM87tpGY
         ek2IXhrrFxeb+Uplk5ZtPZDVdDB3TVDaf7aZx15p1JElioYYu5x1zyh6UdqPNwDETkEW
         8dEOWH5thzJlkbtA2hB9Y4D/krmRair50Dv10FQe/w6CGYb4+UI9BEuG2LrWZNidtMjK
         bImJHUY0hw1cc6yB5AFKcaptz+hELQ2fUtGxWCHpp3KztwCJu1cqPaIGrW4rKWvyTR/+
         3ELKClcFX0LM9rhqH5XJ7zQtHZ60wj5CJZxigX9KNKUaS+6oVWR7lEL3ddqoUZj5b/v6
         9Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751444016; x=1752048816;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpo2ESDt1LMwF1P1AS+ULFy50jeEECnVqLiyEcJOcUI=;
        b=qgzaAk6geRq+JqhFsYDR1WVs3jgd8TPtg3ut4sHAC8NEip8Ft2waDGPpijw/7l/AIz
         +8tx725MCWAaG3S/T3KPgMEKisIyGJWmY31d9++65Pp6Zq2ppDnhfwn8i41p1NxEmREx
         cQe37lDDCF3XtZtEApPfpPzTo8CN5W2Eo+vz71OYRUZFLiM4qeDRZGqyWP9Ne0bdvFGc
         pJslSH40jSGJsWrWrfJ4bu2DDRsWJBd5g8CGt968IH4ZAk4TDanA50tZuYQQIxQ08Hsp
         9F+pvQfFh1RBjjhXFu5gBZa/2MuKWPtqI/sNknYJj9b5NskAZ71aVslT//131wlQ3veP
         0CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD4ABcXijRRDuqm6Ucud59bJWCY+F1KoutiS2Oh0bl4gQ4O/dPmUpilNzZlxswC7Z7AlDkJnHhTvYy3Ck=@vger.kernel.org, AJvYcCXZvf1quryIG1vTcDOwiJ3ZX0I6eg13SfFXV6ko8IsGiVeFMOPAMWc+bFpAVzW8fiBB2+yTw1XdJVwEWx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2LFdR4e4jkWtHjXmkXtcx6xB5YOzGEnNH5KzaUcYyt9RDg4e
	RW06/4pDNXc7qVDu5L0eCK/SC1fsHf90EYM+bqx9Ft+RDbp/80IQ6Leg
X-Gm-Gg: ASbGncvEaDCvlXH335x9ORX/ZckSuUK0JFoLVuzRlpmzTE+WAn7H7bqtWtoysTDgJ44
	kYxYE1Bo+1AlQd+X/PHi8jWjgPFB1IVq65Jt9lhfmOz0CgicGllEYyxP3j99z80nSQ0Cipi9EUu
	UEndC9ifHavnMTLe/xDExFsUHh+J6QADnsMNRjlP0FFhrb+k4Ck2bRx228hlgQ7HIwMOrxBd8NP
	fEIufMzDDZoOGgXIqjeZ/eA5QpILoJW8GnXxNQyW6hUJm6BXGM8VVD/NgKj+kcv3SPSBdEzfNXe
	4J+6EObnIQ6aTeVO9YKpJlvI6smjqNTKLjn1s/BFuE7iX/eGz2+PfOgvuRkYCikPXA17bfuQJu7
	U1bk0WMwq01s=
X-Google-Smtp-Source: AGHT+IFq1xyVsfbm5OpMZLE3lahO1obWQ/sqszwZ7C4sbORBoXKs9FoMUmZ+mcPBYVsXNdCInPgB8g==
X-Received: by 2002:a05:6512:3094:b0:553:ad48:3f2b with SMTP id 2adb3069b0e04-556282aeb07mr683575e87.2.1751444016128;
        Wed, 02 Jul 2025 01:13:36 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95acsm2055286e87.115.2025.07.02.01.13.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jul 2025 01:13:35 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [v2] media: si2168: increase cmd execution timeout value
Date: Wed, 2 Jul 2025 12:13:21 +0400
References: <20250331084437.3974648-1-christianshewitt@gmail.com>
 <67ea654f.050a0220.2a49ac.2402@mx.google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Peter Rosin <peda@axentia.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <67ea654f.050a0220.2a49ac.2402@mx.google.com>
Message-Id: <796D5DD1-D49E-4B9B-9F20-7FC5A88DD37B@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

> On 31 Mar 2025, at 1:50=E2=80=AFpm, Patchwork Integration =
<patchwork@media-ci.org> wrote:
>=20
> Dear Christian Hewitt:
>=20
> Thanks for your patches! Unfortunately the Media CI robot detected =
some
> issues:
>=20
> # Test =
checkpatch:./0001-media-si2168-increase-cmd-execution-timeout-value.patch =
checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit =
description?)
> #9:=20
> Jan 28 12:23:46.788180 LibreELEC kernel: si2168 1-0060: cmd execution =
took 0 ms
>=20
> total: 0 errors, 1 warnings, 0 checks, 25 lines checked
>=20
>=20
>=20
> Please fix your series, and upload a new version. If you have a =
patchwork
> account, do not forget to mark the current series as Superseded.
>=20
> For more details, check the full report at:
> =
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/7364245=
4/artifacts/report.htm

Can someone please confirm whether I do need to submit a v3 of
this patch? - the line-length issue flagged by the bot refers
to the patch description text (which has some longer log lines
that demo the issue) not code in the patch. I=E2=80=99d like to get this
merged so I can clear the patch from my distro=E2=80=99s patchset.

Christian=

