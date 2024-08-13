Return-Path: <linux-media+bounces-16203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6A9504F9
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D1AAB26A45
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B8719B3D3;
	Tue, 13 Aug 2024 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BcYGVssX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0BA186E33
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552290; cv=none; b=ULNa6LBoHHw6OFTTQTAh15cey5lBMGn/U/ulguhecsizP5lwY2e9J0U/EBBTJOHFChaNQLGyJf2MUAp2xpPqMDmT2WB+wtlYsUwVr4aM0PwJl76jziFClJy+7yjH3+z1siTtnwDTSDF83hqurbG90IMPdUdVN2HT4jy/mVMl9NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552290; c=relaxed/simple;
	bh=jhEUxn/pes1s4feDivojryv2JX3XefUWasZTSaw7ezk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlY2dfSfB3Gx9Cad04ZSp3jdYgTUYDVTzzAaVPS2hX1C3V5ojFuU0Dywxv86bv0a45O0AFDeqH622p4+uBYV3Js4GocaeEFLsTkXFv1BhWmx3pFHCPdU7OJkrtSksOi4TaeONSHH9Ye6wXrZN/Bw+lju8dEUFZJgADPWtPzvlW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BcYGVssX; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a3375015f8so378244885a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552288; x=1724157088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIXlD3Ol1LtfkD9H1UrkUWGH9uBnFxqi4VyzSloENMQ=;
        b=BcYGVssXRm6etUVCMvxxXrRbwwLiXtbPeHpTPHJWaPNuvma1TarNsFEv/X2KjlEhFP
         WXfhgTVD6UtXJmPX6+VoWHL7OsTufmBXvraPCsoNYIm2nyBniNhg+f8Mpm/6Wmq8zw1Y
         nCEusZPDmIjW4Sq/foIol6TUkhg1sGLbGucnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552288; x=1724157088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIXlD3Ol1LtfkD9H1UrkUWGH9uBnFxqi4VyzSloENMQ=;
        b=QV8VUFIXn6bX/kVQYExVheIXWSuD5V+HsLu3X4nU7jl3esQdF2cluSESADAIO9vEwm
         7id99AgJils6nT6TqDq44daJw+j4A4lbfrsHuEyQGuVIhMmcxIwS0yoPo7osIQVg4eCc
         fPFzWLiKm3VubpWvyqBKcbwkdkXPtVX/M7Wmy4ZGDwUuiWv01Bjad1Hr21TplLw8CMvJ
         7h+X/9brhidRFpDlhNkf7QcSIafCv1XHEmc5PQU+LtJJuCEngMzPWsaBb90MCYTthLSf
         PRcej9BQcgaTiqZQfMWnKxXx9M//UPQhmlfZqK7n8VCPC0jlnDNu8hxactqaVilgVSiZ
         XQyg==
X-Forwarded-Encrypted: i=1; AJvYcCWfSuAnP//8dI6pTgSJCm+mtrJgxZ/zPgZSWChBtYxvBkS4RYlKSy3rJHviCLnUvuCrbUI8s7MNI19LdVEYCYOjvjkM9pTEPP0mT68=
X-Gm-Message-State: AOJu0Yy83Wa/fAYa5gUqONZDfs66lFguoBiLFqMus4MFymLmXi2M9P6F
	GM4Y/jrds8SB7RFgwt9hQA5ySiL4bHZrq9PM8XJc2/KkCAFgFgcw0bUwZho8/g==
X-Google-Smtp-Source: AGHT+IE2xmMkDbsMy07f7CYEHgKUTqwYARJxNMOEOo1+wr1sMyllp6Sk+ESICy3o68XiwLOXgbyOlw==
X-Received: by 2002:a05:620a:40d0:b0:7a2:275:4841 with SMTP id af79cd13be357-7a4e15ab32bmr328777585a.34.1723552288115;
        Tue, 13 Aug 2024 05:31:28 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:22 +0000
Subject: [PATCH v6 02/10] media: venus: Refactor struct
 hfi_uncompressed_plane_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-2-de903fd8d988@chromium.org>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
In-Reply-To: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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


