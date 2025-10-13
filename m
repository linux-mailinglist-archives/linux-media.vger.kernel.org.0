Return-Path: <linux-media+bounces-44264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE0BD2AE1
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94114189B8A1
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F156254AFF;
	Mon, 13 Oct 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0ZS/WVx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7C19D087;
	Mon, 13 Oct 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353297; cv=none; b=AuIhlMOFFvr/mZeybO29a5Gz/Usks2FL5yBTjuFbyl1Z9Ut/uNIglt4OiCqjf3+kVYh1cywu8SaHRZHm8A3RaXJpF1xtq5JObAinyB384WR/S3fRauMwDMgHGby3OyAWcVcfXfHg1YgrbrOeMbn1vtZjbJDmLa1eNBGVdSPw224=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353297; c=relaxed/simple;
	bh=8YO0W1OhfKGCS6OHoBTvUJkuNNJtzrzqqz50WW9aUWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UN3NV7FGvFl0Jum7ntgA4d/C5CseLSILcnVDlgc8raztCU3zXonJrk0V9EYUvGU/d3cLL4ePBM3k7gp5pkgqS7PTK7VQ7sPWsaz5Z1hhJAnavgLto3eBk2d4xK4+1bYVj6SyDv6jr8Bkb1rz/A5rmPxawxe+k/iq7758dC4WFm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0ZS/WVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D919C4CEE7;
	Mon, 13 Oct 2025 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353297;
	bh=8YO0W1OhfKGCS6OHoBTvUJkuNNJtzrzqqz50WW9aUWw=;
	h=From:Subject:Date:To:Cc:From;
	b=W0ZS/WVxOWCp4IM2c9OVatL+sCAtfz5BZyCi1m7+OO2q1UDiPnbMKUNDwwN+Q4jWF
	 gLoanYcZVZ+EXc+QTrqfrFnIBytPwlU8+2Uh7dWggrD5eGPRUwQhhZoPemI34Pv+Kc
	 YE+cLLgPnKGgTorcHTC3aaH1LJf28MEnoRo0EX73XCcDF01EoT6pKz5D3Gl4ZGGr1q
	 +9oYQkJXyJnkTrFQ7ne68JGhvp6LdI9IW/5cyJS+3MjPyDD67hrJgYpoQ3BV3Oi6wU
	 vpb3uuWgTGAoYhXm2XC11xKhlF9rWgwTa3DlWqYXbv/QwWrFP8ufB6eRitibX7Y6uy
	 t0R11VOuRV2Aw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4 0/4] media: Fix CSI2 RGB vs BGR pixel order
Date: Mon, 13 Oct 2025 13:01:32 +0200
Message-Id: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAzc7GgC/23MQQ6CMBCF4auQrq2ZaQtUV97DuGjLAI0GTGsaD
 eHuFjZKdPkm8/0TixQ8RXYsJhYo+ejHIQ+1K5jrzdAR903eTIAooULBXfTcdoGHznKrZX3Q4AC
 sZFncA7X+udbOl7x7Hx9jeK3xhMv1fychB944bSQcEHWrT1cKA932Y+jYEkrig/PHFouMqXKVR
 XAICn6w/Mb1FsuMAVVZ1milMWqD53l+A5sYx8QhAQAA
X-Change-ID: 20250612-csi-bgr-rgb-b837980c00b3
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

Hi,

Here's an(other [1]) attempt at fixing the current mess due to the
opposite meaning of what v4l2 and the MIPI-CSI2 spec call "RGB". By v4l2
nomenclature, the format CSI calls RGB is actually BGR.

Unfortunately, a handful of CSI transceivers report through RGB media
bus pixel code, which is then understood as V4L2_PIX_FMT_RGB24 by CSI
receivers.

This is made somewhat worse the fact that media bus codes have been made
mostly with parallel busses in mind, and thus the order of pixels wasn't
clearly defined anywhere.

So the v4l2 vs CSI mismatch was confusing (but there's nothing we can do
about it), but the doc didn't really make an attempt at clearing it up
either.

We did have a convention so far though, that about half the affected
drivers were following. 

This series improves the doc, adds the missing media bus codes, and
converts the transceiver drivers to the rightful media bus format.

We'll also need that series [2] from Laurent to fix all the affected
transceivers. 

Let me know what you think,
Maxime

1: https://lore.kernel.org/r/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org
2: https://lore.kernel.org/r/20250611181528.19542-1-laurent.pinchart@ideasonboard.com

---
Changes in v4:
- Rebased on 6.18-rc1
- Link to v3: https://lore.kernel.org/r/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org

Changes in v3:
- Fix typos in commit messages
- use dev_warn_once for deprecation warnings
- Reintroduce dropped unsupported colorspace handling
- Remove unneeded fallthroughs
- Link to v2: https://lore.kernel.org/r/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org

Changes in v2:
- Don't drop RGB, but treat it as deprecated instead.
- Rebase on 6.17-rc5
- Link to v1: https://lore.kernel.org/r/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org

---
Maxime Ripard (4):
      media: uapi: Clarify MBUS color component order for serial buses
      media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
      media: tc358743: Fix the RGB MBUS format
      media: gc2145: Fix the RGB MBUS format

 .../userspace-api/media/v4l/subdev-formats.rst     | 51 ++++++++++++++++++---
 drivers/media/i2c/gc2145.c                         | 24 +++++++++-
 drivers/media/i2c/tc358743.c                       | 53 ++++++++++++++++++----
 include/uapi/linux/media-bus-format.h              |  3 +-
 4 files changed, 113 insertions(+), 18 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


