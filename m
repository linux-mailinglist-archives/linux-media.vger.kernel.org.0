Return-Path: <linux-media+bounces-11071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74D8BE8EB
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1E61F21FB9
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB8216E863;
	Tue,  7 May 2024 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UA3k66DF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586016D9B2
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099238; cv=none; b=iKPY4L+qmLd8vE6VleV34NUXIZKOgCKi9vF2lwqIskXYxNBuod4gstpmgX84p5RwTMTZJg5MA9LXoFOzaIrmDFYGdQ4spBIE3G0Tpw1oitbladTAJyUqhki4IOl0qomvGWiT38T2KAnyA9pKwG6hqlIm3PgxmFSnHIIMAfg+NbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099238; c=relaxed/simple;
	bh=ENYjVBtJ4EPS9w/ftPm8y0fja8ouSlg/VUcwtfy4KyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jll0vjnwJCZIPmaDDXfe2rl+pSerOXDs8tZong8ueueIWwkH4Vy0Hu8blGgfZUYaLXZOR3e1neQD6E05wQxKw/CjZVtkmHeVWGStVotUewmWvfRNSAcmmGqvNXVk1drIVdi4aVbvPMErBKBEqQiExLoGbZurLSA9gFDDjNAhTWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UA3k66DF; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4df4b388887so534078e0c.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099236; x=1715704036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bajBIKBKiGkzVrECr+DrCDdr2oyOzpQYYR0WAIoyaos=;
        b=UA3k66DFfs3JyEw6Ln1PQp42U0s8/PnEhrADYrBRrV68wiEopRlrjbeo4QlpOpjp8m
         3kJidugwcb8u74p5/ZEfcgZQKRRPFFnD+3pISJp1t12on7X+hI/WVwUe9IAaru/GLXM/
         fcoJmssdPd1J55izmRHLqXY1UCsYcwziFqODQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099236; x=1715704036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bajBIKBKiGkzVrECr+DrCDdr2oyOzpQYYR0WAIoyaos=;
        b=peKjVqcPFXKDzU4wp9GCLfDkw+cqEH3iEw/nI47AWCn7mzelg5wpAERRJxnoRMgULk
         Dj7/QZYqdwYPpimtgFQVUbKNjz3q4YsdOZx6e2a0SI/LEQynPH48UfqxIDEFW9QHRpm6
         k7FQUxOvWUXAJ43ktobuPEIQx0x+oAyP0TncVGe0EbjPMuCG+PZWpKBcxasc2ohhq543
         6KMlYgbRN22JwsVP/LKHDKxvkq8BElquygKLx/eXWS31w67Tmhl65785B/zG9Wgcp2yk
         uHB1HiR9lrojlG6Bmb4u8nnFC5MNuztGYvZzV/jIshLGRgAKgQZp3LJu73/Hx/7Bczr9
         TV6Q==
X-Gm-Message-State: AOJu0YzaHg7VmMKNY9vyANc61mDWv7P8L3MPwpiV6Fr2dNpGDN+E6EaI
	/B2KC2ov83652rM2nuatjK5SAJpvD3AfD8tPA9qz08wWPlZ9iFKtMF9hnPi7eA==
X-Google-Smtp-Source: AGHT+IF792y8yHb1G1T8p5qXRpEfx35eaFsBGY9qOmU3ppGSWJfi2EDsEDzymoanJSEvwZpNFlF1oA==
X-Received: by 2002:a05:6122:2a02:b0:4d3:4ac2:29f4 with SMTP id 71dfb90a1353d-4df692a6b65mr38747e0c.2.1715099235965;
        Tue, 07 May 2024 09:27:15 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:12 +0000
Subject: [PATCH v2 07/18] media: siano: Remove unused structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-7-7aea262cf065@chromium.org>
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

These structs are not used in the code, remove them.

This fixes the following cocci warning:

drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index 46dc74ac9318..bc61bc8b9ea9 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -1042,20 +1042,6 @@ struct sms_srvm_signal_status {
 	u32 request_id;
 };
 
-struct sms_i2c_req {
-	u32	device_address; /* I2c device address */
-	u32	write_count; /* number of bytes to write */
-	u32	read_count; /* number of bytes to read */
-	u8	Data[1];
-};
-
-struct sms_i2c_res {
-	u32	status; /* non-zero value in case of failure */
-	u32	read_count; /* number of bytes read */
-	u8	Data[1];
-};
-
-
 struct smscore_config_gpio {
 #define SMS_GPIO_DIRECTION_INPUT  0
 #define SMS_GPIO_DIRECTION_OUTPUT 1

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


