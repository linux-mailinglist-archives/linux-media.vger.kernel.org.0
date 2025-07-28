Return-Path: <linux-media+bounces-38599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6AB14503
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 01:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032EB16DA94
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 23:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3A821D3D2;
	Mon, 28 Jul 2025 23:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iLRtxJwm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB31A316E
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753746629; cv=none; b=U4E2khut7JL02w13VLetgUrtiHvaePBj+dL9VPsk1jZarH58oSDHh5UPhPuGb9YQw8tXYgQms/Xy/MC/FnNd+3j3oCQOO4qCeIwXb/JsPXRnXRAO4pyom1POZQzqIEg2iiMFBZDIASNaFcl0Fv8hkBs3dg9bhxdmeQtn+9xymAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753746629; c=relaxed/simple;
	bh=RI73O+zmPB4C0fTh98GuF/ncZBGRUdMTLwZoCRPvL+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HM8onys6nsQKe5d3rnfxIzqeNNVM1sk9wZhg2lIEgsX/WPi6REYia3QCEcXM6x+xZvaijocRKFkDP+HR8hJAokVzxhEnqC0EagSLuplBhw8yaZ2Ef/RdMVZkGR5mU8oZCTDbW8m75HCHj9jqLZCbWD+b1WUmI8rGTzgX2P2SSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iLRtxJwm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9C4BAC71;
	Tue, 29 Jul 2025 01:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753746575;
	bh=RI73O+zmPB4C0fTh98GuF/ncZBGRUdMTLwZoCRPvL+8=;
	h=From:To:Cc:Subject:Date:From;
	b=iLRtxJwmVd6mvGHBN9j3fzIFCq1CYTROT1U1VoI22WJNXjzfr3KdAwQ4r/bPbuCUk
	 HcNgfQW5Cneqkq/Lk95+KrPKGgM+es7SEqP0hLeGSz7LcX2YCTmE6LsmKNOL6cfeyv
	 xfHZpaGo7NaU0B3zrpVgS/rv88yD1UlaLUkA88UY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 0/3] media: Make v4l2_subdev_stream_config private
Date: Tue, 29 Jul 2025 02:50:07 +0300
Message-ID: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series attempts to avoid usage of the
v4l2_subdev_stream_config structure in drivers. The rationale is that
the structure was meant to be an implementation detail. Recent
discussions about how we store stream config led to considering a need
to rework the internals, and usage of the structure in drivers makes
this more difficult.

Patch 1/3 and 2/3 drop usage of the structure in the ds90ub913 and
ipu7-isys drivers, and patch 3/3 then makes the structure private to
v4l2-subdev.c.

Ideally we should also make v4l2_subdev_pad_config private, but it has a
few more users:

drivers/media/pci/saa7134/saa7134-empress.c
drivers/media/platform/atmel/atmel-isi.c
drivers/media/platform/intel/pxa_camera.c
drivers/media/platform/marvell/mcam-core.c
drivers/media/platform/renesas/renesas-ceu.c
drivers/media/platform/via/via-camera.c
drivers/staging/media/deprecated/atmel/atmel-isc-base.c

All those drivers are video-centric drivers that use
v4l2_subdev_pad_config to implement TRY_FMT. I think we could use
v4l2_subdev_call_state_try() in those drivers, like done in

commit f076057f0107c3ef890bfad8d6658387504e7f11
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Fri Jul 1 14:15:59 2022 +0100

    media: stm32: dcmi: Fix subdev op call with uninitialized state

I however lack the ability to test that beside compile testing.

Laurent Pinchart (3):
  media: i2c: ds90ub913: Stop accessing streams configs directly
  media: staging/ipu7: Disallow source multiplexing
  media: v4l2-subdev: Make struct v4l2_subdev_stream_config private

 drivers/media/i2c/ds90ub913.c                 | 17 ++++-----
 drivers/media/v4l2-core/v4l2-subdev.c         | 24 +++++++++++++
 drivers/staging/media/ipu7/ipu7-isys-queue.c  |  3 +-
 drivers/staging/media/ipu7/ipu7-isys-subdev.c | 35 ++++++-------------
 drivers/staging/media/ipu7/ipu7-isys-subdev.h |  1 -
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 35 ++-----------------
 include/media/v4l2-subdev.h                   | 25 +------------
 7 files changed, 48 insertions(+), 92 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart


