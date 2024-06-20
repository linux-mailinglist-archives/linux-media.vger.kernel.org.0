Return-Path: <linux-media+bounces-13854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA10910FFB
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 20:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8478B2CB61
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C01BA892;
	Thu, 20 Jun 2024 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNNUr1vT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D41B4C26;
	Thu, 20 Jun 2024 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718905122; cv=none; b=LBXJHmNLFnrDbu59i7+6REoMMx6ujbum9wt25Icv8Is2dLR9GkkQnMteceCzjRjn7PN1z1yytF+O25S5+6wm8sBGZfOkKVm0x3d+KAMpFrIoEZwBKHGl/W77+0ZrHHNAX0yXHIL0skDsQXBcO1pY+G0bHko9G8j0Yx16WH9CKGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718905122; c=relaxed/simple;
	bh=WNDUfhBM9/HSXNcFmiKwEnh7+iaCd5SdM7ZCgWc+f/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4bV1iqdrLikiaY3/dKVj8LSi7rq1JlN1AMmDpg8GDA/faHxpoRZFNS1Z791vgQtwqb6v0Du2hlbBMHoJd88HNrKg/47qbsnLKXOveQ9gCOF4Itwf/c+4GdmpLtHmJcBqvmSxELxd5FUzSPEJkevLDSrbE6GKH5bkP5UwdxMqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNNUr1vT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f9cd92b146so8085025ad.3;
        Thu, 20 Jun 2024 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718905120; x=1719509920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sG4Va9OdsdsAbudvNBTbNSzmionWI4fbzxfvxF/ZFU=;
        b=NNNUr1vTXlNoCMK5h20v7urH9pZewRlosfUeedkaqPeGndfK1b0jZ19qYyxr1iX3gT
         LTAiOn0WRWMp9/KFBWpZ+VQhr90Yr/YTLGnXlc50L4mSZNiUBZrSW+FI4QBCdTULbpQJ
         yIkFA7WO3V4Qr51wYOZRHUYzEY9TW/Ax8PmVaLCa5gu8F+XYyyb5lK6hxwO3D2fj5veJ
         85LHA2RAb/uoT1mWb+zqDYCQS8JOaiyggACWKhJKxYOX8XkTl3t06Kh0IWsG+Jffx1Tc
         nCUC8UpW+jP5Y4oDUYD01SsDhnffEA8nj3T5d+m6opEfsluTGkFG2Eh6uJT4WZR0JuQn
         V/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718905120; x=1719509920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sG4Va9OdsdsAbudvNBTbNSzmionWI4fbzxfvxF/ZFU=;
        b=QTepeAmOWZ4QXjiAPyljFiw4v7I4ff5jySb4u5n4pXMhqzvjkXVl6BMzq545nRgKwT
         HWEBJa0GLZTnBkFuWhX5y1cwXspVdVL0pmlokt4CIq4oR1b9Ovh1fw+qEo7AZrTUlfcR
         rDTpYiR0dP80b8vjPEUgNRxZ20jnlMu8FzWs9HrM/f5q9xEOtSZsp0jLYzUjo9B2Wr/q
         wQTRKGe8BlOyv2/uokWaYVXNnj+nG8BAuc7yyON/BirLC2dQX/rcCpvYq5VgK3klAqId
         95O1gnoXkksJeILnzp2BkRsY1Z3MBfcrc9+mKos1pQXTeIIIKbVkhRFGJ6nIbT+JNWwp
         rp0A==
X-Forwarded-Encrypted: i=1; AJvYcCVRl8MhzuEprOkXcMtuawck8KLP1DZpBaQKAeV/uTBf5TchUTHQRABYsP1tcMTmQE8/RjkLrvNCZfFpRuGWoQrqddbRLhIiUmPfZFcOpki25l+duh+CUaDAi4vxZb8fER7/Aas6tFM4NI7ZmB1oJvXKUbvf6zBcJE/hG+ZiXmF8TdCybtBm
X-Gm-Message-State: AOJu0YywWB0F0QIDTr0p8P118c6O9AgUfwpVJbwrQirndNe1vzBl3nZD
	wvfIeQPKtx0LHAlu0/VOxE05O3MkdKpWu0utVeeit/EkF7sWLG0i
