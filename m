Return-Path: <linux-media+bounces-16287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15196951A12
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40C4A1C212D4
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3841AED57;
	Wed, 14 Aug 2024 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M4tdAlft"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5D1AED58
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635571; cv=none; b=mDA0KeKROy1H2Oxe0mb3s7nznaZj4JS2jXngqPCxNSWldrgvHFJ9Ou4FxEX/HU9ddASe4QKrbXXEWlENQ+MkCV0ceyjwrV7fGh0JqGkIpAth3fo3HW2xavnnwCxpv99nlW8z+hEhdjymPtnDg+O1sEP416FAPNdUb0eHY0189Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635571; c=relaxed/simple;
	bh=5GjsDBGQqIgtkhE42oyItt8GLxY3GZ3DjuoGu9io62I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4d7nIq78SOTTi6VF639KTHfK2pTRgDznFrCnUJJGrq4zP8De5LBFiSo/f6tmu6o4PxT8EQs9VeLuV/1hNJLIOZxpHkmpXU+iCwn3+AKjlowJ7Xr6HEsNEXIOASLtAIsqsesxz1Y3r09a+sk2/iaNsh7bc8enPuppGehWGMwyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M4tdAlft; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bbbd25d216so7003166d6.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635569; x=1724240369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUMFOlEGEXrhpj9V1EgmNfGLXeQh9qSdvMzJJ0d3XaE=;
        b=M4tdAlft7SRHx9iAyXlW9ETtIa1Lr/REeJoPj3hPKZZ9YMx9nXfJWlVarPLC0hLHU+
         yaN8LcXx5qvuuLQUSEx0RMJ2CpsgNM/oLfrm8W2yxtnec4IdFYePV42YJhKra+eSDOZv
         Y4jgtBnp66S4WG9H0jMvjem1yZ1LCznl9LopM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635569; x=1724240369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUMFOlEGEXrhpj9V1EgmNfGLXeQh9qSdvMzJJ0d3XaE=;
        b=s3ymYhjznDknTKCENsB75kprh8RyQl0jdU68d7fzz1ieCuq8lNzjGCUn/ZfG5vQIvF
         ZXsJY1iGNUZyA+qpKUJ429JSXRF2b1TrLA6pTsRCKu1F43PfvVjPcWVUmsY7oStS6LCl
         EqgcXRv9ruDQjFd8pUnZHMLxy8zUgeOYKLbnRPlemxgMM8aC4t34CgyTpTDWaHC4Zrm2
         UcaWJ5M0DfE43nPfQPkOk6+5ceindtY1dMK9FHhE+gzK8OgTpPJyfCOxWVNxpU+QJaXy
         AROA0IpcoluLX6A1uRgKxzJ/aP0EEsT0fJ0+JaGF4MQXmOZYXBCCG9IBxDElplI18JsR
         xkzg==
X-Forwarded-Encrypted: i=1; AJvYcCWt2hl2PfKgAAY3s3kIMBnqNMUffxo6Z3Yf1V518ii0Mu3GeB4JGSjmNuYmK/EtdG46aOObIHw9SQAmzQViAgKEQFKXN1ppgr/VK/0=
X-Gm-Message-State: AOJu0YwRvqusotpcg9lcLctzraDD+3mVfQL2+AmOeNe8NkoJhLKg26tw
	fRU1ucqzVEMQzf6tBPoWCXcEodn0HG/6cPFneeAMXDC89IsCKD7H8oGLrVsyhQ==
X-Google-Smtp-Source: AGHT+IFJDtb638rb+wV2H21FdbW4vA4Hf7yPXCUSiIUml67X7wYGObrCaoKmvWeXp1gLR2i26FSdzA==
X-Received: by 2002:ad4:5e8a:0:b0:6b7:551b:7800 with SMTP id 6a1803df08f44-6bf50c4e22emr122066976d6.19.1723635569305;
        Wed, 14 Aug 2024 04:39:29 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:22 +0000
Subject: [PATCH v7 02/10] media: venus: Refactor struct
 hfi_uncompressed_plane_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-2-8a1cc09ae6c4@chromium.org>
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
In-Reply-To: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This field is never used, but if we remove it we would change the size
of the struct and can lead to behavior change. Stay on the safe side by
replacing the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1003:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index e4c05d62cfc7..5e91f3f6984d 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1005,7 +1005,7 @@ struct hfi_uncompressed_plane_constraints {
 struct hfi_uncompressed_plane_info {
 	u32 format;
 	u32 num_planes;
-	struct hfi_uncompressed_plane_constraints plane_constraints[1];
+	struct hfi_uncompressed_plane_constraints plane_constraints;
 };
 
 struct hfi_uncompressed_format_supported {

-- 
2.46.0.76.ge559c4bf1a-goog


