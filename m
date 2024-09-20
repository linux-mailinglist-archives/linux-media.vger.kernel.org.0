Return-Path: <linux-media+bounces-18417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1E97D587
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 14:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFFF7B21163
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 12:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1FE150997;
	Fri, 20 Sep 2024 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qPXcdbgj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBD13D52B
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836094; cv=none; b=FiI+hIgTL/oYqP2UezlRFm2YiQXa/O17y99iIb2HM626Dcrhql/qs+WoKZqiFUQK9/6f/cJkcKKLUJlfBqp3rps261mp+PNDKbfRwiGo5e77a27y78F8YFqy5RKoc4kXUUZQB5R2mfrBWbCz57DGjGqAfNwpFhYyyR8ma0d/3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836094; c=relaxed/simple;
	bh=DliYHsJs9oEDz3vJys8j9xeNP5w8KX9fsw/9mDruxCg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W0fpmCJF7rWmZsX9+kjYk5R6P3vL4Txcm7bdd1lqZYWL4lbnEKqjm6669EzbGDumx4oG6v0XyiEKPvbh6RFseOHdEdO6DpHOjxVhJOSSloWCPDbmkzFfANQKZ2JZf2xQ+hCAwU3E+NgYbSmTUWpJfeFfY5yUF4m1WRQlVubK2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qPXcdbgj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D61F3DA;
	Fri, 20 Sep 2024 14:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726836006;
	bh=DliYHsJs9oEDz3vJys8j9xeNP5w8KX9fsw/9mDruxCg=;
	h=From:To:Cc:Subject:Date:From;
	b=qPXcdbgjzTqyQRtxJNizX3TqqBoP1qTG/KM81QN02OIagzWg1kQ2D+PFv6VKYlqo7
	 k/5Xx8Og2Cpvh4+0k4I6yGrhJ6gqh2gvyV2JZkNyQyfGXh7pb3N0jjveUYPgAWY1Jm
	 HXvfFgbJxMKJyQMC6bDfNd0J5x7qlPGfI/yZmNgo=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/4] Extend RAW format support for rzg2l-cru driver
Date: Fri, 20 Sep 2024 13:41:11 +0100
Message-Id: <20240920124115.375748-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All

This series adds new pixel formats representing the 64-bit packed format that's
used by the Camera Receiver Unit in RZ/G2L and V2H SoCs. Support for capturing
those formats is then added to the rzg2l-cru driver itself.

The series is based on top of the v2 of Prabhakar's recent set titled
"media: platform: rzg2l-cru: CSI-2 and CRU enhancements"

Thanks
Dan

Daniel Scally (4):
  media: v4l2: Add Renesas Camera Receiver Unit pixel formats
  media: platform: rzg2l-cru: Use v4l2_get_link_freq()
  media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
  media: platform: rzg2l-cru: Add support for RAW10/12/14 data

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-srggbnn-cru.rst          | 143 ++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   3 -
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  37 +++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  88 +++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  21 +--
 drivers/media/v4l2-core/v4l2-common.c         |  12 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  12 ++
 include/uapi/linux/videodev2.h                |  16 ++
 9 files changed, 280 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst

-- 
2.34.1


