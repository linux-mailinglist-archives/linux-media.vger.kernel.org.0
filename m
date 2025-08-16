Return-Path: <linux-media+bounces-40019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE73B28FB2
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 19:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20D1C1C8591F
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 17:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E462FE046;
	Sat, 16 Aug 2025 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IszcFlLr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570191993B7;
	Sat, 16 Aug 2025 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755363985; cv=none; b=TyxBBbxW7gpX0KHSpAxxLxUphvXTO2b26mSfct0p1x97dXZMjIt5f6hxOmGdsHJqgMnS7WfWwUU/+LPUS9626x4lTfhKTlUbBU3Sbi+nqdKRhz/d9+aUMP/yEZdWBamIhQlgNoXAutRWdk0h+mRdAfPKt1KAsJHqnvp7tdBs2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755363985; c=relaxed/simple;
	bh=sB2cYu5+Jf0zWpRTQV5q+PheZ/lZktCmmZantthNZFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=feWctZ0d2haFzm0mz9ErNFfCrvGE5WEKRC0vhz2oDLsRvWLmE98QPZjwT1CbS2vMckkFZ3daZb0+mMf2Ee0qVBrCSEIgSxH3OKqLz3OGmJPmv+momEu1+/D7A6k3s4cB+6P8mvt51LtXNaeXrk+vlNXXHu+M66YD7uN16F1anQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IszcFlLr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9dc5641f9so503840f8f.1;
        Sat, 16 Aug 2025 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755363982; x=1755968782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgw7Gkb4p3y4ALqCmeQkgKUKoK0mG01yPSRfozmaBxU=;
        b=IszcFlLrxPPkoab1+TNiJopZTerh3JOCbtZPh4w9fJNB1ZLpC4RhXapPZhDyZQcmg0
         rsT1QFXCSzz7pnw2u6OZv8BMaEFcLuwpEVCFkw+/p0g3o3hc6RiPEXrAcR6bSue6C09E
         ykbkSiSgugeWPzA3i+FLqExN6YZiWlsVCfrSUkqORKcMXtpBzA2IHyKzgNXPLeix0wg0
         M7qHJjrzSa1vw6FOywbC9wC/Boh9ZFNspFGe1+MNq38WpB0otmrTqVC1xMI8G4JoE/un
         YDwIpf+SvOTwK+WcgDSABzi9eM3rlkWXSpCUWMT5MzRWENG4noFUA8qMqV7Humj97VWW
         Bzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755363982; x=1755968782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgw7Gkb4p3y4ALqCmeQkgKUKoK0mG01yPSRfozmaBxU=;
        b=vAkPGsuT6IF+O72XxReRg0UIVEqfXCNkmKcpOqPXg30sKKnPcZzQX93C6IOyWUoVl2
         w7v6GlB6g3FM1+d1FNKy7bbupKCXIBt8GKSxp6086Vv9PdCIJ8wX2R6o7eV1U0+AwTOP
         fuBlKEFdkKA6WRWZ/QPK5NTan1fYat3MNzuWJlW8cKlfL1absBxQFLLJk8X9oq+kdppO
         i7rZf26i5+NZapw8EW2r8uU5216GIMUXl4Pi6Lfrr5gEoGURfzgEt0IiWixUQVFG8lBW
         aK0iLRdL2U5EA4CkiDpkMNSTrGA/i41LUIs/o5Mg4JHE3H9Y8/fH7djxJ6WP3uebSVzG
         8VYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcA0d62u4qsisIIU6QxaCPGmLjRsSFNKQVc2qbzPYcLPFAn5dmNMC53mh5uP5ivZtdja4MmB6x2Bq/B+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUzN6CKQgtjkcNaKtgx+2x4fKM9c55R1uXjWyvK+ljK7BpBRP
	YLgOKbC3LgeG+0JleHAtXZUGeeQmUORAb+jKCN7qNOMpxcY9O7i4wJIW
X-Gm-Gg: ASbGnct0fw1QhyY2CAC84rhhEyOynoTITv+tA6iuTuS8+iHw+PUqwRwgGl1I9cKcxjZ
	L/FfmqsWQ3zWVQ7vBRvxt9m/zLF4SmOOFf9jfKK5oWn2uuLfP5h2LbxGuidQRWqsmBoYw6459R0
	eTDce5732DvGMLgoDI7nX93fNbMzg74cjFTUFU1+uNHhSpLoz9qwezTzjsVxh0JoPniynUA1iUQ
	M+8zs/AKbZpZ5ePDop5nfoJQVby/mt9zwldptDRvw7AxGsEXAd863C93MpHPz2SAe3PTj1oRRT7
	HQr/r3YOT5kujbfRtvmoucIdqODHifecn0YgQtMM9wxkdyvRMPR6nqMliC34Bhu3Nh3492+weq3
	i/JoJVxzU/eVI2qSdVFB+qQW28L2jMASm1lAOLaNyS5QtXvoiXfkxkQvK+Q==
