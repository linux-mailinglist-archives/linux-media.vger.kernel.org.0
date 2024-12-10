Return-Path: <linux-media+bounces-23095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7968C9EBA71
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6587D188909D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F1922A1F9;
	Tue, 10 Dec 2024 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QkvUaSsD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DFC226886
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860585; cv=none; b=oAgIhKmSTRqKNtNhtjNOfg6Fcw6scf6RI7kWAn1GetoH/4OqMmbK036WyeCgk5uYP2naETYM5fs3T96OCEOEecuyJGqLSh/6Dt8PuytUIBePDRVUpUvEUU0vQzrFkGio0LS+PIFYgaWYlJJoTXmmZXtVC9lIVSbB8YHHzKxogx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860585; c=relaxed/simple;
	bh=Whh0DQItzHYKCLXHq+kfFC3x+7+Dk004xdEIyRizvX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OvQrXowBx64K8ej3SEJa8C/1KlYIjkVJWsY5NOlyYWNV37jJTTiPY9pJtgF9U733/1RPlb3fQ6prr7nGPJeUWiR8eu0cXlQ7A7eyIbtcRqBx15vl432nhXVyKpLFRDCISrcLdWSSVWh5uDtKkrvz7A8nvrZSG30KS9DxQ0cf6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QkvUaSsD; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso1854164241.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860581; x=1734465381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8Rm27YENFKXAm/b99nWNPn/wMV7ojkGu352W65SJ+Y=;
        b=QkvUaSsDjiaKz2N0cUsM9qtCGW0xthUakRBDtOZqKdtK4jG2jUqgbMhI3n43H0+YqT
         SmLX0FldveJuUcacSKDYeZBWIv9Bn8zLiSS636aIXDBVJ6aYwpRHADGKx+TJ4vTCF+A3
         WV/WuXdK89/b2l9+3Llaqrz60WkOLXK11QRjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860581; x=1734465381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8Rm27YENFKXAm/b99nWNPn/wMV7ojkGu352W65SJ+Y=;
        b=QTbFTD6Av/z41Y3lTJ1PvrZE90KX7SzD60i3uA/PrRNIuLjrfiG60BWytYYSS+MTlS
         YH3dopplsc0eBS4lhIY9mh7LWw88PePznZ6jSiH7UKS/E/hyl/lEyJTemKVNg562765i
         snm6IXAWbPRqifVffs/XGGAXKofw/E/lzQ8X8X5rk6TyBXVQg028OtiR751FHIhTIist
         m5VT2WsL32uSy6IUN0A2Yre8OlqPoprWt2g45kduf+wLBV6xH0p2lZwgLVAXIYKJX/Jn
         LHdjMThSJzFbO7uhME2lj9MoUMTg5FtVH4VqPZuo+3AqSzoYqoW6iho+8SmwHQ/KEDxG
         DEjg==
X-Forwarded-Encrypted: i=1; AJvYcCVo0dz+4D3kjZH5p23CqdPh3jV6MiCVpcJRnsYBXxp96p9JcSyfQyjmk5LumdX1QLdHIj28aM5QLJc5BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybSsoKS7dsfMdn9rhwlRvS1SzRuzBibMXD+CuXhv2MR5yMeXvR
	v9VAwfd+DO4P9WYngxMAWo5tYsW2QWVBKas0ja458tqNcsbZ98666GrkcIgYzw==
X-Gm-Gg: ASbGnctzLFQF96el+SJTo8+QaddGIICFtJiXsqmNyxBszJ0NBddQ00AZuJ8nBlTFOr/
	sPF6EKH6Hu0mYFTERUaUuKJ4D7TWeTVXXUmxk03FIqlfx5SGLluGs+Wr/+3EXMHCuWhQDmfRjIT
	0w+aVj6aq+lioVRhDwrfQitZX+xSsDd+mp7bCjTn6FPFPcRmLj0gNzI9udr9FRkRzqbHauMTHPw
	rJEk0fEFm+SxTW0JVeig20QbJ0X3O3odpTZP1gDCpHKg96cOk9XJhjGP0ZU7e/6T9BVh003GC++
	vAvkIYEFllMKI4rloplSTSwnQD4w
X-Google-Smtp-Source: AGHT+IEooHxihkgq0sisqhW/5irMfcedK/Z/FIef/F30lACx1FcjAKe1abfF7f/u+XsC/FOi7CtYPg==
X-Received: by 2002:a05:6102:ccb:b0:4af:a925:6b40 with SMTP id ada2fe7eead31-4b12913b260mr760661137.20.1733860581729;
        Tue, 10 Dec 2024 11:56:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 19:56:02 +0000
Subject: [PATCH v3 5/7] ACPI: bus: implement for_each_acpi_consumer_dev
 when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-fix-ipu-v3-5-00e409c84a6c@chromium.org>
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
In-Reply-To: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Provide an implementation of for_each_acpi_consumer_dev that can be use
used when CONFIG_ACPI is not set.

The expression `false && supplier` is used to avoid "variable not used"
warnings.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 520f12155e7f..4f1b3a6f107b 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1009,6 +1009,9 @@ acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld
 	return AE_ERROR;
 }
 
+#define for_each_acpi_consumer_dev(supplier, consumer)			\
+	for (consumer = NULL; false && (supplier);)
+
 #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
 	for (adev = NULL; false && (hid) && (uid) && (hrv);)
 

-- 
2.47.0.338.g60cca15819-goog


