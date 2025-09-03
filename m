Return-Path: <linux-media+bounces-41656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E1B41BB4
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FEF33A1DEC
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0882EA17B;
	Wed,  3 Sep 2025 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JxgJgN5k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7632E9EA9;
	Wed,  3 Sep 2025 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894999; cv=none; b=A9KO7qzChDOJOHrCD0pRQedKQwX7ihY444CDBddvc8oxkezaXbKUD1Gnan7e9CIqv67UXt+sEGO/Hd8VWi8s1owA7/oKpQxHkG9Q/l2J/u4ofqDwPYiUEOAe5Q3I4Kvo+FR1/OV+y26FtXTOf/fie8DBQ2XNh8W1OjFgmEDF42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894999; c=relaxed/simple;
	bh=GbcLAdAhFKI9Ex7GIGV1fgOFZiAQOcEHxjTZZhi1/kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwP7M8RaxAPfxM4LISlwhPAwGiH5eHJpiKSLmOdNsM+Rjh3JROvARdAFLjlflSbJGj3NcHN/Wq6zyPjdKyOjpnko09zkWpS2aWo/W2PgT6gN1GETBd8CInbw1FXiI2TZ7pAOPkpvDujCkP8QiBnbbIYk3iYuO07B90m7bt9UrUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JxgJgN5k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A277A982;
	Wed,  3 Sep 2025 12:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894924;
	bh=GbcLAdAhFKI9Ex7GIGV1fgOFZiAQOcEHxjTZZhi1/kw=;
	h=From:To:Cc:Subject:Date:From;
	b=JxgJgN5k0EjPF1CIuYMT1+2TtAjMpHWrC5RxIg8Kj2tPMVQsWxh+C28GuFMkA26Uy
	 GPJpN5dbvhbgPsdjIid5iXS0i8UHRVwGEBz3SgDbivbLS4nGLPBneTe75HhYNLWF24
	 QX8sQ71uRGV4zzobYJ1wOArfTX24rEVbaK54uhjk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 0/3] media: imx-mipi-csis: Get the number of active lanes from mbus_config
Date: Wed,  3 Sep 2025 11:22:39 +0100
Message-ID: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that the number of desired active MIPI CSI2 data lanes
does not match the maximum listed in device tree. Add a helper function
to v4l2_common that calls the get_mbus_config op to get the number of
actively used data lanes in drivers that support it.

Compare it to the number of lanes configured in device tree, and if its
invalid, use the number present in device tree.

This series also uses the helper in imx-mipi-csis driver to set the
currently configured num_data_lanes, while keeping track of the number
of data lanes set in device tree to ensure we can still use all possible
lanes if we need to, and the upstream subdev driver requests them.

Tested on v6.15, compile tested on v6.17-rc4.

---------

Changes v1 -> v2:

- Added helper function to get active data lanes in v4l2-common
- Store the maximum data lanes possible, as configured in device tree
- Added media: prefix to commit titles

Isaac Scott (3):
  media: v4l: Add helper to get number of active lanes via a pad
  media: imx-mipi-csis: Store the number of data_lanes configured in dt
  media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c |  8 ++++++-
 drivers/media/v4l2-core/v4l2-common.c      | 25 ++++++++++++++++++++++
 include/media/v4l2-common.h                |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.43.0


