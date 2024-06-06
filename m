Return-Path: <linux-media+bounces-12653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1618FE783
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FE6BB26129
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E70197A6D;
	Thu,  6 Jun 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ntd/dDPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D1197536
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679860; cv=none; b=hXq7hY3yUQPsb0a3osFWOblfhKOFZBaJSaeLEU5t5ATSdH8PKfmIEcv/iqnj/7H5ItWn6OSnV/Afgp/AxVwKyQCZswjCjPvPv6tsuHkcnQFVTYZwWBS7twEHg773P9F7BrTka8LMSIoaCigVmGmQlsGDNdzF4E4EjmGGODGBfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679860; c=relaxed/simple;
	bh=rr+ZAD9eEY9wxQwSyBHAujNTY1n691T+07WEbe4AI+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1gr8oqRaZRcU1lO6iHx7niMIlVqFxtUuEJ+8QHZFwBHDM/5VGdYeeR7KppMqVLuyznIWy5egfM/IDlqHUPlh2MfCJXSn6zhaNsycOasx4n9BMV7ArWprTd7E9RG5j9kghoWxmyvlHodneMS/hho1um6CUE7kOzeKr8WUUjFX4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ntd/dDPP; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ae1b32752fso5008606d6.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679858; x=1718284658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV++zhXkLm63xkLNQev5FMXGRPhSAuf2+6p1s7sOLOM=;
        b=ntd/dDPPjOuAXrysYvbBo83QdWpNwlilfdrgAUQYRbdE0RAfoenU+qfyECYt2/kU5r
         4TStcYC0Gs8kNraSTw6Fie4A8jMmytxs6UO4DHIJDDCdQgKIsqfClLQkP6jtmko+q/OV
         A73vOxGemKnuZQYGGsJ8PrIZ3h6uygmC/JDOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679858; x=1718284658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV++zhXkLm63xkLNQev5FMXGRPhSAuf2+6p1s7sOLOM=;
        b=NQQ9FvRhQJLoKOw9Itt6tgCXXHpQKPMAeVE72TSIFWb58Hd/kSppweus2WEwzCFmVS
         Dk4yoxHKy05ydtnTUFRyb3nhNNM7s1DiXexUmIfn4XGS6kPER1eg1rDdpp9giChJVHmx
         wc91hGGdTuD0Sy+/MwOj6BRxgdZSpqycE6/+3o2VFUGB+G+dqkPi3CJeBAzyvq8PTcjS
         lxMLz2j3Dd6vktvnxbEvq5DIFlX+dUPFbwitFJAaZ/+XZ6wrpmn6OfSW38BrA4BdY0au
         IdAk7OcdjCyW9xUxgdfG1hiIJHBiaVkxAiIi07Ex0PA5tjlqoo4Zwkv83GeSnzjwR2dz
         0/kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPSmFYtZkkIKGTnNQeURTp1B2ZJc6mGywHwWlNPuNOcVLQJFnkru7Pz1ykCKCUnZKYH2mnzQELttfXiTDGWpgrMRuOcLpi+iY8Yg0=
X-Gm-Message-State: AOJu0YwS1O3SXykVUUvOL6YJCSusuFqZ/bg+0VR8pmdIj1zEX4tKs29y
	iQ0PtbybFWyaeH4zr/b06+gSbNa1ZBL7TXjzFm9/7kRckKVIFcO2QyhU189Umg==
X-Google-Smtp-Source: AGHT+IFEbhMVQzLzMehFBZ5O1a5UQYgBDvAL87jiyZxeXK49H/vAmDrzba4DetgTJ+cq2bB+dcgNzQ==
X-Received: by 2002:a05:6214:3c8e:b0:6af:b8b3:338e with SMTP id 6a1803df08f44-6b04aeb2647mr34544096d6.53.1717679857474;
        Thu, 06 Jun 2024 06:17:37 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:41 +0000
Subject: [PATCH v4 07/11] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-7-3379ee5eed28@chromium.org>
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

The single element array data[1] is never used. Replace it whit a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index f5708fdfb197..8768ee052adc 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_fill_buffer_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


