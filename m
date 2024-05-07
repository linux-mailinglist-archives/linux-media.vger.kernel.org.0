Return-Path: <linux-media+bounces-11074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE108BE8F4
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498BE1F21B05
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9386316F0DA;
	Tue,  7 May 2024 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X0fcPP6X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678EB16E870
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099240; cv=none; b=TdmHnLK1KpSVTzaxKLS0ORUalzu4eValqQQzXsgD5PshglQwAW3MT+Qfoa/X7+4eY0uR+0aPBsCdWEpqBkkF+h4kliAHkov/AFn3fEX1M7a0+t7TbyMjpxBG5zqlf+hoe1b2YAD2nPr0GZj1tHQ9m27IFNKb6w0zZcTbw1kyfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099240; c=relaxed/simple;
	bh=9NQhYiz/IbLF6F7xrUyCvcZeCyvNKJflJvFw3WrA/2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htqnNuMngUNHpJ4D2+zrG9SFRJ9503o+K8ncnyVl7B+ein5CHAsdW/ZUXnLGIXV6VHacU0SanbJT1ANowKBgHJvbWaJAz4oZW1z34EOlzA6J85DLULGS6VwbmTTPMEZOZBGx33qkkaAlwMm7VVI/pVuPg88b9vqNCJKjAfo7Sq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X0fcPP6X; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43692353718so23891551cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099238; x=1715704038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WR87o59ttHnNvNigBqZHzwph/s3gT6BLw9Ga86sRtPA=;
        b=X0fcPP6XV9gErF/+4W1Z2PmcakgwH2aR6w5ezvGuPZgIgzfX67v7HlVU9wXeFvw0QH
         kjerepixGiDuoMQQBv35iqKyJ2r/dXb0IP3Y39y91FJjN9db8u6c2BQuka7Spfg7FjoU
         eowjiNN+hFx3oyTZf85+N3+nqDs+thzQI/e0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099238; x=1715704038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WR87o59ttHnNvNigBqZHzwph/s3gT6BLw9Ga86sRtPA=;
        b=AMmOfRImm2agyggzXG/mt5vD6az/E4ALMjmx230pIYBLlAnmXnmMdw1FbxbpYYdweS
         zaZZgBm9FbTU2L7KBEki9iC9qZaVvQDhQ7tSv5I5NnqFDqm7npFgHHb+uaageXQWbVdg
         RyKLITS3mHOBgurKClL/CCqSNK6UNsChwARBbESXvXYJ+Zi0cLCDF6bk+wn8LAdTa3jh
         GiFGtj808//5xNa8KYzC5ZEqGEfF2ddDlwY3qFEnx3uPm5CMJkDaRcQWEqN0RxddwfYv
         U89XNHxvEw8YkeO2vk2+31vEdOmSKbyprmzhhOQS/cokd7ES7mZXddxfjuPkpWvE+o/u
         j1Rg==
X-Gm-Message-State: AOJu0YyVy7EUFaGHjLozuo0R6RqgXXMhETxOI1CmDwaQtnpAWjtb3+3u
	kdkywXTR6LRicL2WC5F3cZa0klLNm5dkNo5JMJXYTSNDEyapU9m3snPR9DmfGA==
X-Google-Smtp-Source: AGHT+IGBjH3AdmiLQTQFeu7s9S83R8vO1MeeESLv5H1A9n7OSdIiA2Y0rCHZA8aZ7JmFdPuh3j3q+g==
X-Received: by 2002:a05:622a:1aa9:b0:43a:dade:7ad2 with SMTP id d75a77b69052e-43dbf51448dmr2415871cf.18.1715099238350;
        Tue, 07 May 2024 09:27:18 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:15 +0000
Subject: [PATCH v2 10/18] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-10-7aea262cf065@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

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
2.45.0.rc1.225.g2a3ae87e7f-goog


