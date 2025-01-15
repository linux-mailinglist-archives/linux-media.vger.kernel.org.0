Return-Path: <linux-media+bounces-24746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CFA11B55
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0645B162D85
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 07:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D064020C494;
	Wed, 15 Jan 2025 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CyJb2/W4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D3C1DB15B
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736927653; cv=none; b=mLvGtmjRB4pB2Kx2zDTfNSwOFhMKZEMfQ6fr1cGeWfS3JkbWaQgZdO0snMDa5dw+Gt14jM+pDV48JaHJQX44YsmKkS2d8VuN2nsfeW2llVdS1Og8i57cYopdGO2pRiBUCFr2P6xDIDjNO//oyORmQNebz0yrNqoUDlVsX4vo2jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736927653; c=relaxed/simple;
	bh=LfjITparxecmgs/OMSXQDhOgSUALhQ5AtLzIE6/vce4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Du/zKPv56G4j/JcrwdbMwc7GnYBA/zo9d/gFbacrEv2cQ3LzceKWT6odOgmDp6tf2X0rcoOr487/03vXjCRF0t7yU0UGfo42RLnOfbPyaNXS6vVxd29nL490fX1wnLAxJw8BLDPLwwowjOJMJfGGrB76IVxU4rYPyG//p6IJlDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CyJb2/W4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so12324436a12.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 23:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736927649; x=1737532449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECOn+cnCIb0Bi7+W4OWUT6XQNCiNMEF2qI8394m/Z0A=;
        b=CyJb2/W4/5mylZGSsHAaoufxar2p1osdgp8xUCv8JKQU6lo1BUzdmP1Yx7AEM3g7vu
         82q0bMKeIEyBSoIRA3bPfVnyLgvozFWu0igU3mUeOufz+zBeSKFWeha1vMGGGeZukvhU
         +wID33YKUbgaj07VtmH8525pKZ19ui0W4usQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736927649; x=1737532449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECOn+cnCIb0Bi7+W4OWUT6XQNCiNMEF2qI8394m/Z0A=;
        b=B2lUzFy9s2RVxP1G3XMgDV+HoFlQeC7C3LQyCaJjgNQEiG+n8SfRiEk2DwUIeERFeS
         cKOG1UMeZdpYZA32LOvthDRTod4fkBAZPqHVur7Hr0ZHyA70iZSUd+SJ56YivH4brJsV
         HQUSsDsl07oc4PSQ8ebiBaEq+QhI2Cvew365W+Aech1vnOTN1LtNXIS/otaNRezLWeBy
         d4gYYpvDa6ndYkrrmsf0IFH0iQFplsugiVX4bWyxbHBXaDjbf4k9KCYWGPBd3T+AycoL
         cct/LvJapUh+/0DQwS78YEQjiO8hJ5SgCO0hCMavenXIoFh9M8bW2vvr1v1t0mXCwj7x
         zLhg==
X-Forwarded-Encrypted: i=1; AJvYcCV9k0m8ldlPB6IorA44+O0hDx4vkf2uDm+lCP338LYciD6MBPwfP1oPVtZ1qgaHiRYn+6dRcEwJDptNGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvedNvTb+UFEOlgV6ZB/zUfMAQaUwYpBeH6Sq4pYLC08PMEtF
	020YgyopEzKLKKLLpRJUx4PfVqDVBBRxCpQZmT3l6epsF87Qw49eklF6zvcJzeT/WhFTDwwArxu
	yCt2p
X-Gm-Gg: ASbGnctHFJLdXXeOI6RFamK3jRRMZhzG/Y9HXrkU5jFGKS/eQ/X9BWmqEFKI9oOer30
	dk/J8SNQuZ3n83QzuX4+7Kqp99uMemUtTglydwM9YTdaNQQM+L70u7yjqV4gRwJzpNEQquvLcOF
	0V7x0R+l94qtKdoUulZcJcVN+tlg+scHy5Z2iK1IEQFB/PCnILtfvT1tAiVvTQKmm3p7A7BNbtf
	KEwmyhSXgeMBj5IJdjNKJWfn+VLxqEvm5edjqJbj6j2x5BxyeVl0xIeG/XOZblg/yluN9MhwJa5
	MgWqS29I2N/GXXzT
