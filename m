Return-Path: <linux-media+bounces-330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F338D7EAE52
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 11:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 502E8B20AF8
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A4719BAB;
	Tue, 14 Nov 2023 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="lnTOBYQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB719BB8
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 10:50:40 +0000 (UTC)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A5E187
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 02:50:38 -0800 (PST)
X-KPN-MessageId: a2dc689d-82db-11ee-b94e-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id a2dc689d-82db-11ee-b94e-005056992ed3;
	Tue, 14 Nov 2023 11:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:to:subject:from:mime-version:date:message-id;
	bh=8fLngjMqIHgZN5mx5ERslfxQD7CkyaXkL7g659Kjmuk=;
	b=lnTOBYQ2Tpuddf9ZD5AVfi8pn3OXerplLw4bpj+GM5Zh3K5B3v5Wl0S/IM261khJIH+5yAWaTtfl4
	 souqf/knNcMgjzRYtRx0V3IzLAOAWnMaPOLioVR/VjeEkDONrzIqo+UCv0E28liwTPNt9yYAe3/DmY
	 cQTEequE+uaOyYIqDpKA+9oeCnZ+1vf08CbOWraRz4bBEusHY7tYHEn5JCGq8RZK2tcHf1CSbfXwNl
	 o0NPUNrKnCx/avQ2uiP7LKeoJasTnw31t/EdI9PrgjGdQruJJTijRJ8ymlGCRfNpW/8rHkNY2xiuHw
	 Nrgvch48+3KJFD0cW2EiW63R2+VEs5w==
X-KPN-MID: 33|N1OjzEW3YTiqkEuucTYM5FFMXDdyq2RTGYy+CGDzDUyC8/Bqsu7S67jboYJZps2
 HV4C7G9W8Ohy8uWBr3nEz0Q==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|vqcjxxdNU3bPLcvSquZiJeWNOusR2VLIRTXNfJsAwUuPTGA5aDhYo0tJJkDfcrC
 HZyJM1VUOH7RYXZ2EfRNqTg==
X-Originating-IP: 173.38.220.48
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id a4c14273-82db-11ee-ac7f-00505699b758;
	Tue, 14 Nov 2023 11:50:37 +0100 (CET)
Message-ID: <709474e5-328b-4fbd-823e-e81d58c81ad3@xs4all.nl>
Date: Tue, 14 Nov 2023 11:50:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videodev.h: add missing p_hdr10_* pointers (RESEND)
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The HDR10 standard compound controls were missing the corresponding pointers
in videodev2.h. Add these and document them.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Resend with correct email for Stanimir.
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index f9f73530a6be..4d56c0528ad7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -295,6 +295,14 @@ still cause this situation.
       - ``p_av1_film_grain``
       - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
+    * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
+      - ``p_hdr10_cll_info``
+      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_HDR10_CLL_INFO``.
+    * - struct :c:type:`v4l2_ctrl_hdr10_mastering_display` *
+      - ``p_hdr10_mastering_display``
+      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_mastering_display`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3d4e490ce7c..a57c19ceaec5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1837,6 +1837,8 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
 		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
 		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
+		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
+		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_mastering_display;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));

