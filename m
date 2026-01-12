Return-Path: <linux-media+bounces-50433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD0D11DAC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A1E4305BCD9
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229E02C21C2;
	Mon, 12 Jan 2026 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXixjsfX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C22C1584
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213550; cv=none; b=lxorS8SOLTZqhZcza8a0IKDlGbyexBibB6Lbk6V9W79boueYELWSB8HFbXHuC1UCJK9qLKEWMou0Cs2X8i6nlYf2D3Z1qOXipq2eh4pSp+gJkux5IR4bOmKebDNg6vd/URoFxtnLeqvB1n9nc+cLEAIXtYtkXIA1JyV9sm7vtwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213550; c=relaxed/simple;
	bh=Wj4y0YV9XLzH0qmaW7skPoqu944aoqPq+Xe49r1hqX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jG3mMUBAU+lyYL1zZiSQHKQL+0bU+4v4uP9trx37hHzmQF3nFO4nuG4hCbylBBmKiYUw5EUUMTbd1VZH6aK1wrgXsDG78R/IPOUuy7UHaRymWRhbjz0m347khMMY+uY2Bqi4JdQGC3/5/7F88o3Swt1LlWDUNA4kkHjb/wHWQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXixjsfX; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso1176159b3a.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213547; x=1768818347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gA3whBBIc3+xdJvDtLsJfhi35YsrVjyNujVe7YSmpc=;
        b=CXixjsfXpH/u2bNFV9KuFDkJ1i35++Ar5fXT21/1mXkqT4cPyrC4jQQKajJXZVaVaH
         SQKi99DqQqr0VDfjWAC6z1mtwtyMqhUQPnREb4ntptwQnHscfac07vDTPEx4VznL096z
         +jZx7KuZFBT6g5Ci4MeRgwMXlqbFxnw5HqZfuC5rd5gROLO8Hx+mMfbdW3MKdzyNsdts
         pUWfvaamiEpusLg+cogHlxBnpyrXcftXFPaccAwWzu/i/W0VNRyXu3UVb3pkKYjMnx5X
         YtdhAiBosYvBkf+8pMYTn+wgID/04bGYG1JvWs+htrn9xMjZNta8zVr51fAwoUlIV5ju
         Hhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213547; x=1768818347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gA3whBBIc3+xdJvDtLsJfhi35YsrVjyNujVe7YSmpc=;
        b=J1m+ggUJs2Zhlc3MmQMXK9ZVaamOAiHh7oosTZ+7KyTFK+VDK8DpbDfyVsgj7Q6YlK
         ZTCytRRSuiRXk0lBIoXZfn64o7CXlxAzEq+gsfIRTQNKHCXWlbhXOjXnZbPU92PQ3zyh
         hBXr/3AbwfALl1kjWVdAe/PffC1JYGYcUw+JJCmVr1Dh+5XMiPXJvJ7GHAutLThEM07x
         3i6frkllDwTjTZAm8Mu9A7XpMyPOpmooyf0UW8wuCACttdSVDM6pQOnURBaYRnTlhe/U
         a4+IuUwVX/9W84OP7s708EBzh4WrZn4bwkMok80u93MS6S1waWqYBajisyy3BAWmGGoo
         125w==
X-Forwarded-Encrypted: i=1; AJvYcCXKqHHmMaQcB74D+zyYaC9tBScMb+HKQ3BD2cVSMxpAVSbjGz9IJo9yDV1BN1m9D2zXVKy7UmhibJ3Trg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxJdWHqyZJ+xivCeakUCMiID6oMhqP1CVnYClMOopwyHJ1Bcx
	OgDWhoFkxpcsvpp/EvIVXWNHfUK4Z6tHMgqcAszaoakYueQUdJBJ0Bv5
X-Gm-Gg: AY/fxX7wiVX5DMpK5N82WirnEtJ4AbSSYUfcUAIo3/i2MiLQDl5yQRldh63hdg7eeAf
	QEsGCe0oXoVFx9wASATUVUMiRLuqw+9gOyQFVrC5BMNO4drdOZOb5dwDgWMX9nGjLyLZVkilAuG
	9gaRHHVzWyL4jwvtQdlNyNr7dcJczgNIwr/irmb7ZcuUbtqmTms2F7x3wzzbIvEsIO18d8LwYlx
	trHXCu3R/tGFEsMiQLpSAVSgOa/CMd8nFsn88tz9i/xoiWo72U2WW5AnSE4wAO2Nat2sWmCyveb
	Td0yDbb78Fc3H7ZpCRr8QMEN3XxA2oMSC91N+QLtnDqdRi3EoTu5VFEwgkN0nmUN5yM9+ifH4p2
	LK417ICs7y0SHnKB0ex1U9aW29mmdK5gPaCXjDsEEDQkpPztEHhgjWMkwa0Gbl1ZehErABbZ/5j
	bnC+oRzLpvOp5cGv5o4ZKXTTjMXiWVIGgHZ6Z/vxma
