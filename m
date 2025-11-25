Return-Path: <linux-media+bounces-47685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBFC83FB8
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 09:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20DC04E7C18
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E482DAFB5;
	Tue, 25 Nov 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c/Lvki1d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26C2D0C72
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059402; cv=none; b=QkjeVTRj6LmNBLVMMRpsAKtHhs53Q9Jc6e2+uS7jCzOWQf29rdNZloNoKLR0XFrYh0wYZ/FGcb747JbPmi1c/fRdC8Of8dyXc1giNq+EK3Ad+Erg4DbMYUewGJEiAjRNZXTC4BzbX6Ftg6nngeB4XiG0CX19NA7M4OSNuUvZC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059402; c=relaxed/simple;
	bh=BtTZBo/mypspLx7OUuwaMkHmy9ZaT0Y5Yyh5DhUi1n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WESNQjMutEbkwA3F4VrT4qh7Li9C5K0HRZhh90My3JWf13Ex2Jlf/k0tQnZpZb8+XAkPVI1kHM6lkoexu8La6VWr+GzRBZKounF4zi6rWw0546ZX0mlV/3U5KadNhncNc0XtslSy1dNshTz3kh/JPn7SUNL47Y0eCLa4dRSRrAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c/Lvki1d; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59583505988so7049800e87.1
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 00:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764059398; x=1764664198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtTZBo/mypspLx7OUuwaMkHmy9ZaT0Y5Yyh5DhUi1n8=;
        b=c/Lvki1dM81H6dGTjgvOq8d87o3TKUepwVJZY/uTki2S6pyCQOyCvkVpxTtGVQm5PP
         +OlA5mPcenG4owALr1bL2XyS83YRbiCAdmaOUpjWhy+9chRMwApIuO5m3slOncrCt8Oc
         SsmRWIb33uR+Oj5m5xDwv5her04lKGal38IRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764059398; x=1764664198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BtTZBo/mypspLx7OUuwaMkHmy9ZaT0Y5Yyh5DhUi1n8=;
        b=uvYuw4k/3bAhAT1EetZ1YMbqOlk1+KJmXi4Kifg5VpquaHnrQdNBbDfBF39yTsgUa2
         UFS1h4qdGL4Gk/g8PS2Oyrdpb/v9zcvcbN4YksTBdV9iPLl7JtpZKROiyhJkOEbzR6VR
         AcJ8fbSmY/LYTHm40TO8n0WFPKr3Pd7Lw7PUA23QpF+3Q87WutEPZ+fGkaX1l7pKmoGx
         /vWNBTFODnQA6zr3qn5xuqsoTg6BIvqIXRAms0hlRXua3uN7izCb4KVMtZlwTgtz7dV9
         bwyLkOgjjfT5PP00Xkrt+E2uylitkO80gOYIuHxbyPSGQU47dtIrHEfTFlqz1pfWDF4V
         ctOA==
X-Forwarded-Encrypted: i=1; AJvYcCUobN5Fk3iYwbk15BRZ4iKu5JR56cnFe0EaG5WA38Js9RozhU4CH7s5k15pUSLg8kOiWNN4S8VtKmnjcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIonQ3q5sP2xTgrWN7p6zrfD5qCuD4Tf2epo+J4FH3cuRmcCC
	b8EuaUUmNCQSBpt+BApV9o0d+XS/Bd9GHMJ7MgHDu28j+w5ySzTSIit5E4ZpXpgxeaRl0+xaUco
	T55HW4A==
X-Gm-Gg: ASbGncugs5nCup+6zZZd45llLPsVt2RDnBsfY5yNGDnRb3rJT/sobayzchgc6kf19Az
	7DJwlKeUPrBlrXiHhD+wIXp4MmeEl4vaJ301gPKuLSTrzByYWtPW6Zir+pzCIs1zMRi9bl0lflQ
	/5AGAsLOeffSe/0O8Odd7oddpKOgBGd2kLBUMAW0LQTETRdVBP4mZjxkiX1Bhqtcqzgqp+8cnJy
	6BMRLpX+HgZ/ebhIscL86xfpvOEk/yjILCAeIH1Ppnk/K4zbynXU6LQZVMc/KqSL38xo4ys9RCK
	eprzA373wz2J7OThUF4wClyFM7csP8QcyUd1av2sDF3oR2eJ65E2PEAWWcRwpGhgPFICbETyE/V
	ZBV+IqUXFXHPj0ZGnYoS8Ejw5HmIO/G/ry1ayuLJ5wZMaLZbQ0LJ+jhknsF7o5xRXcmsZNDMBmq
	poE/xGEQD4aYjC9V6bfdiyIT32PT+eovvwsZine9sPbpzhwgX3
