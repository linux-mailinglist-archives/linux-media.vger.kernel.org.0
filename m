Return-Path: <linux-media+bounces-12305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4098D5574
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 00:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D091F21E8A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE351761B9;
	Thu, 30 May 2024 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VkDIK9b3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7B7406C
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 22:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717108435; cv=none; b=f2Tz8qQUj5JajpmeczA0aLz4CDQ+a0h6+CyiSKgZHIlG0kHGeg3siRYW7IovXbYcXlSQF3Kadhlp8R3fYj3nyFQy7aa5C7I/ghyuUejtnHYlPxCy3Oeu+Iz8AhoLFJVN0S+dnFnfpdiERYFadPvaFz7EhGk2Da5AFMqVYc6lrPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717108435; c=relaxed/simple;
	bh=9JWGX519hx5TYygXBzIaJhurETFRai5Os3mHRud+QMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfrBlGv56v4kuWJTqUsy5bkW8eacklX347t+iBJ4fsJP1Q28xIud4Vr4oOVeCLOK5ypz9oSTO00gQE2Yxp8/b6d+NMQLu2zfyXgeJe9744rs8BKK5cp2yvB+hyxq2yFXSTb1HKx79vHkPoVRiM6QoWcUNlrbOybR7L70mJpDLoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VkDIK9b3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6818e31e5baso1117601a12.1
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717108433; x=1717713233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7hsF+V9CRlUQX/Zqj8qcipzAMvQ/bVXG6EusD9d7Gk=;
        b=VkDIK9b35VTaRqwufG4X8S3WVrj9tOZMIlrCWKPBJkDGo0v3iVOcYnGu9isMUPFitr
         E9Jm0L7+G/5XV2Y1iy9J/Dk1Hzh8ROI8cBI2XscpIVALCATdrRk9nYI95x5Om8cBLhjD
         r4tHOm52pT8pLPiup4tccFxspuMmB3mFd9UAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717108433; x=1717713233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7hsF+V9CRlUQX/Zqj8qcipzAMvQ/bVXG6EusD9d7Gk=;
        b=kLE5QzDGGpY/qitaKTTEO8GuBQRYSg+eloYU93fflK9jlLGdC/KP8Tcv8tUctiyvCZ
         Pr2EFlVm4nl+i1yW8g9cPfVhugtKf2VlnJKgg+s4B5yruGNXMeZKj7ZjY4tmz0c3WAQL
         r9SccEUb+NLEbau1yON+N8EyaZ4KLwTRDoCLISaOCnrEmuxbw40h+HohfuRzEuanTt8d
         gNnZgZ2ALAn5NmTMSUYB4YR2Taxhgnk92FB+XsoQxQ1B6JDnoXb4KzFb/PSTpGprEQEw
         W8N8GyKW/xFW7MuAnqUkHdiT2neqAMhtvjdlmL4yAeNBCLA6TeRjQKlmRcDjdylI3+ql
         SA1Q==
X-Gm-Message-State: AOJu0YzsCxtp8ADpzIBXRkSukG6QHTG2/3gU5yyiNexRo4/cAA33ryEq
	BO+N5ncNDbW1M6Ovj1O5diuvccLDABVCQstkCCo1ME51rw9lcOG8QI99NQs/8T2l71ownVuCrdU
	=
X-Google-Smtp-Source: AGHT+IGG1rZKkN35ynaNn7wmocaO0cAOsGDSpXyWjQ9gwA+FSQhECAxrW7w159YZnjNKKwR2lpr5nQ==
X-Received: by 2002:a17:902:d481:b0:1f4:aac7:ffff with SMTP id d9443c01a7336-1f637006e24mr2108105ad.20.1717108432673;
        Thu, 30 May 2024 15:33:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:b720:a50b:7251:1e59])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1f63237d9c3sm2958245ad.116.2024.05.30.15.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 15:33:52 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH 1/1] Documentation: Fix AV1 struct documentation
Date: Thu, 30 May 2024 15:32:53 -0700
Message-ID: <20240530223348.1888663-1-frkoenig@chromium.org>
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

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---

While looking over the documentation I orginally only saw one issue with
the AV1 controls. But then I found some more. This patch is intended to
replace[1].

If it is more desirable I will split them out into individual patches.

[1]: https://lore.kernel.org/linux-media/20240530185157.1824672-1-frkoenig@chromium.org/

 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 786127b1e206..adb62e455d7a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -3374,7 +3374,7 @@ semantics" of :ref:`av1`.
       - ``uv_pri_strength[V4L2_AV1_CDEF_MAX]``
       -  Specifies the strength of the primary filter.
     * - __u8
-      - ``uv_secondary_strength[V4L2_AV1_CDEF_MAX]``
+      - ``uv_sec_strength[V4L2_AV1_CDEF_MAX]``
       -  Specifies the strength of the secondary filter.
 
 .. c:type:: v4l2_av1_segment_feature
@@ -3439,7 +3439,7 @@ semantics" of :ref:`av1`.
       - Bitmask defining which features are enabled in each segment. Use
         V4L2_AV1_SEGMENT_FEATURE_ENABLED to build a suitable mask.
     * - __u16
-      - `feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
+      - ``feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
       -  Data attached to each feature. Data entry is only valid if the feature
          is enabled.
 
@@ -3490,7 +3490,7 @@ AV1 Loop filter params as defined in section 6.8.10 "Loop filter semantics" of
 
 .. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
 
-.. flat-table:: struct v4l2_av1_global_motion
+.. flat-table:: struct v4l2_av1_loop_filter
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
@@ -3829,7 +3829,7 @@ AV1 Tx mode as described in section 6.8.21 "TX mode semantics" of :ref:`av1`.
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


