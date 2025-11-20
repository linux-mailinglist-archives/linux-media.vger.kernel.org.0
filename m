Return-Path: <linux-media+bounces-47455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC3C72F82
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0B7134E050
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC013128DA;
	Thu, 20 Nov 2025 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WR1A0gyi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D830F948
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628607; cv=none; b=Ltr/l3mhRbkVfeEV7Gw4g4+U6nDyVDL47MkNfqU/CCNpW7uTp5MF4tPrQ8bXILuGSEeFoT+hKcCc9VkFAA2pSDvjTeEdoYdS/XfsusFAWdW1Kf6S97kFJcVYS5syXwYaWtrh3iaxKU6sNBECS0TcRuRAHslHbUsUGvZsiuoTC8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628607; c=relaxed/simple;
	bh=M+mW+WSULXXoA2BJG/VmR/L0N4mc6VSqrlTT8ZT02VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wm858dN24ZeNViAjFFFIm+O2VsTUgZT851SWjrV/4FzVPtXdGkDAn5MFvQ+n8jl1VFkSYJwibTK2q/Yx8LdXpqZWsvWaRV3OkedZwF0hDDp5846ITU1++ZGgw/dyUuCvL2asSK3mw4UhtFEZ8v0+eDVUhJSyS2kMAoOcd827EJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WR1A0gyi; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so690671b3a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628605; x=1764233405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wulNorrU/LplRsqFdq/jjsuNqQC6CdMEcWXsJuIvbw=;
        b=WR1A0gyi+E2jXsw2TGeEcwQmbP4NferyRRhD/wbKNW2R7HfSnUeM6z4zkq7Wy/WwID
         b4nZIqFljQnIsmCS3wwQefnAG9Ypu5vBYj6eXxf2jAQPioJN/h3cng3nzEupGksVTZ3H
         Lv4no8aHFCS9zGPql6TQuXrMXvLN+MPH2t3XHOe/O7RF2PlSRD4dbnicY//GE837uQhF
         KoK/QalWdWn8xggE2t5z1Eo8pxFfv0JKXYSQ64Y/MHNYp5KjeEFrar6KxlBGv3sDMju6
         PtiLBYBldvfiHzJVPZjaJkD9W9DYGg1X7/AGT1rX5SYkQtvj7XWPoIUL8ti6VLWFrK1U
         bCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628605; x=1764233405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wulNorrU/LplRsqFdq/jjsuNqQC6CdMEcWXsJuIvbw=;
        b=niYfy3ycxJm71VtdYyJc3ItM8xfKSd+T17D2eH9qmox1CEPmiTWQZmtpN14bYz9kla
         h13gY71YkEIdYM4+fDR8/gfKGq50MuyUvfPn/XBLXJfUpaHfCOPlwtDx97XMg/ZLGyk4
         0encZkH/TcoLc2U4WvIT8+3uIlg+tzf4K1HtIbsdht8PvUODJmW6dRH4kxCmIjFXCE/3
         spuXWA/mq8tQ3SErXNdZ7u90iu+Sq9QZViIGPw/Zc3gbBcKpPzkZgy22Fx5BTHBe4rlK
         WZ7DqjVtRBR1jiHObLvZyOxi6RUWcg30FEmPzettoGC03cwP+uI0TPddM2JU/bEVXVn2
         lv8w==
X-Forwarded-Encrypted: i=1; AJvYcCUWcmGCLqjnUA9i8plDQcoOfnQNGjmKQwVJFGcDRb8z0xnHtSEncnJ+k48j8vNQDcHHtOQw2xbMQ/CZew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9m2zHfS8iCILvelajps07cW1g7+g03HoZ2P7qhQ2ejFl3M3mg
	6697s81M6cotT0CUb06C72cm0CGWOTnn0CCX0bj7DZZOdTlbmHeSy6qI
X-Gm-Gg: ASbGncvvg/0UB5a/XWUKoesOQbKW2QvpUOtOCO3/NPl+vw80wNVwp1IzW1q2UwyEADC
	Q2vZg6lcSYiaMTLocS5I9M09L9Y7wV/W2JhJwSTBIu5LZDgorvPEwwFWfvE0zTWePpl2IDN0l0q
	dbg0XSiBqS/eJg6Val97PCny+M68ynOAymEaKkEsW6IjQPPU/8QDXEKAaS9x5ez/KgRwEYgHOZo
	lfrozLjK4dRSTGV/8hhLtfs0MCc01l24YaA9UhUrwIxyk2wIpSgRqjXv/rB//6eAME5KaYeyr9q
	YZxnevD+T32wETN95w8Sq2ESRrLCu+rCqsUf1Y3b2p7tQsoFI5GXaIQi6mb2BK1pOFojKSV5Re3
	1K6HeomzU+ZtzwETJ9RyGyA18gZZe+8LJWbBE65ljWp/NmYMZVnblr756GUxdE3fqHmXm58REqz
	FoegBDuuadj3fEXTUK0+5nOVkYzezHUPFDXJxvpw==
