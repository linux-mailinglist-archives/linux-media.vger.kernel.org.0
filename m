Return-Path: <linux-media+bounces-49345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62BCD5F00
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AE483032AA5
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 12:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805F52472BA;
	Mon, 22 Dec 2025 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LeJY7W1Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07FC20102B
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405505; cv=none; b=Sn/XWp/LCEU1h508nfSIYBiJeOsCMsGonKMDnJ8hjhBsl8onuCzgfV3FjipxtMBQeRj0ZDtHzbg7Xgp/HFNMCahJPKecGqe7IJqgQLP2mXFXzkExAQQNVhhsDChbRJHRIj/tsuWSJqw/aLXaWBru8kbRTKezNJIlektS9K4AfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405505; c=relaxed/simple;
	bh=mzwkE2azKppMn9m574ADhwGwaBncGzA1Nm8F4E0jYm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVx8yzj/ZuJtMAF+EQr27zlYEx/2wjn8HdRRf/MUU4dYU4INzZM+IfpbQ0ukR3t6OBFIwT0lw9+wt8bOyx+AUSd4NxK3jtpzCV9pZCVaY3Z3qrUoF1wYtAMwZ4B9qZ69NZ8M0mkKcFLPzJAHLS/S8d/qTPia4awch9yk7ECEtj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LeJY7W1Q; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6420c08f886so5020553d50.3
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 04:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1766405503; x=1767010303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LeHnl0F43d16X8P94eu6uknVu3mY15ikEwfkXKd7pI=;
        b=LeJY7W1Qqk1CR5vIAijx4iUQicvrH2Xg4zsEvHPvMlCE0L69cxgv++m04HcxQjIwge
         PbBlRZpU3G+u8uyC3XMjXbvhQQ63DaQiCOweTjp0zHZuoU0Oih9Yg4TjNoOTxUJTELqD
         oeiPATO/CeqrSstSdyJA1GMoRRkgSIYON4KVD61BFs/Y0arzEvCXRNLJTFfGLEl4f2aZ
         PXXmNbeuaZ2SnlsXIfnzwO7X7TarSsUPughcqe9rILhC66yANBhS3LjUlaHSNwKiAr/Q
         bh9mR49ugyb4g6APDH+yk/3amMY82oY0xG9prZXHxgpsSewZ/TyCTiqYgw26r9jATN8o
         q3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766405503; x=1767010303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LeHnl0F43d16X8P94eu6uknVu3mY15ikEwfkXKd7pI=;
        b=OWlgmN/ECkKULNE6l1RtLk7U9GdlymcF8ebSGLuuToHBgqIPjhk24U4yvYedItFF7x
         v50mbaX+Pnz/t2/P+bEsxeTHnxCgX0zsvYQzB9cqZSLNqbdRSdk8h7+AnibY2Ip9xyi+
         VJ3DGTMUQaYfft73Jra/5RGf3umlanac0wrby7l1axbAvzQIA0LsGRIwIEcaW1XgcqJm
         82QULniodHqEi09K6NjYDRKDIIw9rxOBAMlMEjzrPn7nf09KzEbmGcLk6hm1MxUyikiO
         vF/mUCVFG4Z+j8TO/xEfCTFUOi+FLcnmK/nkfLyW7xeodjl1Q8TBQJQojzYR6YfofQ+0
         v5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXdMHfnf/XIuF8TVG6QbfN5KE34oYIUwYX8lpMxEDCoBG0mFAzFN+GPVsM+BsErls9CDhL8q53MbgOwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuqBVa6eLXuiVTn0a8Rtzkrkgm4+7I9/AnN/gfD1SWsSVHCd1
	2LcRq/QMw/ZHANuW19YJk+5D968vZoGlLXoNpbjIGHUYjvcSIl8uRgM9tj9cWFuHiqvnEXJ09mm
	G93LNztuYlUO5HRt7YmXwGpP9BxK4ROcnIM2iJvpddw==
X-Gm-Gg: AY/fxX4/WsjTG1jSBNmj9An3jjqyCPh9eQgO/8jFtmGqC/MBl6z4mjzA/vMV7Mw4Sjk
	EMtk1vTCz0H36vGWM1cu0b9fVEGqomJ/G2maIiHRaoLCeJgJJQuNRp3RWf8VXNPdB3AZV4T+RQr
	E9jDwjXEWKhV3BzxlyzcAsWNtata9X3j3MtHgPa7Zlch/loQxXdbk5FEth3C5yMGKLSAjwX3TjN
	r4AU1Tgcvi8SACgYjgBz6djdEL9RHsFtxQBhaE7/Oo1855AnSLX02GOJBRdSq6OAuN+dXQ=
X-Google-Smtp-Source: AGHT+IGh4coGI15TiNhjLDPReCHfH+tvU2yTLcQGabuE+x1CfJmf35+EbuOoPHsO3Z04pGFBQJkgqDe+09+R4r24z58=
X-Received: by 2002:a53:b98b:0:b0:63f:ce86:8b81 with SMTP id
 956f58d0204a3-6466a8445c0mr7472723d50.18.1766405502830; Mon, 22 Dec 2025
 04:11:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain> <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
In-Reply-To: <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 22 Dec 2025 12:11:26 +0000
X-Gm-Features: AQt7F2qE3ZFsyJS6cRTUU2hWFqn5VWbRnM2RigjgwkkqpQCGwRt9qP5zPU56fy4
Message-ID: <CAPY8ntD9GO_Y13K=Ko5kxz-o1edaocJP=Ns50rUheJP0iJ9fNg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wenmeng Liu <quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wenmeng & Sakari

On Mon, 22 Dec 2025 at 09:35, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wr=
ote:
>
>
>
>
> >>
> >> The Arducam IMX577 module requires a longer reset time than the 1000=
=C2=B5s
> >> configured in the current driver. Increase the wait time after power-o=
n
> >> to ensure proper initialization.
> >
> > Is this somehow specific to the Arducam module? If so, what's there in =
the
> > module that requires this?
> >
>
>
> Yes, This issue occurred on the Arducam 22-pin IMX577 module.
> I have tried changing the sequence of regulator, reset, and clock, and
> found that this module must wait a sufficient amount of time after reset
> before registers can be written (10 ms is a safe duration). This issue
> did not occur when using other IMX577 modules.

Is it the probe that fails, or starting streaming?

Google has found me a datasheet for IMX577 at [1]. I'm hoping you have
an official datasheet, so do correct the following if that has any
updates.
Section 7-2-2 on page 30 for the startup sequence.

The sequence is meant to be regulators, INCK, and then XCLR. The
driver does XCLR before clock, so that would appear to be wrong.

It also states that T6 as the time from XCLR to being able to read the
version register is min 0.6ms, but T7 as the time before you can send
"Streaming Commmand" is min 8ms "To complete reading all parameters
from NVM".
That would be a difference between probe and start_streaming, although
admittedly sending the mode and control setup I2C commands will take
up some of that time.

Plausibly the other set of modules don't have the NVM programmed and
hence they are ready sooner. Either way I'd say that does mean the
driver currently isn't following the defined power up sequence, and
the patch looks reasonable for IMX577.
However as this is a shared driver does IMX412 have this restriction
too? I can't find a datasheet for that one to check. For the sake of
~9ms it's not going to make a huge difference though.

  Dave

[1] https://en.sunnywale.com/uploadfile/2021/1222/IMX577-AACK-C(Awin).pdf

> Thanks,
> Wenmeng
>

