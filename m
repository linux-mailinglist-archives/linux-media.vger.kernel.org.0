Return-Path: <linux-media+bounces-44172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE73BCCC8B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 13:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5C8B19E630B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1660A283CB8;
	Fri, 10 Oct 2025 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWELRjjG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101725A2DA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760096110; cv=none; b=AlnvjPotY1+xp9Ash3wz183d4TVyWrY5VKH/IAc7VJNKb/Z/7Uhlt6OyiNeI04mwmtHw8Zo0twNmfbeEe5gK1YQzLhEcHIba1FNGsJzcW+TpP760/nrBXXmE8oBfXUaqAm/lCEbCj+xlOm97VOwXCbAs2p4e8v1vwWm3aFs6+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760096110; c=relaxed/simple;
	bh=xzxUay2tR3oYS9wXd2Ypoq4LpJHFfDK4i5UzMHFX+1E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=uVJh5hslYH758o+4ajOrM49CCUvcKCqVMbyL5VdNzWq2oFzV2/TleWwmIddZTm8WKlPDqkWl/CV/nkexDLHnYe0MhZ+qJUYDX0N8pfkS2TVHOjU1pYDDg1yKSpIGya0ds2AZ9+Kj66+4duybb+aoaWSao+NMNa8MdfdCJdLj8oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWELRjjG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C137C4CEF1;
	Fri, 10 Oct 2025 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760096105;
	bh=xzxUay2tR3oYS9wXd2Ypoq4LpJHFfDK4i5UzMHFX+1E=;
	h=Date:From:Subject:To:Cc:From;
	b=kWELRjjG1Dnev5ZF4zPHhhCIxnx1xub58eeS7JL2MmiMfduxsuqyWZ82ZdXC8D6Y1
	 qnZ3N4zGXoMJmEL5W4z5f6QrGiK4puvM16vCrZAXEgIP6HrW10SoWBIgXriw2xn2KZ
	 O253j8u4pfjimSGCcs6PYJOOSgDDfdd65O9oQG7E1H5pRofnrKnngAis7nplxdsTDt
	 TiXreKJjJ6GiI673IPs5NfFEGzJvtXZPKY/G3OObWHPlHCp7y/3P/H6cFLzV1TlD8h
	 VgntAj37Jw5vKF3emWaXRBzpMOTTsPXDSX6e4NIycMM9pAZ+vbM+fg3CH2WM9BF/M1
	 3lKfILpWBhC/g==
Message-ID: <d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org>
Date: Fri, 10 Oct 2025 13:35:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCHv2] media: v4l2-event: keep place in event list when combining
 events
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When subscribing to an event a fixed circular buffer of N (N >= 1) events
is allocated for that file handle.

New events of the same type are added to that buffer and eventually the
oldest event is removed from the buffer when VIDIOC_DQEVENT is called.

If the circular buffer is full, then the event framework will
merge the two oldest events (what 'merge' means is event type
specific).

So far, so good.

There is also a per-filehandle list of pending events for all event
types. VIDIOC_DQEVENT always dequeues the oldest of that event list,
and that event is removed from the corresponding circular buffer.

The problem occurs when the circular buffer is full and a new event
arrives. Then the two oldest events are merged, but instead of
keeping the position in the list of pending events, the merged
event is added to the *end* of the list of pending events.

So if a lot of events are generated, then events can continually
be pushed to the end of the list of pending events, and so are never
or much later dequeued by the application.

Effectively this is a denial-of-service situation were the
event is never seen by the application even though there are
actually a lot of events.

So if you subscribe to events from control A and B, then
change control A, then change control B, then change control A
again, and now call VIDIOC_DQEVENT, you will get the event from
control B followed by A, even though A was changed first.

This patch keeps the oldest event in its place in the 'pending
events' list rather then moving it to the end, and in the test
above you will now receive the event from control A first.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Fixes: c53c2549333b ("[media] v4l2-event: Add v4l2_subscribed_event_ops")
Cc: <stable@vger.kernel.org>
---
Changes since v1:
- fh->sequence was not incremented when replacing an event. Just drop that
  change and keep the original code (i.e. incrementing the sequence counter
  at the beginning).
---
 drivers/media/v4l2-core/v4l2-event.c | 59 +++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 3898ff7edddb..919cdd46a2c2 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -104,7 +104,6 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 {
 	struct v4l2_subscribed_event *sev;
 	struct v4l2_kevent *kev;
-	bool copy_payload = true;

 	/* Are we subscribed? */
 	sev = v4l2_event_subscribed(fh, ev->type, ev->id);
@@ -116,29 +115,59 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,

 	/* Do we have any free events? */
 	if (sev->in_use == sev->elems) {
-		/* no, remove the oldest one */
-		kev = sev->events + sev_pos(sev, 0);
-		list_del(&kev->list);
-		sev->in_use--;
-		sev->first = sev_pos(sev, 1);
-		fh->navailable--;
+		/*
+		 * No, so we have to make space.
+		 *
+		 * This is a bit tricky: the easy solution is to drop the oldest
+		 * event from the fh->available list and add the new one to
+		 * the end of the list. However, that can lead to situation
+		 * were, if there are a lot of events, the oldest event keeps
+		 * being removed before it can be dequeued by the application.
+		 * Effectively this is a denial-of-service situation were the
+		 * event is never seen by the application even though there are
+		 * actually a lot of events.
+		 *
+		 * So instead we take care to keep the oldest event in its
+		 * place, and instead either replace the event content with
+		 * the new event (if sev->elems == 1) or merge the 2nd oldest
+		 * event with the oldest event.
+		 */
+		struct v4l2_kevent *oldest = sev->events + sev_pos(sev, 0);
+		struct v4l2_kevent *second_oldest;
+
 		if (sev->elems == 1) {
 			if (sev->ops && sev->ops->replace) {
-				sev->ops->replace(&kev->event, ev);
-				copy_payload = false;
+				/* Replace the oldest event with the new event */
+				sev->ops->replace(&oldest->event, ev);
+			} else {
+				oldest->event.u = ev->u;
 			}
-		} else if (sev->ops && sev->ops->merge) {
-			struct v4l2_kevent *second_oldest =
-				sev->events + sev_pos(sev, 0);
-			sev->ops->merge(&kev->event, &second_oldest->event);
+			wake_up_all(&fh->wait);
+			return;
 		}
+		second_oldest = sev->events + sev_pos(sev, 1);
+		if (sev->ops && sev->ops->merge) {
+			/* Merge the oldest event with the 2nd oldest event */
+			sev->ops->merge(&oldest->event, &second_oldest->event);
+		}
+
+		/*
+		 * Replace the oldest event with the second oldest event in the
+		 * event list.
+		 */
+		second_oldest->event.sequence = oldest->event.sequence;
+		second_oldest->ts = oldest->ts;
+		list_del(&second_oldest->list);
+		list_replace_init(&oldest->list, &second_oldest->list);
+		sev->first = sev_pos(sev, 1);
+		sev->in_use--;
+		fh->navailable--;
 	}

 	/* Take one and fill it. */
 	kev = sev->events + sev_pos(sev, sev->in_use);
 	kev->event.type = ev->type;
-	if (copy_payload)
-		kev->event.u = ev->u;
+	kev->event.u = ev->u;
 	kev->event.id = ev->id;
 	kev->ts = ts;
 	kev->event.sequence = fh->sequence;
-- 
2.51.0


