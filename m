Return-Path: <linux-media+bounces-14477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6891E5E2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 18:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865201C2161C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBE316DC16;
	Mon,  1 Jul 2024 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vS53mDAB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D016D4F4
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852764; cv=none; b=iicrDYGMRv6NHS63GHZMh6UQYk9EPQmWt/bMO0AdxEkPhjFYXbO/gIUlI+TOkIdIu4HMZmT34wVeO0JkIIKnnqxOqZHXKoEVz7Vz7ebjBfV0iRVUNcxVLbaTWgVqpu/1kS8FCZgq6LhD0Q6i05zSoltvRQFvz9rxo2cSh97TUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852764; c=relaxed/simple;
	bh=JQ8+H1qJ8NABIHicPAo3lfebQ2bxtFOCbFZbWpRFlKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3IImFUgKPiaFVgsEZSUkMa26wovFfLHxaUN1Vcx2zi1ssI0M/MprEtWQyC32zSZ8+kPEkhSaSXvB8XzFjpWPtydVRMe7qy35T3el0QxE9G6/41lfWoYdYPM366keu/5aF7mbvyPG6ndmnTM2Usx4pBy4Hcm1Pm93kj5JOacRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vS53mDAB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20EF2289;
	Mon,  1 Jul 2024 18:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719852731;
	bh=JQ8+H1qJ8NABIHicPAo3lfebQ2bxtFOCbFZbWpRFlKA=;
	h=From:To:Cc:Subject:Date:From;
	b=vS53mDABf40K2pXeNXm6MNko9uh42Hi9mUjy4i2QD7842nTUD1kYWhWhy0ode/5Si
	 XHoUytWIG/DVkEYcP/E4Mcz6aZBHaPXewG9U7o6durqDjyPdNTebC8xETnzQUYcuVr
	 EWyU2IHo8FxRbN8taIbLyTILeUINUBWn6NOZdHyw=
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
Subject: [PATCH v3 0/7] media: rkisp1: Implement support for extensible parameters
Date: Mon,  1 Jul 2024 18:52:14 +0200
Message-ID: <20240701165222.205510-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

I considered sending this out as RFC, but the implementation has been tested
with a libcamera version ported to use the newly introduced format [2] and works
as expected, so I considered it good enough to send a proper patch series

A kernel branch for the interested ones is available at [3] with an associated
CI pipeline [4]

[1] https://lore.kernel.org/linux-media/20240529152858.183799-15-dan.scally@ideasonboard.com/
[2] https://gitlab.freedesktop.org/camera/libcamera/-/commits/imx8mp/extensible-format
[3] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/imx8mp/media-state/extensible-format-v3
[4] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1214712

Jacopo Mondi (7):
  uapi: rkisp1-config: Add extensible parameters format
  uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
  media: rkisp1: Add struct rkisp1_params_buffer
  media: rkisp1: Copy the parameters buffer
  media: rkisp1: Cache the currently active format
  media: rkisp1: Implement extensible params support
  media: rkisp1: Implement s_fmt/try_fmt

 Documentation/admin-guide/media/rkisp1.rst    |  11 +-
 .../media/v4l/metafmt-rkisp1.rst              |  57 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  31 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 741 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/rkisp1-config.h            | 489 ++++++++++++
 include/uapi/linux/videodev2.h                |   1 +
 7 files changed, 1261 insertions(+), 70 deletions(-)

--
2.45.2


