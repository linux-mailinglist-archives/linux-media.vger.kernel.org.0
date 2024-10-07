Return-Path: <linux-media+bounces-19138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F039922D0
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 04:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51BBC28296B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 02:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAFF125BA;
	Mon,  7 Oct 2024 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hy3N36jB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62983E574
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 02:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728269374; cv=none; b=aWYJ6owGxq9l4S9qdIvys3afOqyI368uXWjWM4YzWmR8s75si5mFDFOE2PFUtDUc0RHJdU8vMEazkeoQPje9L40hsmKu4aAEzzUDNZazTPxHGAjEHwoYlLixplqQYUjGPUuiWSHKcO+MciKH8vi9zY2uMr2jSuuyKwSSWrZc+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728269374; c=relaxed/simple;
	bh=J13ods05MMOTSiPdCF5EVBLIc+5dHXWMeQWMHkogVRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUxeFS+COgg0ad/Rs375Ll+5Udpj5iOqTQRJFg3qCQLJzOvCFJxVqFlpiE4A00ReobFrsdLGfJE8mAsT4Lvf90F+Ue4VmS6r/x2/+cyLWgdtoNCcoK9davRFznRKxYcIcG+VN2ElgnhAPDe/uG380kCRIGzVPs40f5Tc8Py1I/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hy3N36jB; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e9ff6fb4c6so1624977a12.3
        for <linux-media@vger.kernel.org>; Sun, 06 Oct 2024 19:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728269371; x=1728874171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J13ods05MMOTSiPdCF5EVBLIc+5dHXWMeQWMHkogVRQ=;
        b=hy3N36jBQ6wl2svGipeD7usXQ/5GMQX30m5fC9/krm91xj2B41ajHOn0Fx92Kgzzaq
         8LGMxt4nKhE9NTwPwx36jl4/nQxsoIAicVoutAf5+svi+nYOsKQorFALJeeAuOC/jSx9
         Yp/LSRyapAJj9NnGdXGQS37Es7d7hJnld5ofk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728269371; x=1728874171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J13ods05MMOTSiPdCF5EVBLIc+5dHXWMeQWMHkogVRQ=;
        b=M1fI8pKBYrpYeixVK7lxVQy0jxYmgvIXICdVGVluD97ZMwrkGCj38WT+kWNoiSQ4ae
         7YOPY8KoR7/2fQfYMwd/madRcWqxsGfhKyUU5RVuWUeNBEM4jnmTyjAX0E3N58seIX12
         /WNnzegSSfvYcNgIH1h/2uaASCAttqaYt/SsL2O4+NhkNmYzBXH+qb29eMDM7KV1UvYc
         tJqO/xU7+2v/eTBedKuYASr97e8HrWpGmlsAWl0jGHioo/+VKdWC/FyplCl4pP2s4JUH
         qDa9Ho8JJxfdG67BpnM/P0lBLBiGp2mPiGBhlXsf4LY5oRJZCcTNvoy5d2J26I3fqLtw
         AoXA==
X-Gm-Message-State: AOJu0Yx6XKrIwbLdAArFt/TXYiRtu/W4m6oBkC3kOEyJX/6Ym+9KdtmY
	lIMbEYtXfePwpceLSE3y4wRvE7/VmTIr11iOVlf26Sy4wUHlEVfnbgnUIb4cVVEGc2sb9aBkKjE
	=
X-Google-Smtp-Source: AGHT+IE6/BGHDhxwy66ddEO3o10vYthsiQIQsWC5lCbx0/1JcK0NWqkrH6IjPgYyWinmxIU/OCTvIg==
X-Received: by 2002:a05:6a20:b58b:b0:1cf:42e1:f61d with SMTP id adf61e73a8af0-1d6dfa3fe21mr15904967637.22.1728269370872;
        Sun, 06 Oct 2024 19:49:30 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6c4915asm3881724a12.86.2024.10.06.19.49.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 19:49:30 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b7463dd89so41666995ad.2
        for <linux-media@vger.kernel.org>; Sun, 06 Oct 2024 19:49:29 -0700 (PDT)
