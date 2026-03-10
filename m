Return-Path: <linux-media+bounces-55273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMjtFt6ZsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:23:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC950258E08
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93489305E3AD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0A73A169C;
	Tue, 10 Mar 2026 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bq8/b3uQ"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471938D693
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181399; cv=none; b=P6FmaWOTXeAIOPkYByoZvpg7NXkjqoxyT4xcU7nQoyD3ny+g5fwzJKdao8KKzZ0NfI+X8VIu4VUqw7xnniSfznZDcOtP4IbRoM4UoChVdlT1lfnIra+lmcYeRgJHQ2affAy5a9SIkFDp6DWWvwZC2AYZz6BhPs5qLs4yDPUogU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181399; c=relaxed/simple;
	bh=2BWLBbJHj6+XBLMk2n+WNRmXU0uVWWkr932TZGVpSBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AM/k8tvveGxdPbEPUHC7fF2uRnNxs5ZEICOxGHAkiLgEJhdoYc0C5BE1Dnd3jPsbaf7ybNGfaB/ilPCdBL22xTcqYHPYeTodzgBU+tJDL1KXTKEXwSrKBzksQUVaWECuZlu9vkhwMcR/E3Ar76bOBKn8SipQyh8NMmMLebcxWLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bq8/b3uQ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773181396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qrP1oGG317mA+DmnsrLL8HVSskRTO5cPeFTQIZYRW64=;
	b=Bq8/b3uQYv46dsStc8hyVQqvOsg6N/uHtRfPXBtccGryAu73XYQZUXOUedSgWzjNaoyWi5
	4MlyrE5AMR/bH756hPXvXwt5IA1dKTMpMYionGkGGng3k3oxLeeEJQq5QhdzgM8eP7OCl/
	SW8rXGshaDoJS0W8WI5bEfoaCN+5wJU=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] media: uvcvideo: Fix deadlock if uvc_status_stop is called from async_ctrl.work
Date: Tue, 10 Mar 2026 18:22:59 -0400
Message-Id: <20260310222259.1202061-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: CC950258E08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55273-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.anderson@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Action: no action

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

 drivers/media/usb/uvc/uvc_status.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 231cfee8e7c2c..2a23606c7f4c6 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -316,6 +316,14 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
 	if (!dev->int_urb)
 		return 0;
 
+	/*
+	 * If the work called uvc_status_stop it may still be running. Wait for
+	 * it to finish before we submit the urb.
+	 */
+	cancel_work_sync(&dev->async_ctrl.work);
+
+	/* Clear the flush status if we were previously stopped */
+	smp_store_release(&dev->flush_status, false);
 	return usb_submit_urb(dev->int_urb, flags);
 }
 
@@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
 	 */
 	smp_store_release(&dev->flush_status, true);
 
+	/*
+	 * We will deadlock if we are currently in the work function.
+	 * Fortunately, we know that the URB is already dead and that no
+	 * further work can be queued, so there's nothing left for us to do.
+	 */
+	if (current_work() == &w->work)
+		return;
+
 	/*
 	 * Cancel any pending asynchronous work. If any status event was queued,
 	 * process it synchronously.
@@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
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


