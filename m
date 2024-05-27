Return-Path: <linux-media+bounces-12040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B158D0F32
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86051C209AF
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1931B16D4FE;
	Mon, 27 May 2024 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gZOcqluz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739516D31E
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844155; cv=none; b=bFZaNYaujYMB69C3vDd+b+TFAR3aOKataduB/o6egA4CNm72TEtzOGTkR8kVsfTIBiGko3lkEH8xqh4Sp4ui6EGYZVmLPWBlzE51fwJjctH7vrCx/6CbJGfuyh3ErRaPrUuoFl2E8aaN0XScGtSuWNELaW3Lvqsuplkqd2sKWW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844155; c=relaxed/simple;
	bh=4i7VPHSnsqzbI0HW0QkAUX5lIBSz3TuveGC+pMCiIHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rL2frdIEk9IhhpIitMVRFRmNalIx5bp9G/6Rvx8YTli46dQslHNT1v6vK3ik4opqgOkwniH8SFnPakKQowYLNwox4GW1G8T87meZew8OuxOPbO8pLyyleCWgNTO479/sBYvgBCnfPYP+EsOZ2/PTCLaUBhVlwM8S00Se4XcpxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gZOcqluz; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a2424ecdaso1431567b3.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844153; x=1717448953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3fZDWwdSfr806tKPwKAlFoXNkHe5euNILjrUm/nl8g=;
        b=gZOcqluz3b2KD6mADEjHMQGWJcW0YwGnUQsgxkPEoAUkPptRkgwicBvhh5OdGeH8Jp
         7whmhiK5sIBJLG03keF7/qDv4mz3H6HddJpqqvcFbcz3NjVKda17EJLMcB0n4OPDKbiG
         KRnk6nb5GDJLxQV3yf3EYHX/YPKmOjpuC9hUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844153; x=1717448953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3fZDWwdSfr806tKPwKAlFoXNkHe5euNILjrUm/nl8g=;
        b=imk2s5Zvh9VyONRqwAVWMsdAEVxlcpWwW3AJGvZnVAQrKNbF+NyvveeMKIeIgtWkxj
         BFoHpvvYvwr2qw1lUU6FZnIF6JWamX1FVu/NIcXDNRYQY/pvmZ5BIJjj9l6EsMogXUmA
         5iNEOOXGGsHtAhMlFZeSc0wtLKKimOMJKv+6b1HScnM/yZbedcinkD//JzXMZp4pyLPx
         powouaXzrY02yviyB2Y1Dnv6gymLI3D8DszmfBZgF+tTFvgFHPP2Lg1MT8zFncVxd7Gh
         Hf+ic6dWcJpMVdC01MXM/j9FV0riQC3XG+mkJB7VrbN2suLQ/cakHcmh1/x7lGvZNJYW
         k25g==
X-Gm-Message-State: AOJu0Yx0LSZKrwEiuhnSi+bIfBSqwb6YhU3cC1zcvK8Gm+o3JhTRn9XX
	F0rV4HznFqhmaEHyD2kPqxUPHQJsFagwwRBCKmXFcmO3fWnDhbXosMsT0yacGg==
X-Google-Smtp-Source: AGHT+IE7yvawDvvPTW8z16+danN5kIYa/qq3kf2XRt5s2NEtmjukpOxQYCxbSk6UfuH55Or4GMU6Cg==
X-Received: by 2002:a81:a105:0:b0:61b:3484:316b with SMTP id 00721157ae682-62a08da0820mr90061817b3.14.1716844152764;
        Mon, 27 May 2024 14:09:12 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:07 +0000
Subject: [PATCH v3 17/18] media: venus: Refactor
 hfi_session_fill_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-17-cda09c535816@chromium.org>
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

The single data array data[1] is only used to save the extradata_size.
Replace it with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:175:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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
index f91bc9087643..daba45720ddc 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -172,7 +172,7 @@ struct hfi_session_fill_buffer_pkt {
 	u32 output_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_flush_pkt {

-- 
2.45.1.288.g0e0cd299f1-goog


