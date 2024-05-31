Return-Path: <linux-media+bounces-12358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898D8D67CE
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 19:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F53C28B3AB
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 17:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EA917622F;
	Fri, 31 May 2024 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KMMCiI8N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E42156242
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175454; cv=none; b=ELj8AU9YGnevJR1fmq3Cu2jUm85f/zah0nAH5cLSA0Bwr1Jb0OQyw9RC2rfnk8HVXnqKZ2IgQTjcd2np+219+URrcsBUGbHD9HGrcRBwUVBRfA5GiFIuyOKWvTqITixYvVZwuKvyItp02QGo/4IxSpSBlygX/423egJZOSIOfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175454; c=relaxed/simple;
	bh=N6qa+kfndNrV7gqeMAv/+q4hO6RYMoB+kq1ym+4/fUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXRy9k5b33yv+iRd46WeHiDXe6sSjYrGhg6wRBY0r4FXx1KyquY1mNPY+hxotSZPou5Oy8/IPgWTYx5QAv5faE0qwbkal6UFFL60PeMhAPO0GfkdKpPSRLJNoiKIp22SB3zGhcfYa8vImnN3hVuWp9yplg6bHtYHvbs6UZ28DiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KMMCiI8N; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ff6fe215c6so2003507b3a.3
        for <linux-media@vger.kernel.org>; Fri, 31 May 2024 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717175452; x=1717780252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlDtETBlTaH/Q4K2CVmdTG0C4WkeW/ty0+cGsmxryBs=;
        b=KMMCiI8NzccCONH+ymz+bUeAMUNwcDDMTf5SRg9lzIHHu4AaI2TCT6iC1Eol3l0lw5
         pmlkaiGX1W91Ly+CwT+x+aZ7U+rFzUZk9zcc+rCaRcW9xLlMk94wU2j5n2Mz1OzmeCO0
         PbW8/51Jc+rxyegU5VGKpLoWRvXnGBu/Xr8/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717175452; x=1717780252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlDtETBlTaH/Q4K2CVmdTG0C4WkeW/ty0+cGsmxryBs=;
        b=rgD3CQ5BUKzeJYTDVgf5GJ9BsQbBjGLJFP69r+u2RxwktDFg4X+czikNj5L7cjvvWq
         20Lttvd7w6BEQmRdd1iXHI2dfkobWIg/FXlNeQ8OYT3OmVRMdm/h6INaGbOySnnapky/
         iXRQH2iir1quWbfrJAhSN3eF0fD440oQqUwMOyX7bM4iuwsbuGQPeiiT/dIZd7hfZ3iR
         H6hkBH2ReVCjcU61jBvjQ2joDyI0LbrxfWDoZlwu/8PLgmP0YE+9qZrJQLY1VaqKITDU
         FxqPHXbVk12wE6kzSuPlExRgvoN2N8h+QGaqKGdT9X2Avgv4lwaDirzU3CiGk/Wv3WSG
         SiaQ==
X-Gm-Message-State: AOJu0Yx+CSEwdun9l3WXGwWry/8ruNMYX/J/97Zeh4Mufzx1C28JMTz5
	EcmNDbH6aiPdQfYPOefhUQpcaeOLxjQDTLuT7VmrzFZtit8bzTgdc57071mFCl7B3U2JbgEDrUc
	=
X-Google-Smtp-Source: AGHT+IFfbp2on6Pwj+GvgarOHcDAMIqwASsvft9Tg0HY4+b/w5Ua/Jg9tSkx4MQpe9RfKR8rEu7Ogg==
X-Received: by 2002:a05:6a20:158b:b0:1b0:1916:92dd with SMTP id adf61e73a8af0-1b26f16e876mr3253592637.5.1717175451673;
        Fri, 31 May 2024 10:10:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:fe8d:d958:bcaf:8db9])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70242aec951sm1681525b3a.103.2024.05.31.10.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 10:10:51 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v2] Documentation: Fix AV1 struct documentation
Date: Fri, 31 May 2024 10:10:06 -0700
Message-ID: <20240531171005.2509859-3-frkoenig@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- v4l2_av1_segmentation table formatting
- incorrect member name uv_sec_strength
- incorrect struct name v4l2_av1_global_motion
- incorrect link label for v4l2_av1_loop_filter
- add max_frame_height_minus_1
- struct ordering

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
V2:
- add max_frame_height_minus_1
- struct ordering

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 786127b1e206..8eb337b3cb00 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2993,7 +2993,11 @@ This structure contains all loop filter related parameters. See sections
       - Applications and drivers must set this to zero.
     * - __u16
       - ``max_frame_width_minus_1``
-      - specifies the maximum frame width minus 1 for the frames represented by
+      - Specifies the maximum frame width minus 1 for the frames represented by
+        this sequence header.
+    * - __u16
+      - ``max_frame_height_minus_1``
+      - Specifies the maximum frame height minus 1 for the frames represented by
         this sequence header.
 
 .. _av1_sequence_flags:
@@ -3374,7 +3378,7 @@ semantics" of :ref:`av1`.
       - ``uv_pri_strength[V4L2_AV1_CDEF_MAX]``
       -  Specifies the strength of the primary filter.
     * - __u8
-      - ``uv_secondary_strength[V4L2_AV1_CDEF_MAX]``
+      - ``uv_sec_strength[V4L2_AV1_CDEF_MAX]``
       -  Specifies the strength of the secondary filter.
 
 .. c:type:: v4l2_av1_segment_feature
@@ -3439,7 +3443,7 @@ semantics" of :ref:`av1`.
       - Bitmask defining which features are enabled in each segment. Use
         V4L2_AV1_SEGMENT_FEATURE_ENABLED to build a suitable mask.
     * - __u16
-      - `feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
+      - ``feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
       -  Data attached to each feature. Data entry is only valid if the feature
          is enabled.
 
@@ -3490,7 +3494,7 @@ AV1 Loop filter params as defined in section 6.8.10 "Loop filter semantics" of
 
 .. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
 
-.. flat-table:: struct v4l2_av1_global_motion
+.. flat-table:: struct v4l2_av1_loop_filter
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
@@ -3806,12 +3810,12 @@ AV1 Tx mode as described in section 6.8.21 "TX mode semantics" of :ref:`av1`.
     * - struct :c:type:`v4l2_av1_quantization`
       - ``quantization``
       - Quantization parameters.
-    * - struct :c:type:`v4l2_av1_segmentation`
-      - ``segmentation``
-      - Segmentation parameters.
     * - __u8
       - ``superres_denom``
       - The denominator for the upscaling ratio.
+    * - struct :c:type:`v4l2_av1_segmentation`
+      - ``segmentation``
+      - Segmentation parameters.
     * - struct :c:type:`v4l2_av1_loop_filter`
       - ``loop_filter``
       - Loop filter params
@@ -3829,7 +3833,7 @@ AV1 Tx mode as described in section 6.8.21 "TX mode semantics" of :ref:`av1`.
     * - struct :c:type:`v4l2_av1_loop_restoration`
       - ``loop_restoration``
       - Loop restoration parameters.
-    * - struct :c:type:`v4l2_av1_loop_global_motion`
+    * - struct :c:type:`v4l2_av1_global_motion`
       - ``global_motion``
       - Global motion parameters.
     * - __u32
-- 
2.45.1.288.g0e0cd299f1-goog


