Return-Path: <linux-media+bounces-39354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17AB1FC54
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 23:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896417A42EC
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378A428641E;
	Sun, 10 Aug 2025 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="m249i2Xj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A61285CBD
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754861149; cv=none; b=rEtObXw6HRHUVn0K7SykJZ84QmOzN8nSND9CRxE2TND90nxpxZXtRX3J3HMmlqIqupE76vJ+2v80ZAtArDfJT9UqjNMly7GuYVgR+lMoJP3bgA4pjAxpMJpkOU94rL7AlFNgz5+QF7vJ1bPfP0SI8tzuxB559ySHgN+Ymg3rPgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754861149; c=relaxed/simple;
	bh=zDVlMpHH7tnydMbO2dUpOFhZWofI7gCu2AQJwuHSzrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=upmJUOceXQM3ANvocQhvnGkrTYMRazYgUbZuZ2nfWyZoy7oTbbqunr5kYqs9pRkKK/HUrMyhdBW0g7hQPztX5D5nyjTGC3yWeUXmmD+mH6opjCNC7ys3XW7C+Rc7hybWwhtUNW/ilPNBgTkxNxZMfgoe+ecc8JuHSM1oWXGz+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=m249i2Xj; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1754861140;
 bh=49DthfWY2VK6fQCJl8DvFJwoiYjXnSFyByoGc0X5E44=;
 b=m249i2Xj2fUMAeo0vBTr5wOuNRr3oOEBCFz3rqIYdzlKeqDuf+TSDREftsJLqrNkLPa0BA1A/
 R7nhak9Sy6LevSoU+NrDSdqDXxF1Hw+t6rLHolmB2AIkzUIvWxm8w+wAQeb6yEGtSfr38OEySrv
 2wQDUvz4wx++BMRFTFdk3WhIwjSHFmA5L2y328aA7zJWGMbNvLeDsWH0MuGykAQq9yV67wVl+27
 KSnV93dMzmCAos9/8pSHSc7GeyXXqoZwhv+wQvviYJRyAF3wWjIcCgEbetEGrt4GmbJ3LGq/bjB
 yoXMMbITmsbzycLbD5m2Xu1+plahG85xIj2O9S3L5icA==
X-Forward-Email-ID: 68990e4e797ab896277923d3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
Date: Sun, 10 Aug 2025 21:24:30 +0000
Message-ID: <20250810212454.3237486-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add a HEVC backend to the Rockchip Video Decoder driver.

With the dependent H.264 High 10 and 4:2:2 profile support series
finally merged there is finally time to send a v2 with minor changes and
a suggested code style fix of this series. v1 of this series has been
fully functional up until recent unstaging of the rkvdec driver.

A version of this HEVC backend has been in use by the LibreELEC distro
for the past 5+ years [1]. It was initially created based on a copy of
the H264 backend, unstable HEVC uAPI controls and a cabac table + scaling
matrix functions shamelessly copied 1:1 from the Rockchip mpp library.

It has since then been extended to use the stable HEVC uAPI controls and
improved opon e.g. to include support for rk3288 and fix decoding issues
by Alex Bee and Nicolas Dufresne.

The version submitted in this series is based on the code currently used
by the LibreELEC distro, excluding hard/soft reset, and with cabac table
and scaling matrix functions picked from Sebastian Fricke prior series
to add a HEVC backend [2].

Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for making
this series possible!

Patch 1 add the new HEVC backend.
Patch 2-3 add variants support to the driver.
Patch 4 add support for a rk3288 variant.
Patch 5 add a rk3328 variant to work around hw quirks.
Patch 6-7 add device tree node for rk3288.

This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):

  v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
  ...
  Total for rkvdec device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0

  Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
  ...
  Ran 137/147 tests successfully

  Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
  ...
  Ran 9/9 tests successfully

And on a TinkerBoard (RK3288):

  v4l2-compliance 1.30.1, 32 bits, 32-bit time_t
  ...
  Total for rkvdec device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0

  Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
  ...
  Ran 137/147 tests successfully

  Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
  ...
  Ran 9/9 tests successfully

The WPP_x_ericsson tests from test suite JCT-VC-HEVC_V1 has been showing
a mix of both Success and/or Fail result for FFmpeg-H.265-v4l2request.

Full summary of fluster run can be found at [3].

Please note that there is a known issue with concurrent decoding,
decoding errors in one decode session may affect a separate session.
The only known mitigation to this is to pause decoding for some time
and/or do a full HW reset, something to handle in future series.

Changes in v2:
- Rabase after h264 high10/422 merge and unstaging of rkvdec driver
- Use new_value in transpose_and_flatten_matrices()
- Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
- Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
- Adjust code style in rkvdec_enum_coded_fmt_desc()
- Collect a-b tag
- Drop merged vdec node reg size patches
Link to v1: https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwiboo.se

[1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch
[2] https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com/
[3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d

Alex Bee (4):
  media: rkvdec: Add variants support
  media: rkvdec: Add RK3288 variant
  media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
  ARM: dts: rockchip: Add vdec node for RK3288

Jonas Karlman (3):
  media: rkvdec: Add HEVC backend
  media: rkvdec: Implement capability filtering
  media: dt-bindings: rockchip,vdec: Add RK3288 compatible

 .../bindings/media/rockchip,vdec.yaml         |    1 +
 arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
 .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
 .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  826 ++++++++
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |    4 +
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |   10 +
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  184 +-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   15 +
 9 files changed, 2886 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c

-- 
2.50.1


