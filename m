Return-Path: <linux-media+bounces-23096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE679EBA73
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B191889074
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16922ACCA;
	Tue, 10 Dec 2024 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f2U1IB2M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187722A1E9
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860586; cv=none; b=MQViqYNHo+e+b4XtXQmC4rfFjafk+sZopWoCkXamLOAG499kQqIsM/Mp1rQM0SH0Y7vVLyj10LeX5O/03jrZzSUYdWDlPO4YUud5bGlKviXMu/OLZPhGQTe+VMZESvV9yGPS8D+N3o/Wd03JVmSIGQKpevLS4FNAttPfYuld1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860586; c=relaxed/simple;
	bh=YpVt1IJK5kIz3EzNG0TljucOUwJ/2fX8gxiI1v679o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=paKLQ9vWEReSw0lioUWpbZnYEszgDHChfLVNLYhSQ1mT08ZA1X6c8QMoID0MoRiLSw+5yjx9fKDIgNslGpdTAxQsy6Y5cuALTuD6zt1bgOb8eYfiwPvtVXJGAgvZzYyNl+Mp470XX60z4bxvysyRdglmQhaApGGtMIVoxpmMCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f2U1IB2M; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1296479137.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860584; x=1734465384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wo4Brw2DCcVsJ26CFqfG+Q/anJpN5TVrr8Upgev/TjM=;
        b=f2U1IB2MM4pHGi6h3UpxH8PSKZ6clBOZPiOblYq05btEOJIzc9916Snj4+Jp3OQrHc
         UbvDG3LfFc3Z0BRlooNqPPrd4cnYfDF0JLbzINax0Rxoefm2NTjD8j7ZpsZLAoOOXaJd
         dfX8rHqUmXbJYJfP4XmDlydxxCMXboiPEZPAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860584; x=1734465384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wo4Brw2DCcVsJ26CFqfG+Q/anJpN5TVrr8Upgev/TjM=;
        b=O/KSJru0+Dx007SJ8IUjTq2s7wpwqQNCXoAJvzXsbBFUivnwnJUXDYOyuhyAjAOQK7
         CBTsWJa3ACd7+wmlNwDbqtvt4yjTyZn1ojSHHLY/alJRZ+qNr7gI2JytjRNT901/bT5O
         VisX1ondVFRgcqcihJ0dMwE6r4FwJnK0nPoyfrS2vzKe+R+4xOngMkh/CzDHMHSiqpB7
         04ettlyQ1sEacrqCJ9DNX3jTpDg8VuBcNYp4ZUcu51Ss4PiWom8+B8Ud30MEDv73js99
         ZAHFvc3tYWlXMulW+ae3m7yW4BspX/Bi6Dgw3uD0MOwOZnbyQxy8E6AsHxO4nfbOMf1T
         kTWg==
X-Forwarded-Encrypted: i=1; AJvYcCU013BHw161dJIeWLwO6CWNF8bTlfvJUGu3EUaqJIVFlbvOx3CKzw2SONN9cjgf7qsGAr/r8tGzW+4u+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBySy4Av6Vov5NpKHM4jKb79031QxIxXrbJqCCgq+KsMVPne+Y
	4kGgLQRGSw29KzaX7vdezknPVB5y7m4bkcPcs43Z7fe327ROvof23oLtJX01yg==
X-Gm-Gg: ASbGncsUEs5PaAJ//J6WNO2AzVM31Zctd+7VH1RXpjH/qU/U2xVbz97pvJeLQ/Yl4kI
	SjoHjOssrlYFcBiJCirNTB/g4UrnHkaY13XsKjS56S2+TyIM3wH8I9IKJ1PgWh9r3mHq0XFs46n
	31n8O34YMyW8qILHL9x9r5CrslOtzEUvgdEjBwEsw7U8KH2LJv5FibZ1mer7tv67/1mTmLbDo9e
	b8W9wViONmiF95pR/EF5ZDGKRBthpOD/u3qCnSJcajYp/KFTz1LZDuvTbOYbSOajufnIVqviuih
	qhBKlpvX214m5gMuNyMXH0K1BZst
X-Google-Smtp-Source: AGHT+IEmzXYFoUfqOj/dIppTnK2q1X3UMKlfoOVpixdTmMHqeSiokiuDcOibXmJMwEkU4cB2noY0sQ==
X-Received: by 2002:a05:6102:5092:b0:4af:bef2:c8df with SMTP id ada2fe7eead31-4b1290d6f1fmr862642137.17.1733860584010;
        Tue, 10 Dec 2024 11:56:24 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 19:56:03 +0000
Subject: [PATCH v3 6/7] ACPI: bus: implement acpi_device_hid when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-fix-ipu-v3-6-00e409c84a6c@chromium.org>
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

Provide an implementation of acpi_device_hid that can be used when
CONFIG_ACPI is not set.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 4f1b3a6f107b..c25914a152ee 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,11 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+static inline const char *acpi_device_hid(struct acpi_device *device)
+{
+	return "";
+}
+
 static inline acpi_status
 acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld)
 {

-- 
2.47.0.338.g60cca15819-goog