X-Google-Smtp-Source: AGHT+IGuxDdFAgdWqgiP/kZrg0iwxBJMVyTH3b8zZKvOQHHripPZ4bEWsXUOLcu/oJJn63EYCqpTKg==
X-Received: by 2002:a17:903:2443:b0:1f9:cbe1:ae9 with SMTP id d9443c01a7336-1f9cbe10dc6mr23294315ad.44.1718905119620;
        Thu, 20 Jun 2024 10:38:39 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55ca1sm140132045ad.49.2024.06.20.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:38:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas.dufresne@collabora.com
Cc: andy.yan@rock-chips.com,
	benjamin.gaignard@collabora.com,
	boris.brezillon@collabora.com,
	conor+dt@kernel.org,
	daniel.almeida@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	ezequiel@vanguardiasur.com.ar,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	jonas@kwiboo.se,
	knaerzche@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	paul.kocialkowski@bootlin.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
Date: Fri, 21 Jun 2024 01:38:30 +0800
Message-Id: <20240620173830.277022-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2349746d488f4edf9c7c40df5e15ff70d3ec67b7.camel@collabora.com>
References: <2349746d488f4edf9c7c40df5e15ff70d3ec67b7.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Thu, 20 Jun 2024 10:07:41 -0400, Detlev Casanova wrote:

>This feels like hacking the driver to please a specific userspace application, 
>so I'd like to understand better what chromium is doing.

Yes that hack is ugly. I have added log print in chromium to see if they
have set frame_mbs_only_flag to zero and found nothing. This sps->flags is
initialized 0 by kernel's v4l2 code. I printed all sps values in function
rkvdec2_h264_validate_sps and they are all initial values when chromiumn
call VIDIOC_STREAMON at the first time.

Hi Nicolas,

On Thu, 20 Jun 2024 11:03:54 -0400, Nicolas Dufresne wrote:

>This falls short of a specification to support the uninitialized usage by
>Chromium. That being said, we do make an effort to try and have a valid default
>SPS control and OUTPUT format combination. So my suggestion would be to set
>V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY in the default compound control init. This
>way, 0x0 get translate to 16x16 instead of 16x32, thus will work with more
>drivers.

Yeah that's the root cause. Vaule of sps->flags is initialized to 0 along
with pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1, so this
check would fall with minimal decoder size 16x16.

>Chromium these days is not being tested on anything else then MTK, which has a
>64x64 minimum size, this is why they never get into this issue. This driver
>validation is entirely correct. Removing in some cases is unsafe, it would need
>to be replaced with STREAMON only validation of the CAPTURE sizes (which
>currently is validate by implied propagation of valid SPS/OUTPUT).
>
>**not even compiled tested, just to illustrate**
>
>diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-
>core/v4l2-ctrls-core.c
>index c4d995f32191..a55e165ea9c3 100644
>--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>@@ -111,6 +111,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl,
>u32 idx,
>        struct v4l2_ctrl_vp9_frame *p_vp9_frame;
>        struct v4l2_ctrl_fwht_params *p_fwht_params;
>        struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>+       struct v4l2_ctrl_h264_sps *p_h264_sps;
>        struct v4l2_ctrl_av1_sequence *p_av1_sequence;
>        void *p = ptr.p + idx * ctrl->elem_size;
> 
>@@ -179,6 +180,18 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl,
>u32 idx,
>                 */
>                memset(p_h264_scaling_matrix, 16,
>sizeof(*p_h264_scaling_matrix));
>                break;
>+       case V4L2_CTRL_TYPE_H264_SPS:
>+               p_h264_sps = p;
>+               /*
>+                * Without V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY,
>+                * frame_mbs_only_flag set to 0 will translate to a miniumum
>+                * height of 32 (see H.264 specification 7-8). Some driver may
>+                * have a minimum size lower then 32, which would fail
>+                * validation with the SPS value. Set this flag, so that there
>+                * is now doubling in the height, allowing a valid default.
>+                */
>+               p_h264_sps->flags = V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
>+               break;
>        }
> }
>
>Nicolas

This patch makes sense and I just confirmed that it works with chromium.
Thank you very much!

Best regards,
Jianfeng

