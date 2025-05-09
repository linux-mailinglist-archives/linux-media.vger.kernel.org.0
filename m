Return-Path: <linux-media+bounces-32191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A731AAB1FDC
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 00:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104911BC38B2
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F012620CE;
	Fri,  9 May 2025 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="INXcOcLj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED1254B14
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829591; cv=none; b=eS4t1eI+WgxVd2kVwu43JeNSYWzf1LGmR5Zgka9vKNUjYqhMbqwBfwPDYmiMtRDb3jE5zKH1mmVhm85U7ew3iem+9eL0Rfpc2mmL4NIeXEy/uQhJIs+U3itB5iczPxl9XwVl2MkFVcsEGogPyKRfyYl3cOpPv47tCA3rhE3hsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829591; c=relaxed/simple;
	bh=yn04gnUUhOrwwRyO8pHF/8RCt6NrPnVPCJsgVdIA1Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkBBms8O5u/Bq7MfN83d5pTkui9yXfEMpMmHJIhOnziV25GZEm5r11lMbkgTjlwDO0hiMHHzhNZuc3fEm4y+sggQwaFxyqYquPj+5yQC81I28tAB4y7MgZg92rlDRL3IFhrkf8NV9JurtDm1ew1aWjTX/MjJ5kctB/xL0+L8oOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=INXcOcLj; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e816aeca6so3627773e87.2
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 15:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746829587; x=1747434387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+WLLYY6aZsgT/Lw9fybhbeiLhdlSc7tB6cGMaM3EME=;
        b=INXcOcLjXi5mjau5qU6bz3T9qfsbNZmG1o0La3zXUj6WqbFEDejr8kYd5adZETNQaR
         PasYoV9m+Deu9Tg083yAoQuDcR41wpJpNEnxnOMJ49M3LC1IC1lPPaWAQybviSGi631R
         ppw+OaIba9uD9Q++Ngp74lwBHAwaWN8F9Pfws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829587; x=1747434387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+WLLYY6aZsgT/Lw9fybhbeiLhdlSc7tB6cGMaM3EME=;
        b=VUeCJEKsOIKv1DUAKXMUIqtmE4oQKv9Ln9RhfZIm3ApZqswv8++pSQAlpMBirsViPs
         i4Zle7/LUyK0d+F4gQf8XsoPG2Tm/bjz/ygkfoHZPR/Z4K7yI2J+tKyLPYRBXsP7kQJN
         +c78ok1k56ULRCIqo4yKmP4YZQ87qmxcHQsLMcAuJGPJAph9A1aAetVjFOp9yk6qWumr
         8tSwFeTOvqili8sEmr7FjX3sY41/kANncq59gYot26jWrqgoMphj79y/zHqy/6T8meQl
         E3o038Qq84HrxCpcIJ1yNv9KSKAPRARlCgLsKbntrnyDNQSk4d7fT8Cjj85lhJTGd7dx
         PZlg==
X-Gm-Message-State: AOJu0Yw07wSKF/0Q+q7Vczq6HL+2KI5vhe34Iev6W5FubPwJ+fytrkEF
	4Xc1Ja3ls4GFs1aRc+87RwBAJRbahZUBF21KUYZVzSJeeNWYQedOWc75V597tUw92W933Kam5kc
	=
X-Gm-Gg: ASbGncsqu4L2eFjy1rVeOaj6oOZIhsdKWKYT34/PCrxVYcAehBAXdkuyrRwh+VrMA7f
	NRbLr3o3ZcbQmZ6ZrliN2L3S2SrGu6LXO+SDJwto1bkOsqbhJNFsqSrUZYb6VDoXTjXpHzBaoNU
	qyvU5GgSs2xymZ5Bo2KCxm4hvICLuoawrvd7JQ27hgayzf3KvusbjqTlOousBNcjK9Qu8YIlYCB
	NV51AwhVqFUPjPRdRFwIxFG510fDtPrW+gz2dd36U8OF19cCOy/ApmGIQTcSg3WFPZYuaFOI0rp
	9waUZnBvL5SVEM9QnVMjwX8NYdQz2wZqcdZF9YhBwQc0TWweJheQ2xoiBJOcjEOQNUe99QKii5C
	upAdEw04jwlRm2KALuA==
