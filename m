Return-Path: <linux-media+bounces-21776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FE9D547F
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 22:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707221F21F8C
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 21:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBE71D90BE;
	Thu, 21 Nov 2024 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5lDJlp5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B11DA63F;
	Thu, 21 Nov 2024 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732223151; cv=none; b=pvxo6tBsa5vEJI8Zm7kpjmNzP4zlQRWdVZJTpPEmEiUNQtmF52VeltVso2UZNzQ1rhGSNXzb+2zfKys0OkhUAv8vluneHHd5VrSI+r+HIDOFy/tC6ttauq1N5/7wQP8u+QTf7S0aoWFybdWhOLRcza5SUjAEpHwTYUTQH24GVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732223151; c=relaxed/simple;
	bh=fVfNIVDknjIh/0t0F3JPpYJurvUB7ZlfS01oi4uSWlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ixC9D333e0pwNMJsxQY7JNr8PF0nWaX4gu+yqhWBx77BPIJKlofocJE0KP4U/vxzhQqWqbXYfyF2YIQUYqv/c0A/IplgKKrQZ17OBB9YpAd4qd2DGR6wC4NcIbTr3sc/HHvmevMdxr1Rkb8yGkDQ1KjiPI6XISafYc0Uz5HIWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5lDJlp5; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d419832bf5so11169826d6.1;
        Thu, 21 Nov 2024 13:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732223148; x=1732827948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUUavdC9KXFSOqbuqB9VQAPUOgY2DcYv11W+nkff50E=;
        b=g5lDJlp5xRjqi86LpgRsiUPVhwGlZatHNPVTJIJSkJxrG5rCD7PGVMzuWZk6AMowsE
         V4a+ur1UgrzqxuRok6Rs8dWlmTZoO7AF5Q8BrPDqjhU4nq5V0lN0Rml4soyfeLXo26xU
         HPYgiwqXLC8mWz5Vshm0AVvmzNmApbsi4mSpZKvP+myQDlGHbPPS/G05ZiN39njdVouH
         tg0SfS0Yp3vsUceqOgiN2k9JMr/1as97BGxx4JMxnAP4QvBX0+5p6PYW43QnNIrnhoyk
         gCwMH5WjTKYVzYwAjucSlDsaIuLgbUw5kaStC+n1iWtELpkOT2raTebl+u5sSGJkXCkS
         bhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732223148; x=1732827948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUUavdC9KXFSOqbuqB9VQAPUOgY2DcYv11W+nkff50E=;
        b=ggn4I2CF8BugobyFBdEqJWSZil7uh+ovBuU5tp2m7Phh1rT3qD1cDGmqucxeg9JWJY
         lFzi4j0qrvQv57+Z1R0oUaZrYGvsBiT4yrqiEy2mAC6QCH51J0yTdMSfshGib9jSN2mg
         uUnxNaafq0Vs7gG1c3yWgTGvtKiMkmxOuT+qjMj/KiaoOSBYQswhROHg5o0XpnObVNJ5
         kh7KsAUgtVVK+75TTv7PPDmqwqYQhRIqJqdsTx+UOj/U7sQh/ZEpHTG9ACsOo7Q94hha
         4amITiQU9nMgB8unSg8UoBDdOWxwF2sunmhYTWnBRBYtbJpX8k7WSIozJJpakffOzJcX
         tHOg==
X-Forwarded-Encrypted: i=1; AJvYcCVd9+pdINPxYYhnC/BZ1Wy809qT71puNArUCrAMJi4Y3WUkVCHk4FBNJ6d5H9bs9Qdix3GvRPEYs8mFEHrkJbqjW8k=@vger.kernel.org, AJvYcCWpZKMn00H8Ny0VLHp06beLR6IZ7AmeP52DGYwtFNs2n6bHlUGwBj3phqGxO6HWQrUD3GCKiP1qvWC1dr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2mO4ELnx2pppixuAuEl4v8iri6Rt4pWQLfT1B5TcVaplWqyUy
	YvxHU0pgn1meJ+LjCaXVXC/3P0XmB9UnCkLoMfHDYqMwefGz1arn
X-Gm-Gg: ASbGncvexQeeh1eCnslxyvevH6gqlyekXUNpDSTBtTsc1eXET2TpsoxheGPaD/GV9CH
	vT7qAr8+sAf6HFQYybl3+wHySv+14D1QPS824qtDSml5rSWYTS00TrJGsGlxkNV3aste9f0rKPZ
	g7yML/ho4COaAbNq+RZ43gwpd08/xcNKrUc3q1AU6F9O0La8T+VG+2LDbAComClxxXbGdEt5q/T
	UH98ojONmQ0c0SV26X8sOelbdiORxudShG6+aYjw/0hRBM5zAzCe9rMKODJQC/7rVVd49mI
X-Google-Smtp-Source: AGHT+IEmOD6xWP8JPHNPxGJBr5HO77neL74Fcf9zeBqiL3qskduADaRVqaWOHYGSFIJ1yUIEkxA3gw==
X-Received: by 2002:ad4:574b:0:b0:6cb:ce17:e80d with SMTP id 6a1803df08f44-6d4510167d7mr11722036d6.18.1732223148239;
        Thu, 21 Nov 2024 13:05:48 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b4a11dsm1658506d6.102.2024.11.21.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:05:48 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 1/2] media: mipi-csis: Add check for clk_enable()
Date: Thu, 21 Nov 2024 21:05:43 +0000
Message-Id: <20241121210543.8190-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
References: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNOS4 MIPI-CSI receivers")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..d1c938065475 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,7 +940,9 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret)
+			goto unlock;
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
-- 
2.25.1