X-Google-Smtp-Source: AGHT+IFYSwSv77QJX8GmNU4hnm7cRP+x92fwQzXChwOJNcHuxW6Bw/qQ0rb2hu50z5fb9BILrzuMeA==
X-Received: by 2002:a05:6a20:7d9e:b0:366:14b2:30d with SMTP id adf61e73a8af0-3898f9cf51bmr15490322637.64.1768213547004;
        Mon, 12 Jan 2026 02:25:47 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d79sm174720175ad.56.2026.01.12.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:25:46 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey Kadati <karthikey3608@gmail.com>,
	Unix Antigravity <unix.antigravity@test.com>
Subject: [PATCH 3/4] staging: atomisp: Remove input_system typedefs
Date: Mon, 12 Jan 2026 15:55:12 +0530
Message-ID: <20260112102512.19849-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove input_system_channel_t and input_system_input_port_t typedefs.

Replace usages with struct input_system_channel and

struct input_system_input_port respectively.

Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 .../atomisp/pci/isp2401_input_system_global.h | 12 ++--
 .../pci/runtime/isys/src/virtual_isys.c       | 56 +++++++++----------
 drivers/staging/media/atomisp/pci/sh_css.c    |  4 +-
 3 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index 4aadeb133..bce8aa999 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -34,8 +34,7 @@ typedef enum {
 	N_INPUT_SYSTEM_SOURCE_TYPE
 } input_system_source_type_t;
 
-typedef struct input_system_channel_s input_system_channel_t;
-struct input_system_channel_s {
+struct input_system_channel {
 	stream2mmio_ID_t	stream2mmio_id;
 	stream2mmio_sid_ID_t	stream2mmio_sid_id;
 
@@ -55,8 +54,7 @@ struct input_system_channel_cfg_s {
 	isys2401_dma_port_cfg_t	dma_dest_port_cfg;
 };
 
-typedef struct input_system_input_port_s input_system_input_port_t;
-struct input_system_input_port_s {
+struct input_system_input_port {
 	input_system_source_type_t	source_type;
 
 	struct {
@@ -141,9 +139,9 @@ struct virtual_input_system_stream_s {
 								Must be unique within one CSI RX
 								and lower than SH_CSS_MAX_ISYS_CHANNEL_NODES */
 	u8 enable_metadata;
-	input_system_input_port_t	input_port;
-	input_system_channel_t		channel;
-	input_system_channel_t		md_channel; /* metadata channel */
+	struct input_system_input_port	input_port;
+	struct input_system_channel		channel;
+	struct input_system_channel		md_channel; /* metadata channel */
 	u8 online;
 	s8 linked_isys_stream_id;
 	u8 valid;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index e6c11d5f7..291b2fb33 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -26,28 +26,28 @@
 static bool create_input_system_channel(
     isp2401_input_system_cfg_t	*cfg,
     bool			metadata,
-    input_system_channel_t	*channel);
+    struct input_system_channel	*channel);
 
 static void destroy_input_system_channel(
-    input_system_channel_t	*channel);
+    struct input_system_channel	*channel);
 
 static bool create_input_system_input_port(
     isp2401_input_system_cfg_t		*cfg,
-    input_system_input_port_t	*input_port);
+    struct input_system_input_port	*input_port);
 
 static void destroy_input_system_input_port(
-    input_system_input_port_t	*input_port);
+    struct input_system_input_port	*input_port);
 
 static bool calculate_input_system_channel_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_channel_cfg_t	*channel_cfg,
     bool metadata);
 
 static bool calculate_input_system_input_port_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_input_port_cfg_t	*input_port_cfg);
 
@@ -89,8 +89,8 @@ static void release_be_lut_entry(
     csi_rx_backend_lut_entry_t	*entry);
 
 static bool calculate_prbs_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg);
 
