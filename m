Return-Path: <linux-media+bounces-16005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2294C5D6
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 22:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE431F24185
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 20:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCD4158DA3;
	Thu,  8 Aug 2024 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d3cEheXz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC81494B5
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723149688; cv=none; b=njhmQY6f3xy5aGfxlk+xWE+2R7j6cQ1QVEDR49TNs8hlT9QSlkxH1/TWc3iDq0VtrsdfWmshqjIz6iHEg8j3+yXryT19c6gif1mqG51Fv1c/cBOY0hDgYNJdqLPs93Me8Z6tBDV31NJjRXnBtUFhxTxTx57Au6js/bAQeSPCfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723149688; c=relaxed/simple;
	bh=frs0fp+XQTwNP484QtSkftpPmiDFi/EFvcv1goBupk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ha/ZztHcXFaRilxta+xzB8Sn27ldSzLS2RxIvZ7T0XdVAlMd3AfjorYT+PHxqyXfc0Rqyi6m6uq6dFKuTzG/6p8dOm+vsBjW3f7a3FrC5DJny55R52jneMRvL46K9gJj3E00VTB+MO7UQUOufatVhiXCca5S2P1mHueA3U0WECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d3cEheXz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-118.net.vodafone.it [5.90.52.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC17C581;
	Thu,  8 Aug 2024 22:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723149624;
	bh=frs0fp+XQTwNP484QtSkftpPmiDFi/EFvcv1goBupk4=;
	h=From:To:Cc:Subject:Date:From;
	b=d3cEheXz2vNF1h4vg5JI9m9PdDH+XxHdzCYQHhUzijE8sCrHdjdYGI5F/C3D5AaXz
	 maKTtiOmkCQQ14kZDJtt40gtzNBPjJjhmP86/+zw3b7KSb3N8RzkJwXYc6rL4ZQ2xu
	 niMe2PE7syIJNRoRrgt1cCHtqDmyq+X8HXm5TSXQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v10 0/12] media: rkisp1: Extensible parameters and companding
Date: Thu,  8 Aug 2024 22:40:53 +0200
Message-ID: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9->v10
- Fix spelling error in format documentation

