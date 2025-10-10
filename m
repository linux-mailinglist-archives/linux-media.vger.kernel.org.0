Return-Path: <linux-media+bounces-44163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87738BCC72E
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4116840312B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025652C159D;
	Fri, 10 Oct 2025 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDc4EhbM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2C20A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090260; cv=none; b=CXPBRvMasg/A4JnOkHVyyPZQQd2Izc7x1nvU9buqN5Zumr1MU/m3H+THZ5oZ9jjIXmH6SFZPfCQFM/2Q1ULqFQED70Mu5yX5PjOmZm9hU11dIa1Cwfl+JjHhgR6D9K0bOOSo+awykfniUNVEJZ3/PC8hEwNLo8CekV7pwJrURRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090260; c=relaxed/simple;
	bh=pO+W6flKTST2WSJ8+F42LUOhZ1Xz7XG39/gKiUO/oOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Au9zdX5numf2gtDVpGh13S8RHm3yurhCv4TlqtLWOv5EjYXXnvNEmcuSDLR5liyaWhUD73qdPaghyRII1nlTR7UkodJ0YY8anAPkwMXUlgjd31CFbG4Zy30tszwhpd1Xo/Jhl7vRi/0jGr+tiVYz126KWJI6GGX7ZZ9D8Fp6gDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDc4EhbM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E6DC4CEF1;
	Fri, 10 Oct 2025 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760090260;
	bh=pO+W6flKTST2WSJ8+F42LUOhZ1Xz7XG39/gKiUO/oOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HDc4EhbMVoj+t2hq2t2QIyVrJ5MDmnibD2/0LlKYFI7YMA82qpbEW7b9gcwKD3YCz
	 6yA+wCa9ogkUcuO01dege6oguP8NyzvGGX33pGiajQ+ODGkZIGcemkUtgc9nvvb7Au
	 UPASPFNymay18XYt2t3mn0YzukPsgIFRPJ9h7cUnQB7CU1F1VL+IN0aOcpakbUu4i7
	 efEWfoCgRTYhRqmeYYhrFgNqkS51sY7NaFzqCiEMScD07tDMVEWNsmGIp/lX1Wln6v
	 tc/fhknUoMvmksEsPv0hflwZWuL7EaAlGotRgsQgJcwL3ET1exrxu8FPWOPba/5ydP
	 0B7ukADeaHhIg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [RFC PATCH 3/5] media: v4l2-event: add support for V4L2_EVENT_FL_MULTIPLE
Date: Fri, 10 Oct 2025 11:54:08 +0200
Message-ID: <77f928b426b65f96436c366ed75cd4a43bd877dc.1760090050.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760090050.git.hverkuil+cisco@kernel.org>
References: <cover.1760090050.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the V4L2_EVENT_FL_MULTIPLE flag if two events are squashed
together.

Also use the new flags field of struct v4l2_event so it is
copied to the events in the event list.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-event.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 1bc1e2f8c3d7..2c0d1e66584c 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -139,6 +139,7 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 			} else {
 				oldest->event.u = ev->u;
 			}
+			oldest->event.flags |= ev->flags | V4L2_EVENT_FL_MULTIPLE;
 			wake_up_all(&fh->wait);
 			return;
 		}
@@ -154,6 +155,7 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 		 */
 		second_oldest->event.sequence = oldest->event.sequence;
 		second_oldest->ts = oldest->ts;
+		second_oldest->flags |= oldest->flags | V4L2_EVENT_FL_MULTIPLE;
 		list_del(&second_oldest->list);
 		list_replace_init(&oldest->list, &second_oldest->list);
 		sev->first = sev_pos(sev, 1);
@@ -171,6 +173,7 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 	kev->event.id = ev->id;
 	kev->ts = ts;
 	kev->event.sequence = fh->sequence;
+	kev->event.flags = ev->flags;
 	sev->in_use++;
 	list_add_tail(&kev->list, &fh->available);
 
-- 
2.51.0


