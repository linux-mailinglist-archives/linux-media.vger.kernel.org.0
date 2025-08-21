Return-Path: <linux-media+bounces-40524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC9B2EEFA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DEE3AB09B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94ECD27EFF1;
	Thu, 21 Aug 2025 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hcOblnxD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2D22B5AC
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759700; cv=none; b=HmaBo8m5stw3iQhpc8RXvdkz3DRdKNr1EXzda6fHk0rC2zVsAhMZtv2X1IChm0HwKRQ0UIa82dsTDOXJLH8rmE5iQlOuAgFBeLPjFFmWS/X/SM9LE/44mfdcfoPeZvPNUsjiaHkczfOqrprTUP0in+y4vNAOtLpXe2Szc+/s7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759700; c=relaxed/simple;
	bh=xAbwWeBBjg9N+cdieYDjYzALaVmrwO5vpPTMIUPytzk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TfMOxdacb6qYMq6usbKQ7dsB539WwUrCuNmLO8NVpmQxaD/x4hO7TzSKHCMkSXnQdJ2Nifb8AaPL2VIqJzciDWUJeQy+2rFKl9cxUQpZCNG//WIBmiVwNME4GKiH4ySfysnVWayVoMVfMqq3bn5W3S9kcaIY7Y7ivxwl3wl8uTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hcOblnxD; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1ad21752so2500335e9.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755759694; x=1756364494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIUE2PmBqOrrYO7GAV3V+fHhCJGdLaC9xCv0zLUGcNE=;
        b=hcOblnxDNap8aX9N5LLgAqTZZ/cNLjESpPbIG4uCd+JkcOHVsKsvPAs/C6Hj/rhxCr
         UWN6ibRxIhMkVLyz5ewTVRa6PRM5xy7esS0qeaEspX6jII+Yq7QQLAlBhVm4rwIgLUBN
         A2VkYa4mTt79NKa8/fx8G1NPSUMiCTvl8M6BWNLm/ZAwRvQu3D1yQBsxvFCKnYiiWVKF
         PBTNjPxX/edQt26xGii0csEdCL9JlggABmWJdcwA8zUhDcKPZnYZMdRlBvBKVWMcpsjl
         mZTjD9nu1nC5Z8bFE4P3v+Bn5PVAUA27MvaN7CDTvQBjVebJZFgFS+odiTaJxVaFMafX
         UmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759694; x=1756364494;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIUE2PmBqOrrYO7GAV3V+fHhCJGdLaC9xCv0zLUGcNE=;
        b=QOW412zeOXMFImomVeTf/hfh0WBf5cKcI+BK94cQ/vIzolngEIPSTf56LpVerAYgWg
         QBNcfQvzREWJgueI1A/qMNOAg3LvifL03En0eJBs8TUrBWhC2grh4z3Ww0YIfPlPAp1e
         A6PlPE+6xmNooR3b/Orsjo8wwUc46LT4RoVYEr4ocU4C4AfHXwoPfyCdDlBXOAWFYxMd
         WSMHRhONs53xwDWc2KF7fOLCxR4C4o/T5X7J4Qs34sUW3t8bO6ee21tsN4KQzM3qCN+F
         ipqMlFgFCF30KpzTNwrPsnrWNFHtUA1N4YTENRvJCw7xl0/n7DQUPn3K/XXKNib7kdge
         PyLg==
X-Forwarded-Encrypted: i=1; AJvYcCU+kdbOhrK8TzUYVIGxUb63cZq20Z38qzzHZ1bskeOMZ4lZwuHCsGBRZpZghn1X4e/cCrPgtbyxmjdoog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFWgRa2celUJUWXHiTuVG3jf6brvj5UMGtcckQIU6Zz2w/frhl
	dqlxXFN6VtW93uTZKugc5c8rw/0GKGCyNc8CsQd2iaZ3AT9xy6gH0TdTvuVIL7WnTz6VstUMJ15
	GgPCGmugLQg==
X-Google-Smtp-Source: AGHT+IGlH2xw1DoBwNhaE0zN8l2SvWcW/Lug5/2eb+mUXE7rWPWReBJndxbSGekbGMY8ZvWt/3V02e08ioCL
X-Received: from wmbee17.prod.google.com ([2002:a05:600c:6411:b0:459:6a64:4582])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0d2:20b0:459:dd1d:2ee0
 with SMTP id 5b1f17b1804b1-45b4d70e0f1mr6209805e9.0.1755759694320; Thu, 21
 Aug 2025 00:01:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 07:01:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821070130.2581766-1-abarnas@google.com>
Subject: [PATCH v2 1/3] staging: media: atomisp: Remove unnecessary inline
 declaration in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get rid of gdc_reg_store() forward declaration because it brings no value

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/gdc.c        | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8bb78b4d7c677..bfda3cd13306e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -11,13 +11,11 @@
=20
 #include "assert_support.h"
=20
-/*
- * Local function declarations
- */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value);
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg=
,
+				 const hrt_data value)
+{
+	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
+}
=20
 #ifndef __INLINE_GDC__
 #include "gdc_private.h"
@@ -92,15 +90,3 @@ int gdc_get_unity(
 	(void)ID;
 	return (int)(1UL << HRT_GDC_FRAC_BITS);
 }
-
-/*
- * Local function implementations
- */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
-{
-	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
-}
--=20
2.51.0.rc2.233.g662b1ed5c5-goog


