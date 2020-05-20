Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F1C1DAF94
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 12:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgETKCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 06:02:07 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37547 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbgETKCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 06:02:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bLXzjmaqPFjnUbLY4jXnVV; Wed, 20 May 2020 12:02:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589968924; bh=xANaQzoI3Pw/9XN4Rvp4pqqAXzEKyWlrC0dtz6VHYc4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=BPtGqrCuYk46TjYilUSTY07qdHErw2gNOXu1YraRTrOi19wsoJGBG5gAVQeqJ+Szj
         2tcab4aEIRJJQSFaOq+A81xdC7GzSH9QAmXbYLrFch6NX2xs34hZN7JZ6mgSutdGCr
         PPRvVsz6K+B/QqsOHvBDebi72HlrNhi8H0S2pEWJtbjj0pgZGE8Ior8T8+So42LRDQ
         u3ua90kvRfGzpxecBlSNlsU1aZreJaH4ne3gol28Ya+yQqm3JYrj4BtQ1ehMsbHYnR
         Mf3UQ4OwjDp1nEN++P6/Y3D6aQL48YGc5HKiuA6+i3tfzQCw0F5w8pvqwXKt2Ym5kT
         oxXC/Puxabpfg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 2/2] vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
Date:   Wed, 20 May 2020 12:01:59 +0200
Message-Id: <20200520100159.2094831-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNWZnJQcJi46SO/h6mzDZ2gBjc5RBO2ohWpiqjbN224vLYyxQxRjqlrBcFnoQ+1iibRv/SLUo01GIlccPVMIgjdmu67R6iXPz9+50eECAKDEkcYxFfeq
 x6YG7qlwCYDn8HUx7uRXBZdMrHgM/zObdiCBY3NmmrVZfHr0wzm1WzTDd0XaEc+sH5Sgs3iVrGGcm+dnFPdsmp42byQiiJIF4S3cAY9NA796wwllXERF3TMj
 ClCF2UUYqPTxCCFa5FV27KlZSef13WZzEyq5a7SXWMzz9DPlaYYMPeClLbpjCRw/RM9gG+UOPoLPrTB1HS2Q+Bj+rdF5X5PSWVWx3FqSzOQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This documentation is very outdated. In particular, it is
not obvious at all that this is used to change the framerate of
sensors.

Fix it, and include references to the stateful encoder API where
this works slightly different.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/vidioc-g-parm.rst | 51 ++++++++++++-------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
index 42e9f6ee7a59..0524f1e4458e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
@@ -42,12 +42,13 @@ Arguments
 Description
 ===========
 
-The current video standard determines a nominal number of frames per
-second. If less than this number of frames is to be captured or output,
-applications can request frame skipping or duplicating on the driver
-side. This is especially useful when using the :ref:`read() <func-read>` or
-:ref:`write() <func-write>`, which are not augmented by timestamps or sequence
-counters, and to avoid unnecessary data copying.
+Applications can request a different frame interval. The capture or
+output device will be reconfigured to support the requested frame
+interval if possible. Optionally drivers may choose to skip or
+repeat frames to achieve the requested frame interval.
+
+For stateful encoders (see :ref:`encoder`) this represents the
+frame interval that is typically embedded in the encoded video stream.
 
 Changing the frame interval shall never change the format. Changing the
 format, on the other hand, may change the frame interval.
@@ -57,7 +58,8 @@ internally by a driver in read/write mode. For implications see the
 section discussing the :ref:`read() <func-read>` function.
 
 To get and set the streaming parameters applications call the
-:ref:`VIDIOC_G_PARM <VIDIOC_G_PARM>` and :ref:`VIDIOC_S_PARM <VIDIOC_G_PARM>` ioctl, respectively. They take a
+:ref:`VIDIOC_G_PARM <VIDIOC_G_PARM>` and
+:ref:`VIDIOC_S_PARM <VIDIOC_G_PARM>` ioctl, respectively. They take a
 pointer to a struct :c:type:`v4l2_streamparm` which contains a
 union holding separate parameters for input and output devices.
 
@@ -113,14 +115,21 @@ union holding separate parameters for input and output devices.
     * - struct :c:type:`v4l2_fract`
       - ``timeperframe``
       - This is the desired period between successive frames captured by
-	the driver, in seconds. The field is intended to skip frames on
-	the driver side, saving I/O bandwidth.
+	the driver, in seconds.
+    * - :cspan:`2`
+
+	This will configure the speed at which the video source (e.g. a sensor)
+	generates video frames. If the speed is fixed, then the driver may
+	choose to skip or repeat frames in order to achieve the requested
+	frame rate.
+
+        For stateful encoders (see :ref:`encoder`) this represents the
+	frame interval that is typically embedded in the encoded video stream.
 
 	Applications store here the desired frame period, drivers return
-	the actual frame period, which must be greater or equal to the
-	nominal frame period determined by the current video standard
-	(struct :c:type:`v4l2_standard` ``frameperiod``
-	field). Changing the video standard (also implicitly by switching
+	the actual frame period.
+
+	Changing the video standard (also implicitly by switching
 	the video input) may reset this parameter to the nominal frame
 	period. To reset manually applications can just set this field to
 	zero.
@@ -173,11 +182,15 @@ union holding separate parameters for input and output devices.
 	:ref:`write() <func-write>` mode (in streaming mode timestamps
 	can be used to throttle the output), saving I/O bandwidth.
 
+        For stateful encoders (see :ref:`encoder`) this represents the
+	frame interval that is typically embedded in the encoded video stream
+	and it provides a hint to the encoder of the speed at which raw
+	frames are queued up to the encoder.
+
 	Applications store here the desired frame period, drivers return
-	the actual frame period, which must be greater or equal to the
-	nominal frame period determined by the current video standard
-	(struct :c:type:`v4l2_standard` ``frameperiod``
-	field). Changing the video standard (also implicitly by switching
+	the actual frame period.
+
+	Changing the video standard (also implicitly by switching
 	the video output) may reset this parameter to the nominal frame
 	period. To reset manually applications can just set this field to
 	zero.
@@ -216,8 +229,8 @@ union holding separate parameters for input and output devices.
 
     * - ``V4L2_CAP_TIMEPERFRAME``
       - 0x1000
-      - The frame skipping/repeating controlled by the ``timeperframe``
-	field is supported.
+      - The frame period can be modified by settings the ``timeperframe``
+	field.
 
 
 
-- 
2.25.1

