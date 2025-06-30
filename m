Return-Path: <linux-media+bounces-36371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18710AEEADC
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4267E17BD92
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397E6291C05;
	Mon, 30 Jun 2025 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZQdLVUyt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869E242D82
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325504; cv=none; b=qPTU83bYXgvdWYfIkPNfha2lpQQmX7i5XdYSECWQ3jxu50CpZL9TxDAeT4m31wDZlOVEJc00YUIvGfp/XR3j/yUSrdtN2TYlnf5PerNxVJ+ZiFfzn/FHkDnlnuX5kcNZwJE+AhYhsyLorQ8HZ7FtxK1HKXsHCkoV1IWVXA6F4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325504; c=relaxed/simple;
	bh=V8jnMuKUH3YwT+jFbEcDbFyrvLTLIFSZvsi8UuzzU44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2s/pwBMj10boP/iZe4ymtRWHkmjAbYuKVt0W3+KrdDs3J0JyTzLoB9iEWqNtJOR2V1FbRnCWYqJOvWMwOdQcA/IGo8UkPpjqybi+2fCOlMaQRyhvc95+dAiRrZOrqkDkh6UY8AxZqGBti9nTJBgMewx/TzQUcEMqLmc+eGk2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZQdLVUyt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1FDB87E4;
	Tue,  1 Jul 2025 01:17:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751325479;
	bh=V8jnMuKUH3YwT+jFbEcDbFyrvLTLIFSZvsi8UuzzU44=;
	h=Date:From:To:Cc:Subject:From;
	b=ZQdLVUyt7LzxCjJvZWAeGzf1bXBb9ggahtToe+8RMgApl9/8XQ87MHAqO6fTCvpe2
	 LTGjknoYT+f1+FvIZ2LBWW1RKn3/L7nTkzL4kqohYgymRizJl93y/HR8Dr9uy8uwgb
	 FTA2J/gdpAGrnlAatxlcq8Of9iztkE+9VAHuSpzU=
Date: Tue, 1 Jul 2025 02:17:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [GIT PULL FOR v6.17] Renesas media changes
Message-ID: <20250630231755.GI24861@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Mauro, Hans,

The following changes since commit 35392e855abf7d02ad3b061cbc75c7c7c37f0577:

  media: i2c: max96714: Drop check on number of active routes (2025-06-30 09:06:21 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20250630

for you to fetch changes up to ee2ca80e8eeaa5cfbb8d0cbc9954084e517c00b5:

  media: platform: rzg2l-cru: Add support for RAW10/12/14 data (2025-07-01 01:34:54 +0300)

----------------------------------------------------------------
Changes for Renesas media drivers:

- RAW formats support in the CRU driver
- Miscellaneous cleanups

----------------------------------------------------------------
Daniel Scally (6):
      media: v4l2: Add Renesas Camera Receiver Unit pixel formats
      media: rzg2l-cru: Add vidioc_enum_framesizes()
      media: platform: rzg2l-cru: Use v4l2_get_link_freq()
      media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
      media: rzg2l-cru: Support multiple mbus codes per pixel format
      media: platform: rzg2l-cru: Add support for RAW10/12/14 data

Jacopo Mondi (1):
      media: vsp1: Add missing export.h

Lad Prabhakar (2):
      media: renesas: rzg2l-cru: Simplify FIFO empty check
      media: renesas: rzg2l-cru: Fix typo in rzg3e_fifo_empty name

Laurent Pinchart (1):
      media: vsp1: Use lockdep assertions to enforce documented conventions

Tommaso Merciai (1):
      media: rzg2l-cru: Fix typo in rzg2l_cru_of_id_table struct

 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |   6 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  14 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  45 +++++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 108 +++++++++++++---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  42 ++++--
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |   5 +
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c    |   1 +
 drivers/media/v4l2-core/v4l2-common.c              |   6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   6 +
 14 files changed, 332 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst

-- 
Regards,

Laurent Pinchart

