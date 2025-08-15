Return-Path: <linux-media+bounces-39995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E2B285C8
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 20:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676A01CC7B92
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 18:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBA028D84F;
	Fri, 15 Aug 2025 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSug0Tnn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A22192F4;
	Fri, 15 Aug 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755282290; cv=none; b=lR285PDsu4VzIhgZzoxWPE5GtMf69d8o/Rt6RVZobzz09Kf6c72o/6IuIhTwM3nt7g0eccDJQA+/c+f0z9tlRGBJjOmtszOwUgCzQZRv0Pw3psFzpK2hv2eimskp/tMrthrRv8FoSnwhvoBOcIRWZNBmBNzokfiE5ezXVP9B9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755282290; c=relaxed/simple;
	bh=QobVYEfTkkSCAnUJE1eYW2fseY8dFPW4L7iGC07OMNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozx7buKRB3ynWMDMzGt1KFMDAd8FXtXetQ0NMF54xatGSbHFhuWpxLictt/6I/EDPjCF4yrSN/UNsruOH1oPZ8YY7KhAuWcVfsSxjnYHkqdaX/Mh0eUU7v/E2qFkGMAozcOPwS7BhsJwNJmA6f9KVyviSen+LxusXf3Nm8lrLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSug0Tnn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc5641f9so376426f8f.1;
        Fri, 15 Aug 2025 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755282287; x=1755887087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0zpMZnkL3xUP4iMVr2Rvk20jrCXLh2STUJz8BkNkI8=;
        b=bSug0TnntvCiiKQK2P0eZ4btJRhjQwllUi5aDNSscPn7Sz2VB1XMgnc2C6sSt3YpwS
         YGkarEQf4+KbBuyKSN4W9c6FbHLcwEZrXFVU971Ht9W7xkF/WaICaryjb1Qm/LW2OitA
         /pPECE58T8PnLB5N/x/Emv6ysgQhl6kuxNFgO1wLs2UHCHurR/x2CgSM0biGdF05+AcF
         dJZIG0JySpACvvcoxpnaYrPlWNieoc3ziPwidgsyeappJf5ccuLetHZV4i+63fpdCMe2
         7PmQ4QOA7D+Fa3jtXpv3L+J7NAnjvA1JXf2/Haq6lJ3WLD0anaD+tvz+3s/crEiZb30V
         Donw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755282287; x=1755887087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0zpMZnkL3xUP4iMVr2Rvk20jrCXLh2STUJz8BkNkI8=;
        b=IC3eLI1jnTYG4aHXtwhaV9TQ1ozRomcZazG6KtZfnxg9+ZzjJr6hH/nF9LPQx1e+/U
         AlwBroSzbretqGXHFmikFpno8YLeiQUJnKqKckPLf0pVDTl9eqeErAT157qgpK53oTLE
         4a+gBdJpzKChzAfqYlswj02JX61B9XyZv/fNoUkwWEID/n6N11g8YpHX2LcgNBcncl+t
         yxH69g+IIYWGwWIrjRj7Ko70Xa06aD1lGfURNqmxtQHCCKtk6UGbs7I4weasFFkdxGsr
         o2RpPoGmgxoXzWtv/Yy+Uk+PkTM5dHvgFo+bWKjw5sSrlp6f0U7/SHkluhSNcZVeFaJz
         gF/w==
X-Forwarded-Encrypted: i=1; AJvYcCV0A/HYBcxMtUlRymLm0D366852nRBsnLPAYGQJJ0Ft+onxuWtOh3SaWWkCusxpNDriNKtjIhzkG4wfuWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaC6memEyV2kaknoL1AddEqUCOB6ITbL9eYVjBRxcG21QZl02k
	U4ZK1SIhlx8/O8byHiCWMR5vuVTpC7B9IGjaZEzmNQ2+QwbP+tdHejOT
X-Gm-Gg: ASbGnctyfECtBXo0Oz1/cJEw0xn4rURlPCc+rQAwwc+vZl/cayT8wrP3RkKm0FxXT+e
	W1UhW3rjuJe3+7Rqc250UX0jiw9VmUCjZ8a1x2mvYsG0Wk6wyQ6YCwqkeTy80iwWAyQbKJYmFSB
	bgulhzEutLDo7sjxAH4JBezW03ikk6+lw2z5oR1Gj5xRsP2DvFT36UbvI6qj/cDQZ1E8/dkhLuI
	PLwpCg3m/XYl/cvjxn9yjVSG+L7r8ANVgRYCcN19VKpXHsvxN5rA9KkVZJOeRBkhAeVyoKYcLH6
	+hwO9jZoKYIDd9A/I4L8HNz0WwM7KxyXEkP12WzniBZ+AkVrlHAKWy6OvxHdMms/9pW6bicXDmv
	kO2CHqxTHCxaL6xEAWGFUjyxOy9TDVlvhP87/EFsExgOsAgido9tzIXjcvf3i3lZybfvtz7k=
X-Google-Smtp-Source: AGHT+IG2Hgsf0X8riW5W1RS9V2Pmq4G97r97dj8tDlD9PVoE/DtRi0I+An1Iqw2p7XKPxCN6Cv5pOQ==
X-Received: by 2002:a05:600c:37cd:b0:451:df07:f41e with SMTP id 5b1f17b1804b1-45a21803ec8mr11696575e9.1.1755282286429;
        Fri, 15 Aug 2025 11:24:46 -0700 (PDT)
Received: from localhost.localdomain ([154.182.175.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6be103sm71465605e9.2.2025.08.15.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 11:24:46 -0700 (PDT)
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
Subject: [PATCH v2] media: atomisp: Add lock asserts for mutex protection
Date: Fri, 15 Aug 2025 21:24:11 +0300
Message-Id: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>
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
v2:
- Fix Typos
- tested by building the driver

v1: https://lore.kernel.org/all/20250815170901.32105-1-abdelrahmanfekry375@gmail.com/
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
index be5f37f4a6fd..94f63d6a85df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1447,6 +1447,9 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 				     enum atomisp_input_stream_id stream_id,
 				     struct v4l2_mbus_framefmt *ffmt)
 {
+	struct atomisp_device *isp = asd->isp;
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
+	struct atomisp_device *isp = asd->isp;
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
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
 		.stream_config.init_num_cont_raw_buf =
-- 
2.25.1


