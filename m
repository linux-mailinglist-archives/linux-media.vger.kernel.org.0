Return-Path: <linux-media+bounces-2040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B204480B24A
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 06:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41C6AB20A11
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 05:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917851FDF;
	Sat,  9 Dec 2023 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbVidt4e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8411840;
	Sat,  9 Dec 2023 05:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1856BC433CA;
	Sat,  9 Dec 2023 05:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702101372;
	bh=aCFfBSa9nnx8NNyT0B152rksUW5wx19k9ppcNts1/nE=;
	h=From:To:Cc:Subject:Date:From;
	b=SbVidt4eudpBAv4qg8oFBO0eTQ8Lcbao1ZQRZJv0BRhnhy2gWtUjLG+nqbZrBedoR
	 7awjExc+ku+Z3LngNI14pSYamtVDvh3RXSgaGdtlfKNLc3NbuAdQfRLUQS3v9LQziG
	 qaeSGjaU5gj4QFFqG/XqrD7OQlWg6N4VLCquoAm9HoPhbO94nOgVVISkSou+u8Em7Q
	 NlKjHBvjGNse0k/3aGh90uGqqhGJ4YGL9tHyb93cl8wEt+t36CI1ba43BIjBj1xhvK
	 kRRuT+WJbFz3gNUPXxcpS0wcc9cKe/W6/j7BRXiZ6rTZaEb6MX3ZCCrjYGHx5xcmmI
	 ubQ4lvr9gKjKQ==
Received: by mercury (Postfix, from userid 1000)
	id 40EE9106CC70; Sat,  9 Dec 2023 00:19:48 +0100 (CET)
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
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 0/3] GC0308 Camera Sensor
Date: Sat,  9 Dec 2023 00:18:16 +0100
Message-ID: <20231208231933.284277-1-sre@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi,

I did the following tests on an i.MX6ULL based system [0]:

 * v4l2-compliance -u /dev/v4l-subdev1
   - v4l2-compliance 1.26.0, 32 bits, 32-bit time_t
     (from Debian testing)
   - Total for device /dev/v4l-subdev1: 45, Succeeded: 45
 * Using gstreamer + v4l2-ctl
   - Tried 640x480, 320x240, 160x120 YUYV8_2X8 formats
   - Tested effect of all exposed user controls
 * checkpatch does not report any driver issues
 * dt_binding_check does not report anything
 * rebind driver works

[0] https://embedded-recipes.org/2023/schedule/running-foss-thermal-camera/

Changes since PATCHv4:
 * https://lore.kernel.org/all/20231113230421.226808-1-sre@kernel.org/
 * Rebase to latest master branch from Sakari
  - v4l2_subdev_get_pad_format -> v4l2_subdev_state_get_format
  - v4l2_subdev_get_try_format -> v4l2_subdev_state_get_format
  - v4l2_subdev_pad_ops.init_cfg -> v4l2_subdev_internal_ops.init_state
 * Fix feedback from Tommaso Merciai
  - uint8_t -> u8
  - drop extra newline
  - introduce gc0308_init_controls
 * Drop galaxycore vendor binding (merged)
 * Drop async fixes (merged to different tree)

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

Sebastian Reichel (3):
  media: dt-bindings: gc0308: add binding
  media: MAINTAINERS: Add GalaxyCore in camera sensor section
  media: i2c: gc0308: new driver

 .../bindings/media/i2c/galaxycore,gc0308.yaml |  108 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc0308.c                    | 1451 +++++++++++++++++
 5 files changed, 1578 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 create mode 100644 drivers/media/i2c/gc0308.c

-- 
2.42.0