X-Google-Smtp-Source: AGHT+IH7o4mFvUskvJ8tgvRlrCg/v/TbnRR3ccsdkXgMqIiB9upLobfM18TFI+4x3gLQ0XPRzr2igA==
X-Received: by 2002:a05:600c:4fd1:b0:456:1a00:c745 with SMTP id 5b1f17b1804b1-45a2185e3d6mr21491465e9.3.1755363981376;
        Sat, 16 Aug 2025 10:06:21 -0700 (PDT)
Received: from localhost.localdomain ([41.37.217.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cf151sm101701315e9.8.2025.08.16.10.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 10:06:20 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3] staging: media: atomisp: Add lock asserts for various functions
Date: Sat, 16 Aug 2025 20:06:03 +0300
Message-Id: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add lockdep_assert_held(&isp->mutex) to critical functions accessing
shared device state. This enforces proper locking and detects violations.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

---
v3:
- modify declarations to match kernel style

v2: https://lore.kernel.org/all/20250815182411.36092-1-abdelrahmanfekry375@gmail.com/
- Fix Typos
- tested by building the driver

v1: https://lore.kernel.org/all/20250815170901.32105-1-abdelrahmanfekry375@gmail.com/
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 ++
 .../media/atomisp/pci/atomisp_compat_css20.c  | 28 +++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..fc5c8276b013 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3706,6 +3706,7 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
+	lockdep_assert_held(&isp->mutex);
 	if (!input->sensor)
 		return -EINVAL;
 
@@ -3800,6 +3801,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	u32 padding_w, padding_h;
 	int ret;
 
+	lockdep_assert_held(&isp->mutex);
 	fmt = atomisp_get_format_bridge(f->pixelformat);
 	/* Currently, raw formats are broken!!! */
 	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
@@ -4334,6 +4336,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct v4l2_rect isp_sink_crop;
 	int ret;
 
+	lockdep_assert_held(&isp->mutex);
 	ret = atomisp_pipe_check(pipe, true);
 	if (ret)
 		return ret;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..03067479dd69 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1447,9 +1447,11 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 				     enum atomisp_input_stream_id stream_id,
 				     struct v4l2_mbus_framefmt *ffmt)
 {
+	struct atomisp_device *isp = asd->isp;
 	struct ia_css_stream_config *s_config =
-		    &asd->stream_env[stream_id].stream_config;
+	&asd->stream_env[stream_id].stream_config;
 
+	lockdep_assert_held(&isp->mutex);
 	s_config->input_config.input_res.width = ffmt->width;
 	s_config->input_config.input_res.height = ffmt->height;
 	return 0;
@@ -1519,6 +1521,10 @@ int atomisp_css_set_default_isys_config(struct atomisp_sub_device *asd,
 					enum atomisp_input_stream_id stream_id,
 					struct v4l2_mbus_framefmt *ffmt)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
+
 	int i;
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
@@ -1621,6 +1627,9 @@ void atomisp_css_input_set_two_pixels_per_clock(
 
 void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	int i;
 
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
@@ -1631,9 +1640,11 @@ void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 				  enum ia_css_capture_mode mode)
 {
+	struct atomisp_device *isp = asd->isp;
 	struct atomisp_stream_env *stream_env =
-		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
+	&asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
 
+	lockdep_assert_held(&isp->mutex);
 	if (stream_env->pipe_configs[IA_CSS_PIPE_ID_CAPTURE]
 	    .default_capture_config.mode == mode)
 		return;
@@ -1646,6 +1657,9 @@ void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 				enum ia_css_input_mode mode)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	unsigned int size_mem_words;
 	int i;
 
@@ -1690,9 +1704,11 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_capture_enable_online(struct atomisp_sub_device *asd,
 				       unsigned short stream_index, bool enable)
 {
+	struct atomisp_device *isp = asd->isp;
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[stream_index];
 
+	lockdep_assert_held(&isp->mutex);
 	if (stream_env->stream_config.online == !!enable)
 		return;
 
@@ -1726,6 +1742,9 @@ int atomisp_css_input_configure_port(
 {
 	int i;
 	struct atomisp_stream_env *stream_env;
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	/*
 	 * Calculate rx_count as follows:
 	 * Input: mipi_freq                 : CSI-2 bus frequency in Hz
@@ -1760,9 +1779,11 @@ int atomisp_css_input_configure_port(
 
 void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 {
+	struct atomisp_device *isp = asd->isp;
 	unsigned long irqflags;
 	unsigned int i;
 
+	lockdep_assert_held(&isp->mutex);
 	/*
 	 * CSS 2.0 API limitation: ia_css_stop_sp() can only be called after
 	 * destroying all pipes.
@@ -1815,6 +1836,9 @@ void atomisp_css_continuous_set_num_raw_frames(
      struct atomisp_sub_device *asd,
      int num_frames)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
 		.stream_config.init_num_cont_raw_buf =
-- 
2.25.1


