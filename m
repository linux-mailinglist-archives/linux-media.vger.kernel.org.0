Return-Path: <linux-media+bounces-37805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3235B06651
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A7A16B6DB
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930C92BFC73;
	Tue, 15 Jul 2025 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gq2ZgOeW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E072BE7AB
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605583; cv=none; b=GnX3VgII6LOJKSiIU2dzdwJJmm9kFoN6SX9QF/mSb6Fa+4ulJWvx2e7yQyXkyz4sPJayXWrD7OLekhxvnZVqezVw2jCuo6u/x9Mlh3SnXfmG0hTtTlqYuYA8RxNUbcZ9GyEMm1J+QArixcKWoxeDJV5bIj/Usd0/Z/MPfeql/6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605583; c=relaxed/simple;
	bh=Y3PB8VZ/bU5J7yZqsQkfhj56guephoV73YcONJ/40i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYeW1ktrcNWNKiUgSg4Ri9V/lPXaQF2jaol++BVnZE7mAOQy3QzZ/ItHLYb/OITc7fHhEVRbAVfD6wd9HSSwAiIr+IjsNZWlMpbqPc44PcjZU65sw5f+ESKbFzX9iYvhW4D0tu0jPwdUf/qGceGAMCCxNTDZWuqgbKe+GKOuvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gq2ZgOeW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4E20678E;
	Tue, 15 Jul 2025 20:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752605547;
	bh=Y3PB8VZ/bU5J7yZqsQkfhj56guephoV73YcONJ/40i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gq2ZgOeWqP14zuR1RzSX35Zqu1dTqKQBhI1rpWL24obB1zsKf/8yJaIbW20ifM6+s
	 bX+H6inSxTPcNW8lHMObQGN2T2Mf2o7SFp1xJFEP1w0xCb3KxeEVJuSXhl+ldUhW9r
	 0WypeXBVJxFUdsTw14gUFmNY6ztjHg+hZT9UfT20=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 2/3] media: uvcvideo: Add missing curly braces
Date: Tue, 15 Jul 2025 21:52:53 +0300
Message-ID: <20250715185254.6592-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uvc_meta_v4l2_try_format() function is missing curly braces on an
outer for loop statement to comply with the driver coding style. Add
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_metadata.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index b68bfb2d47df..386b04a3a102 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -67,11 +67,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
-	for (unsigned int i = 0; i < dev->nmeta_formats; i++)
+	for (unsigned int i = 0; i < dev->nmeta_formats; i++) {
 		if (dev->meta_formats[i] == fmt->dataformat) {
 			fmeta = fmt->dataformat;
 			break;
 		}
+	}
 
 	memset(fmt, 0, sizeof(*fmt));
 
-- 
Regards,

Laurent Pinchart


