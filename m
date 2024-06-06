Return-Path: <linux-media+bounces-12650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2E8FE77A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57BB0B23B33
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A298196D9E;
	Thu,  6 Jun 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k0x+fHDm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D736196457
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679856; cv=none; b=DKOyk7O6IuRn5b3aEjdq/0dEFzp3VsDcBSyzF1Nz+MMU5EPYiM56myBcvqyIzW2mlwmB8epUTvMklmClnGa4oUELSJjamFPm1Jro1VcCD/RM0atRFl8lQg34ICTGzmtrMoLbKQ+u5FqrX9+sFA7b5KdvEBiCur7twvEuVQxCxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679856; c=relaxed/simple;
	bh=0b1zuE1MbEB0QXjShSrW/hvbjBrNrmRe+hDcjTlyO2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duPbTtYdX/jo7iGjubCoiBZRAbFkJ/LEX516f7bsX8OKSJnMO1LgBwghnw6LL10+ONLIlPSbGy3RRtW0dI5nx9FG7VxbAq7iPbL2GC5faAk+R5x1ncwytcRlv0sq/zv1PKkcKRWghRQV1eFgszrazhw1k+RYOKpmftBi+QGza4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k0x+fHDm; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ae1b32752aso4737816d6.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679854; x=1718284654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CC1kPEM1QEeXV+54pCQUERgeWC6whHxHJCePKioCow=;
        b=k0x+fHDmaHogDzg/tqEzGFmB29TaGllQUFT4vOGuoemJaQNuXGtFFcy9MdMXxRXNr1
         EZL3UcgEGUCSAP/6oVI2nR5A6VtbyuokqZ36xdLa7lCHb4hKjwPNXQ8FvSqTyiRYkSyD
         Ok8HuHcsp3My3anUOmD3hmZlSWadiUPPXBA1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679854; x=1718284654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CC1kPEM1QEeXV+54pCQUERgeWC6whHxHJCePKioCow=;
        b=CB6sSjzCo1WmIgijMJKRBa62JX4ZyBUGQ1cL0bcaaxMrWA2JgHwAZOJWjLfLGL0aFx
         Zjz1XtInlfN+PuV27MkN3ZCrjhjBmfTgUuhKs4ewzQ29J/AmHE5K2RLHBdW8f7QCaLbI
         Pxy7++gOMqWvClzsJCko3l8eNVgrQA8lcsqKXF4q88e+gRF4E3meDRzpEokdARAsK/u+
         M1/ipLS2SAHI10tRyfCHmi5rXMa05OcNHzOBt1hHDuZujl/u6LFE76MucIFAnbefQ6R2
         q3BsUtzjxo5oA4BPuZyVOUOpMD5cbp7bb5ujfzCAEUSKcV0yN0kZ3kfFG1wmWNE4y7VR
         ciNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVF7EYOhgj0ykgkdmgRt/pU+3ad5hcJPHsSuFCdl2xOtQ4mH164f6DoyDcel0rhykstfupxwK/1cKLLZzsN8aSi42McJceLXQN4ys=
X-Gm-Message-State: AOJu0YxGQ+hky59KbI8gw71W+7OPi0snsqQ0da4g44TvoqGRDQ2ZU/If
	zmbhMznmXrSX5MAeklwZB0RAJKBQmKXX2y1xRrVXJ47+3YEfFnnDSY5zna4tIg==
X-Google-Smtp-Source: AGHT+IGbbRegP2RzDH+X9svE133yMQUWHCvloWmhh0XtejpJh8/fXunC7mYI78Zn+Xm9usjDEMhazw==
X-Received: by 2002:a05:6214:5d81:b0:6af:31cd:f1a3 with SMTP id 6a1803df08f44-6b02bf87f4dmr58276916d6.27.1717679853817;
        Thu, 06 Jun 2024 06:17:33 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:38 +0000
Subject: [PATCH v4 04/11] media: venus: Refactor struct
 hfi_uncompressed_plane_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-4-3379ee5eed28@chromium.org>
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

This field is never used, but if we remove it we would change the size
of the struct and can lead to behavior change. Stay on the safe side by
replacing the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1003:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 7c0edef263ae..eb0a4c64b7ef 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1000,7 +1000,7 @@ struct hfi_uncompressed_plane_constraints {
 struct hfi_uncompressed_plane_info {
 	u32 format;
 	u32 num_planes;
-	struct hfi_uncompressed_plane_constraints plane_constraints[1];
+	struct hfi_uncompressed_plane_constraints plane_constraints;
 };
 
 struct hfi_uncompressed_format_supported {

-- 
2.45.2.505.gda0bf45e8d-goog


