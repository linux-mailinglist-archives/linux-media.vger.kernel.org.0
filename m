Return-Path: <linux-media+bounces-39993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158CB284B6
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 19:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A701884275
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 17:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F1B30E83E;
	Fri, 15 Aug 2025 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtdF0KCS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E83E304BBC;
	Fri, 15 Aug 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277756; cv=none; b=aR9X4CkPmLtmIB49EYhVhm0DtGTOVSGvKU/fpX7clK3TPkC9qCNpLspbJiBmvW2JYpvBLOatWYhCN6iA8Jd1rFT+LFT0d6RxZdyYHDxLjBgw6LbttRMTdghTtJoU2z1Mbp1mI4jTw0ihbG3/mEX9f77VPus7doYeSl6y/tavw8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277756; c=relaxed/simple;
	bh=i39aS+ObywOPyCHHVYemcnYSe1Eb0V7lSuSL0TimfzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WilDw0J3H/VfphN/VE/pHXs6IrddyzTvq+TlMTkwMpqvqgTsstlMqDa5vTPtCt6dPKaW5zROSxVH/kiojPyoWhKFpTAtp0yQuTfnRSH5TTQRFYrui75ffYEy/qqbY3oFiCRi7+Kto6MQ2Tie20fwUEcH2qUmkh4wmp7MxKkScis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtdF0KCS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9dc5641f9so363733f8f.1;
        Fri, 15 Aug 2025 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755277753; x=1755882553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9f02u3GqmQB3JIkPAoqZ4J3n/9mgpEYVfExN7OiRrE=;
        b=YtdF0KCSkIbtJGzF6seIz0lQaZL/Ru3P1ElLC6mdBqd4aMb2wzHnmB7seYwVUEOUB7
         GzT/4d31LqEPQQHF5umJX+CtH3XyKu5nZqHxYNbGz14VSvHHkKPolA51FW9sMF98oC9c
         ugry1z1PZtz7Di3G6VgeZCAkZoZQpEUA/oR5uiTbSbUhHdXEOqB3a44jW7ZatlCgHEo/
         EtvNF4wfEeVob4OnWcssEp4b0PziWj2pd9r6+RlagyTrq0yvKOH/kzX8tO1/QfmeG+8k
         b2kqm3wdBqTsK7wWwi2kNqwf11eDVV2MIgeac/3RY5YC6bVQZ+kQKSbrwhJ6Cwz+P1u5
         P6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755277753; x=1755882553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9f02u3GqmQB3JIkPAoqZ4J3n/9mgpEYVfExN7OiRrE=;
        b=ueeoq6ZR64UhuB/HgZD4/F7Hj6uWrCfaBN8i8vPfwRJUEelZ9mztbJ6tcMnz6fvfGh
         1iDmD9b0GC2bkmqP+FQwGrLiz7CtJ39/DCyTwij7yJHCykXiDe7UfP6Reb18WrtvUkXk
         D5NY9QiU6YCkghuG6fAKjfyQlDWiiQSv/zIUrKCqxlgN/dQMtUhhZ/2edsZs/DsUYiI5
         YVH3zAmxxWTZDFNo7ddsSxT1G8fV09kldCT0D9dQN9kkR25NRZ5ywBqIuwxyj7ydyEYv
         vPMzDf3cEAVPDu0B6yLi7rct1d1DAXiGnh8cYJduWs/Mj7R2sT/Oall7QFkpbyPORpIE
         Ac3w==
X-Forwarded-Encrypted: i=1; AJvYcCWlgeib45LgQq2e6S18iGAi4zvW4iEIFbJlziWYyKA9iyTyFHOhyI3XdkNsxZSuairXsS6zscIbNSQg4xE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSp5dav1ssbDRBF1Ty5VSG9Q1PRNFXhr3LQ16u6U1xDocZWgK
	UVTa39FVxXLzGzF+iKGaOBWZ3/DfAB/Cfj0kZ3/p1XNzii/5bmTMjxIS
