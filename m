Return-Path: <linux-media+bounces-12654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 586EC8FE789
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4012B26566
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F25F198846;
	Thu,  6 Jun 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hBvkXsXa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE55197A85
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679863; cv=none; b=BC50A08ZIHlORrd73ubne7dCsw8lU3P/eLtjs3C2qNuzIxmHKIdMsGD9hGQ8sTsmThIK/1E9n/bHJrW2zZgVgoTCWxb8IdE3pTiZzq1Ce/XNvXAVgc/Ci3KkyWGVsgMEI1scV3e6mBkW7DxyQBABYShAKpxXAzIs0MS2UYpXb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679863; c=relaxed/simple;
	bh=AWMP5+BquLDtzLKwUlgSS7VtSoQfhl9NrOwjnGNd7WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=on3MBUX8rlTjwiQAgHkthTreZJ9ff43ekpNW+b8RP0M00AjB8aJIjnuZy1Df9yT1BgeHVv9M6JjHVr8Jz77AItxo478rsRIciZFxBDnlK0N5brsdWcxrD35bdZdeCPUh1v018wwYFRejqAwIxdkc7qONWPJNcdNHd5DtzrCTM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hBvkXsXa; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4401a1ee681so4399261cf.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679861; x=1718284661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox++ObHoucj04Nng5whrLexOcEwZLp6Wnb/NRj7bOEs=;
        b=hBvkXsXaGc8ztZwyZdsJtflSByqW+KORAWXRGhyLbOagYTMp8aHnmY9HcV+JCPLtnM
         83YMLcZXDyMC5n9g6dW/ypqZHCeZZOBLwJy9D67FL87T4OS5cNXeEhlqUFqq8FnnwwXL
         /O9LuvK7Hli26AzPKpFkHi63RAZtj7QSyhByo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679861; x=1718284661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox++ObHoucj04Nng5whrLexOcEwZLp6Wnb/NRj7bOEs=;
        b=ph95LZLyszC/cbWl/zTMldwZXhUyQKySJ6AUq4dRJZ0/GdJVWdiiJmsvQWSyItEmED
         QTfB4j4cpq6iildioxR/2kCi8i/Xqs7bEAWO6Hh1egd96jfohlSbkg4ksbQhJs35rjih
         H9hJQTbWsQAenH19RZtpqqyM7bv8+up9IgdKsNTIscpA3njRC3b+fHIgXPqtCZYc9c4Q
         U/a4rCRfkkZQW4lPCHwc5Da+s2NpBaKROgdSGN9wWkW4octT7Irc8Emg2KSXfkgkNesx
         2hjEEGogFmt8SMYfQa1B0/MTJXeo6Kzf978gjVvI3eElifvU6PPzglSn/PWgtJc/DHPy
         +7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX7OuQhvePgjk27bXvnO94ZTpv2sHAA0BXI1VhMucsX8hibIy1PYHN87ih2mG6i/UFPx9Ax3c1BZDlxN6iZ7naZkMc4KP4Pc1IvPJo=
X-Gm-Message-State: AOJu0YwWirIg2LZTH/O0vou+QGfCn686M+um46CBFa/YYYHpB93iwimf
	BOAafRxj2CK4M//RjFtq07+wl/LDhqNsUP30DsVKTi5CpXhd8tRzem3fHpJLrA==
X-Google-Smtp-Source: AGHT+IFzv3hWSZczWB+TZSLeuXfXc1Q2NFlWyqPdthC4uOD9GBvoBOQzGOjMlXNfaGf9AaNt1yvmQA==
X-Received: by 2002:a05:6214:4806:b0:6ae:47b1:58a with SMTP id 6a1803df08f44-6b013913980mr61775836d6.0.1717679861047;
        Thu, 06 Jun 2024 06:17:41 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:43 +0000
Subject: [PATCH v4 09/11] media: venus: Refactor hfi_sys_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-9-3379ee5eed28@chromium.org>
References: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
In-Reply-To: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace a single length element array with an element.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 75f4a3d3e748..0a4de8ca1df5 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -156,7 +156,7 @@ void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt)
 	pkt->hdr.size = sizeof(*pkt);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
 	pkt->num_properties = 1;
-	pkt->data[0] = HFI_PROPERTY_SYS_IMAGE_VERSION;
+	pkt->data = HFI_PROPERTY_SYS_IMAGE_VERSION;
 }
 
 int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 2c56ae303989..f91bc9087643 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -74,7 +74,7 @@ struct hfi_sys_set_property_pkt {
 struct hfi_sys_get_property_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_sys_ping_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