X-Google-Smtp-Source: AGHT+IEeg6bzNbUVrcET8uRVxbLwdzPSUih+Fo61LUda5JMvH3UZDXc8zUvYLJrk9glhzckkzfBdAA==
X-Received: by 2002:a17:907:2cc5:b0:aab:cd45:5d3c with SMTP id a640c23a62f3a-ab2abdbfa0bmr2846453066b.50.1736927649339;
        Tue, 14 Jan 2025 23:54:09 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9c592ec59sm4562061a12.30.2025.01.14.23.54.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 23:54:08 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361d5730caso96465e9.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 23:54:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwNBJcgkhcEeWLQgxS3nFaqTBBOHIOQN/WbItKOnBc0FRLfK+PMclkp+MOPm/wHWduzHVif38DYnPz6w==@vger.kernel.org
X-Received: by 2002:a05:6402:419:b0:5d0:b20c:205c with SMTP id
 4fb4d7f45d1cf-5da0dd88945mr41288a12.5.1736927288927; Tue, 14 Jan 2025
 23:48:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
 <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
 <20250114204240.GA29414@pendragon.ideasonboard.com> <Z4dmFlJ_0hugX2rY@kekkonen.localdomain>
In-Reply-To: <Z4dmFlJ_0hugX2rY@kekkonen.localdomain>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jan 2025 16:47:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ASMNr2tO+R1sYa58diWLHJr8iomKA2-PinEojCdXT98A@mail.gmail.com>
X-Gm-Features: AbW1kvY14DfSpnwTLqBt72p4pu76YvOiOANEOo0Q2EYntPgnjoz9_xaoOvLxMK0
Message-ID: <CAAFQd5ASMNr2tO+R1sYa58diWLHJr8iomKA2-PinEojCdXT98A@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
	Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>, 
	Jemma Denson <jdenson@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 4:39=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Laurent,
>
> On Tue, Jan 14, 2025 at 10:42:40PM +0200, Laurent Pinchart wrote:
> > Hi Krzysztof,
> >
> > Thank you for the patch.
> >
> > On Tue, Jan 14, 2025 at 08:46:21PM +0100, Krzysztof Kozlowski wrote:
> > > Replace ternary (condition ? "enable" : "disable") syntax with helper=
s
> > > from string_choices.h because:
> > > 1. Simple function call with one argument is easier to read.  Ternary
> > >    operator has three arguments and with wrapping might lead to quite
> > >    long code.
> >
> > It's more difficult to read for me.
>
> I don't have any issue in using the ternary operator either. Using these
> helpers makes the lines generally 3 characters shorter.
>
> >
> > > 2. Is slightly shorter thus also easier to read.
> > > 3. It brings uniformity in the text - same string.
> > > 4. Allows deduping by the linker, which results in a smaller binary
> > >    file.
> >
> > I don't see why the linker can't de-dup string in the current code.
>
> In fact the functions are static inline so from that point of view I don'=
t
> think there's any difference.
>
> >
> > I'm sorry, I just don't see the point in doing this. I'd like to avoid
> > those changes in the Linux media subsystem, or at the very least in
> > drivers I maintain.
>
> I don't have much of an opinion, perhaps I slightly prefer using these as
> the rest of the kernel does, too. Yet if we choose not to use these
> helpers, we continue to be occasional targets of largish patchsets "fixin=
g"
> this.

To put one more aspect on the scales:

These kinds of patches actually make it more difficult to backport
changes (e.g. fixes) to stable kernels, so my preference would be to
only use the new helpers in new drivers.

Best regards,
Tomasz

