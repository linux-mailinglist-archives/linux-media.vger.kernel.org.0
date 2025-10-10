Return-Path: <linux-media+bounces-44158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16068BCC6E3
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0794A1A65C4A
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316672ED154;
	Fri, 10 Oct 2025 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp4alx/I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97428EA72
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089688; cv=none; b=XxVCg5sQl2roHxLv2afjj2M9ubhD5w07/GviT0plJ+K0JsOwEFfHXh5L5FA6CIJqHG88IHsgaXEJjYSRKr5E8yQeUU//tF8/BeCGOf5l2Vvp+Yz0yqyV8yD7ZfTK+Dh+plar1t84WfhoIa8I28rjgPNiwdSgyDT0nTQLKiBi6NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089688; c=relaxed/simple;
	bh=4fffIZdp1pIPcRes1P+3XoyFt39EncGvfHXrJUrVQQ0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=LPeo4IhIWwuByrZImd5TItdMW1Zgn0m6O6Oa7jha+EDipcDnyzxTY8vKfS8E/AzLWZlLC6bU7uE1vG+4VEztJALgH0791tS9o2DOmBN5sVuITS7l5W0XBuIl7NdohtMCLYSq+sePgQ37bQ5I54GBMEusGqHl3i5xJYYBmTgs4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp4alx/I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD621C4CEF1;
	Fri, 10 Oct 2025 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760089684;
	bh=4fffIZdp1pIPcRes1P+3XoyFt39EncGvfHXrJUrVQQ0=;
	h=Date:From:Subject:To:Cc:From;
	b=Kp4alx/IPJ8stkp2dJuyS4ffh3O/Z9FixGbvvRsSdx+89vDExe8a6z+pUfR6GJG6g
	 iRzuQ0XFDOObfVCSQfhm+ObaNWOZEV0ZquYq27gV8rfYVMUcpmnRZKOf8n7NfJ74Af
	 F6NTbb2ap1nM4oRgjc1e/AOWE5cZRYaroY+IRyodFXFWRtsrDG9YDrCH1qHaVCB6iI
	 ApQgcieglDpeWLgHFqbVeiaIlf5LjmFVlh9PxUxylmEcPgVqi5f4AhqpOCcIofqOJp
	 LaX2Tn9K8sJ95jsplECIANk/jB6M5Oa1RtRO1Y+MS5w0F6ilfEXStQR0S+hW1512LH
	 11VXSW14+clJg==
Message-ID: <063bd6f7-e9c0-4dfa-babe-cd004cfc4552@kernel.org>
Date: Fri, 10 Oct 2025 11:48:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: v4l2-event: keep place in event list when combining
 events
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
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
 drivers/media/v4l2-core/v4l2-event.c | 65 ++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 3898ff7edddb..1bc1e2f8c3d7 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -104,41 +104,70 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 {
 	struct v4l2_subscribed_event *sev;
 	struct v4l2_kevent *kev;
-	bool copy_payload = true;

 	/* Are we subscribed? */
 	sev = v4l2_event_subscribed(fh, ev->type, ev->id);
 	if (sev == NULL)
 		return;

-	/* Increase event sequence number on fh. */
-	fh->sequence++;
-
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

+	/* Increase event sequence number on fh. */
+	fh->sequence++;
+
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


