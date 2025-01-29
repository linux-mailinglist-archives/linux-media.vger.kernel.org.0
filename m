Return-Path: <linux-media+bounces-25411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2248A21FED
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 16:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EDDB188638D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55C34C83;
	Wed, 29 Jan 2025 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MW3XZKUR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BEB17BB21
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163039; cv=none; b=IUjK0nsd8PsMwMlhqJ7IJkdvvRU4C2/YkbwYZmqkLCaPThK/zepJzSVIx7qF+mOw7410kgru+Wqm9+q/YitD9ci2bsP2ZXfX++I55m17IMm1RGXnh8LnfVs4qHMRC1KYVo+81y+ChCxWbGEoTNr5qaUO81DV+WUdsENbWU5Nt4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163039; c=relaxed/simple;
	bh=AZUkRTiXt/11j1aYVCU9foKtJ7qIL4neS/wOS4IuEAc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RM5B8wDxfb5L7fqHeib66fBFxs6ersG8ijVrYJrX02pOxGJiQ2p9PHbznD1jI3ZFSEBtQnIw9xACF+/l5lTgg7Sw0xxW41NFITWu+0pzxxcU2MKkaGwVDMRHuFwrDnNoGCFe/jp6vuZFzY/bfrw590tNNoh2OOfB/FQbhPPD2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MW3XZKUR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso47410235e9.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738163035; x=1738767835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7jOr3jG/gqHO+XxbNXXOpqeLaZUfs/H2fLjYnPioHY=;
        b=MW3XZKURvwmDFOhke/S6HSWIm4tL21CLWZdxYgst2vCBqY+H2R4on5HrOwy19RT4bJ
         ulzY5NuXYq2pW7q1ZijJTim+5n8STD22dApt2u3VdE/ot1bqqNf8s0265I8Me7ll+9dg
         kIxUfTbfHeF1JNxgb0zs4p0Xms7+3+kXBiV7QC+QSkS1DUQ91d+NPPgIcXQPvyaR2KBG
         0/9rqF6B60sUjgt1a5t93ZHsI9Br5EuNv25IuNnwV6+bRVvPFy3CrbJBt5OEZ2pY+oKr
         rboRU9Ce+TKZ5DNYjBnNc/5Xz/tyJUhSscpJNvKxZvwdlb3csliXyTzuub2djm44gZjy
         WzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738163035; x=1738767835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7jOr3jG/gqHO+XxbNXXOpqeLaZUfs/H2fLjYnPioHY=;
        b=iNW+7JSpyYNPIye4RWpl+2c4gThDZSblvE1SaeBjTbse6dWYhC/Pw1LGeRY0wIpKV5
         F/1JPVx6Mo3xgU83mNyZ4nZH/XpbkcRdEetWe+0BTfhAee0us8BjBxLgSQ3iYHPpUWiV
         pmyMkkF/Alo3ukXfmx2fcorku2PXk+iuegRHHWRmzY4Kkj4ctzh+X5nZiE1mWiDmOCZ8
         nHPj+LtWbCLXfEdj8R2MOsi2gORkb0LspLNr0JWOihGwVF3riZOyUy3Sc1W9U+vwqQDT
         kcWNyQJOw/lSWD4PT7JdLSaNFpyMLjiguMq/nk0Agqcbptzwx4HaRO++Ca6+9NJxo8n2
         LR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVy6vdhfs9y4B1sZtr4XPgIar5TiMQffMNzeC5zi6sJpugBEqJsPLfsBFuz28rWJOsiI02ocoyAoNxpwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVNaovrkEPAF8V0iXmOKsShoBJoFtpkFoT4L5yMKIXI2yK13PT
	ch78mpKW++oTLcJPHFurqF1kxjN/jRn9QFbl9rQBREiU+UK+W3CY8QgOzxsMY+Y=
X-Gm-Gg: ASbGnctNzJz8qxe0oUNr9RuwM140hTNZ57PoVutoXoYGyfkYpRRxVjNfLT3gRmI7oAD
	PMSvpxHiFKTRqkpAszC1gnWj4DLrAGmrIUeXfm8c9zn6qNF6Yhe9kv9Spxoj/pbgroZ2azxcdp9
	Tk7xkvv5u9XgWaoCcwoHcrt4pLBXdt7tTfU6jkSV8zoPEmcFeTZR0hw2uzoyOFQzyeG0Mz2itx8
	BjAcTPPqwM3YQG7LWLiWicA2oTX/Auu2u2fAi3lUpLNFaXdOzXWqjSFc6wZuzaR9/8AGjbm4xSS
	t0zUnzw=
