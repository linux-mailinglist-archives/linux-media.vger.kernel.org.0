Return-Path: <linux-media+bounces-12590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E263B8FD32F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6016BB2286C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 16:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4605F188CDE;
	Wed,  5 Jun 2024 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AgCNIgcn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B918188CA8
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606503; cv=none; b=oo+UAAnbugtt/MRoLUBnaKWyeh/Rw3+52jHWTCtnEX0pyAfiF7IzLcJzf/GIn/pOqh+Gxw+OFLbYF4tnbchE3zzAG9/ZKfzA/cJy8GjVpykF2t/VyWmoyKp2Dih9wlk6d4kJZDqvuqnVSNBjVF5K4zcus1dp4XzGPeUaqXCGpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606503; c=relaxed/simple;
	bh=HK62skjpVwxfWthHvTaDzWTrTAQushfJr6EdWX9UVaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cl3Yz+yPiP8LTbD+4ifJ29zpznjIzYBG3dVEKSqG/f38bEDkaxQvM2gdhlZ0eTOs34Bu+wngjw/ca6vMl8aBpN0R+H0T7zUAMpJZ4mlyoTakFqQYkDKUjMSwHQFVvBl1IdUppCrVjb9rNuIsj7kUwqQWrjROBP96v0Op+zfWDQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AgCNIgcn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0F8410C4;
	Wed,  5 Jun 2024 18:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717606488;
	bh=HK62skjpVwxfWthHvTaDzWTrTAQushfJr6EdWX9UVaI=;
	h=From:To:Cc:Subject:Date:From;
	b=AgCNIgcnVL/fyo4I5pESGdws4O562FThBzP6DBa6k8B9/3LZWMmgk0EAhwjCDoEL3
	 5u7Ccywa5u+KFtds5YywBj/8bcPCI9nMxW9J3Dp/1QRHT9PVSvpOzaq2Sxb2i4C/OM
	 qVFUJ8Eph1baYXH3PGpBy/xfM5+4vX5KAVjJY0qo=
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
Subject: [PATCH 0/8] media: rkisp1: Implement support for extensible parameters
Date: Wed,  5 Jun 2024 18:54:19 +0200
Message-ID: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
with a libcamera version ported to use the newly introduced format [1] and works
as expected, so I considered it good enough to send a proper patch series

A kernel branch for the interested ones is available at [3] with an associated
CI pipeline [4]

[1] https://lore.kernel.org/linux-media/20240529152858.183799-15-dan.scally@ideasonboard.com/
[2] https://gitlab.freedesktop.org/camera/libcamera/-/commits/imx8mp/extensible-format?ref_type=heads
[3] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/imx8mp/media-state/extensible-format
[4] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1194073

Jacopo Mondi (8):
  uapi: rkisp1-config: Add extensible parameters format
  uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
  media: rkisp1: Remove cached format info
  media: rkisp1: Add support for ext format
  media: rkisp1: Implement extensible params support
  media: rkisp1: Propagate pre/post-config errors
  media: rkisp1: Add struct rkisp1_params_buffer
  media: rkisp1: Copy and validate parameters buffer

 Documentation/admin-guide/media/rkisp1.rst    |  11 +-
 .../media/v4l/metafmt-rkisp1.rst              |  62 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  29 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  14 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 795 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/rkisp1-config.h            | 482 +++++++++++
 include/uapi/linux/videodev2.h                |   1 +
 8 files changed, 1314 insertions(+), 81 deletions(-)


base-commit: 1aea3d1d4a21e3e7895663b848ffae79ee82e065
--
2.45.1