X-Google-Smtp-Source: AGHT+IGtuUW0eOH4iDC4C4u0pWDQHVhkJCMz9yoff/QHqW4CoAGSE5E7MXTOxDhAJhNsBCykPSB0tA==
X-Received: by 2002:a05:6a00:23d5:b0:7aa:d434:69d6 with SMTP id d2e1a72fcca58-7c4343e34ccmr1973989b3a.10.1763628604575;
        Thu, 20 Nov 2025 00:50:04 -0800 (PST)
Received: from opensource206.. ([157.50.102.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm1974900b3a.41.2025.11.20.00.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:50:04 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 5/5] docs: media: vimc: document RGB/YUV input entity
Date: Thu, 20 Nov 2025 14:19:26 +0530
Message-ID: <20251120084926.18620-6-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120084926.18620-1-opensource206@gmail.com>
References: <20251120084926.18620-1-opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the vimc admin guide to describe the RGB/YUV input entity and
show how to use it in a pipeline.

The existing media-ctl and v4l2-ctl examples are updated to:

Use the correct device name, platform:vimc.0.

Keep the original sensor → debayer → scaler pipeline example.

Add a new example that switches the scaler input to the RGB/YUV
entity and requests ARGB output with a padded capture stride via
bytesperline.

A new vimc-input subdevice section documents the RGB/YUV frame source
entity, its default RGB888 bus format, and how it can be used for
software-driven frame injection in pipelines that start after a real
debayer stage.

This makes it easier for users to understand and exercise the RGB/YUV
input entity in vimc-based experiments.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 Documentation/admin-guide/media/vimc.rst | 39 ++++++++++++++++++------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
index 29d843a8ddb1..a1b7de769e23 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -4,7 +4,7 @@ The Virtual Media Controller Driver (vimc)
 ==========================================
 
 The vimc driver emulates complex video hardware using the V4L2 API and the Media
-API. It has a capture device and three subdevices: sensor, debayer and scaler.
+API. It has a capture device and three subdevices: sensor, debayer, scaler and RGB/YUV input entity.
 
 Topology
 --------
@@ -29,17 +29,28 @@ configuration on each linked subdevice to stream frames through the pipeline.
 If the configuration doesn't match, the stream will fail. The ``v4l-utils``
 package is a bundle of user-space applications, that comes with ``media-ctl`` and
 ``v4l2-ctl`` that can be used to configure the vimc configuration. This sequence
-of commands fits for the default topology:
+-of commands fits for the default topology:
 
 .. code-block:: bash
 
-        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
-        media-ctl -d platform:vimc -V '"Scaler":0[crop:(100,50)/400x150]'
-        media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
-        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=300,height=700
-        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
+        media-ctl -d platform:vimc.0 -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
+        media-ctl -d platform:vimc.0 -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
+        media-ctl -d platform:vimc.0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
+        media-ctl -d platform:vimc.0 -V '"Scaler":0[crop:(100,50)/400x150]'
+        media-ctl -d platform:vimc.0 -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
+        v4l2-ctl -z platform:vimc.0 -d "RGB/YUV Capture" -v width=300,height=700
+        v4l2-ctl -z platform:vimc.0 -d "Raw Capture 0" -v pixelformat=BA81
+
+The following commands switch the scaler input to the RGB/YUV entity and request
+ARGB output with a padded capture stride.
+
+.. code-block:: bash
+
+        media-ctl -d platform:vimc.0 -V '"RGB/YUV Input":0[fmt:RGB888_1X24/640x480]'
+        media-ctl -d platform:vimc.0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
+        media-ctl -d platform:vimc.0 -V '"Scaler":1[fmt:ARGB8888_1X32/640x480]'
+        v4l2-ctl -z platform:vimc.0 -d "RGB/YUV Capture" \
+                -v pixelformat=RGB3,width=640,height=480,bytesperline=4096
 
 Subdevices
 ----------
@@ -53,6 +64,16 @@ vimc-sensor:
 
 	* 1 Pad source
 
+vimc-input:
+    Simulates an RGB/YUV frame source for pipelines that start after a real
+    debayer stage. It exposes a single source pad that initially advertises
+    ``MEDIA_BUS_FMT_RGB888_1X24`` and accepts the usual width/height updates via
+    ``media-ctl``, which is useful for software-driven frame injection
+    experiments.
+    Exposes:
+
+    * 1 Pad source
+
 vimc-lens:
 	Ancillary lens for a sensor. Supports auto focus control. Linked to
 	a vimc-sensor using an ancillary link. The lens supports FOCUS_ABSOLUTE
-- 
2.43.0


