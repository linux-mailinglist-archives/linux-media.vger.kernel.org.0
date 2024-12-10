Return-Path: <linux-media+bounces-23092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293C9EBA67
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBCA81888EEF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05A622837D;
	Tue, 10 Dec 2024 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ws4Sj/MV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6F228365
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860577; cv=none; b=izTOI+bQq6FkGgD4KQX5MAlMtOCwu+HUV13F/5vUsh8v6FCUeZ3KxyY9+ix6NM64GF8oyiRCgS40ym7jPe72nTVQl4uUuiWnRF7um6+IqqihjY7P818Nvmgn6OJ3otH9aEabtk2mXH89zDrLipBc7ZtXeuWM+fc3sgO8Dr/77jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860577; c=relaxed/simple;
	bh=JEumEao6OwtFIq3N27scJvmQPpmiw+AAjw5tpWVO+jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkOIFrAL+LLHzUNhBusnJPgx1tNBMD/kF9o6s8GkhDDkp4Bo0ie8t7bZSVbf3R48MlH+zl49h8njIiTr74vSkgXhdAS2GeI/4nnQNB9A6mdnIqC2vjOhhG1N5OLAySPyLFd7ehG8uHIky2pouybAGQUi0WsrnT7r1FkC3/V0uyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ws4Sj/MV; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff04f17c7so1465279137.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860575; x=1734465375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FC4QnqJ94HTxVX1/4qkFrZziKxV3eN8ciCJ+f2BMLY=;
        b=Ws4Sj/MVvQsDZ4JUz9UwtCUys0nLv5tjhXrxEueNLtG3HUN0QaVVC7sqvLLuf1BLsC
         VRCNlSBoXBWcofxTdC7Lw69wE82O+3lURT/ZrEgdPjOj1lKbKohYLM+VA7GQcazKjctp
         02Aoc3IwuphW2yVTskgPEYHo+iqHeEICVgWEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860575; x=1734465375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FC4QnqJ94HTxVX1/4qkFrZziKxV3eN8ciCJ+f2BMLY=;
        b=V8IxQN3+BYlz0z0UJ6fPzq/Lp2J2SUXf8B9zHwjgNnbD8IlP8Vj6Wr/+YYUMRdQP1q
         /s5T7sYNf98W6zhmGwEA2Y09IxkaXX1irl8UFwdG1KmoilrsErvlGEDceIH2wEIJOrG2
         ZJOLouTNV2u3DAr527NNzqsipQI92xRNkyQ5QWtvulLoOccP3EBND/NeW7CQMyf0Zlk+
         OtUnkA+616CKnVE/2y4ZNh5XPTIND2i7jYB6Qi7g2/f5H+TLyl1mRNGH6jqbHS7qTewn
         tnA9ZzTRbBmV7HUqACnq5+aZFFDJzrUFNZUU05Z2vyUqw4HD1EDLWaagOzc6gwPapvXe
         xrkA==
X-Forwarded-Encrypted: i=1; AJvYcCVKwEWGEbghXkXof6L8s6td6mJmnF5e8xDgVUZhYEI3OsECYiCqQ7kbsj45kFaYIXUQdJs09SNpK6swzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjopZzoR9pElBzC1lTQLvk6q0cc6+zFj1b1SIS1E84ZXSGu+0
	JK6Zx1XTGIhE1YeDdfzCnY/eRZn+nERYdiHKDxuVPZz/diIR24geCNSucrh3HQ==
X-Gm-Gg: ASbGncsNMR9HE1da1GKpPxWCgK6qjdP0N9PGO4QVzKg7060EaZRe79g2eInoJyUQ8Rh
	4B49H0CFglQ5goDnPb7NQh6xjnpqQZ2HWDYlxB5MF8DHeDfAk8fDvzXXehXcxuDKgTbJ+6sNGxI
	37aLYHOPShEDBeEqVDqs5EUM3OEh7/2wPGBCviMw9UqQCBCzV/D0+1c61Zw0+aHunjxjFEkaWii
	AJlEFMus3FO1uXJ6pZc5Rb5fsH+y51sJnw/JFx6tC8wfOIiWAt+IF+p9Wj7CgUcZCWwlpl/fEnI
	jsPQgZB2/FEjly20YiKHMcfSS9O7
X-Google-Smtp-Source: AGHT+IF9huJ4RGbON6vnfjO82QKXcufJ1oPqeqqPWduurqVjnR4pau4FlzjogA7CTu3zPtWKx5FO2A==
X-Received: by 2002:a05:6102:34a:b0:4af:fa96:1ff with SMTP id ada2fe7eead31-4b1ca3daba8mr12220137.6.1733860574875;
        Tue, 10 Dec 2024 11:56:14 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 19:55:59 +0000
Subject: [PATCH v3 2/7] ACPI: bus: implement for_each_acpi_dev_match when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-fix-ipu-v3-2-00e409c84a6c@chromium.org>
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

Provide an implementation of for_each_acpi_dev_match that can be used
when CONFIG_ACPI is not set.

The condition `false && hid && uid && hrv` is used to avoid "variable
not used" warnings.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index b2e377b7f337..eaafca41cf02 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,9 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+#define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
+	for (adev = NULL; false && (hid) && (uid) && (hrv);)
+
 #endif				/* CONFIG_ACPI */
 
 #endif /*__ACPI_BUS_H__*/

-- 
2.47.0.338.g60cca15819-goog


