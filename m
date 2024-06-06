Return-Path: <linux-media+bounces-12649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB88FE773
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A21B1C25A78
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEFA19645B;
	Thu,  6 Jun 2024 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8dS9Jfh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24652195FD8
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679854; cv=none; b=lRPuYC34wmDLkz6JGsjLGLPUtfJ+0T7S1ORedVtyD1q17qZfmSZswPn001walIpO4HbhNcbac8loccWgROtMI5Ft7f4a2hELoak+T8EA2LEB5pF0jVgesNgoiGM5kgwM5qv8ZXebqhYlJoXFHDuFUVm36yDZc85BdVJHfovAR1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679854; c=relaxed/simple;
	bh=LKep9+SsMgXIw7N/wwAo5L/YSHeXN3o1qd6elsENQvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzoMAd7afZ8G3kajg839NovOXyQw0XD421wH+vjrAp7YfSJ+qT8J5/h+4pLedpOSc2cSgOvKs7pbkiB2nERzuD4B5fbVPl/PLN8am/DvbE+Vj3yJVivXnGj3/3Jvt2E6Bx+tjr3qPcIDcnyt7u+Mfup2PRaMdynRS1TR5QYNnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q8dS9Jfh; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ba6859fb57so436122eaf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679852; x=1718284652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZZh27lvax1pQKtebKo1tSyfI2/RfGD2+tRBLkwHpFg=;
        b=Q8dS9JfhUN0JBhPQ2Pc+v0JQqNI9KiQVlEXPQ4YhjjMFO4vefxSidC2dXIJ2fMT41b
         6rUYMQCj/lQSwE5Tmx6gtNRVdD4pkx7Hg5Ex9J8uuMl76DnLrYLyKPulvDvDWrkcFSQ9
         WxbuomJvMde3Xv92dEN+InNMT0gFjt8sqnSd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679852; x=1718284652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZZh27lvax1pQKtebKo1tSyfI2/RfGD2+tRBLkwHpFg=;
        b=cT44I/4HjBuUneKpzH1NGUdH4zWbcUpoKutr6owYLjN5HBbG0wVDWocsaHImHneZ0j
         XIeUr31PwZDPOmYhvC3SzfWZDC8tcewW3CKLKUK4WA71n0wworTfYsqkPRMUsZhEDnKf
         upKKAV78rOfIKJgkSQmm5vWabYrEjMg+w0ovrtgWjdNALSSANIfcgHdJPzZ8r3w5/kPV
         GBrei+hM2IQYpZfgRm4OrpT2r+L6QZ+teLCv4n+ysSaliGVb182uMDJB3F/sTSoJBIj6
         RbeKuZpVSkWgd1OHp5jVxWrWI1xwO6m47OjUGEJfSVAMm9QbfeNSRarT6Z8j7gF27IdB
         9vFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIn1HKXdzXicWv/5waiLB4nOajcqgyB3SAHbXK00z2Ixv6Ims94UKnaQA4tVw+Ia73Z8KEK8txMi9k43tKLn24pmlYS1F0zr0C64c=
X-Gm-Message-State: AOJu0YxK+oLizoqJBm4I1zt7lC/A75ugrblW8NqaBIgBbnvYCT1/BK1d
	P1r+nQRObLiG6FphELR8CiMjOT032Daisx54C2rdNzjlMmB77eYJInqMKFvFsg==
X-Google-Smtp-Source: AGHT+IGNI9HGZGYM1bs7kXBQ+Gzd7oXjy4+AygNfoD1Lq7a40uZ9nWHXC95xkS7mtZToVDJBYIlggA==
X-Received: by 2002:a05:6358:9985:b0:19e:e402:4d17 with SMTP id e5c5f4694b2df-19ee4025007mr233623255d.7.1717679852165;
        Thu, 06 Jun 2024 06:17:32 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:37 +0000
Subject: [PATCH v4 03/11] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-3-3379ee5eed28@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 41f765eac4d9..6dff949c4402 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -201,7 +201,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


