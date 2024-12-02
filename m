Return-Path: <linux-media+bounces-22461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF79E0619
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60684284BBB
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA51A205ABD;
	Mon,  2 Dec 2024 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BhEGbme0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84B204F70
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151524; cv=none; b=BLJqiFkKcy0U9BB16loalf+kxC/W/5GFETWxRELGOrpgcdUkUo2iwpPt7hln3kjKeTfEKeii2eS/yMu6PWhMYMi+INC25t9we+/xN2k+9MEppQz+sjOMW2OCep39zUwxlDbX3gE+0mXQffXyIHjwHl7R2S+pmbjftl71A8G12VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151524; c=relaxed/simple;
	bh=cQojCg8wzDP1w//0t2KgX0EGY9/RmE+SoGKIU8KzRQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kru6ecMq/oyz2m8pMpzHYrwpWogNS9swVsqYktXqxdSDV5eN7siH+lKp1ERRN9oXLCpwA32rJ8dBgSs8rrZjEKMCSX676HmmE0W2zlgMk4ny8Q0T5QFlZmDQHeUeRzRuB4yR5tmZSwfoYFQc1sUJaPn9jwNv74nHDNiT+nLGPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BhEGbme0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 327B46DE;
	Mon,  2 Dec 2024 15:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733151493;
	bh=cQojCg8wzDP1w//0t2KgX0EGY9/RmE+SoGKIU8KzRQw=;
	h=From:To:Cc:Subject:Date:From;
	b=BhEGbme0DLmEIBnEFXJHpOnsbgJKbJLCTMlX3GoqOgD348wt9v2NOlNK3kqWYiUu8
	 r02iyTtYXdCeS237/W/fsj0pn5ad86qONKqCYCyzMi2DpOwiDHP7hrqbYNG67+6zzZ
	 CoAKBTgH3J5WwkmM02XYruSeysLD9v1fXSDqruGs=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 0/5] Extend RAW format support for rzg2l-cru driver
Date: Mon,  2 Dec 2024 14:58:26 +0000
Message-Id: <20241202145831.127297-1-dan.scally@ideasonboard.com>
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

v2: https://lore.kernel.org/all/20241112124614.646281-1-dan.scally@ideasonboard.com/T/
v1: https://lore.kernel.org/all/20240927232729.GR12322@pendragon.ideasonboard.com/T/

Daniel Scally (5):
  media: v4l2: Add Renesas Camera Receiver Unit pixel formats
  media: platform: rzg2l-cru: Use v4l2_get_link_freq()
  media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
  media: rzg2l-cru: Support multiple mbus codes per pixel format
  media: platform: rzg2l-cru: Add support for RAW10/12/14 data

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-rawnn-cru.rst            | 144 ++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  39 +++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 108 ++++++++++---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |   5 +-
 drivers/media/v4l2-core/v4l2-common.c         |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 9 files changed, 280 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst

-- 
2.34.1


