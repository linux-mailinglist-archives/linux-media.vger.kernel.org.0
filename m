Return-Path: <linux-media+bounces-42629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C255B59D56
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E10C83B456F
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FE631FEE9;
	Tue, 16 Sep 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F8RAfdmY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E896362085
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039326; cv=none; b=KDGc/Md1vOT9BYh5UhFYhLkf7t2eXOwxigpbFqx4+fUUZvatqKIIPOBtBK2rsv4mmRixQmF4Ht87BFlzflZ8mhOYhXPnznGgu1CrkaYI1/VTXl3vgAAcoU6DwyESPVLxIqlSrgx3DBW0a/f517DSol+4SJM6fHKFe64nMU5fIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039326; c=relaxed/simple;
	bh=K9mlco20vJF5BVh9MruxFj+OIqcRUtCnYwP9xfYIQDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwIgiUPPxI3HGdDvQe61DJRhzygWUEvvo0/Rlpq+PgYl6K1tRMXa+ZPhSfibbrn07T2oIYNZY2S672pwIHx+ZFsVWulQrkmEWLV9U4QGFC89C/1O17j8J17/88A5gQeVFmOCMEbCcBvvyYFGiZXhHk5Pv8llsqJwE0FV/HfS3ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F8RAfdmY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 575408D4;
	Tue, 16 Sep 2025 18:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758039243;
	bh=K9mlco20vJF5BVh9MruxFj+OIqcRUtCnYwP9xfYIQDU=;
	h=From:To:Cc:Subject:Date:From;
	b=F8RAfdmYRmKOUsP1HjrHlpK3NIszna4WGL2lWlR0xwmNzU/sBGwCuq9gnGcArESgy
	 pAWpE9QLJ1i4l6WDTm1YKXAh3jbbdLZ6COlyon3bjCNfoECq4SXiy0HxSnJBkE1MeI
	 a8U6bwACC8addxIOBmI4/b5/sKsEOs+RJjf4LXrY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Replace dev_dbg() with uvc_dbg()
Date: Tue, 16 Sep 2025 19:14:53 +0300
Message-ID: <20250916161453.24740-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uvcvideo driver uses a uvc_dbg() macro that supports enabling debug
message categories selectively, and prints a KERN_DEBUG message. The
macro is used through the driver, but one direct dev_dbg() call creeped
in. Replace it with uvc_dbg().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2905505c240c..d58bd888f0bf 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2929,8 +2929,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			if (!ctrl->initialized || !ctrl->modified ||
 			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
 				continue;
-			dev_dbg(&dev->intf->dev,
-				"restoring control %pUl/%u/%u\n",
+			uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
 				ctrl->info.entity, ctrl->info.index,
 				ctrl->info.selector);
 			ctrl->dirty = 1;

base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
-- 
Regards,

Laurent Pinchart


