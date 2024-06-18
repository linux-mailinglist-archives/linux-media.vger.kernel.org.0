Return-Path: <linux-media+bounces-13551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 419ED90D340
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6B51F21EF8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB4F16A959;
	Tue, 18 Jun 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LVvpOfA/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0416631F
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717875; cv=none; b=mWLrcG4eKLmQq/ZC6X8A5/feLt8FLGRCARVyldslKAt/2VPCtu4Rj+6h+yspXiuaA+VewCxQZmlT2Fqi3sFdQxrvGZDQkBqyeA7T3texASLsEKvCYg8kr4HqUNbQSn4ax8s7xqVsWE/Ptc+Uwwzla0tu+gbBEGcoaqVtFDgRgbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717875; c=relaxed/simple;
	bh=vg4N3vHUM1NcfIbzq9vLahhTUasyDZ1bYNx+7yaEx7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgYJvv5KEmM+JyK9o8NXUJaEMnyVDEtAPkpFTYzifXPn4VOGIJMNvYA7MHxnLRwrwZ8wqf7AR2llxJ5YotYwYo/ZOIloLPMs/3d6T2k2OQ+lZQmnCi9Rj8W7J921DXSHKqs1EucfxYjjdgy3jU8gZnbxCD35IUd9VWn5QkwIm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LVvpOfA/; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d4430b8591so728198b6e.2
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717872; x=1719322672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBlrdaaQBMTsb4IyivLP+IImA8pYTXHtea9bJPgetqc=;
        b=LVvpOfA/p38b9lHM8K/FCUwLLBHVbdmWK/2m1cwXvO21gnad89zy58f7ksG62Jd/o1
         WI7WQVMyp4+2l1B8IIqauw/AYOAnZbb2ys3o4PhPYIP6QPtIwUbeqbs6kpdQC4UA67C/
         XDZYCkddpxPHrZ9WjKkdWJcjWcF9YAVSqzmHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717872; x=1719322672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBlrdaaQBMTsb4IyivLP+IImA8pYTXHtea9bJPgetqc=;
        b=v8CrI8eUzGf/6KW5HUFKAJwdoRkcfviBtIxrqgy5cDXDhwv5Q7kr+1lo5e3Jx2io6N
         3RbQTkcttXzd+AZVs6HNjG5to6ObSrKQMPQyvDSq98/HaW09X5+TnMkXCyxDjQ/P0pZx
         UrKexhr+0d07M5vgyi8SBSa+PuBeAGpIKnJkUwslw7c/6TAa094nf4uwBJxrCwwhzhDw
         Hch38jW4zwgrxx9LYFCcmzcFY4woWbSyJXj23e9R5K57ga0VP4TYHwd27ffJt3kLNp8D
         u+O3bkSm+bbN0rPWHztn86dRaL0uIiUPt0WxXylypncXcSyLwAQSc1eTsJAP8yOs16iK
         shrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYkyv9/qTjS5Y7SVfoJ36zDAm7uVDMqBAH1NuIg2k75Wd4JGw1nTWQQCa5s4wzftVTmgnFUHt4SbUikNYzNfzfz9StJ9pQQ5oVk6Q=
X-Gm-Message-State: AOJu0YxxmOvP9dY2CzW+wpzQ5peEhik33XFv0FPnDvlqwKuUJ4WBZ0dK
	3hJmh0seyq0JKb3DetXoXPxgcnQgdBLMHQ/AtE8Trvsy7xQW5xpoBEJ9pZQOMKG+V8AmYpGKhOA
	/Uafj
X-Google-Smtp-Source: AGHT+IGAbmA+QOT2T92r/tmWOvvfxvs5SSBY51LP38a381c8Nq7cxwS5jqWGmNHK7iqs+JxA0IQXeA==
X-Received: by 2002:a05:6808:128b:b0:3d2:2b1d:7bd9 with SMTP id 5614622812f47-3d24e9085e7mr15725342b6e.33.1718717872024;
        Tue, 18 Jun 2024 06:37:52 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:45 +0000
Subject: [PATCH v5 02/10] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-2-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
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
2.45.2.627.g7a2c4fd464-goog


