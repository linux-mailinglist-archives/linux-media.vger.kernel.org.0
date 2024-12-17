Return-Path: <linux-media+bounces-23573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB909F49BE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F71D16D539
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CBB1D5CCC;
	Tue, 17 Dec 2024 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RZXwZSnT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0D1EC01F
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734434517; cv=none; b=r5dJM4g/s+HhoJp93D89oSugE8SPBE1l6vnl2yDyEeqKjDspgxh8PseJxmxvILk+K10yIVN+C6XhAsi4SsCX3lgj7mLEuN/Nu/CWLZX3mPCRxfJAeD3NFf8EUyVjfqvoqxRBFr5WN1TV0OqieiW4Z7ffZAdsT2rql1cRoi8LY3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734434517; c=relaxed/simple;
	bh=TV+nd1j9w/cyAcobeoCVSib2l9U95gnLH0xnRglbAdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjqwJpE2zOasvfTjQaKke3x1/BnRrlybPldak+wJBQUdXYK1w1tlKEw11lujbUkT8Merf8hLNnrEmx3iQ5rk3ZxU77LnkTVBPrxY5PZGeyrc+h7W1JTMzMbXJvUcU7M4VdcFT8Q7AyRraJS26UCES2QQvNR0Y816Q2lGBEOu4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RZXwZSnT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C52AA4C7;
	Tue, 17 Dec 2024 12:21:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734434476;
	bh=TV+nd1j9w/cyAcobeoCVSib2l9U95gnLH0xnRglbAdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RZXwZSnTM/Bo9KUKU4bxgFE+rTGeK876waAgMCtoVYpMFsVSlU3O1qwCX6U6H9ZIx
	 mfgwMFSoKeUMcgFrlJDU2asSciCCJLmE1EToNWhKGtwbI/l5AjEMzY7zXLQNQH3hUJ
	 nPvHXPq/8gwLccalEHq+2F6pTYxExgWFvdHrzeKY=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for MJPEG_NO_EOF quirk
Date: Tue, 17 Dec 2024 11:21:38 +0000
Message-ID: <20241217112138.1891708-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
erroneous frames that do not conform to MJPEG standards are correctly
being marked as erroneous. However, when using the camera in a product,
manufacturers usually want to enable the quirk in order to pass the
buffers into user space. To do this, they have to enable the uvc_no_drop
parameter. To avoid the extra steps to configure the kernel in such a
way, enable the no_drop parameter by default to comply with this use
case.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 947c4bf6bfeb..45028b45906a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1948,6 +1948,13 @@ int uvc_register_video_device(struct uvc_device *dev,
 {
 	int ret;
 
+	/*
+	 * If the MJPEG stream occasionally loses the EOF marker, we set the
+	 * no_drop parameter by default to avoid dropping frames erroneously.
+	 */
+	if (dev->quirks & UVC_QUIRK_MJPEG_NO_EOF)
+		uvc_no_drop_param = 1;
+
 	/* Initialize the video buffers queue. */
 	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
 	if (ret)
-- 
2.43.0