X-Received: by 2002:a17:902:f54c:b0:20b:b238:9d02 with SMTP id
 d9443c01a7336-20bfe05f3bbmr106087445ad.33.1728269369022; Sun, 06 Oct 2024
 19:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004121924.27174-1-m.lobanov@rosalinux.ru>
 <66ffe500.5e0a0220.241d65.10a3@mx.google.com> <189134863.638526.1728056170648.JavaMail.zimbra@rosalinux.ru>
In-Reply-To: <189134863.638526.1728056170648.JavaMail.zimbra@rosalinux.ru>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Oct 2024 10:49:12 +0800
X-Gmail-Original-Message-ID: <CANiDSCs82VP7z4EQ1YFBDKh0LN31cCbA0HD4wFovsdSh3vwU7g@mail.gmail.com>
Message-ID: <CANiDSCs82VP7z4EQ1YFBDKh0LN31cCbA0HD4wFovsdSh3vwU7g@mail.gmail.com>
Subject: Re: [v2] V4L/DVB (13661): rj54n1cb0c: possible integer overflow fix
To: =?UTF-8?B?0JzQuNGF0LDQuNC7INCb0L7QsdCw0L3QvtCy?= <m.lobanov@rosalinux.ru>
Cc: Linux-Media ML <linux-media@vger.kernel.org>, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikhail

Thanks for the report

Your fixes tag:
Fixes: a6b5f200 ("V4L/DVB (13661): rj54n1cb0c: Add cropping, auto
white balance, restrict sizes, add platform data")

Is mentioning a patch that is part of stable:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3Da6b5f2008a3d54b5f5350a01121b718dd6bfead7

As per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.h=
tml
 The stable tree prefers that in these situations you add a tag like:
Cc: stable@vger.kernel.org


All the patches for the media subsystem should have the media: prefix.
The patch you are fixing does not have it because it was submitted
before the rule was in place.

Regards!


On Fri, 4 Oct 2024 at 23:36, =D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB =D0=9B=D0=
=BE=D0=B1=D0=B0=D0=BD=D0=BE=D0=B2 <m.lobanov@rosalinux.ru> wrote:
>
> I believe the bot flagged my patch incorrectly. Since the patch hasn=E2=
=80=99t been accepted upstream, it doesn=E2=80=99t make sense to include st=
able@vger.kernel.org. Additionally, I omitted "media" from the subject beca=
use the patch I am fixing does not have it in its title.
>
> Please let me know if further clarification is needed.
>
> Best regards,
> Mikhail Lobanov
>
> ----- =D0=98=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D0=BE=D0=B5 =D1=81=D0=BE=D0=BE=
=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 -----
> =D0=9E=D1=82: "Patchwork Integration" <patchwork@media-ci.org>
> =D0=9A=D0=BE=D0=BC=D1=83: "=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB =D0=9B=D0=
=BE=D0=B1=D0=B0=D0=BD=D0=BE=D0=B2" <m.lobanov@rosalinux.ru>
> =D0=9E=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=D0=BD=D0=BD=D1=8B=D0=B5:=
 =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0, 4 =D0=9E=D0=BA=D1=82=D1=8F=D0=
=B1=D1=80=D1=8C 2024 =D0=B3 15:52:16
> =D0=A2=D0=B5=D0=BC=D0=B0: re: [v2] V4L/DVB (13661): rj54n1cb0c: possible =
integer overflow fix
>
> Dear Mikhail Lobanov:
>
> The unreliable Media-CI system has found some issues with your series.
> Check the report at: https://linux-media.pages.freedesktop.org/-/users/pa=
tchwork/-/jobs/64664035/artifacts/report.htm
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> If you believe that the CI is wrong, kindly reply-all to this email.
>
> Best regards!



--=20
Ricardo Ribalda