@@ -99,7 +99,7 @@ static bool calculate_fe_cfg(
     csi_rx_frontend_cfg_t		*cfg);
 
 static bool calculate_be_cfg(
-    const input_system_input_port_t	*input_port,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg);
@@ -110,13 +110,13 @@ static bool calculate_stream2mmio_cfg(
     stream2mmio_cfg_t		*cfg);
 
 static bool calculate_ibuf_ctrl_cfg(
-    const input_system_channel_t	*channel,
-    const input_system_input_port_t	*input_port,
+    const struct input_system_channel	*channel,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg);
 
 static bool calculate_isys2401_dma_cfg(
-    const input_system_channel_t	*channel,
+    const struct input_system_channel	*channel,
     const isp2401_input_system_cfg_t	*isys_cfg,
     isys2401_dma_cfg_t		*cfg);
 
@@ -263,7 +263,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 static bool create_input_system_channel(
     isp2401_input_system_cfg_t	*cfg,
     bool			metadata,
-    input_system_channel_t	*me)
+    struct input_system_channel	*me)
 {
 	bool rc = true;
 
@@ -324,7 +324,7 @@ static bool create_input_system_channel(
 }
 
 static void destroy_input_system_channel(
-    input_system_channel_t	*me)
+    struct input_system_channel	*me)
 {
 	release_sid(me->stream2mmio_id,
 		    &me->stream2mmio_sid_id);
@@ -336,7 +336,7 @@ static void destroy_input_system_channel(
 
 static bool create_input_system_input_port(
     isp2401_input_system_cfg_t		*cfg,
-    input_system_input_port_t	*me)
+    struct input_system_input_port	*me)
 {
 	csi_mipi_packet_type_t packet_type;
 	bool rc = true;
@@ -410,7 +410,7 @@ static bool create_input_system_input_port(
 }
 
 static void destroy_input_system_input_port(
-    input_system_input_port_t	*me)
+    struct input_system_input_port	*me)
 {
 	if (me->source_type == INPUT_SYSTEM_SOURCE_TYPE_SENSOR) {
 		release_be_lut_entry(
@@ -429,8 +429,8 @@ static void destroy_input_system_input_port(
 }
 
 static bool calculate_input_system_channel_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_channel_cfg_t	*channel_cfg,
     bool metadata)
@@ -480,8 +480,8 @@ static bool calculate_input_system_channel_cfg(
 }
 
 static bool calculate_input_system_input_port_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_input_port_cfg_t	*input_port_cfg)
 {
@@ -613,8 +613,8 @@ static void release_be_lut_entry(
 }
 
 static bool calculate_prbs_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg)
 {
@@ -632,7 +632,7 @@ static bool calculate_fe_cfg(
 }
 
 static bool calculate_be_cfg(
-    const input_system_input_port_t	*input_port,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg)
@@ -677,8 +677,8 @@ static bool calculate_stream2mmio_cfg(
 }
 
 static bool calculate_ibuf_ctrl_cfg(
-    const input_system_channel_t	*channel,
-    const input_system_input_port_t	*input_port,
+    const struct input_system_channel	*channel,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg)
 {
@@ -759,7 +759,7 @@ static bool calculate_ibuf_ctrl_cfg(
 }
 
 static bool calculate_isys2401_dma_cfg(
-    const input_system_channel_t	*channel,
+    const struct input_system_channel	*channel,
     const isp2401_input_system_cfg_t	*isys_cfg,
     isys2401_dma_cfg_t		*cfg)
 {
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43..ec4d15ffe 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -665,7 +665,7 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
+static bool sh_css_translate_stream_cfg_to_struct input_system_input_portype(
     struct ia_css_stream_config *stream_cfg,
     ia_css_isys_descr_t	*isys_stream_descr)
 {
@@ -852,7 +852,7 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
 			    "sh_css_translate_stream_cfg_to_isys_stream_descr() enter:\n");
 	rc  = sh_css_translate_stream_cfg_to_input_system_input_port_id(stream_cfg,
 		isys_stream_descr);
-	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_type(stream_cfg,
+	rc &= sh_css_translate_stream_cfg_to_struct input_system_input_portype(stream_cfg,
 		isys_stream_descr);
 	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_attr(stream_cfg,
 		isys_stream_descr, isys_stream_idx);
-- 
2.43.0


