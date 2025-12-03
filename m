Return-Path: <linux-media+bounces-48130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F498C9E516
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 614374E11B8
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573A72D7DDD;
	Wed,  3 Dec 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HqlZFvJU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57A2C21FF
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752142; cv=none; b=et2Q+HzlPTRG4MF6YdTKpTMe5ndWY6Jmg/M5ifoivG8VV4CVGQHGbk5djjL3Bm1aQSGahWu5b9vbzodTzmtwRwOBjFOlsY9+d6+f59hf67IcZkSWS+SaPoKEtuLDd8epqTiTcATCo+pVzMPgPflpSrm7T77NoZnUqWmEYQx/tdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752142; c=relaxed/simple;
	bh=3oJz3ZltYDqpWr5+uCLuJCyHQnDQ/0WypPYIDHiOHFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMn5qMDuDQKaT3Mu5ZbTf6PL4G62zRlWH+/V0W+1cEC3NjR9OVUpJ4OwDcy58nHWG8ztVj+KkkYG42apDxzz50H226wMUuigYRCy3BGbs4jGypJEvdFPbLndNAWF3+b+NpwSxIVSuDudediLJaRWTy9sfhRCq5NFDFqZh1P33Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HqlZFvJU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5943d20f352so5740258e87.0
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752139; x=1765356939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8y22R6XWDK/GOldRzQWK9Q2C3Ir5yEJKiaGjpAlLmI=;
        b=HqlZFvJUMBtNMJAhJwVy7XovhNQjsZYMYnevf456rShaLAG89zUNxnBFi2AEt58EqA
         m59umu08WtramawEKQi6cUwIW33eeMbAps24VSl+RuJjhIBAa+wePg5dafBOxr2vBEK7
         W6liiX9uwkAT5I+4CbUZ8aEAPCqJkXg4telYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752139; x=1765356939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8y22R6XWDK/GOldRzQWK9Q2C3Ir5yEJKiaGjpAlLmI=;
        b=dcpR4gCPLDloPbVIWxvLuBYDRB2H5nAB/c5cDn+mt/zYipfHKxPakF/QB7vzpnnfDG
         0M9LwEQ+7S8sYUcJb3bo7UnXNUAM6cB2P30DEe7YsbCBWcPAjp24wdZOXrgYajfh4b4C
         YLhRthSHLfHNheilj9spjzcebbbYHtZe+kFpler/VKtCulHOCscepYGqlECyhro1+P0c
         QFx5RpE6gl6R8FSfwHto5He3HMmqZvHUu4NyA6aWDR86e6D5wJDJoZMXpku960RMAHEa
         AqKfG5E9cs7fEPqQKWOLeYP9MN2e/l0Jobx39Lw1IOhCkRSLNmh16VYazKHmg/h4c/IO
         A4tg==
X-Forwarded-Encrypted: i=1; AJvYcCVCBj6XesgN9r2PqOoSX3c4RXUygKDNpZBg77wphEqbbQwWAKWkPaZJfNW1pL0VXfeyyAXFMe5sjH1oJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAuZJZIQHA3smh37+EwiMvIkQuvKJ1DDUzXT60iLHDyT9DCXpC
	TEL8BIc8qHPss6Yj4IXhGFixVNvA7lNLR/JFnVTE6WDwT4Vye6p+Og4bBbzD/cdYQQ==
X-Gm-Gg: ASbGnctDvVodRbskL7vgt0Jc8mze6/ZtEVI4qWKWNJf9jWZKAeH5mlQlNOB6XqPkLWr
	eMQFYLae2A/JPHFS8nrEDydRXOfToLAesCK0Ed1WNC/cJezHIm+zAU7npc8jLyJmAo19YV5Y1yW
	b6OVp2xLLWhEb8yDxICig50t2+RrNuF1zZlppWWptrwVuT203PA24aY/XNsPmMTL63ryG12XEzp
	2BaINxHIOfpL7ufB+mk71QkvOdb5r8z+o7yPeyYEJJvfMWwyMFW69q24De4GCH9G6gUKexMJW4X
	YCICs9RH9DFC0A9bG0ixjREXB6YoigSPSkxuNOBG+UrJHC358QeC5Ym9P0BzkjKqP3JKoLFf/XP
	Ze8Q4IEJ364zMcBfhHbkwrbxUNeK4Hn/H5Zvoy0SyUJ/T2E1fJ+u00HD4CJNA78Z8JHppe/HZw7
	9BZlVsFzJ7UU5QhA58MeQnXDpA5aAlSSbLphqK/ujkw8U/7Ohp2AOre1hTbx6+Q2xCWCeF4w==
X-Google-Smtp-Source: AGHT+IF3xsdoMGrgPPAVSpklnW3yTghz2fpZ17/ANQgtvfY6FupWoRh+Pdfp2OA8LBXT6KUdlKgBEA==
X-Received: by 2002:a05:6512:3094:b0:595:831d:22e9 with SMTP id 2adb3069b0e04-597d3efd920mr696138e87.1.1764752139058;
        Wed, 03 Dec 2025 00:55:39 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 03 Dec 2025 08:55:35 +0000
Subject: [PATCH 2/3] media: iris: Document difference in size during
 allocation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-warnings-6-19-v1-2-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
In-Reply-To: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

As we get ready for kzalloc checking for invalid sizes, let's add
documentation for the cases where the size is different but valid.

This patch fixes this cocci warning:
./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index f9129553209922fda548ca320494ae6ae797854c..ab91afd0597045bd876d0411b08b5a3421b12c70 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1212,5 +1212,13 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
-	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+	struct iris_inst_hfi_gen2 *out;
+
+	/*
+	 * The allocation is intentionally larger. The first member of
+	 * struct iris_hfi_gen2 is struct iris_inst.
+	 */
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+	return (struct iris_inst *)out;
 }

-- 
2.52.0.158.g65b55ccf14-goog


