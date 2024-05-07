Return-Path: <linux-media+bounces-11072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7379E8BE8F0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28643285806
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EFD16E89D;
	Tue,  7 May 2024 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d2fw3tcx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF96816D9DC
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099239; cv=none; b=ediNSShpnjDppoyHF76Bs+JWYL7dgM3dQ964LR0QYRebTntOO6n35xdqnOOFq+90ElzkRthvWN0nPomNRysVhh9yUegr0NV4ijJJuV51Zkt2F8rq+3dbSkxSlbnmiEs7PlxYNZczlLQnnEHKP+qCzMq1YUxLd05UHZ5UZFindkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099239; c=relaxed/simple;
	bh=3FQmdzC7rLah5bHXqxL1pjRWMb/l2vnOq/dIwPsVxiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A02zBcZV6QwJ8Fk3nVCRvKhdf+d72YEypMmsAym7xinq1nUFLlgRCcbvpzlrS07TpwANPRwgyZLVut00772QY1ZBJNyoU0I0klQgIOSx3SQTZ8Ew5yxRSh293mrsP2ckSvNOkiQp4bosOz8lncnHnYz/oABxgui3emyGVfIPkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d2fw3tcx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c96a298d5aso1550488b6e.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099237; x=1715704037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKfhOSoHE1VqyRhgB0xYInvnK6a8zz5LZUqmCULZe+M=;
        b=d2fw3tcx8B7ebQuzRheafY/HF13lspqh3qU2RkyjcthAncGKEa7QeIed+ec4X3NLv+
         7MRi9U7Vt1ATwL/dQIezPReprvccyBX5OKfVejS+EvZkeUxmu2MNo64kczGvQNqe8DUg
         G3RX+SjTHmVUCLghqdzIK6J3gbIowcPupJR3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099237; x=1715704037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKfhOSoHE1VqyRhgB0xYInvnK6a8zz5LZUqmCULZe+M=;
        b=rc9aBMEGAW8gjUkxkk/VgiWpfMdRRyJfziWVExq4qAxHIkTuXcmDLdDkQnbILu2Xvf
         W/uExdUnyFt6mvLqNq40rvcdhgbGhXgQj/sfWfL++DBFAfCWKzqkPGNMe0yinZ+mB8QP
         C+nCtfxkrVSz4L57If0BDsXdlPogqE0rUdQlmCjKzxl08GZUSsWD3XJC+FjXIIVAthyr
         PsmelCAd5Iv6f6wXFPlO//n5YnhJHCvYjvlBIQLKVP5m/Ucre3Rpsm8wVT26GVlT9KKn
         U1DVUvve/vkSR3nvMdDArRQ2fDjoF2YkAYnQDHwgqzerRTjm47+Mnr5UAU3vW0kDtfqY
         vlzg==
X-Gm-Message-State: AOJu0YwinPgy123FsC4ap11/NGVIcnfSe2k1E6aVbPwrodqoypDvYKO9
	9Eh71+B+/Ah7u3alVMJZj/Cs2QpFXMZ0iIXvhuEJdwid5dqW7Zqy8XnMUm7S0A==
X-Google-Smtp-Source: AGHT+IH1n5rgepkFv+DmmmLViOZnDel/iUrOgLICLSZETgB3GeR4REJxlmdXw7sr6mA1VqvgfFFkzw==
X-Received: by 2002:a05:6808:1990:b0:3c8:665e:1e57 with SMTP id 5614622812f47-3c9852c99fdmr89999b6e.25.1715099236642;
        Tue, 07 May 2024 09:27:16 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:13 +0000
Subject: [PATCH v2 08/18] media: siano: Use flex arrays for sms_firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-8-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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
2.45.0.rc1.225.g2a3ae87e7f-goog


