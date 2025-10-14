Return-Path: <linux-media+bounces-44447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DFCBDACD3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398315469B1
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5258A305061;
	Tue, 14 Oct 2025 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfZUwdbV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD18A30146F
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463637; cv=none; b=UUeFpMbODReQTMJx/StchBaMuLm1ntD9yPY1ocyeoNRGFp5jWwlEJsDPv+MtfhFS5owFEImZuQha775Vnn+Mj4bN1fPBciGKmVRB/xflADNzy8rrmM1imcBClVDdi3UT6gWN0aLIBwS6zMDb+t00DaEDFeQFfehjt2EeLRp7TAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463637; c=relaxed/simple;
	bh=TN4N13UZLHVoB5vSWNxad9BIABy9KdVDi7sWwo+A3+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cIo9psd5P87IkvHYPKv5qVmFz7Dy4OyS1c5NZJ9BMPyPVeiLOUvT8P1V1GsPNPB5IcXm6BdXJkRPH4iFLB0FCf4Vx1wLR9SoIOjiEX/T8rSgQFcgadQHScO9RAm7gxvwwC9qfVsTmcdpvhucKYGdfW8iqPig/7Sy0MT8/Kucyj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfZUwdbV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F6EC116D0;
	Tue, 14 Oct 2025 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463637;
	bh=TN4N13UZLHVoB5vSWNxad9BIABy9KdVDi7sWwo+A3+8=;
	h=From:To:Cc:Subject:Date:From;
	b=MfZUwdbV8FBboxlT6zaYBlrDUHUcdr7OM9JwdDogTLjeLgYK4Qd9f+8v8RlXPkYZg
	 uhwBo2mLnLEllBIYzhMejrjgASZ5NOjZbiP+rJxHxTCjL4WTl3TPhjxJKL9EGMvMAM
	 zOEWUWEA/cBTo4Mhtkm6g/XrW8rhWRO0WrWo/8jxaoFOYQsyG6JFdKpcpVfcu4wjKP
	 9wTfXCxxnWWtvDfdAWR8oyAkbJLfdarI/YTnwFi09oxmaMeYAyXwvOGR54lbP2JaUo
	 XlDoDEtVc3lkNiuvAUVFzhWqTC46SsHRlfXRMeFqGJCJwBStqsyKMXbPrB1xVyx5vY
	 s4t3WWZiODbCw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 00/25] media: i2c: ov01a10: Add crop, ov01a1b and ov01a1s support
Date: Tue, 14 Oct 2025 19:40:08 +0200
Message-ID: <20251014174033.20534-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This is a series with various ov01a10 driver improvements
1. A set of bugfixes
2. Add cropping support / allow arbitrary sizes
3. OV01A1B monochrome/IR model support
4. OV01A1S RGB-IR model support

This has been tested on:
1. A Dell XPS 13 9320 Raptor Lake with OV1A10 color + OV1A1B IR sensor
2. A Dell Latitude 9420 Tiger Lake with OV01A1S RGB-IR

Testing has been done both with:
1. libcamera (qcam + softISP patches for RGB-IR); and
2. Intel's proprietary userspace stack with out of tree psys driver (*)

Regards,

Hans


*) The out of tree ov01a1s driver has a fixed resolution of 1296x798
   (with the height not being a multiple of bayer-pattern-size <sigh>)
   the closest the mainline driver can get after this series is 1288x800.
   This requires some changes to the xml files describing the ov01a1s
   graph in ipu6-camera-hal.


Hans de Goede (25):
  media: i2c: ov01a10: Fix the horizontal flip control
  media: i2c: ov01a10: Fix reported pixel-rate value
  media: i2c: ov01a10: Fix gain range
  media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
  media: i2c: ov01a10: Fix passing stream instead of pad to
    v4l2_subdev_state_get_format()
  media: i2c: ov01a10: Fix test-pattern disabling
  media: i2c: ov01a10: Change default vblank value to a vblank resulting
    in 30 fps
  media: i2c: ov01a10: Convert to new CCI register access helpers
  media: i2c: ov01a10: Remove overly verbose probe() error reporting
  media: i2c: ov01a10: Store dev pointer in struct ov01a10
  media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
  media: i2c: ov01a10: Add power on/off sequencing support
  media: i2c: ov01a10: Don't update pixel_rate and link_freq from
    set_fmt
  media: i2c: ov01a10: Move setting of ctrl->flags to after checking
    ctrl_hdlr->error
  media: i2c: ov01a10: Use native and default for pixel-array size names
  media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
  media: i2c: ov01a10: Remove struct ov01a10_reg_list
  media: i2c: ov01a10: Replace exposure->min/step with direct define use
  media: i2c: ov01a10: Only set register 0x0305 once
  media: i2c: ov01a10: Remove values set by controls from
    global_setting[]
  media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
  media: i2c: ov01a10: Optimize setting h/vflip values
  media: i2c: ov01a10: Add ov01a1b support
  media: i2c: ov01a10: Add ov01a1s support
  media: i2c: ov01a10: Register tweaks for ov01a1s model

 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/ov01a10.c | 959 ++++++++++++++++++++++--------------
 2 files changed, 592 insertions(+), 368 deletions(-)

-- 
2.51.0


