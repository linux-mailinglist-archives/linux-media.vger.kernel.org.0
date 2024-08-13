Return-Path: <linux-media+bounces-16202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E359504F8
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFD4FB26A60
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E62719B3C8;
	Tue, 13 Aug 2024 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eQ9EUiEo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E7199397
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552290; cv=none; b=Amx79bhvU21yPUnDkBytOuYM4ZqJvWKj7ExTx4GFKLy0J3/MBEggAsTomzxQ+qUZAquwQ7w9TqzcU8VvbG4RYQXIVu8W0KD5UMxteeKJ1woE0O5mAa1iuY2XKFlCgqcyF6fpAWvJ/xZA3Lxoj4E9O1grNI/KcVxL7AJQYC6mpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552290; c=relaxed/simple;
	bh=2hjYCqULrObPbnZbgHzv3uAJ+2uRB9aIgS9bUw6j1Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIZDUzk83Uxe5S8t7AuHvf7gwrJbM7L4w6J9A0ojSRIEihuceLfX6fU9/X+jrW6P4xdFhawdZzNvgUO9eBZPb/4AsMzvWgXG2WCv8HgbzS9YvXAfm3akoyLkDkRRrMRk6FI4VHEJ16Fsmc93FR9aSkjmwCqgcL6gp0DqcCfucjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eQ9EUiEo; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70949118d26so4080349a34.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552287; x=1724157087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T26HDWEax3Ht99GbJ/5oCiq/G1VLMfwUsOvAjWX6wxI=;
        b=eQ9EUiEoqF3JNSQxYYIv66MNO57vkb+5MRLgZSN4y4G1SLVjTrsHwVyoQYoJ8dyg12
         5eFOKO+bEu4yPkWbCmjhcI1gaQem3uekT/5Pq0ZX58qUBDMCRIvBIn+keFdXIUmmMQG4
         eBinKE0Yahqbp8bUI9IhD9u66dRG2u2z6/1yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552287; x=1724157087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T26HDWEax3Ht99GbJ/5oCiq/G1VLMfwUsOvAjWX6wxI=;
        b=rCAcBij4xktSAFU51LqNodyqkB9tuGHGJ+YU9JgED8riVdhDL2jiOl2ZH11kq67Aes
         mcmaODGBO+zDP5RicQ8GJbMtZhN1t6uhumEDZ5OXfjkxrDMhNffnapHj+MvW+zyT92sY
         AJSotm6MHGBHev1dljF1c+O7oTo5b1ACFqN896xWzPfcuW0cdWYlC/ZylGUB+xgWYoRm
         5oAW2dav9Jx42f3nNZgDw6xqJfdmFzzvbijlr+XLxzWjqMBUuybw+gGT+A13m+8wutUV
         PyF6tIsbNzWM5QZxs9wWKPudNrI+jtug109nrUpTQI+MPg0JskwF4ZZBQOfE+M8NbwBy
         EUkg==
X-Forwarded-Encrypted: i=1; AJvYcCVuodOho+284c69EY5FO0kgGarRjFzlFgEDx4CX0vZR4FQSVviLPM8EHg47n1YnHWfpv6ACHhyrbvKJrjf0qIlvyV5LUmv3A79YMlc=
X-Gm-Message-State: AOJu0Yx8CDuobkDxF3VErlS5uMbRjQeo/WnuJ8o6RYEOCwA5Wi0T5uON
	EshpIIkgE2JKfJOa4h1sQTXz/GVjj6qvbg6M2e7jAJ8TkK//vpLVNIxwDqQeRQ==
X-Google-Smtp-Source: AGHT+IEt8IEr4mOSgyEydVS86tXDc+nflK2P9LtnkTrXNE23dIpoewktVCky3idoeTnXKhksyaliGw==
X-Received: by 2002:a05:6358:4287:b0:1a5:dca5:a902 with SMTP id e5c5f4694b2df-1b19d2d037amr358929755d.17.1723552287107;
        Tue, 13 Aug 2024 05:31:27 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:21 +0000
Subject: [PATCH v6 01/10] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-1-de903fd8d988@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 20acd412ee7b..42825f07939d 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