- Specify in uAPI header that only V1 of the extensible parameters format is
  supported

	--- a/include/uapi/linux/rkisp1-config.h
	+++ b/include/uapi/linux/rkisp1-config.h
	@@ -1514,6 +1514,12 @@ enum rksip1_ext_param_buffer_version {
	  * indicated version and return an error if the desired version is not
	  * supported.
	  *
	+ * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
	+ * When a new format version will be added, a mechanism for userspace to query
	+ * the supported format versions will be implemented in the form of a read-only
	+ * V4L2 control. If such control is not available, userspace should assume only
	+ * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
	+ *

- Validate parameters format version in the driver

	--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
	+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
	@@ -2585,6 +2585,14 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,

	+	/* Only v1 is supported at the moment. */
	+	if (cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
	+		dev_dbg(params->rkisp1->dev,
	+			"Unsupported extensible format version: %u\n",
	+			cfg->version);
	+		return -EINVAL;
	+	}
	+
 	/* Validate the size reported in the parameters buffer header. */
 	cfg_size = header_size + cfg->data_size;
 	if (cfg_size != payload_size) {

v8->v9:
- Redefine the enable/disable flags as suggested by Hans
- Specify in uAPI doc that 'flags = ENABLE | DISABLE' is not valid
- Check flags validity in rkisp1-params.c

v7->v8:
- uAPI:
  - Make the 'size' field of the header block an u32. Remove the
    __attribute__((aligned(8)) from the header declaration as it's now 8 bytes
    long
  - Make the 'enable' field of the header block a bitmask of flags. I introduced

	enum rkisp1_ext_params_block_flags {
		RKISP1_EXT_PARAMS_BLOCK_DISABLE	= 0x1,
		RKISP1_EXT_PARAMS_BLOCK_ENABLE	= 0x2,
	};

   to allow user-space to configure a block without changing its power state (by
   not setting any flag).

- driver:

  - As the 'enable' field is now a bitmask, the handling of the block enablment
    had to change as well. In example, for BLS:

	@@ -1626,7 +1626,7 @@ rkisp1_ext_params_bls(struct rkisp1_params *params,
	 {
		const struct rkisp1_ext_params_bls_config *bls = &block->bls;

	-       if (bls->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
	+       if (bls->header.flags & RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
						RKISP1_CIF_ISP_BLS_ENA);
			return;
	@@ -1634,7 +1634,8 @@ rkisp1_ext_params_bls(struct rkisp1_params *params,

		rkisp1_bls_config(params, &bls->config);

	-       if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS)))
	+       if ((bls->header.flags & RKISP1_EXT_PARAMS_BLOCK_ENABLE) &&
	+           !(params->enabled_blocks & BIT(bls->header.type)))
			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
					      RKISP1_CIF_ISP_BLS_ENA);
	 }

   this requires userspace to specify the DISABLE/ENABLE flags and not rely
   on the fact that !enable meant 'disable' as in v7

v6->v7:
- Collect [PATCH v2 0/5] media: rkisp1: Add support for the companding block
- Fix GOC handling
- Fix newly introduced errors in checkstyle and documentation reported by
  https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1231492

v5->v6:
- Collect [v5.2 6/7] from Laurent
- Collect Paul's tags
- Add extra validation for unexpected data after the payload end as
  suggested by Sakari

v4->v5:
- Refine validation of the ext params buffer following Laurent's suggestion
- perform memcpy of the parameters buffer after sizes validation

v3->v4:
- Introduce 'union rkisp1_ext_params_config' to avoid casts in the block
  handlers

v2->v3:
- Address Laurent's comments on the uAPI:
  - rename $block_config with  just 'config'
  - reduce header size
  - rename a few fields/blocks

- Address Laurent's comment on the params node:
  - Use the plane payload for memcpy() and buffer validation
  - drop buf_out_validate() and use buf_prepare() only
  - validate the total buffer size against the buffer payload
  - use const pointers where possible

v1->v2:
- re-order patches to introduce parameters buffer caching for the existing
  "fixed" format before introducing the "extensible" format
- align all structures to 64-bit boundaries in the uAPI
- remove NO_CHANGE enablement state and cache a bitmask of enabled blocks
- address review comments in documentation

The VeriSilicon ISP8000 IP, supported through the rkisp1 driver in the Linux
kernel, is integrated in several SoCs from different vendors. Different
revisions of the IP differ in the number of supported features and in the
register space location assigned to specific ISP blocks.

The current configuration parameters format, defined in
include/uapi/linux/rkisp1-config.h is realized by a C structure (struct
rkisp1_params_cfg) which wraps other structures that allows to configure
specific ISP blocks. The layout of the parameters buffer is part of the Linux
kernel uAPI and can hardly be extended or modified to adapt it to different
revisions of the same IP.

This series proposes the introduction of a new parameters format for the RkISP1
(without dropping support for the existing one) which is designed with the goals
of being:

1) versioned: can be changed without breaking existing applications
2) extensible: new blocks and parameters can be added without breaking the uABI

To do so, a new 'struct rkisp1_ext_params_cfg' type is introduced. It wraps an
header and a data buffer, which userspace fills with configuration blocks
for each ISP block it intends to configure. The parameters buffer is thus of
different effective sizes, depending on the number of blocks userspace intends
to configure.

The kernel driver parses the data block and decides, based on the versioning
number and the platform it operates on, how to handle each block.

The parameters format is very similar to the parameters format implemented
in the in-review Mali C55 ISP driver [1]

CI pipeline [2]

[1] https://lore.kernel.org/linux-media/20240529152858.183799-15-dan.scally@ideasonboard.com/
[2] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1242260


Jacopo Mondi (7):
  media: uapi: rkisp1-config: Add extensible params format
  media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
  media: rkisp1: Add struct rkisp1_params_buffer
  media: rkisp1: Copy the parameters buffer
  media: rkisp1: Cache the currently active format
  media: rkisp1: Implement extensible params support
  media: rkisp1: Implement s_fmt/try_fmt

Laurent Pinchart (2):
  media: rkisp1: Add helper function to swap colour channels
  media: rkisp1: Add features mask to extensible block handlers

Paul Elder (3):
  media: rkisp1: Add register definitions for the companding block
  media: rkisp1: Add feature flags for BLS and compand
  media: rkisp1: Add support for the companding block

 Documentation/admin-guide/media/rkisp1.rst    |   11 +-
 .../media/v4l/metafmt-rkisp1.rst              |   57 +-
 .../platform/rockchip/rkisp1/rkisp1-common.c  |   14 +
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   38 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |    9 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 1041 +++++++++++++++--
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |   23 +
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |   51 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/rkisp1-config.h            |  578 +++++++++
 include/uapi/linux/videodev2.h                |    1 +
 11 files changed, 1667 insertions(+), 157 deletions(-)

--
2.45.2


