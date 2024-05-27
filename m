Return-Path: <linux-media+bounces-12041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1138D0F36
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ECA91C21494
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB62F16D4CD;
	Mon, 27 May 2024 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MbJskAPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018916C868
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844156; cv=none; b=jFjOMwEzW6XSi5M75eSgrlXHBk0XY/AvCLSNt7zAdAiJ3AiOX9KDw78K93jGr1MI5bVvvrGtTa+4IfBr79Gc6kyrRvwvHT6tiiWgWfqfD33QxApxdsu+N2a5uFLK41eRjeHnSsVUPA1xBZLYHivPkWB38bUszhmrcqjo5Ed0E9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844156; c=relaxed/simple;
	bh=vq5XPbrneys7sUYRmsmLUBdJqp5KlWLzYqdDrrKd+uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIflGKe6TnStizEFAjyIgNF7RYBAw9JUabOKepZbUrvYck2ExoGDAcAcs/GmlPLOozx3SvN3fy/KzREAWQorQdxEeoxyN3LAiED8AHK5X/HjteC5/0QdH5/byT42ejhSTyqoOKRlLaIWgD97w9OuEsLNQhRgbsdDAT4QNu4c+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MbJskAPc; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d19e57c80fso116640b6e.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844154; x=1717448954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wezSjtqVEo6M70U5aktCNd9/8NZeYOZUNM9cGTCe/BY=;
        b=MbJskAPcSrvjOAy0DviqwXBsFX3oEGs3LqpCaCu5mfZEwQ27ILECF1dEjWwxt4G2hV
         dGjDi0u3uzAePispGYRrfmmDaZEEeMAQEL6nixoVr0jbtdutbgAybTKezMCyTum8w6u3
         VDzyXS6gQolJ3f3okliB5PRqIewCT4VXPnqdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844154; x=1717448954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wezSjtqVEo6M70U5aktCNd9/8NZeYOZUNM9cGTCe/BY=;
        b=Ka612QujnII2nGrsJcwSeUqb2e9FrzbZWV1oVWa2jeR7drjkNfeKT/xKkADGyZjrgs
         uvXGB7uANP8gIc4Igp3y7czyxgixCKBh56YzCw0iSMsDsPb303biUBnIV2NwsOI2pbN6
         FiS6revmrYZ/BZrhStNDb0SrlaXN86brGSumd+UKAmLcE8T6SrIGYAziDYp1a3FpmzQd
         DNrNgLkamOegMTc1Sn5AKpC1uiti69RpXDAwKWcP70CzaGElZdoOWoAqcBsgdKPMisio
         ilPrD7PDQOVt/BoJgDnptzgaOr2TtG+S4/nScnHiyWKCnaWxrRGjP+ssfSHGYeoQlu/W
         G0sw==
X-Gm-Message-State: AOJu0YyBwjo4dl/il2zSp0erkq2kobiUagFahZYQONHmpfHJUkFCuDtt
	In8LK7XHxKL6u/cbFFaF998u8U/nhiiF+CkNPw1urfVyWhnKq539ejoKjlfThQ==
X-Google-Smtp-Source: AGHT+IHZsdfjWuFgWCiJb4AmRAsbbEEenzn0gNbNiTM1mFHuclImhi2FXMMkXzq7m9/5FIbemAWbig==
X-Received: by 2002:a05:6808:199c:b0:3c9:c7a0:94f7 with SMTP id 5614622812f47-3d1a50ad2aamr13149063b6e.1.1716844154031;
        Mon, 27 May 2024 14:09:14 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:08 +0000
Subject: [PATCH v3 18/18] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-18-cda09c535816@chromium.org>
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

Replace the old style single element array at the end of the struct with
a flex array.

The code does not allocate this structure, so the size change should not
be a problem.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index dee439ea4d2e..9545c964a428 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1230,7 +1230,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_metadata_pass_through {

-- 
2.45.1.288.g0e0cd299f1-goog


