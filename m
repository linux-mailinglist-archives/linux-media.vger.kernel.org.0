Return-Path: <linux-media+bounces-24282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB958A026D6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A402B16297F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059E71DE4F9;
	Mon,  6 Jan 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NK/aRmgz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C371DE3A5
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170813; cv=none; b=plIHFTE+ImGQ2qSG9Ofn9L4bfD8bPTt9qPpwW4szCmfqqi1kq7GzB1mZUY/QEhWH/WdMiJ/wOONpY3f5aoDeSGy4VuKY6CUfNdp38DzfHOmg2dhqL8esCo4iw4RlwC6bdUb3SrbiqYsmrPO+RftgX5lzU5YDBXmJTL1w/lHd0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170813; c=relaxed/simple;
	bh=gyc7PHkVIuT7bzGNideviSZKpST9Tf7H8/ISjHyIIjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T24RKNHWQvbkMvL714m/L0ymoPcW9nSU6yFYGnifBst5omr2Bssh5a1iJoUbaD5OpNLQwX0RvzqxTxDOOM4vYbY9H2RfzzNCMFafwHLNrlH37ISTg6fg4FsXdhs0VgasQvPVIEOPYCWbOq0XGOgHMOmyDpRuqxwqfVlx2v1TpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NK/aRmgz; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6e8fe401eso1201362885a.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170810; x=1736775610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMOQdsC3jIKqQqpuSf98ArK9l8+i2xudhvOp7OPxjDw=;
        b=NK/aRmgz9LKIXUPVFMhy4wbRTxq1E/szT1BUS+4vaPjUKQHxIGmfMG204yuEF8nR60
         2DTN020rRv1oUH9UU2NkN50uF8OzswPU35kGPe9JsG0jC/V0sNcyqkqqzikKWH22Z6ri
         GoW4F87p3YkOt6QfATh0uQ+pputPvZLNlKzXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170810; x=1736775610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMOQdsC3jIKqQqpuSf98ArK9l8+i2xudhvOp7OPxjDw=;
        b=GWtzstneSJ0vUlJ4yrYRCCoy0s+qjRhBJmumc88FhTR15SOa54Dl0myD9hIBTOvM5p
         3Bw5bDMf/BddgftwbDSMfuWc7kZA35B0G0zor3mtZosIbhxX38x+R6ez/i4M1uU/P/wz
         mQa0jWH6JsP/OFbQI4pS8smaZc/9dhPSOUKNrm4tsb9Xn/Tr6XfnI/1PemJFu2SmRIv8
         eb08ESB4z7p2n/SaUIFygHF2bk1RV1W86wpaCsdlcwnzfJrIb9SicBnOmOQARvRvVgt3
         hLhf0X1GuT4wS4s3m1jcX16T7DQQKQbV27VCkkksFngne7AGu1uJcj6djtAoN2TGqaDU
         ZLcw==
X-Gm-Message-State: AOJu0YyjIJUz4yKmPHrDNqGcRarGFCJKSv42DwBrmr98gEY0UlHyH3N3
	Hd/gDdoZlfxSJscHxLVwDTiQHWW6JiTC8qqU+W3uvQfFZ66AFLRoOUGJKYBt/A==
X-Gm-Gg: ASbGncvBCdJlH9ldAMzStuYfU+6N7yah6MqWj2uMmCAdDLUFI1gvDO0MhCFwPRHrQON
	U5b8AZzYck3A51bSqRT6HTuraqO4L/iz4/7UCt/5Ut9TvkplB38ATWjYvXqJ9XjSR+9ciETEyih
	3INgKTtqCL1fylZErWIq8n7gN9aYEr9MeaYr0GJQLBxI7W7HD3aMXVNASP4tYvVZb0lLNmYfEdh
	tzuiwnIZAk/7qTY1C1Hc+489hwHGA/tTfJYyH7EbhlChp49puFwGVbSKwTWMFE3NuGHjym37b4/
	3emVi5ObeOe8U6FKtCUbPbpWowjCqzTdlr1p
X-Google-Smtp-Source: AGHT+IG0tS/HxvwhAy9Tnpx7Oq6KCN6+Gj7OoItlkC6sM95sCyRq2jDgb+/eacthbZcfoPddSstN/Q==
X-Received: by 2002:a05:620a:2904:b0:7b6:d959:59e with SMTP id af79cd13be357-7b9ba715e92mr8941485485a.3.1736170810497;
        Mon, 06 Jan 2025 05:40:10 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:08 +0000
Subject: [PATCH v4 2/6] media: venus: vdec: Ignore parm smaller than 1fps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-2-3c8eb97995ba@chromium.org>
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
In-Reply-To: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()) Return -EINVAL if the user provides a parm that
will result in 0 whole fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..25edd77b9cf9 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,7 +481,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
+	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
 	fps = (u64)USEC_PER_SEC;

-- 
2.47.1.613.gc27f4b7a9f-goog


