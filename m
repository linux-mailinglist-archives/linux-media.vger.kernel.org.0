Return-Path: <linux-media+bounces-48894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED4CC3ECA
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EF9A3011A84
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CB92E9EB9;
	Tue, 16 Dec 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JDh7KrQF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A07028030E;
	Tue, 16 Dec 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898351; cv=none; b=BySJbOguylv9plXlq72fFPbmV9Y5jzDiqQouhTBRiISC5vleLfQuert3kOXZ4N8Cweg66P80iEjK8ZNbXGG+fvMbyAv4ETVUxypG8NM767YW9mwbXzFULdSl63d/MjPHOfuKs1D15ARpsMKU39QX2ZTT6UNByv3ekfMlPY7TnIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898351; c=relaxed/simple;
	bh=brKcc7+9o0AII9T4+paEBCZ3OtDeU0xaK+RSib59t/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fo1kdWTNn/VQWFBSUsBoCHYR//4zrShUzM+KmjprbMFoXbPqjHpbfBPicLFC58mKn+HH0/YDAs95PRMfMtDqfTfrhkjw5IjoA3K9OczgMtzLkR+QurlzYiHA04qOY9kA6KixgGI12NOVkNDs9NbVJUkjPykmnLVZXMSNWAh0QgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JDh7KrQF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F5C8581;
	Tue, 16 Dec 2025 16:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898340;
	bh=brKcc7+9o0AII9T4+paEBCZ3OtDeU0xaK+RSib59t/k=;
	h=From:Subject:Date:To:Cc:From;
	b=JDh7KrQFHacQMzHhFGhjq3/5w/RP3zS5SmJKX4NvR4utQaXQX7hPq6qalCNVOKVJl
	 m225pPrWOOjYI3zUwH77+tRiPWp7mR8KPy1Rr3L5/vu2nOiyxAXpV1cUp1yAPRizZM
	 l7+iK2281Uwr64syqLjRPZeZw5fHL5+yADfUlZ9M=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v4 00/15] media: rcar: Streams support
Date: Tue, 16 Dec 2025 17:18:17 +0200
Message-Id: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADt4QWkC/3XPTW6DMBAF4Ksgr+vI/xhWvUfVhcHj4AU4HROrV
 cTd65BKSFG6fCPN92ZuJANGyKRvbgShxBzTUoN6a8g4ueUMNPqaiWBCM8E7iqNDmlcEN2fKgwd
 nrWGggdSVC0KI3zv38fnICF/Xqq6P4YH2zR9paUA3A/WQR3pxOa8Tput5osZYpkFx2bWqL+ruD
 y4DHdM8x7VvijlxS+41U8xrwp/9icL3ntf3Fk4ZDXzoJMiWOTe8x/pATsuQHPpTlXeviMOQwjw
 Zohqe+ZYxMRrFwz+GPAwt2ZMhq8GEMVr70HJpXxjbtv0CmNI1Ep4BAAA=
X-Change-ID: 20250219-rcar-streams-1fdea8860e5e
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5642;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=brKcc7+9o0AII9T4+paEBCZ3OtDeU0xaK+RSib59t/k=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhfVv9nQRBCONvwt+N8851BjwbWC9vZu+5Ip
 3rDdjqfZHWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4XwAKCRD6PaqMvJYe
 9VW+D/0V78pRL02GGOMSstJ+y1eGF8UQW/OSY2X4uKkCD2oAG1+3s2dgacpnL6vbzV7J2bkcg6s
 YzYVs26X9M9h2IihoZrPYfASFiUVI7+2CTpv8gjmlMJerA2VFFU1e5woNvO064dosbpwpU7V3ZL
 xhxj/QhbF0lrLcAUs5HCNooSCM9m1ZQujSwkuClrh2OPHN8bl3r6C1NqFw6ylHKx/E91BchgWCR
 Y+PLfuqw8X4ETTT9t2najr0h+vB7VGh9BDib7+kyCIDZQO4F+t8xnNCHEbT/416r8i1It0Kaxrz
 naPU+kdplfW/UwGF1k25BxwzVPCA/MYTgvfW1eKXmRzcoVAA4+2mx0WHQR4J7qffUnw+/S1G4es
 8vpOwtQ0X4WbxTcAdZtCaSmqXW0t6eWhFSYBXTNlI+sUe9ATcFv1DYuwLmGlgcqOQ+ioZht1xEJ
 zOdUYFtSlsYEDjzPmQMjrvD952zwKafir1ZIm58kFqKZzefFjLqAXdBeMmO5YCJbYYtcKAGmEFv
 20ys1JwPJbQVKd9aBZpTSN5zfg3l6JIgjDgK4PZLByBxfL/p98rJBm+TBo8YT0H/DF5mAtYF9KP
 Vb9iUNlCXYjOWD0shqdiumCZApWid5MoZkB0BMGYQThsYrr5y1BV5MpBPXI/ggDOkMNzW20cI56
 sIcr8sOJ7FGtuBQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add streams support to Renesas rcar platform driver.

