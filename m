Return-Path: <linux-media+bounces-16294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC13951A28
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60BB71C212FA
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4504C1B29D8;
	Wed, 14 Aug 2024 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WtSgc2N6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E151B29D9
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635578; cv=none; b=uKVTxobScA3OD0rW9HoGW61zfdJvOhYZY5mpMyXHsbbJdK/kgA4y3UexGUE/NctAdF4OY6A8MdGZPPUln7UdQvpRgB/IvQ2UUILayroRExXifBMxgBTyAMueySOCoajE0NbnK4T9SnQtT4LlZwSnvo/RmATSCCmSYXSJ4DaUv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635578; c=relaxed/simple;
	bh=RUkSvotJiUicAjr125zoqk67Yg0Rr4Z0u5b8fZH4uhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qe9ry39bo4emvAQO72QjC+4S+7wa+51f4uCc7ncU0CH1lFIBR1yDMv3jrakz/mLYBm2tqyB9kj9+CpWhXUKOkXxF9XR2OZgsLJd3zIHOCE6gbgDtmljhNdTm4KCs7FVm4l1rsQqM/koY/xJkgFcpb4Mkwd2EW0tLOxXOO6ihxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WtSgc2N6; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70941cb73e9so2789393a34.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635576; x=1724240376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RN7Dnd0r7pjMqaCAE+J4vLBmG7zkz8JhaZ76ns/e/WE=;
        b=WtSgc2N6Lp5Fl+Grd8i857ttdZESlfUR3gycn4LSWe9mgJO5RleWN/SDlvDQFFaKTS
         66ca51LN954cVM1yzs2dQaL0kta7EzRXYt3ZdzafFGHckK1YJkZmaNB49P5Tw6aAjIED
         ph0J44PeYGW93g3Krf3LrNhL31cveht7AlS8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635576; x=1724240376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN7Dnd0r7pjMqaCAE+J4vLBmG7zkz8JhaZ76ns/e/WE=;
        b=KMz6wwlcJ7O6B+cfHaYSF7sL+eVBxYuum29DU/1q/Q5v7bhyVCs9Uw0pK1ROHu17ME
         WLxNUGBqiuyApGaVFaz0qJje94tM5JFc3/4hM+19fvPC9XeNtyajEPzbVLUWeoJotTn3
         i4+rC+XeACDaY1hcNvfoNaFk7Ma+XmQHpe2k5XAV4So/6ZNyhgWpC3cYy8EI6zgKdnw7
         RGdzu577rZNDm+yXEhmbuhcrJhTQTHXWsTpFLcF/7qT29VzS045KPDHo5n6SeOy1m6DW
         4u/ym4D28H/JIpRa0YbPQe17gJxiKGrUVOu40BboV0iGB7n9cEZX4BVYYO2EE3mHJBlU
         SNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqhqxsLvcC6VNEEPutK5IuHR04LgQy3yZvF7M8R0oZdmDRkz1jg3Dmgds2HSsQL3snA0wFJkO9A8szsYluM+OzY4fkX2v25yj1IzU=
X-Gm-Message-State: AOJu0YxuKOau2Rq2jx25p1RBBu6cmWCDXFbCskCyN51EUl0kmiCvlrnE
	HCBEJmIlQEhM739G/0hbO9ar5ONAaA94o64QiHmoHidWOmgVxqamcBYXhFiMAQ==
X-Google-Smtp-Source: AGHT+IGw4C+RCNiH4eerEXg4HBAuopT+VKBys5fIpTb7JFfXnmm4MV/gGIeWJWYBjoI+aevyYEu96w==
X-Received: by 2002:a05:6359:410d:b0:19f:2c7e:a226 with SMTP id e5c5f4694b2df-1b1aab1a74cmr270917155d.5.1723635576040;
        Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:29 +0000
Subject: [PATCH v7 09/10] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-9-8a1cc09ae6c4@chromium.org>
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

Replace the old style single element array at the end of the struct with
a flex array.

The code does not allocate this structure, so the size change should not
be a problem.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 3edefa4edeb9..755aabcd8048 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1264,7 +1264,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_mb_error_map {

-- 
2.46.0.76.ge559c4bf1a-goog


