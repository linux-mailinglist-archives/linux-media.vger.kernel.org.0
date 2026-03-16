Return-Path: <linux-media+bounces-55946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB21J0YquGnhZgEAu9opvQ
	(envelope-from <linux-media+bounces-55946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:05:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11029D02B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A6E83015A52
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2853B8BA9;
	Mon, 16 Mar 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g874A4Yk"
X-Original-To: linux-media@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115EA3B8BBD
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676733; cv=none; b=mcG2hhmPtJlMUrLnkn4QwJiV3k1Fh+MVsco+JZ625W4pITLOiXOB6uVllnH+fnU7WULi4ZUPfSi/3XOd7ac2g6vgPpvGS2sspRbEOBDTUEXLG7f8YpdNYp3lXE/CWPmS5+gfjjkZLnFKgrjXQoovjI6W/7Be2TYG/kdCeEdgP1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676733; c=relaxed/simple;
	bh=95GSnyF3hM8k4+WXw7mmF+XSpSd9/9lWmIsOwQdjpmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mOyfL9Ja1G86UAAADzeH9PYfEeKpAs7sTRtHEydo8Wsb1fKnO29SYx9lfgJ9VNQyrQxPm+2aeBAu/AaSYdHVcQv5S06ntds01PbFzXw+OFeOjXSsVWwYc2wGSPH5a95zd//Q4vfe6CqRZYlc1JFcTJgx8CwyZ/HO5XJREekUhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g874A4Yk; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773676720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UmzNJpqcVsIcoMWB5Vkg9H0yEpxSFFcwcDPXJPvvDY4=;
	b=g874A4Yk7SKwYMjfst8e8nORX/eM8dOEONsUYphg9/2Lx/4plFCdtrtb5QvTo4YLQjCZdP
	IZaKNgWgOVLTmOZOZFmT09ePgCXrOq67xQqq12sDXbFN6Bt+CILYPNaVI/XENWRcvwryYd
	kV6bf7t2GBHtSJ4Z4El6EB4jVVFYlvI=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2] media: uvcvideo: Fix deadlock if uvc_status_stop is called from async_ctrl.work
Date: Mon, 16 Mar 2026 11:58:22 -0400
Message-Id: <20260316155823.1855434-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55946-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B11029D02B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If a UVC camera has an asynchronous control, uvc_status_stop may be
called from async_ctrl.work:

uvc_ctrl_status_event_work()
    uvc_ctrl_status_event()
        uvc_ctrl_clear_handle()
	    uvc_pm_put()
	        uvc_status_put()
		    uvc_status_stop()
		        cancel_work_sync()

This will cause a deadlock, since cancel_work_sync will wait for
uvc_ctrl_status_event_work to complete before returning.

Fix this by returning early from uvc_status_stop if we are currently in
the work function. flush_status now remains false until uvc_status_start
is called again, ensuring that uvc_ctrl_status_event_work won't resubmit
the URB.

Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")
Closes: https://lore.kernel.org/all/6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev/
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Update comments with review feedback
- Use flush_work instead of cancel_work_sync since the work should never
  be rescheduled.

 drivers/media/usb/uvc/uvc_status.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 231cfee8e7c2c..ea45b11642e59 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -316,6 +316,15 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
 	if (!dev->int_urb)
 		return 0;
 
+	/*
+	 * If the work called uvc_status_stop it may still be running. Wait for
+	 * it to finish before we submit the urb.
+	 */
+	flush_work(&dev->async_ctrl.work);
+
+	/* Clear the flush status if we were previously stopped. */
+	smp_store_release(&dev->flush_status, false);
+
 	return usb_submit_urb(dev->int_urb, flags);
 }
 
@@ -336,6 +345,15 @@ static void uvc_status_stop(struct uvc_device *dev)
 	 */
 	smp_store_release(&dev->flush_status, true);
 
+	/*
+	 * If we are called from the event work function, the URB is guaranteed
+	 * to not be in flight as it has completed and has not been resubmitted.
+	 * There's no need to cancel the work (which would deadlock), or to kill
+	 * the URB.
+	 */
+	if (current_work() == &w->work)
+		return;
+
 	/*
 	 * Cancel any pending asynchronous work. If any status event was queued,
 	 * process it synchronously.
@@ -354,15 +372,6 @@ static void uvc_status_stop(struct uvc_device *dev)
 	 */
 	if (cancel_work_sync(&w->work))
 		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
-
-	/*
-	 * From this point, there are no events on the queue and the status URB
-	 * is dead. No events will be queued until uvc_status_start() is called.
-	 * The barrier is needed to make sure that flush_status is visible to
-	 * uvc_ctrl_status_event_work() when uvc_status_start() will be called
-	 * again.
-	 */
-	smp_store_release(&dev->flush_status, false);
 }
 
 int uvc_status_resume(struct uvc_device *dev)
-- 
2.35.1.1320.gc452695387.dirty