X-Google-Smtp-Source: AGHT+IGk3IED1rW2H+gS5X9lthNkh4iJZQ+tN3q+utTgQBLLllIeFgCCCpIM4qO564jUt6GQ2RkF1A==
X-Received: by 2002:a05:600c:4e14:b0:438:a214:52f4 with SMTP id 5b1f17b1804b1-438dc428c0amr25426485e9.25.1738163034675;
        Wed, 29 Jan 2025 07:03:54 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438d755375bsm39074745e9.0.2025.01.29.07.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:03:54 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 0/3] media: imx415: Improvements for framerate and link
 frequency control
Date: Wed, 29 Jan 2025 15:03:48 +0000
Message-Id: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRDmmcC/2XMywqDMBCF4VeRrJuSTEykXfkepYtRxzoLLyQlK
 OK7NwqFXpb/DOdbRSDPFMQ1W4WnyIHHIYU5ZaLucHiQ5Ca1AAVWaVXInhpGyf2cayuhaV2BBDp
 9RJpMnlqeD+52T91xeI5+OfSo9+sbunxDUUsljXMVOgSTY1V6DFNF3i8Tn+uxFzsX4YPQ7oeAR
 BTGgjOtyp2Ff2LbthfFPuuI8QAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.14.1

The driver was using reverse engineered pixel rates, and had different
values for different link frequencies.
In common with the other Starvis sensors (eg imx290), this isn't
actually the situation, and the pixel array runs off a different
PLL to the MIPI block, and there is a FIFO between the two.

It's not quite so simple as HMAX is said to be in units of INCK,
not pixel clocks. Working through the various modes that appears that
even that is slightly wrong as it is units of a scaled INCK of
either 72MHz (for INCK = 24 or 72MHz) or 74.25MHz (for INCK = 27,
37.125, or 74.25MHz).

Rework the configuration so that the pixel rate is fixed, with the
different link frequencies adjusting the minimum hmax value so that
the FIFO doesn't overflow.

Switching between 2 and 4 data lanes also only changes the MIPI data
rate, so also can be handled by altering the minimum HMAX.

Once you've got HMAX / V4L2_CID_HBLANK represented sensibly, then
frame rate control through V4L2_CID_HBLANK and V4L2_CID_VBLANK is
trivial, so add in frame rate control too.
Exposure is set in lines (as usual), so amending VBLANK changes the
range for the exposure control.

This has been tested on a Pi5 with Waveshare "IMX415-98 IR-CUT Camera"
module (SKU 28524). That uses a 24MHz clock, so only the 360MHz and
720MHz link frequencies have been tested (other frequencies require
a 27, 37.125, or 74.25MHz clock input.

It'd be nice to add support for 12bit readout and windowed mode readout,
but those are a job for another day.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v3:
- Fix s_ctrl for HBLANK to not return and miss a pm_runtime_put()
- Added Gerald's and Michael's R-b tags (not to patch 2 as that has been
  updated)
- Link to v2: https://lore.kernel.org/r/20250116-media-imx415-v2-0-735263f04652@raspberrypi.com

Changes in v2:
- Fixed VBLANK fall-through for setting the exposure correctly
- Sorted the checkpatch complaint over using fallthrough; vs commenting
  why we're falling through.
- Corrected HMAX for 891Mbit/s mode. I now have a module with 37.125MHz
  clock, and have validated that.
- Link to v1: https://lore.kernel.org/r/20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com

---
Dave Stevenson (3):
      media: i2c: imx415: Add read/write control of VBLANK
      media: i2c: imx415: Make HBLANK controllable and in consistent units
      media: i2c: imx415: Link frequencies are not exclusive to num lanes

 drivers/media/i2c/imx415.c | 183 +++++++++++++++++++++++----------------------
 1 file changed, 94 insertions(+), 89 deletions(-)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20250107-media-imx415-2df67ae21107

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


