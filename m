Return-Path: <linux-media+bounces-54470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MINiEos+qGl6rQAAu9opvQ
	(envelope-from <linux-media+bounces-54470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 15:15:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8872201262
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 15:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BE2F31FE443
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 14:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0833BED2E;
	Wed,  4 Mar 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="qnwmS+Vk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088033BE162
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633126; cv=none; b=qrY5XrxUEg1J6as/pZnIHaMeEmmB9g9kYosnwwds+KGBWE/r+OW+dJtfHM4DZ3Pp4dGQzNi/U+G8zKNcTH5pBw3eyErSvtwLtkDW1g0fs/8dWshuAkMkc31UdjpeD1AN+1hFFLq/16QRjCGDadoIB6G5/1zXX8VEGjjDhyh9Xm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633126; c=relaxed/simple;
	bh=fCZ7l1zWLuOmc9ZecF6FygLedL5iYBbceOgpkaXdciU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+2nDrds3peIApsl928ZTjzcB/cFT13e0Ds5seTBlcZxe1nUeUXDanNiK/VtKeptHFCx/jUmhXFxQdbkmHDnjM2AAhCKF6SgDDILO7CeUhTiBkPKLPGcRCcj7WPaRgYh0lMRoJYpI/JFB50eLY10ZlUxJqPPF+FoO6pAFtw6k0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=qnwmS+Vk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so78612235e9.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633121; x=1773237921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5QNeVnlLBH3/bXg5RBtmhfoseGDTb1QFshJs8flMKI=;
        b=qnwmS+Vkv9ylFabcq8b/wfb+jSGGTPnRmC/pcr/w6nK/TbIwFRNVlIOtRRBq4meViV
         kJlILGZ1fmW52RO91Qz9GKCUixrdDeSgajfXsKH8Qe5DDMpJm3jymoDsYIDkZkzf0AMG
         FPOBYtFLtOBABhTSap9KkJQBuOLfDP6nplpbjV3VxQuSd82K/ZfNYwMtB5VdALqGX0Zw
         vsO0mo5n5OecvGnyVHzdNOFREsClyAUAaZ1w0tDxMvPWILAsjcFHH8wSsBg6b6SRy9rT
         szWh9XznCuTUJ2LlmWIGBtiNSY4CwKu55RdDBDSL75s057Q2qsMog2N0snAeKTaW2xjh
         lcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633121; x=1773237921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5QNeVnlLBH3/bXg5RBtmhfoseGDTb1QFshJs8flMKI=;
        b=uXUsoPbWoo1tliY+y7HdRZ0/nx2ANZvH3So0V9MQ0cEW87XvLvJNoEHoAkFlJpIm8Z
         wjn4/xqCTiAu6i2ad0y/cEfVESdCiI2iWTCD7U08SVODjZUSaBvWpMUyL9AaO1DVp90s
         VgeVRRUHRqB1R7SHXah45vRPAS1pRjcYe7Ao8tKPST3SsFba+RPUrzg+AqNh4Y2gfKhi
         PD8frfxkfYnK/9m+9+dDqEKoMJJTF0QiVzNtNWWvifREHlrwV+OF6zWYdrCgAP+D198P
         UDMEj2MXDd55jcbPsLBXoDY6yo5r1Re0P0al0YnCum4ttGwK1/r9CaZZdM6amVHX8c9D
         HQgw==
X-Forwarded-Encrypted: i=1; AJvYcCVqN8OIbx6Lcg9FnMrbxd4X1R7OCNJGogiU1tnof87x6IATbiLOcS4kOYvJVuIrQSSxwt3a9m918tHQ5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvqmcpB8/ihMA9s7wFVIl7rd+eKl8xwFrIKeNVt4KrnZhWXmT
	0MEyxuV4q7PNy3YmZLh9q1BoZPaj5C869K8kOwwX5jHmp65mkDbf8tvFqhxmzrtAZdw=
X-Gm-Gg: ATEYQzxN7HxRsv+RTHBAC5wJCk8i0s01AbxDiZwxz+xiuqTkP7zX6/wHR6JJ6o90kAn
	xm0vYqF3gBIn49JjRXwFrIP+2h5DKpi24pkvrRPGEfX3Ybt7y0JcH0B7Rupf4b3a5a6iaXgh4ZC
	z15EVjDJ11k2ALryITSq4pXtzEOkDK17ajj0sQ1CDoPI3YWyl0MzSepc3KwI8S9s+ndHfg2Zx9/
	+dRoyl5JcE4TDQjumj7QPAy+gs7eWNZVDZWX6OJLZG1+Sv1s8y99dJlhUzOPdX84hTPmJFsL5L/
	f7/t6yQUwnSaE1vOHBZu/ox89KpF/oxPGATLnj+cWWLCxZJJHyoUKLJJUFHIJzy333gFlOnzMFh
	VGTzawu6PFu+nTD7FzimfqYXeqb2ZGkz9Jjuosq6iCSKBxyBQwmGoMG05P2iT1ad+jsI/mMGe03
	2X9idbYuIn7Y1CzH7yWZaL6OVy
X-Received: by 2002:a05:600c:37ce:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-485198be6d5mr37123935e9.34.1772633121379;
        Wed, 04 Mar 2026 06:05:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:15 +0000
Subject: [PATCH v6 2/6] docs: uapi: media: Document Raspberry Pi NV12
 column format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-2-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: A8872201262
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org,raspberrypi.com];
	TAGGED_FROM(0.00)[bounces-54470-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:mid]
X-Rspamd-Action: no action

The Raspberry Pi HEVC decoder uses a tiled format based on
columns for 8 and 10 bit YUV images, so document them as
NV12MT_COL128 and NV12MT_10_COL128.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0631919bd667..1aa4182b8adc 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -957,6 +957,52 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cr\ :sub:`11`
 
 
+.. _V4L2-PIX-FMT-NV12MT-COL128:
+.. _V4L2-PIX-FMT-NV12MT-10-COL128:
+
+NV12MT_COL128 and NV12MT_10_COL128
+----------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr. The height is always aligned to a multiple of 8 lines.
+
+V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit
+values are packed into a 32bit word. A 128 byte wide column therefore holds 96
+samples (either Y or interleaved CrCb). That effectively makes it 6 values in a
+64 bit word for the CbCr plane, as the values always go in pairs.
+
+Bit-packed representation.
+
+.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 8 8 8 8
+
+    * - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
+      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
+      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
+
+.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 12 12 12 12 12 12 12
+
+    * - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
+      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
+      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
+      - Cr\ :sub:`01[7:0]`
+      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
+      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
+      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
+
+
 Fully Planar YUV Formats
 ========================
 

-- 
2.34.1


