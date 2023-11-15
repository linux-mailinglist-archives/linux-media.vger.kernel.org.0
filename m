Return-Path: <linux-media+bounces-306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479017EA69D
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 00:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014C5281A15
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 23:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2012E3D966;
	Mon, 13 Nov 2023 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c56JiRjM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0AC3C699;
	Mon, 13 Nov 2023 23:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A34C433C9;
	Mon, 13 Nov 2023 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699916664;
	bh=bxaBSP1U/utusvLGYRzx2FzDNa8xlVt597WQS3AhgYs=;
	h=From:To:Cc:Subject:Date:From;
	b=c56JiRjMiRmMiI3D1N8Lumkcgi1wLZc4rCM90D+ipPDWRI0dFbXDCVzUr0ZZGi1Iv
	 U1EMPwaF5Rzdg90HV/V4IQhZWuguKDxtEy36usOelEYFwV6Jd+jKzSFJHEPDrEu8Di
	 C0nGHATp276MGHah8y+/wH13cLZ33mBae3z6OYB/db3kjGrMluJk7pXakOrWecCmrc
	 z1z6KUfto9vaRlxL4+cchxaZUyC7EDbocIKc58LzwHL+UY/TxV911UHAvP0n4rnYNB
	 naB61vLLojdAe6xo+ZIq85/HHHgvyDzB272ApQqETClyaBTv92yKDM0RiMT0jmt82k
	 54b5WRdPoiY8w==
Received: by mercury (Postfix, from userid 1000)
	id 25E1D1060A25; Tue, 14 Nov 2023 00:04:22 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] GC0308 Camera Sensor
Date: Mon, 13 Nov 2023 23:57:19 +0100
Message-ID: <20231113230421.226808-1-sre@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I did the following tests on an i.MX6ULL based system [0]:

 * v4l2-compliance -u /dev/v4l-subdev1
   - v4l2-compliance 1.24.1, 32 bits, 32-bit time_t
     (from Debian testing)
   - Total for device /dev/v4l-subdev1: 44, Succeeded: 44
 * Using gstreamer + v4l2-ctl
   - Tried 640x480, 320x240, 160x120 YUYV8_2X8 formats
   - Tested effect of all exposed user controls
 * checkpatch does not report any driver issues
 * dt_binding_check does not report anything
 * rebinding driver works

[0] https://embedded-recipes.org/2023/schedule/running-foss-thermal-camera/

Changes since PATCHv3:
 * https://lore.kernel.org/all/20231027011417.2174658-1-sre@kernel.org/
 * Rebased to v6.7-rc1
 * Replace gc0308_is_valid_format() with gc0308_get_format_idx(),
   which can be reused in gc0308_set_format().
 * Remove the runtime PM get call in remove function
 * Move the runtime PM get call before the subdev register call in probe
 * Drop message about unsupported format code
 * Add Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 * Merged binding patch with the one from Alain Volmat and add
   Acked-by: Rob Herring <robh@kernel.org> and assign authorship
   to him, since his patch arrived first on the ML
 * Added two patches to fix an issue with v4l2_async_unregister_subdev()
   list handling

Changes since PATCHv2:
 * https://lore.kernel.org/all/20231024010355.1877523-1-sre@kernel.org/
 * Simplify Kconfig dependencies
 * Do not store code/resolution; which is available from subdev state
 * Store register values for mode settings to avoid second lookup in
   s_stream
 * Reduce power_on sleep times
 * remove debug dev_err() print, that I accidently added in v2
 * add missing format check in gc0308_enum_frame_size()
 * do not PM resume in gc0308_s_ctrl()
 * enable and use runtime PM autosuspend
 * add .init_cfg() PAD op
 * use CCI helper instead of raw regmap
 * cluster both flip controls
   (that's not just a performance optimization, but fixes an issue,
   that register update is slow, so fast sequential setting of VFLIP/HFLIP
   override each other without this)
 * simplify gc0308_set_power_line_freq
 * free control handler on probe error
 * use first format by default
 * expose V4L2_CID_HBLANK, V4L2_CID_VBLANK, V4L2_CID_PIXEL_RATE
 * remove incorrect support for framerate and instead add a comment

Changes since PATCHv1:
 * https://lore.kernel.org/all/20231023002547.1754190-1-sre@kernel.org/
 * Update binding: i2c0 -> i2c
 * Update binding: make GC0309 use GC0308 as fallback compatible
 * Add regulator handling in power_on/power_off
 * Fix alignment of regmap_multi_reg_write arguments
 * Fix useless extra return
 * Do not check for pad in gc0308_enum_frame_size()
 * Drop get_mbus_config implementation
 * Use V4L2_CID_AUTO_EXPOSURE_BIAS instead of V4L2_CID_EXPOSURE
 * Drop gc0308_get_format in favour of v4l2_subdev_get_fmt
 * Replace open-coded v4l2_find_nearest_size() logic
 * check clock rate instead of setting it
 * use fwnode_graph_get_endpoint_by_id()
 * power off device when probe errors out after power on
 * replace mutex with sub-device state
 * add Galaxycore to generic camera sensors section in MAINTAINERS
 * add GC0308 entry in MAINTAINERS

Greetings,

-- Sebastian

Alain Volmat (1):
  dt-bindings: vendor-prefixes: add GalaxyCore

Sebastian Reichel (5):
  media: dt-bindings: gc0308: add binding
  media: MAINTAINERS: Add GalaxyCore in camera sensor section
  media: v4l: async: Fix duplicated list deletion
  media: v4l: async: Drop useless list move operation
  media: i2c: gc0308: new driver

 .../bindings/media/i2c/galaxycore,gc0308.yaml |  108 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc0308.c                    | 1436 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-async.c          |    4 -
 7 files changed, 1565 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 create mode 100644 drivers/media/i2c/gc0308.c

-- 
2.42.0


