Return-Path: <linux-media+bounces-12647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A74558FE76F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344501F22FC4
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63501196432;
	Thu,  6 Jun 2024 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NvYMBhPb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB1195B3B
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679853; cv=none; b=XEVZmlQKr1PwnBnmpJF+HS5bjHa0IylqtDv7F6FxduWcEAIfHeHDk2IJShr0zFFD3YySiD8AMhxkKPoXFKBOc9++KdT6fpwF4cYQytVOtADfvSDwrBSWI6FXKxkYLV/WfeHVMGXuL9+oBe5dUyO5ZC1Ul5Nj9IGwxc0jHIfv6Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679853; c=relaxed/simple;
	bh=9Ex/psXstRZqGMxxPJ0VpkCq64t7rGKg+zLLyU8qbQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Th03EPUCz9plt4M//uoVz0wifgNiocOl3dh7tyW+AIGS7ew4U+195Vl2Mu/Y25XnRqsNIkYZIc7/3ASKDeVpYHkOW/zzNfN3YeNMN2nAwB90DX4VXseVw33ahgtDSWd4BZGvwA9bfyk0+ECK9WurQMr/xNR0+Z5wPyxQD0Sywuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NvYMBhPb; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b9794dad09so419738eaf.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679850; x=1718284650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAL4006xAnRJyzvWwdXcDdqMP35ODneV2/4JxIJoTYE=;
        b=NvYMBhPbL4ddCR1Xdo0TVjY2+0mkBDXcQoJmDaBfuAgBEBD5KBI+0Vy9Ew7LZ3U64g
         gqGYDYnPcUh6vAl+FOBCQdz9IbPMcv32KFFTjVy5vxB7Y0wv7ovxcZgmcRTNmJFVjL00
         7szNGD1s7aojdVbkjcCPwbxa2KzrH/8JTxr2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679850; x=1718284650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAL4006xAnRJyzvWwdXcDdqMP35ODneV2/4JxIJoTYE=;
        b=jnN+zAKaANvco6HMP3EONU8va/RCQc6Yj6YGHvmaLmunwBaMU9QghIWtYB8yNMODPj
         zb+qD41PjnQx2iKGoR36HxEK4/eTd+B37P0Dt0vcqOVim6Z1v92poByqGo3f3ceaznh+
         3+zNri5YL9uizEv4IxGEtTHE6vLkmdVJZFve51YWx+sgO+XtIpIFr0zPvt9GS58HrBPu
         REh5DxEobtUQj27l3BrfeN9q/pmt9TxS2xNTzE7wTtlq4pfbYGKuZj61TTSte7PFzVlD
         ONSAViJoj1qpDb5L4Xv0Cb1qdEo14+CwR8P4aRt6s9tHE32tFZ1OoaDe2fnJAvsn962j
         CeKA==
X-Forwarded-Encrypted: i=1; AJvYcCVfabgy2+lf9wuYlJkGn+zJ/u+F2B7mue3lf8IH+Z3kM2/jYp33x0pJS3rnRWpo5uY5XJwXpRwqGfNejt2C4c75NW5S7fRs40Jd/Xo=
X-Gm-Message-State: AOJu0YyocYZTx6VxCiFH6PQP9rXX80fjmfpwcfc0VPqrdhg+4BNSxO43
	FeudMWvn51enXSHdVmslixIg0DFUeQnByNolvJVf7PZIxcJkURD9/QOL0m/vcg==
X-Google-Smtp-Source: AGHT+IFMfHqWudPNwZ7gEE3WDMg2/DCijf/SGmLWSwqmxlW9rIKDz6JeqdjExEkt/BTcjfNpWLogIg==
X-Received: by 2002:a05:6358:2609:b0:199:2b63:9f42 with SMTP id e5c5f4694b2df-19c6c68a2femr652957255d.10.1717679850292;
        Thu, 06 Jun 2024 06:17:30 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:35 +0000
Subject: [PATCH v4 01/11] media: dvb-frontend/mxl5xx: Refactor struct
 MBIN_FILE_T and MBIN_SEGMENT_T
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-1-3379ee5eed28@chromium.org>
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

Replace the older style one-element array with a flexible array member.
There does not seem to be any allocation for these structs in the code, so
no more code changes are required.

The following cocci warnings are fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx_defs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 097271f73740..bf08d82ba2cc 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
 
 struct MBIN_FILE_T {
 	struct MBIN_FILE_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 struct MBIN_SEGMENT_HEADER_T {
@@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
 
 struct MBIN_SEGMENT_T {
 	struct MBIN_SEGMENT_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };

-- 
2.45.2.505.gda0bf45e8d-goog


