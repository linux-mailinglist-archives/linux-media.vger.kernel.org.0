Return-Path: <linux-media+bounces-21805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5E29D5C58
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780231F22553
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4BD1DEFCF;
	Fri, 22 Nov 2024 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Swx+cqMp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF91DE8BD
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268908; cv=none; b=jmJFm6bVT2RbnLUtHteOCq+VahsWaxKmEbBkKIO4OfXVTAESkdFL+1sSPGwWLI2Qq9iyk8OVzSiFT9wZ3T0xnBWK/cw+vtFDap3C+mk89WzwJNED3vgV9QFFCd0IDWA0c32jB254TM8vIkUrTvGULm/3yPPP8S53b1BRN4zAhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268908; c=relaxed/simple;
	bh=BYuLHzueav0sdSprQfzk88q4Y6f26g51RU20Q1WXi6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLM+ED/nBYTeCNWasWZ56BMjAK7QWn4GQDLSyr4Fcr7XQBeDyEG8b6b+cNdaulGfaPGVP8B8MNCRy/a8b0YYiZGdS7paZqi6r6/68wdtexA7UsrFWT3IS6zkQgY3R+BXNk3AzReitL791t/1+SfkOVZrAfCTcrRnSSFxTyKUByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Swx+cqMp; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4609beb631aso11971921cf.2
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268905; x=1732873705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Acc8f5vjpjnUsttSTKqKG5ha9p9/8KASrkXH0sEj3iU=;
        b=Swx+cqMprFgLvaSl+WDnFWbXqyPb1COCP+tO98Oly3pcw1UZozCkYWVS6Lm4HkTodX
         olgFILbOfld5/PZpesnWfV6rDfOJh/U5TXIqY38hNUR2xA9Ev7fMhIwvbgzhkSYZF0dd
         0BrfQbG/NtOPfLf/s4ibj1f1jTKgBMEotrx6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268905; x=1732873705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Acc8f5vjpjnUsttSTKqKG5ha9p9/8KASrkXH0sEj3iU=;
        b=pZ/pIUsYQJwfG//jPRb3FwFfG3gLoJeZ/HFYJqLi1B8bIjmBjyPUTfZGU7cgERhXvZ
         zTEkuU45DeRPuZPmNKNUc9cnjwjVztR9Jwcl4JmaSxlDA/qqYYiFtazcWiPtnKcqe0Op
         4mMCBrZ2yRFGRda1zE/3TTqCxLmCNG5TzvgoNISckeapgBIRHjf4GzsCocUK7617OJQd
         hqoHoF8jX+pCLdEodNUkdB+cInZiA0nopJ1skF9xJzFuq5K99k/szFUybnYlSwsZO4Bs
         wKBXV4SxphvvPIJzBr9N7Bc3R1rd1g3k2FwTiS5cpy7VAwsG3o2k54aSJSJZIUANrnLe
         5p6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAhLMFSsgICDdpTSCeaju/8IGL/Rk7UFYrmuEFG+sZIKMJYM3y8ujacvLkzEyiYbT4nQ2DVZR4hZDu0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUCnrYmWuT04K3xVTHIOYeR1/ixRNEiAsjg+3Q02GOoKJAssFR
	tl0jH2dNoecHGL/dfW7r9zJpwazMFK7vRReSctXc87GjQOxI7tl1xq8jFZ2rzA==
X-Gm-Gg: ASbGncsSG+dJQBTdg3/ap8qBpF1UAjDp5WrgK7KeV6EyCQM+ZXK4aFdCfQfu/tcrRAY
	g8oZRTKn7lKAeg1RbbHx152iPPYaxKUmOeh1mTp3gzS7gnrWp4QPdKgO7iOEFw7cup7GxvcZZ6b
	jkCQjmRk2ZC9ylBEDttG2OzQQSV//AebeM59Y4J7UCpP5iz7aSYYmg1559SQrvLtUCJ8bxU5mG7
	RvHEwVYUh2cMZAXqAboyMFA2cYKXI9WrLa5AlKAsjTJuI204HTY9lz7Ks/iouv+Hkaw7MqY+c8K
	63MalZEZQoRADBxJIYh+Jvj8
X-Google-Smtp-Source: AGHT+IECFL9WoKiDiu1xKptVQF2T2gvsl28cr0HW2a0s9qqj6Aj7Q+ZZVLocd/R1cde01FoPlwJaWg==
X-Received: by 2002:a05:622a:1ba9:b0:464:889f:a413 with SMTP id d75a77b69052e-4653d5344f9mr24237121cf.6.1732268904929;
        Fri, 22 Nov 2024 01:48:24 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:48:01 +0000
Subject: [PATCH v2 4/7] ACPI: header: implement acpi_device_handle when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-4-bba65856e9ff@chromium.org>
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

Provide an implementation of acpi_device_handle that can be used when
CONFIG_ACPI is not set.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/acpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d5ee84c468b..85d7649ac17d 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -777,6 +777,7 @@ const char *acpi_get_subsystem_id(acpi_handle handle);
 
 #define acpi_disabled 1
 
+#define acpi_device_handle(adev)	(NULL)
 #define ACPI_COMPANION(dev)		(NULL)
 #define ACPI_COMPANION_SET(dev, adev)	do { } while (0)
 #define ACPI_HANDLE(dev)		(NULL)

-- 
2.47.0.371.ga323438b13-goog


