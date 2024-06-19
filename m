Return-Path: <linux-media+bounces-13642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2CE90E13B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4D01C20E03
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD40BAD24;
	Wed, 19 Jun 2024 01:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T82++PlW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C868FC01;
	Wed, 19 Jun 2024 01:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760263; cv=none; b=WtGn1hSZnCHlQdHhXxLfo/2aawiOHSAb3qJQikzSeaVWDXt1XjQRIz0J7ZJktdFodNL9ElsFXxHKA/mVVJrfvUZuX5vyERBjPuDjwR37j7xcRxIy8+rB/l1KLTYcGDVeiLY5sj68v9Hcz74gIrg77Q17m+1y7e5axRJIRLXjpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760263; c=relaxed/simple;
	bh=pdc/rvLQeLwwvqUbHBBgY9uhgpm81i4HF9/kBIZdaiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roeuYscJZjfiaOOKhj2x5LYB+pUnj3AmDT4+9+5XNVFni8B2BCbtkWPDwNrbCLt7G8WBQcusVlubDYxgoP5u4UdzD5YbDBLbR4e5j+va3MCBC5gBUsEg78chI7C4HhkXEc5h1uqSFqYjqLVG8v2dgTXj9wFbyIQvLQpT7EWugG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T82++PlW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 257DF289;
	Wed, 19 Jun 2024 03:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760241;
	bh=pdc/rvLQeLwwvqUbHBBgY9uhgpm81i4HF9/kBIZdaiY=;
	h=From:To:Cc:Subject:Date:From;
	b=T82++PlWOMiGRIeqK1WukRWc1XBnl/qVcQ6N5RUJ+r1q1bT+nN8JYI4JAbCj5HB+T
	 CzOYrBs/TJKMDt1es2Akq6n4+FoFwvSiYoITi/Ue1ZKJ9/rcaE9y0xn97Mw0yD1OLc
	 eMyC5usX716cC8zLfI+SQ2Dd9hb44lqaOtR8yAtI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 0/8] media: v4l2: Improve media link validation
Date: Wed, 19 Jun 2024 04:23:48 +0300
Message-ID: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series improves the link validation helpers to make it easier
for drivers to validate all links in a pipeline.

The vast majority of drivers use the v4l2_subdev_link_validate()
function as their .link_validate() handler for subdevs. This correctly
validates subdev-to-subdev links. For links between subdevs and video
capture devices, a few drivers implement the .link_validate() operation
of their video devices, while others implement manual validation in
their .streamon() handler, or don't implement validation at all. Links
between video output devices are in an even worse state, as the link
validation logic at pipeline start time does not call the
.link_validate() operation on the source side of a link, leaving manual
validation in .streamon() the only option. Adding insult to injury,
v4l2_subdev_link_validate() prints a warning when the link's source is
not a subdev, which forces drivers to implement a manual subdev link
validation handler for subdevs connected to output video nodes.

It turns out that v4l2_subdev_link_validate() is even used in the
.link_validate() implementation of video devices by two drivers. This is
clearly wrong, and is addressed by patches 1/8 to 3/8. Note that patch
3/8 should ideally implement real validation of the link between the
subdev and video capture device, but that requires understanding of the
driver's logic as well as testing, so I have left it out as an exercise
for the driver's maintainer. The patch doesn't introduce any regression.

Patch 4/8 then starts refactoring the v4l2_subdev_link_validate() to
separate the current warning in two categories, with a WARN_ON() for an
issue that indicates a clear driver bug (and does not occur in any
driver in mainline at the moment), and keeping the pr_warn_once() for
other issues that are present in multiple drivers.

Patch 5/8 continues with expanding v4l2_subdev_link_validate() to better
support links from video output devices to subdevs, delegating the
validation to the video output device's .link_validate() operation. This
allows using v4l2_subdev_link_validate() for all subdevs in a driver,
regardless of whether they are connected to other subdevs, video capture
devices or video output devices, and implementing all the link
validation for video devices in their .link_validate() operation.

Patches 6/8 to 8/8 then address the v4l2_subdev_link_validate() warning
for the vsp1 driver. Patch 6/8 adds a message to diagnose link
validation errors better, which was handy during development and
debugging of this series. Patch 7/8 then silences the warning. This is
unfortunately done with a workaround, as the ideal implementation,
moving all validation for video devices to their .link_validate()
operation as showcased in patch 8/8, breaks operation of the vsp1 unit
test suite. While that is fixable, it indicates that other userspace
applications may also break as a result.

To my great sadness, I had to mark patch 8/8 as [DNI]. This does not
make the v4l2_subdev_link_validate() improvements in patch 5/8
pointless, as they are useful for new drivers, as well as drivers that
don't include multiple video devices in a pipeline.

Laurent Pinchart (8):
  media: microchip-isc: Drop v4l2_subdev_link_validate() for video
    devices
  media: sun4i_csi: Implement link validate for sun4i_csi subdev
  media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video
    device
  media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
  media: v4l2-subdev: Support hybrid links in
    v4l2_subdev_link_validate()
  media: renesas: vsp1: Print debug message to diagnose validation
    failure
  media: renesas: vsp1: Implement .link_validate() for video devices
  [DNI] media: renesas: vsp1: Validate all links through
    .link_validate()

 .../platform/microchip/microchip-isc-base.c   | 19 +---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 98 ++++++++++---------
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 12 +++
 drivers/media/v4l2-core/v4l2-subdev.c         | 50 ++++++++--
 include/media/v4l2-subdev.h                   |  6 ++
 5 files changed, 115 insertions(+), 70 deletions(-)


base-commit: 91798162245991e26949ef62851719bb2177a9c2
-- 
Regards,

Laurent Pinchart


