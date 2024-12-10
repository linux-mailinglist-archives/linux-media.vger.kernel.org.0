Return-Path: <linux-media+bounces-23094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9059EBA6D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F636283BD6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E363228C9A;
	Tue, 10 Dec 2024 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eS0bQQSR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B5228C98
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860581; cv=none; b=tfwU6Q8FewZpR6tX7ZGblepH52zhYxYXGLWgOPxOdBwch/VDkLv/+UGfNp9Rf3ueYLF5tcfppkN22YF7l++mzQCy9f4vJt3oMrPb2XGbL4FvsvgBFF8wZpVYtoQ8t+eANrRIxPXc8laS8E8eHW0ufP5FB9karkBeGpCPZAptE3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860581; c=relaxed/simple;
	bh=oQ6DOmEDhAhaC7ko0Me30Rr/Q1eMZQPunpUP2qNklrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZi14iLKICMI6VPOVXY8kRT6cZ27S+k3NfGJH4sT4AjQAPLJ65TaP69U8rxvIVPbGCdYEwYH6R8KgNGW0qDU5JQbWooTMocTEZIJtRc7M2xacUA49pPYUt6SqsgRea+mmiLciu/hqT35Vyc2XNC5yH8N/t0lhGIsvfkMAF5w8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eS0bQQSR; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5162571e761so902897e0c.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860579; x=1734465379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lezNY8dR9ljfu1iEN3ZQdA0hj9drLp6T4ntvpJiXGhM=;
        b=eS0bQQSRKOkRTg1R00Lzul3TSSpu/eJPD7952BfrCPISozqKj5oTrH2z+ycumAO7P2
         aqMeIYtSUBs9+yuennfm1GB1PlaEgI6Lvc0xLC6rU8Vc+wEEuIKK5bNUBtqUmCbogqVG
         KMc46btlPwz1ne0c0cRg0s/yOEeBRJApCUoHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860579; x=1734465379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lezNY8dR9ljfu1iEN3ZQdA0hj9drLp6T4ntvpJiXGhM=;
        b=nX7Ulv/6UcFgzdQOdTldu1SUSSP+7JIfGzJWMInTvb+6K9c5keyhQlWIHWPPQIdWTH
         AqAIM9B/hP6s9ooKlDwN+zzj1w46/5Q8yZRgq7/M2Bz4FZEXOLzP+Uqx4Gwl2gMi+qaT
         U9lG1fcTlNRejkjeKUEBPI1BZxQ0jFWdmRCCEqQlKzHe0DEfkL1DA86u03RrtNmdfc/z
         02ZJJCFYq70k4Ot7x+Z7CiQsaQwbc2i0W85a/u4SUU5YqJVRMJjxCuNWnAN+M5p/S4Uz
         oTmIAYJ8yweNpHWXRTbe+Lp/bhUUBC51bEpYL4wGn+O/e54aEk51LfhjoSvt6ncH9qzG
         tduQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbZLRtXRYiTR4IuVKy9urxqV+LevCNl+lUcEqnnaLkz5eHQcRcvT8AVLWe8aObpysI2VLOU8Pk4mCPFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxggiJJq/3MX2vOtJwh4y2PzTYxBKXp/rhZu2Ypc25ss70xAyiC
	IVsBm3B5RG22ahXcwOFV+Jw+YW5wIBH6gGecIuYSnTbm6squLNZNIXQSebMHPA==
X-Gm-Gg: ASbGncsIgRFD72u+XSwCUnn31PN+QAyURUxn+Hc/4IFs5/xiPukcz7OKpHCW3Qp7U7f
	Gx++WrLSuplaFss+fAJ0R5DX3kPJEFgySoA8NkodA00LCdWg4GRA/qT+J8geTqmp/SI98A0w5p0
	03pT7fpwJQrQHU0Wctg8B/1SkUFK53kdwu7ZRpGw8rK93m13QkyABZM8oPgLhiSe9m+JmTNt1mc
	xwefq9T1hgdr0PwcDnENiHqNWd1kotRhyYLTizzbxlLE6tuDjwwT6Y5rpY9w3XAh+Jwyv0dgsrf
	3+1Q+1+VHPmK4BfkOTqhRapSe9Zf
X-Google-Smtp-Source: AGHT+IEMhYnLWvQoSWZmZsMGZeYTR3YN9TLWCv16La+76YSYWE5jDBmdmVAao50oTu5BwjDFJ7Yo7w==
X-Received: by 2002:a05:6122:1d8b:b0:515:c769:9d32 with SMTP id 71dfb90a1353d-518a3a34d65mr938780e0c.4.1733860579349;
        Tue, 10 Dec 2024 11:56:19 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:18 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 19:56:01 +0000
Subject: [PATCH v3 4/7] ACPI: header: implement acpi_device_handle when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-fix-ipu-v3-4-00e409c84a6c@chromium.org>
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

Provide an implementation of acpi_device_handle that can be used when
CONFIG_ACPI is not set.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/acpi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 05f39fbfa485..59a5d110ff54 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -787,6 +787,12 @@ const char *acpi_get_subsystem_id(acpi_handle handle);
 #define acpi_dev_hid_uid_match(adev, hid2, uid2)	(adev && false)
 
 struct fwnode_handle;
+struct acpi_device;
+
+static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
+{
+	return NULL;
+}
 
 static inline bool acpi_dev_found(const char *hid)
 {

-- 
2.47.0.338.g60cca15819-goog


