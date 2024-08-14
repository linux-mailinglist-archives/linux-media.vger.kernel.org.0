Return-Path: <linux-media+bounces-16292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C9A951A23
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44D21C213B5
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDEF1B32D9;
	Wed, 14 Aug 2024 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jP7pKaH1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9581B29BF
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635577; cv=none; b=koVQ/a0cWFWafUnzSBW9VNgrKz3EPQqAWskhByfqJHiyCwoTI9w0kkLE1Go2By6GNewgxFFc0FtHUy0XITzuok0GddVXhtca3K8VfeQL8ItpEhfp9MwsPkXDM5Xpauzo7jwXFWz7SIDaQzQWMdITfz1UQ7Qcwm+OyFlkf7wY8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635577; c=relaxed/simple;
	bh=f6aJO5y6qctXAQENL6bRNRqn7Svp4lX0kLbyb1uIrfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMZg4E5KgDguLSgzhmrwCaJuJf09i96dIg36FTYp9javtZFYMILZSKbNCZo9OVNDt2KCEj//BS6hWtbF9Y8ZplieNZCvGUrPH1nV6V726/0koMBSItb9LZGljSXyTBhUFBMPDQ0Kt2UdVF+M/5wrhRw1JjjIEKP4/IiInyfg7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jP7pKaH1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6b5dfcfb165so35793456d6.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635575; x=1724240375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbltI1PXy7zluZAqPhIhWps9lyd2iHaX1NmD3KiJbs4=;
        b=jP7pKaH1FS1FDHZMSvdJYmL0tIwRsFhvHp8rGnDsLCRMLU22HjK2Uzvp4vLh86XcRU
         cYSD2zNqlFWWFyCsAWDoi8fYEfNv6xmh4HkaGKcK0hihWUQ3j5AumE8+FNaCsUJWPfxH
         UdjNX5LIa38/ASmHG5J6bEPXH7HsZ15Yec9qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635575; x=1724240375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbltI1PXy7zluZAqPhIhWps9lyd2iHaX1NmD3KiJbs4=;
        b=Dce5SywctQGa3cQPGnBtJNMH3ZcvRYGZEzekZHycc3ve7/bTpakITn6z6Ywp7f2KdB
         TmnAUzrTg6eQwajMJFqEcWRGW7L1qByt2MlFbBRhR70/EDBG7sWhgyrqn/MO3+rQkz5i
         g4Hxy4hZkzPW5BrHGOrjfOgSFrFV+Fo5rorHprssXmvolpMCw4OumD23UL6VbdVD6igk
         wujBZVyyrZQk2U8IpIHoTZpswE55BZRFcblh0kqpb2VvnnRtf7/WQcfzD5BkSYOPMTWo
         DF5ygmtFvPWdTLE+EZub+tYQ/fickgJPK84M7jX7H/1wWa8qKYXYoF3tPbA0eJpB8Lx7
         q/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWeq6+Xdiq2e2Lz962lL2tBuxU07jew5W7Ne9WvnB0OLoAj8SG+Hjlf8RpzOHrbPt70CiSXyTlVg6NiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoWmgI5p4QavU15+o54z9Z/T2dCFJvKVy2y5vgthccci3iFLW6
	cjrHeyIy9ssyHJOY3q4qkZCGeUD31bekB1DzpdukiB1fY4MgEL9giloHR9NC9uRBfe7U75dOM1u
	ooF+z
X-Google-Smtp-Source: AGHT+IHweFCYSrJ5VlRLFH54oNC9VVSNaAo0rog5MOspE2NEaZXjQiVr0KeUl63PY2kBjjhRdDlavA==
X-Received: by 2002:a05:6214:2b91:b0:6b5:a8b9:e8ab with SMTP id 6a1803df08f44-6bf5d273a40mr23415216d6.49.1723635575168;
        Wed, 14 Aug 2024 04:39:35 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:28 +0000
Subject: [PATCH v7 08/10] media: venus: Refactor
 hfi_session_fill_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-8-8a1cc09ae6c4@chromium.org>
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

The single data array data[1] is only used to save the extradata_size.
Replace it with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:175:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 0a4de8ca1df5..3ae063094e3e 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -331,7 +331,7 @@ int pkt_session_ftb(struct hfi_session_fill_buffer_pkt *pkt, void *cookie,
 	pkt->alloc_len = out_frame->alloc_len;
 	pkt->filled_len = out_frame->filled_len;
 	pkt->offset = out_frame->offset;
-	pkt->data[0] = out_frame->extradata_size;
+	pkt->data = out_frame->extradata_size;
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 615ac8d156a5..63b93a34f609 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -198,7 +198,7 @@ struct hfi_session_fill_buffer_pkt {
 	u32 output_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_flush_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


