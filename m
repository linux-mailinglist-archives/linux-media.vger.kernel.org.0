Return-Path: <linux-media+bounces-15303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04E93AE0E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 10:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0D821C21E1D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02EB14C58A;
	Wed, 24 Jul 2024 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g53VeXc4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05C4D8D1
	for <linux-media@vger.kernel.org>; Wed, 24 Jul 2024 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721811035; cv=none; b=IP17C/CdNaMC25hn19QnRy+tPjOY0Fd0m+/K7jzwvCvXuz4oeL+zqAkajucVvwbp5Tt/DxWp4Kr5RQvxERGQQxPzSblaiH1/vQAxXEm3ZJO66s4PH7tYrDEmMl6pfZnWu/1c/4OvBjLYMEgYB69pb8zhAUwCW/e85LKaMSkTJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721811035; c=relaxed/simple;
	bh=wmZw8TCyDYBDT8uMoFLTpbxC32ZB0fKyIDPtmhtsEPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gCGnQADGhMjND67SIuMa+knoPTgRwLf1+4eiPGqgRMfRc8XGmPVJiZqi/f4ZxXUEqXf6mNlfidNuaoEYTBmch/+V35oB5Dz/nlXfgkBmTXDDw/pq/omUjbP3YacTPe12sVv97ps3dohWZlEWJBAZGSWQ8anpmqPrW+XYYB6eXaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g53VeXc4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:24bf:30c5:c4f3:c9fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13C1D4CF;
	Wed, 24 Jul 2024 10:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721810986;
	bh=wmZw8TCyDYBDT8uMoFLTpbxC32ZB0fKyIDPtmhtsEPY=;
	h=From:To:Cc:Subject:Date:From;
	b=g53VeXc49ZrkV2krWbgxWzo3AMCztgfsea3OFbgxjgFLS9cyHEvZ2ZLGzC9L+JsEL
	 H5kbyOQbHYl0btDow8QHWSrAKPXSgnb5ZI6f7h1HgWzK9gzRqtzF4JEy4eP223i9bP
	 jD4dKEdoQMWD9StDsGae0vdrS8NighGD10sq/CMc=
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
Subject: [PATCH v7 0/12] media: rkisp1: Extensible parameters and companding
Date: Wed, 24 Jul 2024 10:49:51 +0200
Message-ID: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
[2] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1231500

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
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 1016 +++++++++++++++--
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |   23 +
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |   51 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/rkisp1-config.h            |  576 ++++++++++
 include/uapi/linux/videodev2.h                |    1 +
 11 files changed, 1640 insertions(+), 157 deletions(-)

--
2.45.2


