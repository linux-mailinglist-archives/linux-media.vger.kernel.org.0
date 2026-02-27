Return-Path: <linux-media+bounces-53749-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHyIGJLSoWlLwgQAu9opvQ
	(envelope-from <linux-media+bounces-53749-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:21:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DBB1BB5F8
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21B7F30209B3
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F37944BCB7;
	Fri, 27 Feb 2026 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dUJs5k0x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5CB43CEF5
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212850; cv=none; b=aUF3RzfZXI4mA3OdmzAT+6SEvDUI7V/BtY1CRqCZF3PL//NPKc52zIFkWG0i/XgHCpIlYRsdSzEqZz0v+OZAEsWdSKXF5mzgzCHfrj560DClkwZFms53nMbZTX192L5rs0VP8/2Ol2OyL3p9XrNf+GyXHNhwIO6MP4vZw9+Azg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212850; c=relaxed/simple;
	bh=Qi+4Z2dWtRTIyItgexgTfkuMEbxlrCjpu1oIkL86EJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mr6uyrScmomKkzoqO4+HyRII0L3Dj3c2+a3dDTTbqyxuyASWxrOvxa8/HhcW+y87Q494mMEbPnUwXIbPBpPFTD7mwT3Gvp3TcOB6aFJ2vQhHfIGotNHG7oyP7zmZZ/v2ZK/yzXL1X7BGp82t56Rk2sJa7nRvCFna8pNQad8IXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dUJs5k0x; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso20000285e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 09:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212844; x=1772817644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ljANxlu8ndrw3XskAAbixI7/YE21Bcmq1KmY/q5I1k=;
        b=dUJs5k0x2ykRRt4rIqGc8IcLtzFXV3aTrDKi9K829+LWqibew+ddsUle4xxTSoT6ev
         y36gujp84vngJ5x5dLOP3TV8MNt/m+kes966WCitm14+Pg0VYCkURaIBJ/RyvxL7g+BK
         DMLSyh/4ufbhDLqebWyy5nA14dGQ04ZieV8xR9F3Tv5j0e3YmT3Jy8s/gldxEQ+eFyXR
         o3vuXeLDhFNTAm6Dyao2EQg4l5hZHQpwUyTIdyXACyx5tsdUjrvpl7TvHXNPvGRS6w7w
         B5nv/x5Sa4hRkdE8MYdYN/nMzLnYbCLMrq5YMVbffzCyaBP0If1mQwwl9VleyNJ3lQRp
         S1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212844; x=1772817644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ljANxlu8ndrw3XskAAbixI7/YE21Bcmq1KmY/q5I1k=;
        b=hh0GUZ+VVjZQXTZYrwFpk132kQaQuHJ6YL7T3E2dJtYTLiTuGC3sJYKemgwwartefT
         nFjqiygBIU1Mi+Z0JFEBgdwtd1ykIiCAHY0PiaDnk14Q7QWb6E6BEVlN1xjDDunRUmLl
         jwRuop9gAGycsADYE9P6Lbl2RxxfN44Cj1ah59UzOHV6abT6WIztC98gRwqM4COB5pfW
         cc9POYYEhDMKSWh2N8o/3UaC4f+qwMmkNu5n7thj44S5Z5CPtrZqKTTRLGOcuYcTupB0
         jXIxUM6mHQ7aXTu7IG6pY5vfDBNeacZMYMeDJru/vS7FtlZ55He5SDAVT5V6f3vcO63e
         YmHw==
X-Forwarded-Encrypted: i=1; AJvYcCX3zwo/Ox2k4aFlEwrMMCFeHGGoTqxi4nx3N3qpDy6UmL2DVoCLPAyEh3b2oUWazhCBfup7iaOvwHtH8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt5tzc2FMLCcUSpBmKs5o5hXAXsPRQlTdxGLme2iY3NnIysyph
	pwhoBUCRovaHoT9MEreWMcEUV31PUOlhNEGtuQFnpUezGSZm5Upn+3bC0DCEwx3stjY=
X-Gm-Gg: ATEYQzzajqIQCgHsYW4YXfffKfXJSqD8Uj3dOgVflxeqMALwoAxbObKhvbAvb2eCy0I
	ytXfONyRYpsTslI34nWIWbttgeVoBMo82ttNiv7ziZ5dgyttW9JIZ7gOEXVksEAkl8+sL1GPEnx
	zmJa4lfkVStvP5DRCYf5wVfg6nC7M9rmODzmkV87wCIuhMuwSdLkIcf+UCHJFhSrMsSO1bBNMlw
	IwWuqnWwYpwrQqCyRbhf4b7BS5/5bQUiXY24I2B4htPEolMfakBi0bD20kpv/hqBuw1vIPnCZHO
	+mtCQNqBeSB/co6EQ3wnVOK7nY4FOFqODal3aVraB3djCs5Zslzc3z8iDEWdn7Ih/ROSYxFWveb
	3w3C9v7MFOxKI60Rp1T+N2WiGiBGdmLEKtOv2tjPK7GU4DQg/9As1K5gSFYH40Qli96iuBMJK2J
	95wJWi+2ccA0qJHw==
X-Received: by 2002:a05:600c:630d:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-483c9bdb68emr61023005e9.13.1772212844085;
        Fri, 27 Feb 2026 09:20:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 27 Feb 2026 17:19:07 +0000
Subject: [PATCH v5 2/6] docs: uapi: media: Document Raspberry Pi NV12
 column format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-media-rpi-hevc-dec-v5-2-9bb3fc1816de@raspberrypi.com>
References: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
In-Reply-To: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org,raspberrypi.com];
	TAGGED_FROM(0.00)[bounces-53749-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:mid,raspberrypi.com:dkim,raspberrypi.com:email]
X-Rspamd-Queue-Id: C6DBB1BB5F8
X-Rspamd-Action: no action

The Raspberry Pi HEVC decoder uses a tiled format based on
columns for 8 and 10 bit YUV images, so document them as
NV12MT_COL128 and NV12MT_10_COL128.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0631919bd667..1e7146230f09 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -956,6 +956,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
+------------------------------------------------------------
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
 
 Fully Planar YUV Formats
 ========================

-- 
2.34.1