X-Google-Smtp-Source: AGHT+IGL/htpjDv9b+bY0RQj3RHqaDlxsbCUETH6Ma1FQu6Hri1ERiceQZ8mxtUkseA1kS84BcD2Tw==
X-Received: by 2002:a05:6512:2301:b0:595:83d5:7b47 with SMTP id 2adb3069b0e04-5969e9d3083mr6111485e87.5.1764059397710;
        Tue, 25 Nov 2025 00:29:57 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee86sm4887890e87.49.2025.11.25.00.29.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:29:56 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so5906746e87.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 00:29:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3KwWUm8J4BPOLF3oFtqqswSaIrZyjhUpIEtftgdkXIYCEjsihqhOzRjClGTkyU+/bWmOKvU86MrAzeg==@vger.kernel.org
X-Received: by 2002:a05:6512:3c88:b0:594:2d64:bce9 with SMTP id
 2adb3069b0e04-596a374075bmr5172233e87.4.1764059396274; Tue, 25 Nov 2025
 00:29:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122072558.2604753-1-dengjie03@kylinos.cn>
 <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com>
 <65a0e74c-a9ee-4237-b8c9-9863e4de64b5@kylinos.cn> <CANiDSCtNuYbxH9JH1=1NisDQy+b+SahpvGw3BjyvT4PXX=FO_w@mail.gmail.com>
 <5ebb9c9b-ed8a-4872-80b6-a0da815ad77b@kylinos.cn>
In-Reply-To: <5ebb9c9b-ed8a-4872-80b6-a0da815ad77b@kylinos.cn>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 25 Nov 2025 09:29:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCtmU=7fGnKE1U-=Xnv70rVR8SzknPLZHFcPTg5QDVE-Qw@mail.gmail.com>
X-Gm-Features: AWmQ_bkxipVCsSyhJXIs2QA2HxLUR1iLXaYNfKRFMPj0DZB2y6NzPhDImSYQqhs
Message-ID: <CANiDSCtmU=7fGnKE1U-=Xnv70rVR8SzknPLZHFcPTg5QDVE-Qw@mail.gmail.com>
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
To: Jie Deng <dengjie03@kylinos.cn>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jie


On Tue, 25 Nov 2025 at 04:14, Jie Deng <dengjie03@kylinos.cn> wrote:
>
> Hi Ricardo
>
> Thank you for your reply
>
> =E5=9C=A8 2025/11/24 17:06, Ricardo Ribalda =E5=86=99=E9=81=93:
> > Hi Jie
> >
> >
> >
> > On Mon, 24 Nov 2025 at 04:08, Jie Deng <dengjie03@kylinos.cn> wrote:
> >> Hi Ricardo
> >>
> >> Thank you for your reply
> >>
> >> =E5=9C=A8 2025/11/22 16:17, Ricardo Ribalda =E5=86=99=E9=81=93:
> >>> Hi Jie
> >>>
> >>> On Sat, 22 Nov 2025 at 08:26, Jie Deng <dengjie03@kylinos.cn> wrote:
> >>>> Add safety checks to prevent kernel panic during the race window in
> >>>> USB device disconnection.
> >>> Can you share the kernel version that you are using?
> >> The kernel version I'm using is 5.4.18
> >>> This patch
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Dc93d73c9c2cfa7658f7100d201a47c4856746222
> >>> Should prevent the race that you are describing.
> >>>
> >>>
> >>> In your trace you have a reference to uvc_queue_streamoff that was
> >>> deleted by that patch
> >> This patch may indeed eliminate the problem I described.
> >>
> >> The 5.4 longterm version should not have synchronized this patch=EF=BC=
=9F
> > Seems that the patch that fixed the issue:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/media/usb/uvc/uvc_driver.c?id=3Dc9ec6f1736363b2b2bb4e26699738974=
0f628441
> 1. What this patch does:
>
> Problem scenario: When a USB device is disconnected, the kernel
> initiates the
>
> unregistration process, but the device might still be in a streaming stat=
e.
>
>
> 2. The issue fixed by my patch submission:
> 1=EF=BC=89Problem scenario: When userspace actively stops streaming, the =
USB
> device gets
>
> disconnected during the stopping process.
>
> 2=EF=BC=89Fix method: In the stream stopping function, check whether the =
USB
> device is still
>
> connected to avoid accessing structures of already disconnected devices.
> This is fixed
>
> by adding null pointer checks.

Your patch only reduces the window for the race condition, but does
not solve it.

If the device is disconnected between the NULL check and the structure
use, there will still be a kernel panic.

The proper way to fix it is with:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dc93d73c9c2cfa7658f7100d201a47c4856746222
or
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dc9ec6f1736363b2b2bb4e266997389740f628441

Those patches were not backported to 5.4, only to 5.10. 5.4 will be
EOL in 5 days

Please move your product to a newer kernel (ideally the latest
released by Linus)

Regards!

>
> The patch I submitted addresses a different race condition.
>
>
> Thanks,
>
> Jie Deng
>
> >
> > Was only backported until 5.10
> >
> > 5.4 is EOL this December. So it is probably not worth doing anything mo=
re.
> >
> > Regards!
> >
> >>
> >> Thanks,
> >>
> >> Jie Deng
> >>
> >



--=20
Ricardo Ribalda

