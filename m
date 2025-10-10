Return-Path: <linux-media+bounces-44165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CBBCC734
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 470484026CB
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0CE2EDD4D;
	Fri, 10 Oct 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI6w/8rB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60D20A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090264; cv=none; b=h8uh7rY7Fb4e9v5H2BbrCJSoQLUqDpmX+EVNF0LmiF3QJFka6Du1/d2FD5eRzPcQEN2M+QmWosXLZ953KUthpuplNaGhnRQE9alVUNwtAPP41hdQgwVjyosbSqJruEQs1khQo0ZwMbHYrJBhJsxCgtojiJ253vOpz/Jy5hNqv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090264; c=relaxed/simple;
	bh=DHBe4xO/uXldbG0LNIFBSIpzz+tE+o2LmMSj4YCiLjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0KIcna74BdAsGEa3wWnIxZQOXMratvPoJBiQvQfPr6pJafftR8IjQNpOJugOfGsYt33ITp3qdrdnvuYV+YZvBPNNuEyOVfT2mYCzLERzhFnuSDcAhPWZa0UXSKZtc6kkksjtiNtEWXO7dIt71ZMM2Jh/+gduhSedfbPh7xYjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MI6w/8rB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DD6C4CEF8;
	Fri, 10 Oct 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760090264;
	bh=DHBe4xO/uXldbG0LNIFBSIpzz+tE+o2LmMSj4YCiLjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MI6w/8rBuqvoUUEaRDO7MJCGxr1YKm1NQ6OJL7it6rXgy6GMgrrGZkcOj1sTLnzXJ
	 hTUX5QyauM/joOPWMarAxaF5Xm4JpWR5rD3Sz2S59kbgtV0nkBGdhcxRBlu2uU0WVA
	 lo7atPjnOnSr/v8gDiwQdQFQfmkHuHlBSsLqtwwtKY4YlVO/UlO/xG0AAjZekbexdn
	 wIoHJSG3BRxNi9qklj+3dwMbME+bGw+V2zr/upZx+h7H7qkeCX/dflo38FFt+mrXa6
	 YeMBPxUpSVheisVwBVl1UdgxSXngdM+q6sGejqU8XfDtLLgdhzACu/Imb/odUn8uix
	 yOubNIfqiHGnQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [RFC PATCH 5/5] Documentation: media: document new event flags
Date: Fri, 10 Oct 2025 11:54:10 +0200
Message-ID: <94807eecc0d44520d671c2205e1f8d2fea85d91c.1760090050.git.hverkuil+cisco@kernel.org>
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

Document the new V4L2_EVENT_FL_INITIAL/MULTIPLE flags.

Also fix a small mistake for the type of the 'id' field: it's
__u32, not u32.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/v4l/vidioc-dqevent.rst              | 29 +++++++++++++++++--
 .../media/v4l/vidioc-subscribe-event.rst      |  6 ++--
 .../media/videodev2.h.rst.exceptions          |  7 +++--
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 8db103760930..e66c9fe1f84f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -86,13 +86,16 @@ call.
       - Event timestamp. The timestamp has been taken from the
 	``CLOCK_MONOTONIC`` clock. To access the same clock outside V4L2,
 	use :c:func:`clock_gettime`.
-    * - u32
+    * - __u32
       - ``id``
       - The ID associated with the event source. If the event does not
 	have an associated ID (this depends on the event type), then this
 	is 0.
     * - __u32
-      - ``reserved``\ [8]
+      - ``flags``
+      - Event flags, see :ref:`event-flags`.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Drivers must set the array to
 	zero.
 
@@ -369,6 +372,28 @@ call.
 	loss of signal and so restarting streaming I/O is required in order for
 	the hardware to synchronize to the video signal.
 
+.. tabularcolumns:: |p{7.5cm}|p{2.0cm}|p{7.8cm}|
+
+.. _event-flags:
+
+.. flat-table:: Event Flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - ``V4L2_EVENT_FL_INITIAL``
+      - 0x0001
+      - When this event is subscribed and the ``V4L2_EVENT_SUB_FL_SEND_INITIAL``
+        flag is set, then an initial event will be sent with the current status
+	(if applicable to the event type), and that initial event will have
+	this flag set.
+    * - ``V4L2_EVENT_FL_MULTIPLE``
+      - 0x0002
+      - When more events of the same type arrive then the internal queue can store,
+        then the oldest two events will be merged. In that case this flag is set
+	to indicate that some history is lost. The ``sequence`` and ``timestamp``
+	fields are those of the oldest event.
+
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
index a6fc3c5fe99d..952e28729eee 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
@@ -64,7 +64,7 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 	ID depends on the event type.
     * - __u32
       - ``flags``
-      - Event flags, see :ref:`event-flags`.
+      - Event subscription flags, see :ref:`event-sub-flags`.
     * - __u32
       - ``reserved``\ [5]
       - Reserved for future extensions. Drivers and applications must set
@@ -73,9 +73,9 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 
 .. tabularcolumns:: |p{7.5cm}|p{2.0cm}|p{7.8cm}|
 
-.. _event-flags:
+.. _event-sub-flags:
 
-.. flat-table:: Event Flags
+.. flat-table:: Event Subscription Flags
     :header-rows:  0
     :stub-columns: 0
     :widths:       3 1 4
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 35d3456cc812..f876ee083337 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -529,8 +529,11 @@ replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
-replace define V4L2_EVENT_SUB_FL_SEND_INITIAL event-flags
-replace define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK event-flags
+replace define V4L2_EVENT_SUB_FL_SEND_INITIAL event-sub-flags
+replace define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK event-sub-flags
+
+replace define V4L2_EVENT_FL_INITIAL event-flags
+replace define V4L2_EVENT_FL_MULTIPLE event-flags
 
 # V4L2 debugging
 replace define V4L2_CHIP_MATCH_BRIDGE vidioc_dbg_g_register
-- 
2.51.0