X-Google-Smtp-Source: AGHT+IHHA3AkZ5zN1GcfhZ84PqFtlfUozmCVRbu5G+MdbBCXRcw9PEvEvwhtlm+nEPbTb/ezktPZIg==
X-Received: by 2002:a05:6512:6612:b0:54f:c187:9c16 with SMTP id 2adb3069b0e04-54fc67cb0a0mr1124465e87.25.1746829586884;
        Fri, 09 May 2025 15:26:26 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf857sm403123e87.181.2025.05.09.15.26.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:26:26 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso24366251fa.2
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 15:26:26 -0700 (PDT)
X-Received: by 2002:a2e:bc0e:0:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-326c4627e18mr20921221fa.25.1746829586105; Fri, 09 May 2025
 15:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508083745.1697364-1-niklas.soderlund+renesas@ragnatech.se>
 <681e71eb.050a0220.3a7ab3.60bf@mx.google.com> <20250509221131.GA1722387@ragnatech.se>
In-Reply-To: <20250509221131.GA1722387@ragnatech.se>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 10 May 2025 00:26:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCv-NFw1jbo-gyxPT=P+=mM1Mkdx71kMcTWYPKFjAD75GQ@mail.gmail.com>
X-Gm-Features: ATxdqUGwlNZlwrzJvO_2zMZalsows9l0vIWl1ZTTXxFWrYZWqUFApc7FzP79vCs
Message-ID: <CANiDSCv-NFw1jbo-gyxPT=P+=mM1Mkdx71kMcTWYPKFjAD75GQ@mail.gmail.com>
Subject: Re: media: v4l2-common: Reduce warnings about missing
 V4L2_CID_LINK_FREQ control
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas


On Sat, 10 May 2025 at 00:11, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Hi Ricardo,
>
> Thanks for all the effort you and others put into the media CI!
>
> I just got this error report from the CI telling me a patched failed the
> style check and I don't fully understand the error message, maybe it
> could be improved?

Today I have to recreate the repository where  patchwork-ci fetches
the patches and for some minutes the user.email and user.name was
misconfigured and took the system default.

You were the lucky one :P. Sorry about that

>
> I read you where working on the CI and as far as I can tell you where
> the one who committed the patch in question. I hope I my report go to
> the right person, if not sorry for the noise.
>
> On 2025-05-09 14:21:47 -0700, Patchwork Integration wrote:
> > Dear Niklas S=C3=B6derlund:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test media-patchstyle:./0001-media-v4l2-common-Reduce-warnings-about-=
missing-V4L2.patch media style
> > ERROR: ./0001-media-v4l2-common-Reduce-warnings-about-missing-V4L2.patc=
h: Committer Ricardo Ribalda <ribalda@chromium.org> is not the last SoB: Ni=
klas S=C3=83=C2=B6derlund <niklas.soderlund@ragnatech.se>
>
> Do this mean you should have added your SoB when committing the patch?
> Or is the CI confused about me using a +renesas both in From: header and
> in my SoB? I don't understand where the error message got my mail
> without +renesas from.

The checker removes everything between the + and @. That is expected.

>
> Minor sidebar, the mail charset was set to utf-8 but somewhere it seems
> to have mangled my d=C3=B6ts :-)

The d=C3=B6ts looks like a bug. We have two options, you can start the
legal process to change your name, or I can look into fixing the
encoding.

I will try the second option first  :P
https://gitlab.freedesktop.org/linux-media/media-ci/-/issues/106


Regards!

>
> >
> >
> >
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/7606=
8776/artifacts/report.htm .
> >
> >
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-a=
ll
> > to this message.
> >
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund



--=20
Ricardo Ribalda

