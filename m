Return-Path: <linux-media+bounces-13937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE0791289C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 16:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B956B24EE7
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8917374EA;
	Fri, 21 Jun 2024 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k0G1PqoQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF6918C19
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981671; cv=none; b=RN5lzVcmY94oZOP/AjesWY138ZZ2LToVBnHegreWrPHNnfvDpfjTLJhQIENRSN5E/uvLBVIqCbkjIf+JCOzfR1d9Pzii1DykSXVRbfwntG2kVLa0AsYG9jRY3srJqcj8Bc53cQczQoRmS/19kHeciBb4SNO5oET5fhKj4MisXv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981671; c=relaxed/simple;
	bh=eeVpskxncd1PUOx7dPotg3/3tYxzahGWqHCcGwQ0Jb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQy7wh4WZdf5T17qIzdy/HqZ8DlIeUs6dF7gDdaEMLdtRpoGzG9WG5/YseYZ+TxqsVwYNHsdAq/ut8R8vXSZsuIKW9KD196JMgKKJ93At2v90uweoXHjIaTW8zphIqHKOI43rY/IWTGCh59PQnTLaEB6aP8GgozxfEVB9M9YX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k0G1PqoQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1C1B524;
	Fri, 21 Jun 2024 16:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718981646;
	bh=eeVpskxncd1PUOx7dPotg3/3tYxzahGWqHCcGwQ0Jb4=;
	h=From:To:Cc:Subject:Date:From;
	b=k0G1PqoQFUsFV0lO9uidaydTCjsVTdMHaotlCIhiyo1THiDt53RHNxJcGy5eacMms
	 8RRxQceA/T3fX1JTNLupL/khD2dc9JJrbAmJhUj6HS4X0dUK/kHDpvVM9voWcRjZQW
	 EWjvCQYLpBwVhlrx0ZjQDkZg9VYkLz6UPQoRaLmM=
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
Subject: [PATCH 0/7] media: rkisp1: Implement support for extensible parameters
Date: Fri, 21 Jun 2024 16:53:58 +0200
Message-ID: <20240621145406.119088-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
[2] https://gitlab.freedesktop.org/camera/libcamera/-/commits/imx8mp/extensible-format?ref_type=heads
[3] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/imx8mp/media-state/extensible-format-v2
[4] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1207025


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
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  25 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 727 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/rkisp1-config.h            | 497 ++++++++++++
 include/uapi/linux/videodev2.h                |   1 +
 7 files changed, 1249 insertions(+), 70 deletions(-)

--
2.45.2


