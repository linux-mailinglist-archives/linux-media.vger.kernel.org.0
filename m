Return-Path: <linux-media+bounces-23508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D59F3CB0
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12806188E544
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B1E1DDA17;
	Mon, 16 Dec 2024 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ck7Az4yN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E4B1DAC93
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383854; cv=none; b=KSH7f+pXv+0FcyRb8b7tIViQzUsiS5CAGdNhXPqU8bEk8Q6zM32aCuIIkVLFC8BVMyQoJF4drBCCQeGnU2VaM/OLH7+gTup/vczceAYGEQ/2rS26CI+KRCBzO2qepN4+z3AQO3WFiz5D0+KlO/FQHIeeqJUbQW5L6hM566Owuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383854; c=relaxed/simple;
	bh=Juo2ve3rrjlu9oDP30UIZmhGa+flQbphR9swoQR5GS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9PzAOjVLkjN/70i6/MW6aJCQF3k2+wvGF+rikekl8xV7qvdww4cx8CZzBM/qmeeU2lAufgwkihUzgH7Yq9SFb0AGOYMxbNsuxOtjgQRaVHHCdsXqx7EUagcyKJ+pTs9sP7MmNcuPv8BYNO4VW4Hzj55drn+w7pCZigDeV10Tr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ck7Az4yN; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467b086e0easo16651941cf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383851; x=1734988651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdfI8iMG82M8irlFSVYMbWfZvDLPeTNhiZE+t4N6pwc=;
        b=ck7Az4yNU1mMJp66dLdH5at7e8d7WaBtyH4gT39AhwIjPBkPwFHn+a46+0wShnHe0E
         01R+r5E5DBuZ978DazWMFvzEHniQUS19ChznG0DpEQ+h/iSYD4Sxo7Z6lIvtF5O4m4CG
         wwKcjEOI4PvJWeo+vh7MpCNT1cDGbbBNi8BX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383851; x=1734988651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdfI8iMG82M8irlFSVYMbWfZvDLPeTNhiZE+t4N6pwc=;
        b=g80zsExZ2oF27OmLwpqrNRt4mgWSyxEDerGbLz75pr76URUjY51RR6VnhCw0WCDR8/
         uG3yIsvfmHSkGC3aJmbBrFbnqAgivdxXhtptGVVbCwiJfZ4rL6Py0Z8AtyZAvOaLNBsh
         Qi/tnH6tyLVL+UL1X/xvzdEu2acLo0TztcEL3ZV5jdPKpDjpJIO1+Fy3094rrSKSna6H
         GuvD985QyjnyLGgb/Zp/E28sq/dOVrbcnDmOMPhrkj3/TAAw5tMclGGUyevnS3WH6ahg
         cVvD7WFB6bIubXE2Ktblza+dkz8Us3ZOs6dQUx3Vn/9Ztau2mH1Z1WCF4q5s1zKz3XsO
         3CUA==
X-Forwarded-Encrypted: i=1; AJvYcCUewGaaoCRpc7wMFk85BU6R20QoD5QkFPyDXuxhj0KgvYTEWnqu7CYlrnzVG8ENwSE8ArI3FM6jOpAzNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdrl+VCQxEJl1AVtRIb5UdfsrEnTqOwme2x9uih8lPizDLN7Gv
	W7wWMPGYJ6O/hGYh++zp7GTwhGpFxNNNTQY5p9lyA8/U6j0tiFpKrGnxV2j8dWkDbo0E6ND/dJo
	=
X-Gm-Gg: ASbGncsSwCnOGFdUp9EQiXTFRaM79FZuE8Ibhge5J74SlCSdnEXPXNBZRc7OHmQJqxv
	Od9CKg5lTiq+Nvxd/IOjtmVdcZi1EaKtKh5zqRzx7OiN55QOn5wPXMJHSpiaW69XipE2+9MHZ+o
	BZRZuY9U9inWyXXfHSoZMG1NtqNUno6uvbLTXaLV16YxwbEKVjDC/bj8dHkXxim573uSSbjd4fv
	/JOiPj701uUZYdyZ/GT6MW21gZPWYAr0qaU2zoZiGdSEv98zILT03OgJKHJxsDk2CbzrbtEl38c
	z9spVNjOIvrYTTkgGkhuntAIP4ndGGw=
X-Google-Smtp-Source: AGHT+IEl8hUUhzs8PDA9iSUQEkMmOZX53TWYQb+JuoOBexm0lrDkqiD/7RB/yiHbTUvOThs4R816YQ==
X-Received: by 2002:a05:622a:1817:b0:467:53c8:7572 with SMTP id d75a77b69052e-467a5759258mr245947171cf.13.1734383851253;
        Mon, 16 Dec 2024 13:17:31 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:20 +0000
Subject: [PATCH v5 6/7] ACPI: bus: implement acpi_device_hid when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-6-3d6b35ddce7b@chromium.org>
References: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
In-Reply-To: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.13.0

Provide an implementation of acpi_device_hid that can be used when
CONFIG_ACPI is not set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 68c0e2fb029f..aad1a95e6863 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,11 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+static inline const char *acpi_device_hid(struct acpi_device *device)
+{
+	return "";
+}
+
 static inline bool
 acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld)
 {

-- 
2.47.1.613.gc27f4b7a9f-goog


