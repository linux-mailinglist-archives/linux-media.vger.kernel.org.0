Return-Path: <linux-media+bounces-50434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93973D11DC1
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CACBE301C553
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A50D322755;
	Mon, 12 Jan 2026 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIGqB3Pn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916B2C326B
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213554; cv=none; b=mA7ZJslOUdJzXJ/khfjHZv5ZZZJFKRDqkWLXZe3E+JhEd98XxIHKvBk6TYtxnBs3LkdjDQGdRf2abYibBBK3Lp/SFhNd0Mri4CsRGMoi3EkkAvlHoNlPa07AZuEEiUNJQWlF3IqjlB248Z42kN0w0UgGsG+uhNn6uJiNE9pA9Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213554; c=relaxed/simple;
	bh=PJx7gLECZfGoQUEAbir4VvGcautoUDwg8jjI3a9WZrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mFlZYURhEL701WedkzZOaZ1gK0U5a05qNsbp+psD/TWhaRsRxBEkupCEFbYLQqIub5ZbeG08XPQkT6oet5jZeGjDvk52tg518Nd40keEWVR7KM7V/TntcnwnGZOJnTNrHQZJgbEh7dfZ3goh5McAI56l1jyKzpDfiklP7qPL4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIGqB3Pn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so5289092a91.0
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213552; x=1768818352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niQSiXKdR4fdfoXszCLE/IXTXWyTZ5Jsk+GKPgjv7KA=;
        b=GIGqB3Pnu3kioK9yaPgtTi89z/itA9ui/dyVFxZVnZayTaELfjXO3TDvncuy+F0u9o
         Pn5xQkk9giwhd2mQv91D4Ob+h2S5ngLJvPAopAzQI+QgAw95TV81NYknLBJ+ajlXcBWv
         dXnJ6ukuSijgMj9RtFSRM9tq+l+BSipYD4+/nFmZinS/uPb06Ccjk7mmEn/lEihzHLor
         BbfaDS1esC/fmf/zeNfMQx7POTXSFH5akR4XYi6t+o6C91EsfEELYnql5170gtrlpj1s
         MvA1YYfi/QtFFIhKMtujXFgCEEr/7SzwKeor/LlfuMOGwtNk0AXjufGq+HRicz7R+C/S
         DeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213552; x=1768818352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niQSiXKdR4fdfoXszCLE/IXTXWyTZ5Jsk+GKPgjv7KA=;
        b=j3XKuX8vGlUlUXrPUnL8RzlOMpcumJrVS4ECnP03NkyiDiamb/S4YdqUKYlVMPkO6I
         5TAU2DcEZQRXGF8fTgiJ8rADavKqARxNnpZTd7SiyceHQHf2d/UEpgyboezV+FKuelcO
         XNfh8GIWpj18zj+qw0mRfWzEojfU4UdfNlWZeqMuaHl92BkSLKgOAJJr6HR1Knmgbsaq
         qrYmC1rIb30reWkM7bfmAsTabmb8Cd8dzmzmm7Tq0ecoYrubHqry+K8Da+kn7Gb1togU
         SywoQjIG+dWx9qGpIlP4iCvGREpKgxzbHyF55p5Sv7J85KtOTO7KvmxiiKFgl9HECePE
         JY0w==
X-Forwarded-Encrypted: i=1; AJvYcCVAm6kvLx/2cFdUkMriOpXIA/g4QlCfKHjb3gbQeimBByOeOSNdhP7l7I6OfVGmUcH36Sclo6YLDNy67g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVpv+7BhldVyylf/pWAvQE8NkyFw9ujL5HObeWOtA1ezap42W
	jC7dzPPv0jnHEbd+nK0f0nNjkwHVGKL2yaMlsboyB++rXtk99Z8axxvU
X-Gm-Gg: AY/fxX5/Nr6dfWcPsgitIEtpB13ZIO81nDOSkfjqn4NN3nyU656A3vHmRy2RHbUaO9Z
	W15NbL0KFnVwoamDhPSN5hR6ZQPUlkAKCaXDH/FaKKyZuFmINeHpYHDdFWG9OxqkSnBkdfMiETR
	zRe2jmAAZ9dQJhZd1XAYufX2yL7hai2pPL3zt6VVTFYDTeLdHtTSOO7OCpxEUzLYK8kmN5U0yO2
	tGePsDTKAxfTAzEYPUemptJESHOOFr9V0YyV6vUTD3uuSm8+s0Fh7DLYcfm48y8wKGTlAvvgrPI
	wakNwEatIdBbyRE5aEszV+miNs9Q40fOJun6kMoudHutHTMlGfjj+VeHKAHta2rkM6KcdTSWigo
	Plqo0o9bdZ4RJ6/VV16UdXlba/Y0uXdY9S4nIXkPkqIRaWXjTN77Jz8qXBv0TD8+KE9p4ouGakM
	N/VgY9WSrSljwZV9Cv718qOeAZVNYlKA==
X-Google-Smtp-Source: AGHT+IGN7s66GEG1FcM7dQWqyL2GztVWb2iAOg1IHVCwTH5nKJ6tLkigTpOSzwTx2WnkzILzaODU5g==
X-Received: by 2002:a17:90b:4f92:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-34f68d3b229mr16537095a91.36.1768213552042;
        Mon, 12 Jan 2026 02:25:52 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78f71sm16804705a91.1.2026.01.12.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:25:51 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey Kadati <karthikey3608@gmail.com>,
	Unix Antigravity <unix.antigravity@test.com>
Subject: [PATCH 4/4] staging: atomisp: Replace ia_css_region with v4l2_rect
Date: Mon, 12 Jan 2026 15:55:18 +0530
Message-ID: <20260112102518.19926-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom struct ia_css_region with standard struct v4l2_rect

to align with V4L2 API.

Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 5c21a5415..7cfb355c8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -18,6 +18,7 @@
 #include <type_support.h>
 
 #include "ia_css_frac.h"
+#include <linux/videodev2.h>
 
 #include "isp/kernels/aa/aa_2/ia_css_aa2_types.h"
 #include "isp/kernels/anr/anr_1.0/ia_css_anr_types.h"
@@ -430,12 +431,10 @@ struct ia_css_point {
 /**
  * This specifies the region
  */
-struct ia_css_region {
-	s32 left; /** Starting point coordinates for the region */
-	s32 top;
-	s32 width; /** Region resolution */
-	s32 height;
-};
+/**
+ * This specifies the region
+ */
+/* struct v4l2_rect has been replaced by struct v4l2_rect */
 
 /**
  * Digital zoom:
@@ -444,7 +443,7 @@ struct ia_css_region {
  * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
  * factor will be 64/x.
  * Setting dx or dy to 0 disables digital zoom for that direction.
- * New API change for Digital zoom:(added struct ia_css_region zoom_region)
+ * New API change for Digital zoom:(added struct v4l2_rect zoom_region)
  * zoom_region specifies the origin of the zoom region and width and
  * height of that region.
  * origin : This is the coordinate (x,y) within the effective input resolution
@@ -457,7 +456,7 @@ struct ia_css_region {
 struct ia_css_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct ia_css_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
-- 
2.43.0


