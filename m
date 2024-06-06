Return-Path: <linux-media+bounces-12656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D871C8FE78E
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78A88285D3C
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7E1198A34;
	Thu,  6 Jun 2024 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DjjfF8dT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823519755E
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679865; cv=none; b=Po22JXo3aj+euP/icOlbCv3mXZznTbTKJPTwBw/dVTFHV8hh76khkcP4UhcZ3L2CAhlpGXAimO8LtHNY6EEXK6L94TEAn/mJtr/fKvHTTlSgvlZOoLTjbn3aF3puxKxrTGvmRWkSG/Vslve/KhBcd3MeqyA0hdaK+hq8wVoUabQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679865; c=relaxed/simple;
	bh=uRrwC8FD53XE8snF88MCg3YmB4JlgvZCoOrRUf+Aarg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DK4oeeqZ5OdiulprxM8h4yfOurk95qXttrAqElc7ytz8Tg04wEFgEeQRpeFo1odSeSwxKeSDDvvOgkJipvnH16x/AWSTcnIyaWD4AXxV+EF8t4kr0PlFR/geNmu07tRg6heC7NCbPFy0gc+AUR95BMoKgZGVpAiXLfbjc2siRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DjjfF8dT; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f952906314so171123a34.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679860; x=1718284660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VGhOi0hNkAMdTQTUdauz7KIyv6SLUrF14jCtpe3Zco=;
        b=DjjfF8dTX6CwRsYinTcX+b0YEDptOW/hHDl897jSdewsymydisNcuYARPQ9UEVMvjC
         ix1XdM/e8qrCtSzoO2SHQ8uBWpwyLQUt+oBc0lzeuW9YDrJvjiEs7px100wjZ+XMn7YF
         lUlVn1HBIpgMoTTJ8Vi1nCz20SIIAEOE9bIZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679860; x=1718284660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VGhOi0hNkAMdTQTUdauz7KIyv6SLUrF14jCtpe3Zco=;
        b=SAcA03U0Dyl232rLBrUi8IzdI9k/V0EgGm+AtpiOBey1ox3+TsaS9Fbk8YGVr5fHe9
         s1y5JExK9vQC/L2enymcafGjABWaj9+s+Ah+pOxBWRnFQ1eL7BT8Ok2zKzRj77Badkdy
         4CbfcV5ZJf1/7ykJ8CZZ7Xb1jDmL4PuYyRyzZ5H3JN0KJYtdPyuqHaI9gQ/qdYeB+LcF
         4uf0o8JYozgF3eemnZlCHjt1nZOY1jqk0mJPVlQ2j0lpP7P0kmNSkGUghwZX3fnnfDEL
         WA42L0K23Gug/n+u3OonkD6BReJYfQcb2Kqo0L3lOPC4dfhgG3gxPF14bTw+yWSSKmy7
         Cl3A==
X-Forwarded-Encrypted: i=1; AJvYcCXFKRmhUfH+/Ld6RBDAlkCoStuY/T9PxphvELCX2mS6L6fiJhy1SkRaGlVUG7IN5jKUI2iTLiNtx1rBn/AUt8RD2vQTB4IbyabBJGc=
X-Gm-Message-State: AOJu0YzZSsoROYiv0GjF/Jb50cOedox4Hk26qdgNjVP3rYwEe5wrjb+O
	QfWs9f9ly0UTNonx2EhsPfw5Qn9NwUz6q+cig45soyqvidwRgF5tfdsuGSr5XA==
X-Google-Smtp-Source: AGHT+IFX9KGFgZD+xuwao+c++qZJRxYqYJVh/LsTI7EaXew+xbdJzstfPx2aof9T7S7zaI4fW+k32A==
X-Received: by 2002:a05:6358:2908:b0:19c:45cc:e2c9 with SMTP id e5c5f4694b2df-19c69b89b75mr683604755d.7.1717679860105;
        Thu, 06 Jun 2024 06:17:40 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:42 +0000
Subject: [PATCH v4 08/11] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-8-3379ee5eed28@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 8768ee052adc..2c56ae303989 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -143,7 +143,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane0_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


