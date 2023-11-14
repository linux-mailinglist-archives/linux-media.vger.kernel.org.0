Return-Path: <linux-media+bounces-329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 494827EAE51
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 11:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9A51C20A30
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40261A582;
	Tue, 14 Nov 2023 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="mFGv5ni8"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168511946D
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 10:48:42 +0000 (UTC)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B2E191
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 02:48:41 -0800 (PST)
X-KPN-MessageId: 550fae06-82db-11ee-a148-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 550fae06-82db-11ee-a148-005056abad63;
	Tue, 14 Nov 2023 11:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=/ubGrweu7wbU0vkuKFIesTdKWjtLk5okEjvHQlCJYd4=;
	b=mFGv5ni8WLOQ6Q34r9hBJF2jMoOlttxGWtTgmwgnRlmuG2sN4Bg2qpriEog9EYdYSpQgOqz2tH2+j
	 x5qXkNJWg+nwdRImzA86eTtZyLgmlsoWB+Gis7D6dBr2gVsEOF1zgZT9Mtz88qyTygGAwaq/Iiu8iA
	 em+x8y2MztyscnaCaqfENsG3Muor4VZDPBvsbW9z6puozfygje78aoKinEIlMKKrsMTRyWDQuKUPYE
	 OOkUAWtQrDBuhgBru+Eu31aVIAxNbayLYvhbSIe799NgS/30JTrbgeQ8Meejaj4QXyEluBBXseehRb
	 eohcXtehTHkDQxlVVNfI/sShQjmB01g==
X-KPN-MID: 33|wk38tlR/XBw1L6IwIKcOFPehyW6EjYYZ+PgCfUs6BxtL4xJd6hMfp6x6xOvD4FS
 YUAjm8rkeYSTSuu/dTdY5QXL7ucS4IjnNqY4c5CVkejg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|v9+U4LPSaTp6GZI48hIdyfMywT/mKx+A5gEAOr9adoa6Vmzsu6CwToQNggDu+py
 AGtygVO6wUfg/p6oCMrAGTA==
X-Originating-IP: 173.38.220.48
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 5f0c84bb-82db-11ee-a7b1-005056ab7447;
	Tue, 14 Nov 2023 11:48:40 +0100 (CET)
Message-ID: <7372e750-7abf-4906-8834-ca5aa50de2bf@xs4all.nl>
Date: Tue, 14 Nov 2023 11:48:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videodev.h: add missing p_hdr10_* pointers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The HDR10 standard compound controls were missing the corresponding pointers
in videodev2.h. Add these and document them.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

