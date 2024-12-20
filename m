Return-Path: <linux-media+bounces-23948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E729F9653
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446FD16CA22
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AED21B1B4;
	Fri, 20 Dec 2024 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IvD5h2hd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B987821B1AB
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711699; cv=none; b=QuYebD4aWcKdV1JM7qvlTOP4SEN24zDywL/iznrzFeaiWiGS/0bO6boMKIwkZOsJzh1XQhZZsOzx4QXYt1h+tVSjlw1/7yQzAuZ+GgQFbWQUP9r8/Hu/b1wz3+ZKabH6pZMACT3gb8fF8Y9ydgKqN5umUzpt6V/XF4Yj3jbWPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711699; c=relaxed/simple;
	bh=evUDjlbbbIVWbgnJkzWE2IDXuslB3YSmbdbxGGC+Rsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VU4is7JZsfA7uIGQ7qsrxtcozj+mhUp7yLS6uN/Qws/FMLaCmMI/p6cZ8kUR4ONzM7SzmRQNdOy/qh3qJkjMcRQAcP9UoGRaGcAgBOeYaJ/nrmquKUan1k9KzLq7pjLWeqZt03hUR2vS1lSzCQP06kBeJ/9XxmqCz6zbjO9RM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IvD5h2hd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361c705434so15636785e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711696; x=1735316496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8tvjSHvBnYEUrXXehqqoug7u5Rbl1jMwLkYtbBCoO8=;
        b=IvD5h2hd3bcHmmdqvDTUSs06Zm6uaLyobfjNviTDHcvyks+JayJCSHKyCygDD2G5yH
         URQOeAHHKMt5GwLh+fL6Rf+fzkCfCH4Ci69cydJ2hU0aeP0dy3WtwNkBnsnxf1ofW31V
         /WYOQ4SGXMyI0bOGoN2dzWNXChNuEpli0reIM+t9wttC4Uu+ycTaluUFaXVewTs/+lWO
         6rUcE+m/HGk5+SQeiPMcI8M3FBU0Cldu9pxhw1ULKlASdQ0bkHANGEmJfdKhJO6a+1hu
         5v6Zf+AZ/JLmbHsuRqzezd0jKUsrVtaV/f8XYqpaB1eznltGfWevnhu6uhfpxt5AoTij
         2zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711696; x=1735316496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8tvjSHvBnYEUrXXehqqoug7u5Rbl1jMwLkYtbBCoO8=;
        b=lcuX2tfKThquN4RxetD1tqLu0uRlXqJZCPt5/2An8zDUQMYgm1A6d9soX+9SNqQ5NJ
         GKhEFfU7RJrRHGr62dOXkV4AcgVNPvfiXFZHs5cTUmnCcIYE57uszB70HXNrKJgwIE82
         i+iI3IQXeUH02DiXzIloSKy5cQJP2EVDWNBypPocE9w0tUat98Ddr2Gq7NoE9HOSAPDa
         gxz7J8OT8PyshDDoZA+JDmjlxN76ZMWTk9cV08fuNa9iCLuMvxY+mYkLZLC4K0179jic
         IFYdAgB3oCErnmfqH53q0PoQw0/DnjLLldhcn8GYkgqYvN49Ns5R8rSm+5JC0BrSri0r
         ViLg==
X-Forwarded-Encrypted: i=1; AJvYcCW8eInDlieSRRXTgTXO93F5QEcQv4By1H5zUApsTXYBpEYxAed09cfzf6DqW/K8Ov9Jky3BPsDeugf94w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWOxu2KQghp8hulcJ51DgpkEQN69FW5ZLOf7dl+qmjP+q3aXl
	QhQ7I5LSkr5f5gLpYQtyT+OwAwOhFAxpvKp4QqIrSYQCDksTWz/CMcr1JQShFh4=
X-Gm-Gg: ASbGncts4nu5hyTSJ7nKqRcGpgAygSELkqugYwYFVDZOWmfJVxxkbY+0bJVXiTYgIig
	MeHaSz+AJYeKuJJSXBoFnpQWrJxl1h7KoI8Nz0I1ryL078+jiK6iUkuR5/pIOCrqNrIheyxItdA
	oqkCMQWPnPY4akqxjfJknMj4LFZPr/q1qGz8aktXTQOTHAv0YHfLziqThomL0kLqsW/gofG+2o9
	ZXky3IhhShzU75YW7vKGaxf8h9uiy2pYQCa+aMVCv4ZIFsC
X-Google-Smtp-Source: AGHT+IEVPW76VkTXU2nIJfPsd/7W6ZLfDVF9Rnt4kJTE9CYOpNt7uO369Z3pkgOqLTDRQ8mK233MkA==
X-Received: by 2002:a05:600c:1ca7:b0:434:fe3c:c67c with SMTP id 5b1f17b1804b1-43668b5e201mr28263535e9.26.1734711696100;
        Fri, 20 Dec 2024 08:21:36 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:35 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:13 +0000
Subject: [PATCH 2/7] docs: uapi: media: Document Raspberry Pi NV12 column
 format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-2-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The Raspberry Pi HEVC decoder uses a tiled format based on
columns for 8 and 10 bit YUV images, so document them as
NV12MT_COL128 and NV12MT_10_COL128.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index b788f6933855..90414491d7b5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+NV12MT_COL128 and NV12MT_10_COL128
+----------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr.
+
+NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit values are
+packed into a 32bit word. A 128 byte wide column therefore holds 96 samples
+(either Y or interleaved CrCb). That effectively makes it 6 values in a 64 bit
+word for the CbCr plane, as the values always go in pairs.
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


