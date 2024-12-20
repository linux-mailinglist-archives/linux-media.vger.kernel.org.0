Return-Path: <linux-media+bounces-23958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F59F9956
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 19:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88B7167D7F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 18:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AF221D5BB;
	Fri, 20 Dec 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IRok+GFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD821CFF6
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734718823; cv=none; b=TD7day8mwUzawyrE4sIDw++YePeZx2ZrArfMCxS9FvOLRczoVqZEvGlmZY643UwZLIeixGWD2K13AQVhCH8mWIsDg83YK3fkt5/bIQOtCi6E3c7YT549wNLZsx2R46+TRG6umgq3GPalpNQuPfvdNujwm5ENiKZ6Rnk6aHldpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734718823; c=relaxed/simple;
	bh=R+C8NaTaSkBGbxFL9D2/0h/CJyxreG1LnD8NmuyFyRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJBt6HMkir6w2nYt6CPQF5+v6zrcMJKZhEf32J5yDVuqnMB0ovsqV+cu+r9pVPg7B24I6DeTC+IFKWNEsOwzEd3h6U0FwU3NuUUV26a/9CNS3dI4VOahkTNTb+V8dreqYDTNhvM9DfRkurPbmeR8dsVQx4nTIJ8bcTSG7dZVlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IRok+GFS; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6efc58fae20so19479137b3.0
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718820; x=1735323620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mkmHafwpQo4yg6dWPNSutW36/6DlGMFcAe4tDDqYnTg=;
        b=IRok+GFSDV7mxHNfOGjfA5CEUSuF7XvfcKcm2tDYHLHRx5na9Ac0386JTWKNNj84/w
         BqFb+RVXDQ61CXoiiJ8jozC1aQWktfBaea0Jaw6k1kdd3nK5aVUPfxjv9F8biHwOd0Co
         Ci+yWiMjIGNVYymE+HXNuAgMfRTZQAt9/V8pj2gUYZaofloD95UvCOOx3NooYaqRdWSj
         w1esi7C3aQWCq82KsWUOQ6JW9aAIYFVqGsHzyI1st0ke/M6z1yzvuLkVHuhIzHgUvUwt
         fKNcGbLriIBV3zujuLnqrgGpjdr3+JRSBn2w+kuhbMFaTlbzZC+/JTZTKyMAgZ+ipf/f
         pKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718820; x=1735323620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkmHafwpQo4yg6dWPNSutW36/6DlGMFcAe4tDDqYnTg=;
        b=V/fUrfQORFm+IWCs4uQ5iy0TGnAcT42gBf/OZRtFVMQV/vm5oB8i8SdSf40pbeUCHv
         1Bf2BGzFcCGQ+Roy+rgzgisIySqymqaEV6o2PRYsL88mydRIKuncKfMJqGu0cf7FLRF0
         EpjDV1Pxe5PQyJQsaVdJmGoFEI47HyucJta+cbXJg/JUmGc2d4f85RumE5jPs9cNVEkc
         JOmwPfUDniDEecjrHznL6E4eAq1sQpTqmNx4VbDlYA+LKQSFHySTfqLDfUPNEkrZeUR2
         rSculTEidYLnFJQCUCYgOE8Vq5F2Ljt5We7kcwzDK0k8MxWo/UNwiHKwaSX6o7UOQDVO
         9p5A==
X-Forwarded-Encrypted: i=1; AJvYcCXWZHv92il4c13ZN3Jo7rn3M+0RtbEygZFNTZ65WdTQnTQulZhEEyF5lZyIct/w0z/g3LV2Nrg2HBJqqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6oC5b8A+dviR9IzedpFy1afd4ofdfuVxwIWYgN/cG79T5hQS
	uAW1pJIXct9eRRVC5SSIq3QO5ViCCLKzILGNcDUoNL4nusUK7QLgGW2GWjTiTmM46y8Enh7MZs7
	jn+bmoMFjfO/eIjZOBnRvk9Si3y6gzBXC52X11w==
X-Gm-Gg: ASbGncsyJaE5xf9d9ooO3zTV082nVkvvru3OR8Gtl0Pu+r9iAeLQKoEbW3CQSImPi9C
	9q1qt6uVnn7/sVNHnED5mBtiGGuFpEWAA0n2nug==
X-Google-Smtp-Source: AGHT+IHzodnVW54gqjkWU4S+wDRH0KnMRpnY498su5SkwFKtL+s6/Cs/9gE+4Mln5lebMJJZEE4Nq62hme2QdhAeF1E=
X-Received: by 2002:a05:690c:3582:b0:6ef:86db:4356 with SMTP id
 00721157ae682-6f3f811aff4mr32534157b3.18.1734718820497; Fri, 20 Dec 2024
 10:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com> <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:20:00 +0000
Message-ID: <CAPY8ntD=+FmSRN7k-kr6Vya0huEVKbFLP84w5O7ww3KSHoDACQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Dec 2024 at 16:21, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> From: John Cox <john.cox@raspberrypi.com>
>
> The BCM2711 and BCM2712 SoCs used on Rapsberry Pi 4 and Raspberry
> Pi 5 boards include an HEVC decoder block. Add a driver for it.
>
> Signed-off-by: John Cox <john.cox@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  MAINTAINERS                                        |   10 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++++++++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>  12 files changed, 4698 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a33a97d5ffff..569b478c44fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19567,6 +19567,16 @@ L:     linux-edac@vger.kernel.org
>  S:     Maintained
>  F:     drivers/ras/amd/fmpm.c
>
<snip>

Typical. You read a patch multiple times over, and still miss a "git
add" of a new file

I won't send a new version now as there are bound to be multiple other
things in review, but hevc_d_h265.h should read

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Raspberry Pi HEVC driver
 *
 * Copyright (C) 2024 Raspberry Pi Ltd
 *
 */

#ifndef _HEVC_D_H265_H_
#define _HEVC_D_H265_H_
#include "hevc_d.h"

extern const struct v4l2_ctrl_ops hevc_d_hevc_sps_ctrl_ops;
extern const struct v4l2_ctrl_ops hevc_d_hevc_pps_ctrl_ops;

void hevc_d_h265_setup(struct hevc_d_ctx *ctx, struct hevc_d_run *run);
int hevc_d_h265_start(struct hevc_d_ctx *ctx);
void hevc_d_h265_stop(struct hevc_d_ctx *ctx);
void hevc_d_h265_trigger(struct hevc_d_ctx *ctx);

void hevc_d_device_run(void *priv);

#endif

Thanks
  Dave

