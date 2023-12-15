Return-Path: <linux-media+bounces-2458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB468144BA
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 10:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE31328476A
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9A5182CA;
	Fri, 15 Dec 2023 09:38:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466C18041
	for <linux-media@vger.kernel.org>; Fri, 15 Dec 2023 09:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050D6C433C7
	for <linux-media@vger.kernel.org>; Fri, 15 Dec 2023 09:38:30 +0000 (UTC)
Message-ID: <2cebc841-98a7-4aef-ab4d-c4c99c821197@xs4all.nl>
Date: Fri, 15 Dec 2023 10:38:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: vidioc-subdev-g-client-cap.rst: document struct
 v4l2_subdev_client_capability
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The struct v4l2_subdev_client_capability was never actually documented, only
the capability flags were documented.

Add this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
index 810b6a859dc8..da4a358ce762 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
@@ -61,6 +61,21 @@ been accepted. A common case for the kernel not accepting a capability is that
 the kernel is older than the headers the userspace uses, and thus the capability
 is unknown to the kernel.

+.. tabularcolumns:: |p{1.5cm}|p{2.9cm}|p{12.9cm}|
+
+.. c:type:: v4l2_subdev_client_capability
+
+.. flat-table:: struct v4l2_subdev_client_capability
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 4 20
+
+    * - __u64
+      - ``capabilities``
+      - Sub-device client capabilities of the opened device.
+
+.. tabularcolumns:: |p{6.8cm}|p{2.4cm}|p{8.1cm}|
+
 .. flat-table:: Client Capabilities
     :header-rows:  1


