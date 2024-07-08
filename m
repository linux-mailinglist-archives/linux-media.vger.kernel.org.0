Return-Path: <linux-media+bounces-14695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F80892A02F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 12:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BCE11C21804
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7745B78286;
	Mon,  8 Jul 2024 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QSKzHKWH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CB7581F
	for <linux-media@vger.kernel.org>; Mon,  8 Jul 2024 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434503; cv=none; b=nwvErcK3eXz3EKB21PfiJ8mA3Or4IGLS1MnsbjqNzxJehnjOK0NowkJ+d07Ye1xjxQkQAir+2fPbr/UURr/NfSrUQgzBDCSiFLicyYnPxg9NyYyvj+2dHlstBDZ4cUml6gWHLXexh7k5omw6FBs846NUH/losWB1pSIusg0qRxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434503; c=relaxed/simple;
	bh=bW0HhvJ6fjIVZGMwESxXbWyXwStxLT4Eh5m7lEBuMmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpaR3+tigNShL9WpqrQLwlO4pmhRfdRtxwjS2IXzBmtypMeMHzUiI5hzDcuuVzRImeNSwpVjLYY5jJ4dzOaxgEpX/DM/sn7wgOd378KbsyJdTJ2JScDqwvg1mRi4xS6Ho/jg5L/CtatAkrhze5u2gYNlrtgTvjt9NQJxv2IvNlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QSKzHKWH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-59-142.net.vodafone.it [5.90.59.142])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ABD64C9;
	Mon,  8 Jul 2024 12:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720434468;
	bh=bW0HhvJ6fjIVZGMwESxXbWyXwStxLT4Eh5m7lEBuMmk=;
	h=From:To:Cc:Subject:Date:From;
	b=QSKzHKWHiY+Um0qRabiLRt+o5j/Ln6tmtoXZR24T0MP0NRIESsCHT8UCQN60Lgxs0
	 Frig0a7bgfJXqyGLHw5cTtXCrDiEwdZYOh6yTFZ9KRr/o6fdtSN3TtY4xJAa1fupR6
	 sEgw+VJFa5NYnTUUAEd80GtvEB5hCDnqd/L5R+LY=
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
Subject: [PATCH v6 0/7] media: rkisp1: Implement support for extensible parameters
Date: Mon,  8 Jul 2024 12:27:51 +0200
Message-ID: <20240708102759.53297-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
[2] https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1219454


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
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 768 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/rkisp1-config.h            | 489 +++++++++++
 include/uapi/linux/videodev2.h                |   1 +
 7 files changed, 1289 insertions(+), 69 deletions(-)

--
2.45.2


