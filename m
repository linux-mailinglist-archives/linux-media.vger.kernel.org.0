Return-Path: <linux-media+bounces-38875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD203B1AA70
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 23:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D68294E1C3C
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 21:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681AD23BD1A;
	Mon,  4 Aug 2025 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qzindeXm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6619C556
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 21:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343707; cv=none; b=WxQPDomvhtjSVNitV4B9o5+9MXhBzwR+0SOIYLeW7rAflIDF0Gdj7ucGKAQ1j8dlFx2xVd7NvP5JafHuLX8D6UsfP9K6dNeLwXXi8gi60NaKxyNFsQDeuFH8KUNACi8a2I2vx9GwhQ1OHZP/aIQsPT2hHpZd8q0eMJHqf2M6khc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343707; c=relaxed/simple;
	bh=TgasON7f0GjzgGUDuW1ptb4EPgrVepyvl02exc27cmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHPhK4vPJyhzXIuv6y07BhCbwXRp3P8PBMIzORBKC+HvXgaEqfyWQsO8BAzyq+9HC9P+MVUM5qQimKghbkJHvmQt/lBCZQIRGhC5q3U8hcTQR/rku6eJzOIzIRxCw94e7VDFP+CxsTXlviYDRpCw9tnw6c7NJftbPbdWN1DcT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qzindeXm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D423D1BF4;
	Mon,  4 Aug 2025 23:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754343658;
	bh=TgasON7f0GjzgGUDuW1ptb4EPgrVepyvl02exc27cmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qzindeXmQPNOLcWcSryV8OSVReZpHewHkJXoWQcS2yka0ghaWZzqBF1Ixt9uuURLN
	 8H6I74oqulRla5fouZjTTTTEamsP4o9xhh015tg9fEbmSdRS1x+cCVHcc7Js3EjeKe
	 kI9OUiFOzjkavL91Uq70T/b9FE50yXWIdMPjBeIQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: staging/ipu7: Use v4l2_ctrl_subdev_subscribe_event()
Date: Tue,  5 Aug 2025 00:41:27 +0300
Message-ID: <20250804214127.22217-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250804214127.22217-1-laurent.pinchart@ideasonboard.com>
References: <20250804214127.22217-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu7-isys driver uses v4l2_ctrl_subscribe_event() to handle control
event subscription on a subdev. While this works, it is the wrong API.
Use the subdev-specific v4l2_ctrl_subdev_subscribe_event() helper
instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index 9c16ae9a0e5b..4023db4a6466 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -77,7 +77,7 @@ static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	case V4L2_EVENT_FRAME_SYNC:
 		return v4l2_event_subscribe(fh, sub, 10, NULL);
 	case V4L2_EVENT_CTRL:
-		return v4l2_ctrl_subscribe_event(fh, sub);
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
 	default:
 		return -EINVAL;
 	}
-- 
Regards,

Laurent Pinchart


