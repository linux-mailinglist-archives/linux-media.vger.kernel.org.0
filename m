Return-Path: <linux-media+bounces-15848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F839493C5
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 16:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96B01C20EDD
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B342C1EA0C4;
	Tue,  6 Aug 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ebvYjxJv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3A1D61BD
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955892; cv=none; b=tQZN5orooaNwQPat+yXycH1saTp6JYoP6u2X0eutcJJIu+8rj7kBfDn3oMX2BRPlKn1YPzt+OmpjEKIyGLJ0KPqZG9EF13RbeVoJuDPiaUwIoSfwgx7DCyf0lYkdIkWpyx4WnvPpk3cLDMl9H5V89UwczRB+tO39gQZts4WlKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955892; c=relaxed/simple;
	bh=Kc4huUHqDPCy0l3xFuuBtoN3SV+MMS/zV/VGyWqlFUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3ygVxnVoa1VbqPxh6x/PxxnzJPfUgO/ILy+eL+srds9Sw7xsoIVWH/C1ZGqKsITXKJEP5qCpV+41PeQgcaNfmQQm5SKUm8a3LVRZxS30hvilmKIpi1Vkbz3ue1vLjrP1dVQOKSfnQr/I1SEttY+t2GBuNuPADcp6ztw6G4r3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ebvYjxJv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B27492C5;
	Tue,  6 Aug 2024 16:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722955835;
	bh=Kc4huUHqDPCy0l3xFuuBtoN3SV+MMS/zV/VGyWqlFUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ebvYjxJvtpE4rt9CMIuZvjxAtrz0jvVWi0Agl+bKVS67livodjzeZs6DTUiapRN2X
	 QVDPVNJ9G4jdVkHidxVhX4GrjZJyXA78z4OLy45JgVuVJqU7VOP1wa08HbYmk+iUpn
	 mi4XCG7aiPV/auslbop1oAoQ2eCMQH/OneIOt64o=
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
Subject: [PATCH v8 0/12] media: rkisp1: Extensible parameters and companding
Date: Tue,  6 Aug 2024 16:50:56 +0200
Message-ID: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 1024 +++++++++++++++--
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |   23 +
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |   51 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/rkisp1-config.h            |  581 ++++++++++
 include/uapi/linux/videodev2.h                |    1 +
 11 files changed, 1653 insertions(+), 157 deletions(-)

--
2.45.2


