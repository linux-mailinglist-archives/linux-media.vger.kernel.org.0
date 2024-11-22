Return-Path: <linux-media+bounces-21807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 563389D5C5E
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8F41F224E8
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42381DF251;
	Fri, 22 Nov 2024 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fGHAPEzL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07271DEFC7
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268910; cv=none; b=txHq90HF+Ep/3cx5bsQFNCMxC6OWwaByI/gORxwMaoEZk/T++NNEHJz28hjK1vilEL40kcKRcfZBAWFfF/Ul/Ayj8z1F5Gjqrwq0wsfIKCEeuOp6P/SlI/RHXTGvumNKHeiy15JvlQT+kVAdHkd33nlU0bI2M8QH3PXoIku5D/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268910; c=relaxed/simple;
	bh=4cTEN9eOVpTN9Nyc7Cl2/7/R18o2ZkyvA49rT4c3S24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmWH0NEy/9LfAJvsRgpEB1IlxUpp33SjLh/Rl+q+pbK/DDoN9q0gK4fxXxCZRTYaz1kffzKieybLZtqW/bb8OizVxho1uNbDUvsh8ReumhpnSfi414hOKSprgy8ZogsD2qgXn5ibQr3otbmsWyoRfLvGqAoAsFbtns6Qc4GTNh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fGHAPEzL; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4a484e9d537so217570137.1
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268908; x=1732873708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/QkgKOmc9/c2cCjRI19/30uaM7Ny2Es4XuDA0KGTSM=;
        b=fGHAPEzLf/8i13EPFHoTmj473H/jY0wXpMLEXQ6qPP1kqgSowGlK9ov9Xz2q43SUc0
         hdNUQlHFpKUT9LcEoTIKnuN8ChpDpvRqYyzLvRvpm3xCgIwVn9hu5TOl7KiBhusTzigt
         fVIawulg6IUZGsEB0W2zeJKG6vb7bcKkAXDp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268908; x=1732873708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/QkgKOmc9/c2cCjRI19/30uaM7Ny2Es4XuDA0KGTSM=;
        b=sIOnIE4qdnGIqAgXkNZbbIhc/NjenH2eYocPjXujPZMqNcyxGUOPbjHN8mcbTnDHBF
         TFpI9pAk/nNvVxLF5vl5t6GMt9p3CPku/2I698o5VW2jUy94EHJNgX7he5yII02yi59x
         Hzq2Z6/oF+Xe5DwFpl2HE1CwyxArSj8jzv1rYqX1vsKaihkcfohyPLffzoG94Cnpmqhr
         Q8QBHNJMWxRqryRba/RYAmHrbwFzSDXBlxKj2+wd+Hu0UbMRt0LU58gN+nFGtJMS4cj+
         EPH0NM7rcN2c3H0v+RxZDs3PQU4iWbNH4r7J/5aWegQ7n41cuLDId2SH/VJu17hwyeq3
         F3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWdFkQGbJWYuM7fRwhzUf8sAsS4eNXwRKsjKGbvAL0f/PjCoSNcRq68nXqurwGZrLJDkz3l8Ie7GtKavA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3GU/LFC9e3gp86ePXSBcEhW1D6lOVpYxIp3uFkG5GJ8m3Jc2
	/aKabuIuKIClcFUy5WojVukRJt0Eln6nWi/QcJxvqRt2dbYlKPvSziPqmAaM6A==
X-Gm-Gg: ASbGncsWEsJ3oiCPJmCwwli4sdNebZqUPT5jkNSfKBygZTuM4dL4fSlujLrKOLR3tdn
	9sJ9GWawoU++9E7Da3CxyDbjipu17nRHK/r5DaqyuKRBF1YqoSTMb91FVsNCNbx/ffRWBFX2mlx
	uFrvx50v0J1XvP2HS26tS1saoFyp+R6syme4QIiqpU0qmnCDysrDw7RKlgh5rUflKpTa+BS815T
	kRvI72rqTvOySLS9HB2zNhq5I8zheLFQ7KcwYgMc/Pseeeqe6wkdXKut7kwMiyJUYTB3gT1Pxae
	Cy1W6fBto5w/qjT0vVYusX27
X-Google-Smtp-Source: AGHT+IFUbTeZHYJsenOKlTvdD0U5qrkMPADbncarGrIZ0AbdaxBfQXQNtKr0lRUxMa4p5cx4/MlDgA==
X-Received: by 2002:a05:6102:374c:b0:4aa:fafa:e100 with SMTP id ada2fe7eead31-4addcecef0fmr2390924137.26.1732268907770;
        Fri, 22 Nov 2024 01:48:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:48:03 +0000
Subject: [PATCH v2 6/7] ACPI: bus: implement acpi_device_hid when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-6-bba65856e9ff@chromium.org>
References: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
In-Reply-To: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Provide an implementation of acpi_device_hid that can be used when
CONFIG_ACPI is not set.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 57298c7cfb5d..cb1b38245f15 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,8 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+#define acpi_device_hid(device) ""
+
 #define acpi_get_physical_device_location(handle, pld) (AE_ERROR)
 
 #define for_each_acpi_consumer_dev(supplier, consumer)			\

-- 
2.47.0.371.ga323438b13-goog


