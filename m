Return-Path: <linux-media+bounces-24283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10698A026D9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01DFC162598
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1D01DE895;
	Mon,  6 Jan 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kncgcZxE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4331DE3C1
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170813; cv=none; b=krkeOS1tTX/P3gWa4YmPGYiPXvehP3nq5ZmXsWZlR+CS1qIF66wk4cN/06LoqvmaDxPa1aKE8Ud5gceVL3d5d2QiA5zniU0605prCS1bLyNZ8bh5XG19aYnwEQPXAxfqAkUHr2h/YeqkFnLR8ZOBAsEQnHQYw+xg7lShzo2/aFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170813; c=relaxed/simple;
	bh=6S98sC9zb379SpXjPj44qvbnzAChVkkYXuoHqOebMyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADE5274KTueHQ/bG7Z0KkFzzEgHFWNOazIjuzdWOr4z6jGuDq/VTximvkNdFPiRnsaUbtqh858iDbkR5dKuKm33acVZHlIBCkiLi8WfDj93plxd2l1E3vUXyMEzeQrREd1AicjusUYKdksLlJypt6Y1aCkfBqwH++L9lhh83/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kncgcZxE; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6eeff1fdfso1086874085a.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 05:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170811; x=1736775611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sua/H7q/HxBmtn5ehYvB6xIDSURBEgE+eseMuH9rt0=;
        b=kncgcZxE+nBN/bBF+yiZX3cdt+EhOgfulXyNO8OT6URRm2wHJFX5LnH/1LaVH81cxH
         wKO54jBDLv3VQ1vjsWJIb4f5SUHhVrmGISlKnT3S7TzbLB5FN8ocZkkLe5lHXmL1AGaC
         kCTFK4/URJCBqLYNKduqa16gpwyYMMUVyWyKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170811; x=1736775611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sua/H7q/HxBmtn5ehYvB6xIDSURBEgE+eseMuH9rt0=;
        b=q0PVVIccxjUUbSA6rQfj8vG30bjo8o8THiHK8HNL96u05MCXRosllCoKetCRfNmDeG
         OfTSgv+me0qttgfjoBostC5n06WfGJVev0PagqOD34f6MnGkeTMsbJeSJHx9+FH+Pt/Z
         CoIvtKgGUIhGHQt5iIAgXjCxb9f1tZJpePfEYBQoJOrZpdti3ib2LQ4HVc58nPTjlGL9
         1neKN/0b7rWbV35xzrGMs8kCVFJ7AMotBkeQqbjdjXIJRfZUXQVMT8+nXZYsZRrQoU7Z
         pK8dYIZAIAkD+xJAlY+B+ejlKNHoLyrRo7YujzcBIRWWZSjXAbhbbdtY+Lz4ivLz86Ba
         J68A==
X-Gm-Message-State: AOJu0Yz2dWwykNgZqekHCOo70Wbd9Z77hhpf5QgnbmieY2m0qPpR8yeu
	+W/ffyVa3lT1bzsUhQ0zMvK2/QF6vGzFi1x9HownoVnyKjweivyK7ca981SGdQ==
X-Gm-Gg: ASbGncuPl6j7//3PIynuC8IasGeFRBiwKIGMKD6Bjw9I0x6eiYilJlVBK8RbX5OcfWo
	GIvCrSWcDyA/CdMvvzGsuLtoMaEeidJkCCQ5RMfvruOfDiLAOMHHs17yMV3s/Ny0/R5rWpMf9Ys
	v71FHBaXXUzObDDgNTbHXYneQIoXOZkVDnYbgG6V1BFmX4UvWnjs39wOKz+jSzL1Wm4MqwaX8UV
	ppGeEwl1lRk7AAoaWPGykBdo8B/7ChbAkE0dj60J5DY1NVgpoxlmHWW1L1ofaAIIo9t8BvGb8KG
	02PpALelxNb6AJtptiUol+NIiTYdVNMtwLvo
X-Google-Smtp-Source: AGHT+IHL/i9PYol7/BeTRyIFkBBCg5WCtmISC7fUpGW6mAhMPY0gQu9kkKdiaUQVy0qOM3paHIXmwA==
X-Received: by 2002:a05:620a:4410:b0:7b6:ea22:3069 with SMTP id af79cd13be357-7b9ba79c26fmr8894375485a.26.1736170811310;
        Mon, 06 Jan 2025 05:40:11 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:09 +0000
Subject: [PATCH v4 3/6] media: venus: venc: Ignore parm smaller than 1fps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-3-3c8eb97995ba@chromium.org>
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
load_per_instance()). Return -EINVAL if the user provides a parm that
will result in 0 whole fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c1c543535aaf..bd967d60c883 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -411,7 +411,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
+	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
 	fps = (u64)USEC_PER_SEC;

-- 
2.47.1.613.gc27f4b7a9f-goog