X-Gm-Gg: ASbGncuChVUKgDnRprO/oCPxnaiJM/T4iAhX93UgYQtMwR3EYXL1ZZ5MJIFw0tgN+9N
	g52+/9ME5scS0ujFuK9KMqBTDj7hCPLySJ2J6jXUe+pEI12rDOpLImechtPkeVoFpf2rAxXZ9o0
	Aj8X2wF0jgbwEi3pvxwjWlz5j/DZj65FlZ1xuj48srjr9cJn99p2rR6MSQhCZgNmQxDF3RNribd
	rtqysYVc0jPew+9rZzAqzh638zgaC2DjlHyhNhRl6PNyrqzvhHzeDAbmRoEa9s97D4NtIGPTRd4
	AHX9uQzR0yXef3ZOh36RbSHPLaSluyPxrMTbSdvdBjEUR2gxyzd9tDn4iCPM3KbycJAkZTvw/Kf
	LToFm2qXfqy03onVz8GQkQfsyaPqmyzL0yV/1eTdG6Vns3Oi+K+n2M7ZUwrRGBetGAQNpU8vZfE
	sf9l8zvg==
X-Google-Smtp-Source: AGHT+IH2T8ITBmcU5I7J7F7gTLljdMAJMBGBNIMMZJDwQwmChaogZZpltoGJRKW+LVoQwndbI+PSsg==
X-Received: by 2002:a05:6000:3113:b0:3b7:87be:d9fa with SMTP id ffacd0b85a97d-3bb63ac9bd3mr942743f8f.0.1755277752496;
        Fri, 15 Aug 2025 10:09:12 -0700 (PDT)
Received: from localhost.localdomain ([154.182.175.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6863fc29sm2760083f8f.66.2025.08.15.10.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:09:12 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: Add lock asserts for mutex protection
Date: Fri, 15 Aug 2025 20:09:01 +0300
Message-Id: <20250815170901.32105-1-abdelrahmanfekry375@gmail.com>
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
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 ++
 .../media/atomisp/pci/atomisp_compat_css20.c  | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..48ca33e1c92d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3794,6 +3794,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
 		    const struct atomisp_format_bridge **snr_fmt_ret)
 {
+	lockdep_assert_held(&isp->mutex);
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
@@ -4324,6 +4325,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 {
 	struct atomisp_device *isp = video_get_drvdata(vdev);
+	lockdep_assert_held(&isp->mutex);
+
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	const struct atomisp_format_bridge *format_bridge;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..915c4c9ea9e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1447,6 +1447,9 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 				     enum atomisp_input_stream_id stream_id,
 				     struct v4l2_mbus_framefmt *ffmt)
 {
+	struct aromisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
 
@@ -1519,6 +1522,10 @@ int atomisp_css_set_default_isys_config(struct atomisp_sub_device *asd,
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
@@ -1621,6 +1628,9 @@ void atomisp_css_input_set_two_pixels_per_clock(
 
 void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	int i;
 
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
@@ -1631,6 +1641,9 @@ void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 				  enum ia_css_capture_mode mode)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
 
@@ -1646,6 +1659,9 @@ void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 				enum ia_css_input_mode mode)
 {
+	struct aromisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	unsigned int size_mem_words;
 	int i;
 
@@ -1690,6 +1706,10 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_capture_enable_online(struct atomisp_sub_device *asd,
 				       unsigned short stream_index, bool enable)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
+
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[stream_index];
 
@@ -1726,6 +1746,10 @@ int atomisp_css_input_configure_port(
 {
 	int i;
 	struct atomisp_stream_env *stream_env;
+
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	/*
 	 * Calculate rx_count as follows:
 	 * Input: mipi_freq                 : CSI-2 bus frequency in Hz
@@ -1760,6 +1784,10 @@ int atomisp_css_input_configure_port(
 
 void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
+
 	unsigned long irqflags;
 	unsigned int i;
 
@@ -1815,6 +1843,9 @@ void atomisp_css_continuous_set_num_raw_frames(
      struct atomisp_sub_device *asd,
      int num_frames)
 {
+	struct aromisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
 		.stream_config.init_num_cont_raw_buf =
-- 
2.25.1


