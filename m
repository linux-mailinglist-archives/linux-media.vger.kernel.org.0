Return-Path: <linux-media+bounces-50438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA9D11FC0
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA36304A92C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886C532B98F;
	Mon, 12 Jan 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCKDdajk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8430F815
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214667; cv=none; b=S1R0yCejLz+o04slE0F5KZ/COMQc6E1WpxkUlqeeVsbf68ayymIvgbJjNLs64R1DSBKNzn1SQQB2JRYVzhaSMX9qykP5Sx1AQybO/XgPV642RwydRtwbfAAPIu04MruGshYPAKdGQ5Mn6ONNxi0M+MzB8USJYIX2WojGsE1RCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214667; c=relaxed/simple;
	bh=IadvI/igjuonzkmDbp264AdDOGgg6XR+qsM1nE39ReM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH0jRNUizZUVWt7wMRAeFNLhY5OIlvpLXGXev2L2WG9qJ/mrJq8g+9oDersEVGOgGRrOROjDZcZXMAVM6eqcGCvCLgQMLNm1jjMDomXR9H13MMe4OJmnu/6n8yTr+nSt+1wTYXcFx8G1JcIO3ZBXGXVwxn09a9j52JgtJ/5XpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCKDdajk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c3e921afad1so2636171a12.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214665; x=1768819465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dxF1px319gzp5LleV4H2jlboyE8vZmrw4Yc7He9t+8=;
        b=aCKDdajkLb4qli/a3QpDgWyrCKHFa3lRUlW09ZPDmM3aPWIqS1V4+GZgEb9a0l2PEh
         6F0CBfJUyOju9KrLWC8AeGw0JSGh6sLd++mpWNmqeAvxaJR0DrZd4TieOd6KPWrZiq8A
         Lij7GldPl2ixfDsn2D+v0BFLy5hZUSY33aEPyZ613N+uyE/cNV1o6uvUJV7yjSugr5bW
         TCS+ApOTsuLUoXDEhBRKPmxCYQXNNVW8ytHZZ53V6YtCYz+BC3FuyONzRrqPgPPT2DNC
         Z+MUyPVJRw1uAuWhXZfqyvjrBJJOoTREl5hqKLQ4XTxXQA2TygZeHb7/HFEAgz8G6QKW
         dXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214665; x=1768819465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dxF1px319gzp5LleV4H2jlboyE8vZmrw4Yc7He9t+8=;
        b=B4AuF4gJTKlg7AVET3wcW5SeSktR6AHPe5cGqqdaWZKLCbjs2c+grAGs6K9cRIGOqX
         0X4S9bfVllhVcTvwxHK5hI9hVcFqgv+2UkRLTgYPySk/t7FbMnfI0n0Fqpslw35xIGlZ
         dYK4Bw2d8DA1sPNQ9Vao+pro+7MMV36hjb63bJwd+M2I0P51pAYxnSN62qUsTWCOT3ta
         l3LmkmLr+W2peW0LiqlmMk3juugEUH8hTGfUP+QhmHvSLmjhhH80uKYaNg8RpEHLOUjG
         esu7T83Hu3zvqEClF0+6x5x4JDVlXW5ixFrsmGECTLYwAIF1NnDYGwwscAiQQthEOfRX
         0kvA==
X-Forwarded-Encrypted: i=1; AJvYcCX9mo192AAvGBxQLSdxOGkm068CwR6pvakYIjgNEgoyZwQKw9lox0mZslwnUYIyk7YzEqTgPPeNxTLvaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUwrUQ/D1mz8MwfPvhN1LcxWXamT9h29EmC4BeBoQqrQUFue6b
	AeEYJmtpiPbim7U3mXiJOjBaZ0bmWntY5rzxJmM/MUV3jurJxEP5k4ns
X-Gm-Gg: AY/fxX4r+GCbAPIwOMH7FeAThOhWjwohDScB6p39K4sMAyF7gsWQMuvYfpJDXT0ydzH
	7foyRDx7SwX+udxPc61YV+TjmqqyRANK7zsK+Nf2aeHRyNmreZBsxKHBBvQhzmpbtQ3fOFca3AT
	rQ8elaJ6u/thCcvM7tVv6ZGBHSbpQ8hDQxWrM0qQwFm+krq8vEuUID7fhclqNhnhtrZHgqCsuFc
	cS2Z/hkRVaMLq/mzdIFUnvatjciGcuQNqrmG6sNth3xV3dNNMhBM1Au7kDGtMnhs9CCrFQd9kEa
	6S2qNvUJnNerW+qd3X5vHsEr1hEGfuSkogC26S1n/B0+zMDs9yg8DizDDgIPR3rCYQ9gOpvMeEw
	a9MAPu2wkCw58b7V08xvJOFupKUhsjeJGbuUpKNEvkfyooyz35V/JGLtL9yn5i5EqJR8lrMyaGq
	duvw32mXm+GP/avEjYx42j2oDSKSkq1A==
X-Google-Smtp-Source: AGHT+IGbMtluEeXTEQ6gAE/purEoD1pLMY0OEle1E31dbnMt7CqDOyV8U90eNZ2s6CLzii1abXLNmA==
X-Received: by 2002:a17:90b:3c09:b0:34c:2db6:57f1 with SMTP id 98e67ed59e1d1-34f68c28425mr14140271a91.30.1768214664868;
        Mon, 12 Jan 2026 02:44:24 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b9a1881sm5471916a91.13.2026.01.12.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:44:24 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 1/2] staging: atomisp: Remove input_system typedefs
Date: Mon, 12 Jan 2026 16:14:04 +0530
Message-ID: <20260112104405.24377-1-karthikey3608@gmail.com>
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


