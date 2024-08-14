Return-Path: <linux-media+bounces-16290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD09951A1A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857491F22390
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8A11B150E;
	Wed, 14 Aug 2024 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fAlj16hB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D465F1B1415
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635574; cv=none; b=qFnMb3wtgZOGhKTnpOksjrPY96c7C7LgOVZAj8QbKuHErRsGWIdgrMw0lRlIULQYzQhaFmJyqcRj5yNvttMBBYlCMC66R2PkhAnQRw7CKL+fPnZfWXfkD2VSFMiGiCOHEuP3VJwVzERN5Ht+E2ZEclN9pY8LOh67sLydWV/RE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635574; c=relaxed/simple;
	bh=vxzbkABevUmcO8zo0C7ffTq3vZBZQCpob+pP/oWgid4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIBnCEGIandOcfz7Q+WDlk7Z2ynvNm2QWWvdu0Jk2AWoD8T7yA1ogu0F6QgWRXvkL5zx5ObYsaFKAijc+i+qnSO91bDU69NadI7GMq0T5+xpI4Y2KUt4pjCYQmr4eqH/PyN7q7LLRpgRTOaW/5+ondGUW7gSOH8h0ldh4LQk22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fAlj16hB; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a1da7cafccso325739485a.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635572; x=1724240372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MENOIHt7duNVXQ/OhDJTUUPml/BdyniF1Xogw88blA=;
        b=fAlj16hBsT0Zg4mNV7uEnToGIC2FYF0XBYbGOjc25B9h+iJLFIHPmM9Wcb0PLZP65M
         DR3EkwSs55xyKdDzLB6ytSsdNhJEFSh+qnIMLnITU9iBJbEUL6I9+EG5aE7xwxtS2tDT
         vnMX2ZX6/CrNN4FktPtSEU5GGiNbwsIBEc/50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635572; x=1724240372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MENOIHt7duNVXQ/OhDJTUUPml/BdyniF1Xogw88blA=;
        b=dyM4R8Im0Eqrv84VI5xuWnAtseZ/DBGFwZvhifcmNSwb7KsaVKAgoARUpeE1sw8RgR
         dpKcbL4m4tOoUfx/YikB4Id52cK8e1BXhhiFod1TakyIPFPAHgF1dZapo4wVbN+Dpnsx
         XyxX3LxgU7mcKLeFngL1I6fIhxz/MLkP02ZF1Q83WK/Si6YMbG8eWnsaqY91t8XZb7T3
         fUx9LZkCF6Z8cBscpNXgSF55jc8ZpflSr8eW36RH78cZi+4lotNZdkT3pWwB5FGERxF9
         168H/8ROuuc4n/YbwD9zWBcSdH8eKAaqaE5ciGWd/4YJPz6ZCXqQ/yPTbYDH9kKiy0Hu
         OyOA==
X-Forwarded-Encrypted: i=1; AJvYcCWgq9zDIUCRbMqA7OK889XeLBidOLxspK0Mq82JgSE2/wMsTMv0dLHkEy7ZJG5No6NkZCMoMu0oMpef3HCs6G8qYgQlykreIuytbtE=
X-Gm-Message-State: AOJu0YwhtdqsmEOq3Vx1uPlRefQVBRFlI0UD1IoEfzBzJWKPT4R5VfUw
	g3Q4N+ZZ6tLnCGyWIjJk3dwWZxbpxWW5k5iwNbToLaRQ1Lo5UfYv3ro4U0ZWqw==
X-Google-Smtp-Source: AGHT+IEOOVmvcPoN/8++vzKRrLZToSjJo3+FaNbM1KRubLyRDXu+jabIS95Y0MPfG5GFa5XUFcn82Q==
X-Received: by 2002:a05:6214:3b82:b0:6bd:7373:8c8c with SMTP id 6a1803df08f44-6bf5d1c492bmr28595046d6.11.1723635571850;
        Wed, 14 Aug 2024 04:39:31 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:25 +0000
Subject: [PATCH v7 05/10] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-5-8a1cc09ae6c4@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index b158fcd00dd6..01f5463e0fa2 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -168,7 +168,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane1_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


