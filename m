Return-Path: <linux-media+bounces-12031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912428D0F18
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28521C21422
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAEC169AC4;
	Mon, 27 May 2024 21:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YOfbhlZs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4616939F
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844145; cv=none; b=PwDW2jZJnWBZBbOo6Plxo5+iMwEC5pM2gm/kEs2NKO9q9AFgUJvZD0aKQqAoiONekL1rCLcEFY90Q6Az0rolZFZQdJMXbtZfha62Wtv31z30e0QQoUoaru9B/QdGsfBuMW6angxGjIosam34InSe8KXC5xqRkOGmA/YVfLk2gu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844145; c=relaxed/simple;
	bh=AtfV+7qKa8OYd7+oqo1EiuFIlY8JnCQ5vfZJ2LNqz98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrwnZNRqtD9HVU2DWClDqckCGRNX4yl92jBGIp1LrGXlvJDOI6vDCcYx5FQhzfD1Nk3aSMPvXyT9ixIpDAkVSgTICczFm1IkhZyRaQEsgIrFMVBHi9bJfYaB/5YaBVv1VHE+3IU3RTwoW0KHwFqRWVVhwhi9Tu95YLdbdGzGbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YOfbhlZs; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ab9e0a4135so24780006d6.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844142; x=1717448942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=entYDpzpynGnajXkQLwb6P9rzIVA7SLTRgQ0ZRMWf+M=;
        b=YOfbhlZsUIP/y8BU8bbdS38ebDi5b3fIdOfirBINpF6TuafzqcgZWPr6x+/6gPKzhM
         eBz1x00WJzT5NVEty2RQhcA2BrM6USvpqSVr+a56aXjZ3eqX6oE3DEG1I3yertKpQ6kk
         o6CjnVGrRxYg0HcJBuBJWxC+9Eu4p4T1PL39c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844142; x=1717448942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=entYDpzpynGnajXkQLwb6P9rzIVA7SLTRgQ0ZRMWf+M=;
        b=tWh4/coGWa9dggG/0PCC3qIubu4uMbJLs99Who8ekD/paJW0JEPyT0b9IddJeCcx39
         PszIE6SxdQb/Z9PP49jbSbHoyPOaFUsFIFx8/Bdsru4BKXCaikkXkJBlS/D7D9o07iVm
         2OmBcPdLh3XnIxISzT/rmH+XJ6oOinLn7brNUeQkdIlpRtaVdFs1MUN5y5bmVOEkCQer
         Aa5DlFIgbRmu7Z3257hxkwiarTJcBQradC3sXBFpAc1yl6PmxyRiDi4y1xSCFzMHmrN0
         Nq+o4Q4cYxbPf3D4Bh4XSfiNUpvwX2XRZCUr/NwG54WqE2DrTIX1EkF+64AGI+ZwRedc
         /6mA==
X-Gm-Message-State: AOJu0YwO+huX8dM8GHnv5NLVkTL55QEiCAqUQOMORq8a+gY+PoRTdDve
	h8qCBy/vHeePEG3YQ8kQWAd+kDDkc4HQ4QLn4LSOSrv2oF69kcQayXwlSZrsHg==
X-Google-Smtp-Source: AGHT+IGRTkEFJzLLbC9/MtoTsg0EW+dVQWuLn/GRcDLGaCVnhgLZ5sKm7tGGTDdrZIg9lepBsZ8a+w==
X-Received: by 2002:a05:6214:2b0b:b0:6ad:7070:4e1c with SMTP id 6a1803df08f44-6ad707059e8mr106586636d6.19.1716844142698;
        Mon, 27 May 2024 14:09:02 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:58 +0000
Subject: [PATCH v3 08/18] media: siano: Use flex arrays for sms_firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-8-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace old style single array member, with flex array.

The struct is allocated, but it seems like there was an over allocation
error:

fw_buf = kmalloc(ALIGN(fw->size + sizeof(struct sms_firmware),
		SMS_ALLOC_ALIGNMENT), GFP_KERNEL | coredev->gfp_buf_flags);

This change fixes this cocci warning:
drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index bc61bc8b9ea9..82d9f8a64d99 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -666,7 +666,7 @@ struct sms_firmware {
 	u32			check_sum;
 	u32			length;
 	u32			start_address;
-	u8			payload[1];
+	u8			payload[];
 };
 
 /* statistics information returned as response for

-- 
2.45.1.288.g0e0cd299f1-goog


