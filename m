Return-Path: <linux-media+bounces-16291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A32951A1E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A350728493A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE771AED4D;
	Wed, 14 Aug 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rj9rWN5S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25C1B143C
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635575; cv=none; b=N/ZExGU6aDaRRaq75qb3x71VQk5z6PuUoS2h/6hZD0Hf/aUi42hUDL1gPRpOFMIWQmrMycl3sfA+mYfA+H+N766+FfkfckpHjGlbXVofhdypL1fwAFtUR4/vKTghajwSSE6YFFwFfA7ByHL9mvR1cNkuNz19wU3CZl7uXie8m+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635575; c=relaxed/simple;
	bh=pyIU/wpDxEysTH1DK2l3U//dOe+Y8cV+Qr1aH0szbt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfoR1rTdfjEmvz/VCumtrCS8YkwpzCwlwZyCkOsqSRjEptVFINSlByssJRUrEO1MZ4MGMZQuKYM/tpOROKBar//QvOeRA52iWwF2mryeSw8Ox1KpbgdaDM4zrLboIfYSCPtfOAmQ0pkHvpIKSgS9phUc6Xh4XfqeWeCBo4dEwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rj9rWN5S; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf6606363fso1041646d6.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635573; x=1724240373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qra7e6gnIzbOaHScJoaGRuYLxVmqQHQON+C6sPV13Dc=;
        b=Rj9rWN5SWbVlxMVFVqcNHkrlGVSmvj9Eukip3/VripbTHZCW0CElsZVBrq/k7g7l37
         1S7OjJBqNU2T254laajEykhKSto0MDjFI3FKlF3N7bcy9PIi5tvHIE1xjZ500VLD2BAh
         xChfWjyMrQBJsuqksHp1GAvsoM//pZyAvC8HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635573; x=1724240373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qra7e6gnIzbOaHScJoaGRuYLxVmqQHQON+C6sPV13Dc=;
        b=HygRFZh0/vOZQbV5sHjXR3NPXArd48pSfDZAzY6NQMHa32VedJgEXfoFwkJ5GkUA4t
         IlCQGFA32fkEFG2NTGMhKshdeo2Zs/ZC9iNd6A3Ngy1VOM3Q+mgHKAc5o7y+gKIxOXiO
         v+wM7bwlf9OlvSTuYAS3S/TPMT3cBMYituePl66edVmczONQtFyzfvqQjtqpt3OaxWju
         7F39lhmd3Iv+nTWrY5AnfKDni+G/Hs6Gtn8r/wh4T9mbNOKm9N+AtaY8D9EZNSN4LfQG
         lY6h1UA6jLWsAZaw9H0I0B1SBrFbonNKFNOw2gigbfkJbnBFIQ+NWXl1kW0Km72zNsXF
         TL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAxKmGUmENsE6VaENV88AHoMCHm3uVFunxbIbh35Eg4x35bMky/RDSWY9myRu/vWPSDbd8kP6lM5/GPsDqU/pt19Ms2E7iE6Llclg=
X-Gm-Message-State: AOJu0Yw91RKjnYNHjlpoqK45n3MkkT710ppZa9Slt49L6zrkpQ+8UnR8
	l6aBC4ZbnYkuTHX5oqxmL/j8P/tXk0J7QgQzEKD5abK+IlQ8VycFfVBE5P6WGw==
X-Google-Smtp-Source: AGHT+IEwgGa1Gx+up8FUs2IaSrC67k7jaLZQEMvAtBGuuQ1QJth3AQrJWfsKiZSm5YL9CycnW+R6RQ==
X-Received: by 2002:a05:6214:469a:b0:6bd:9622:471c with SMTP id 6a1803df08f44-6bf5d1642d8mr36612546d6.12.1723635572647;
        Wed, 14 Aug 2024 04:39:32 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:26 +0000
Subject: [PATCH v7 06/10] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-6-8a1cc09ae6c4@chromium.org>
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

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 01f5463e0fa2..de0bf2399505 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -151,7 +151,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane0_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


