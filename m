Return-Path: <linux-media+bounces-16207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B1695050A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4A8BB272B9
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4723C19D899;
	Tue, 13 Aug 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UHfeUwe2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81419CD16
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552295; cv=none; b=FrDABjnsXEq0EHLlxd90z8l87j3xizLF8QuQ1RWk647xtlGfoY7cTyJ+xG+BOVGUNlsg4RM8RIuVvXscBtYvrofu+rzuYhEawqX2wHVy/zoghvSYyQA7Wv1ZYVGACtqBUPgtctIxfgGnHOUVle/TAfzFjI3E8eoWW8/QFlwo5gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552295; c=relaxed/simple;
	bh=p3jpIeza54CehiKa4tgs3b0fLFLZmsQXlmR/9zDU8zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPjIe7D0f5MMw0VkVfAcE6cx1fg/jwpupmOexzp+BKtKkwqsLcGtWwssAU1J948C/FExc8EJKeRCqSaOJZ+iaacg6zyHK2Xyt59SaCBx3AvQx1w50cGyzoD1kCuCE6ieaw/uMeo98XQwBWL7xfNZy0sImufCKNn7/0VeySUYkmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UHfeUwe2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a20c529c77so347825585a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552292; x=1724157092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m0qOojs5u3nnBaeP4R5XScsxR2jha5TQMuQ4WnxziM=;
        b=UHfeUwe2A2dMtDJPuyPrPTVy4Bu6anYz8LQqWZgLekZ7s2Nr4WcUj3ZqaywwMSt89/
         bF0EENvdn0G8F09DoGdUD3PdX1516wUONSmXYc3k7q++9Midn9Cc1NN3ruV/qtM3VyGB
         iwID7N/cZG6L13OFUUBaUQOJJwzJyKUvV87Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552292; x=1724157092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m0qOojs5u3nnBaeP4R5XScsxR2jha5TQMuQ4WnxziM=;
        b=gqsrAVY4Z/GsKLoc0840IFvs86ebAHJm+nvJQLM5D2kPYoHHoWFvGAYQUoSdAbAN9m
         76Jx6Ifi/L1zaY3IOqZIvYqhwDcn8L6wEzPRXwb3tWsBvA0rGXIqPj13a1egLlGL80gN
         y6TnPVFZc0Xez3zlouwVme2wfJCoaA/GfOKJA49N6gdDM6Bn4HKvYV+5lDLEaqt5ByZq
         WLEx8HzYyt4HQ+/+FeN9CpcnsgJp7DirbnnQIhJtH/0Vm6QUICo/+BzipQqxZsWOiG67
         wK/uu+jaGxK/KGFl7CKMLsBUpB8xMgYaP0gnPPuZJnmbWaKMlkrcT3Q3t68Cwa2Pt1w0
         YzZA==
X-Forwarded-Encrypted: i=1; AJvYcCUuyJa2v8sAbDQXePgVVnZY9Uj1MZqA5TZA33vPgKGizo863SvBjNP5b4Xmuzit4x3KS1DP+gJhvl1WsuQIwPqzP2Htkn1wmPOHY/Q=
X-Gm-Message-State: AOJu0Yzlp3Xr8nG1dNUtoolmlWj2h1U8V1HxWz3QMqLnCcogYmhvKN4R
	0X7y5jroa4pwA1OGbO0hd6XwH1sJ1onCGlsn7bcBkGqmN55qM/b1YQgpbhSmRQ==
X-Google-Smtp-Source: AGHT+IENk8SpFwKWQLaKLf4cUuMptIr4tn+mOT99jzPw9kpr9RZ5Z+jGj/wE6VKPl37qKt0dMKu46w==
X-Received: by 2002:a05:620a:2450:b0:79d:5b21:804a with SMTP id af79cd13be357-7a4e1500decmr422156385a.14.1723552292603;
        Tue, 13 Aug 2024 05:31:32 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:26 +0000
Subject: [PATCH v6 06/10] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-6-de903fd8d988@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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