The series keaps compatibility with the current upstream for a single
stream use case. However, in upstream there's a limited custom
multi-stream support implemented to the rcar driver, which will be
replaced with the upstream's Streams API.

I have tested this series on Sparrow-Hawk board, with a few different
setups:

IMX219 connected to the CSI0 connector
- The following patches applied to my test branch in addition to this
  series:
  1) The v4l2_subdev_get_frame_desc_passthrough dependency
  2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
     rcar-vin: Fix stride setting for RAW8 formats"), as that commit
     breaks RAW8
- Tested with a single video stream

IMX219 connected to the CSI0 connector
- Plenty of other patches applied to enable full streams support and
  embedded data support in imx219 and v4l2 framework
- Tested with video and embedded data streams
 
Arducam FPD-Link board + 4 x IMX219 connected to the CSI0 connector
- Plenty of other patches applied to enable full streams support and
  embedded data support in imx219 and v4l2 framework, and TPG support in
  ub953
- Tested with video and embedded data streams from all four cameras (so
  8 streams in total)
- Also tested with ub953's TPG, combined with video & embedded streams
  from other cameras.

I have observed one issue with the embedded data (i.e. requiring bunch
of patches not in upstream): when stopping streaming, VIN says that it
cannot stop the stream. I haven't debugged that, but a possible issue is
that the if the video stream for the imx219 is stopped first, the
embedded data stops also, and VIN does not get the frame-end it is
waiting for.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v4:
- Rebased on v6.18, with minor conflicts resolved
- Improved patch descriptions
- Re-ordered the patches a bit to move changes that could be applied
  without the full streams support to the beginning of the series
- Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
  CSI-2" which removes possibility of wrong routing config on Gen3
- Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
  another patch in v3
- Addressed minor comments (constifyings, cosmetics)
- Fixed the missing stream_count checks in disable_streams ops
- Fixed a few instances in csisp and csi2 where
  v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
  instead of using the data from the route
- Dropped unnecessary ISPPROCMODE_DT_REG register clears
- Squashed "media: rcar-csi2: Add more stream support to
  rcsi2_calc_mbps()" into a previous patch
- Dropped wrong use_isp check from csi2's rcsi2_set_routing()
- Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com

Changes in v3:
- Rebased on top of latest linux-media
- Dropped dependencies which are already in linux-media (only remaining
  dependency is v4l2_subdev_get_frame_desc_passthrough)
- Tested on white-hawk board, using the staging deser TPG
- Also tested in a WIP branch for GMSL2 (two video streams)
- Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com

Changes in v2:
- Rebased on top of latest upstream, and updated the dependencies to
  match the latest serieses sent.
- Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
- Drop "media: rcar-csi2: Fix typo" (it was not a typo)
- Update the code in calc_mbps(). The previous method relied on
  V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
  provided via get_mbus_config().
- Dropped dependencies to Niklas' old series which doesn't apply
  cleanly. It's needed for multi-stream, but not for the current
  upstream which only has a single stream use case.
- Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com

---
Tomi Valkeinen (15):
      media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
      media: rcar-csi2: Improve FLD_FLD_EN macros
      media: rcar-csi2: Move rcsi2_calc_mbps()
      media: rcar-csi2: Simplify rcsi2_calc_mbps()
      media: rcar-csi2: Optimize rcsi2_calc_mbps()
      media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
      media: rcar-isp: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move {enable|disable}_streams() calls
      media: rcar-csi2: Switch to Streams API
      media: rcar-isp: Switch to Streams API
      media: rcar-csi2: Add .get_frame_desc op
      media: rcar-isp: Call get_frame_desc to find out VC & DT
      media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
      media: rcar-csi2: Add full streams support
      media: rcar-isp: Add full streams support

 drivers/media/platform/renesas/rcar-csi2.c         | 437 +++++++++++++++------
 drivers/media/platform/renesas/rcar-isp/csisp.c    | 232 ++++++++---
 .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
 3 files changed, 509 insertions(+), 187 deletions(-)
---
base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
change-id: 20250219-rcar-streams-1fdea8860e5e
prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v4
prerequisite-patch-id: bce4a915a29a64f88ed1bb600c08df37d2ba20c6
prerequisite-patch-id: 69b75e7dad9ced905cb39a72f18bebbf3e8f998a
prerequisite-patch-id: 58463f6944c76acd6cf203b14a2836cdb0db2461

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


