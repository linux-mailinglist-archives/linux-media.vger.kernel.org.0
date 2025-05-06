Return-Path: <linux-media+bounces-31849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78038AAC48C
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC491C25ED3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAF927FB36;
	Tue,  6 May 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rmqlrkLx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A08F27E1D7
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535828; cv=none; b=paZRyBdRQrOBaH2FKhRjX6DejjTrb0tMHF6BrAnOYqDQMl8YzETTlpN+b1EODZZ1bB2sXFsZbc9ZfgKuDPMW1sKVAkttQOlLlo5a3wOlJGjWXbEUOSY8IyymvYq5EgyBv0GOkYS4j+dwz7WpGjlQW3sUpKg85v9hXsLF37jJNp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535828; c=relaxed/simple;
	bh=e2TOx/boN7tN2w06yVHqGe+aD1oZeO2OHIVNRjb4Y5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A+l9+H3S6HRyLz0XbE11tUDqvrJiXmyYHtsDdp+kRUGjjb7DYHGEERriNCIA8HSInr0K9DZIXSovEecF40qo7XXuZg717nRL/5vGDx5IMLikmcdCy9sPSc2TnLWvSmg3UfE417OE2zGQf0pjZGP7gkYdKYxn0L6/eZmOjUfR9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rmqlrkLx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55D91129;
	Tue,  6 May 2025 14:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746535814;
	bh=e2TOx/boN7tN2w06yVHqGe+aD1oZeO2OHIVNRjb4Y5g=;
	h=From:To:Cc:Subject:Date:From;
	b=rmqlrkLxKhCps/dugqQSEwGDfmrJ51S4Km/7Zij8UKxZyrFhLbh0pc9P0zBPgPa0t
	 OAZX9fGXtkBs6iNjPL3i7By+CV0YC1uU+91ixsyqtLvbs2EJZe1efuhXKor5jCWTMk
	 LO9JHdvMfovHDNPHTkqFTU/Aw8QGpZKKzxn+kaFk=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v4 0/6] Extend RAW format support for rzg2l-cru driver
Date: Tue,  6 May 2025 13:50:09 +0100
Message-Id: <20250506125015.567746-1-dan.scally@ideasonboard.com>
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

Thanks
Dan

v3: https://lore.kernel.org/linux-media/20241202145831.127297-1-dan.scally@ideasonboard.com/
v2: https://lore.kernel.org/all/20241112124614.646281-1-dan.scally@ideasonboard.com/T/
v1: https://lore.kernel.org/all/20240927232729.GR12322@pendragon.ideasonboard.com/T/

Daniel Scally (6):
  media: v4l2: Add Renesas Camera Receiver Unit pixel formats
  media: rzg2l-cru: Add vidioc_enum_framesizes()
  media: platform: rzg2l-cru: Use v4l2_get_link_freq()
  media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
  media: rzg2l-cru: Support multiple mbus codes per pixel format
  media: platform: rzg2l-cru: Add support for RAW10/12/14 data

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-rawnn-cru.rst            | 143 ++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 +++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 108 ++++++++++---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  40 +++--
 drivers/media/v4l2-core/v4l2-common.c         |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 9 files changed, 308 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst

-- 
2.34.1


