Return-Path: <linux-media+bounces-50436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D0D11F4B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B1AB30873AF
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF85C30F801;
	Mon, 12 Jan 2026 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhnJlcWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC29264609
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214360; cv=none; b=OKvIhebYBmrF94SU8CHYw3Z6RaJYd2Yf0RgDYcYSLBXUX9sqxLgLMdmwOSsnYrHqeIM60zHMJLrWOzcoiEemB0T8PI7ScvAklrDIIEd43Zspv8XpIA8WcCoRiGZst9aQmVXtMEFfoanFqgA8UBiaJWKQBh9XCVYAczfdY2Pnpto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214360; c=relaxed/simple;
	bh=IadvI/igjuonzkmDbp264AdDOGgg6XR+qsM1nE39ReM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXY0PksR140QaSZhokZXT1ZmAHEY8W2xKQ8jaEduNfLYbvLRerYiFJ638ohAjHNtKOM+gXkd4npB9RJoNHSD2Z5H15KG7Jhn02x2iIlff+Ct8kzBl2TRwNLnB9xTBcjaxViFkwWB0LIi0j7SoIFbVdPOT7BTtjClgvjwOEr0K2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhnJlcWg; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81f3c14027cso859925b3a.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214358; x=1768819158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dxF1px319gzp5LleV4H2jlboyE8vZmrw4Yc7He9t+8=;
        b=nhnJlcWgWvkKQdHPi/NH4IailIMr3kEVEBMk3fM5+E8EmgoptMlUmo8iJYy00pavMO
         rGPDlpLMEP4wkuSt2TyOritHZWSpQFojoFySk6MI5cROTlvCju0R3jci+oNl5qNRppSd
         AyX5GQNHvO52cg1l+VBVGXl+nsvZEtJkS7E6WmuDYG3jSDXdqNu4WriWj8cW5edqrW9N
         Yl9kMopA9i5Bhj9szu+89v4m7L2Ry7zCrXbaGMxMFBDHVNRGnsRKXeM6Y718hmo9Nh3/
         KPXEJlDTwDPReHYC4O8Rny/tP2Ej1zuIm7e9Kp1w3QkthbQEr9HQEwLA8g/3wbdBiegd
         Y55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214358; x=1768819158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dxF1px319gzp5LleV4H2jlboyE8vZmrw4Yc7He9t+8=;
        b=oFILwFlvhhQ8Aj1aQ0aNsS+5hbHkcS6l5ep6dKDNG/OvoWMFxM0VagGOlT3kkJAhJd
         rWZB1DOOfIptOhTbc2iYbGNp8B3AdPOatIGoXiktXRDJ6UDkowcdXJhe5i7rRxIrvS5f
         I2XSwCkXej5j+FQ5M14Wie8iEJ/ubWIa4w0n/9Qup3rJ5WSbpTzQWak0lQO0zNyFMR2V
         kge1qDCWRFROhV9+ssm5hadNtWWjpSFEyoCo0/MesSTOde+P6rWM5kiTJW03o3YGAreL
         5RPtDrLSSPwBPOANaGASHSdmBUFsEFH7R8XH4xQ8VMTFMo7ETAcTuooa0+8ff0OklRQw
         ihYA==
X-Forwarded-Encrypted: i=1; AJvYcCUWHA7m7CKNmsyNbUdG1TsJKurbVSU70lHtTSR/Fmn/CXfc6bBvfMDERmQCepblVieQfVPSHpEjQxXkqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjm4hSnywl7cdy0ZgExHIq+nheGokeMImnoSzSUHrTSu04FqH5
	swu+NQHKjKh6waU9HRLBTkPWv+PO2+veLmD2qnO6xSwC1GJmC8Rfui7M
X-Gm-Gg: AY/fxX4KLmdo27LVc01l+4YYtQwZvivkQVPZK+FOUirFG+kzKVJ9BJajQwdwmiF/at/
	ARs1xOABclNTXxlUAvgu+WyEzbLOrnklosDeZal6gfIgtQPA8FwJm01W6SFX1ArgPyaQsSIyABy
	f0Km0Y3Hp9AVpwNr4Mgs82XMzPdBNhbLVpTlddSOQZ4XAvZ83IdYY1sbKLFFm966buHmHktFLwW
	pTxGPIdLkKeuyRWl15C09BuVmObw2xMfJV2SX9Od1eiXQGnSV/NB9lMtC34S99TEli4tSxZah0k
	aLkL733j0I5VJvpWWaPaxeBbl89XBE76QRnMyF3RuQbonuqQ8F19C26OJE/VHkhoOb+zSOXy+NY
	cNkuuor9W1HMXUod1aymlbz3YGrJv0lzYWP08qeHVTHpRCp6M+gNaquCUSdWSZvQWQ5erv6BQao
	ThDvjYydJjc2SwwSDwZURhBjaPlivCBw==
X-Google-Smtp-Source: AGHT+IEZN1XNOzjThVCgADBQrSb9BZRXqgTvUuZTBFHr5sGBWS/oZ4gOux7gild0c5LzNioPUIyZ6Q==
X-Received: by 2002:a05:6a00:1ca5:b0:81c:ce40:b29b with SMTP id d2e1a72fcca58-81cce40b605mr10941809b3a.15.1768214358166;
        Mon, 12 Jan 2026 02:39:18 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm6539877b3a.48.2026.01.12.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:39:17 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 1/2] staging: atomisp: Remove input_system typedefs
Date: Mon, 12 Jan 2026 16:08:47 +0530
Message-ID: <20260112103848.22980-1-karthikey3608@gmail.com>
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


