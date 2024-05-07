Return-Path: <linux-media+bounces-11018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE828BE3E3
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2693428C276
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3E916F271;
	Tue,  7 May 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RDMbgFrt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68616EBE8
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087924; cv=none; b=mK7NwtE7piIZqZDqs27IQ+tvO4WthDSWn1F/WYyQ8fZKdFAxlDCpMqD3O9fqJmWdRlYljUKaZFED6bYLwYvzKOHKPLNdjtAIrmNnlkH3hprSmHwkksfeYtozow6gakBhJ3++O+KJwVcrRmM9WiLPnQoUKWVwkqpQrkBAgz/moWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087924; c=relaxed/simple;
	bh=cqQiASSb1ke8R5KptOfAxJYuMrFDRm8Ouf7QBhfinuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isSeVck3B6ZI1lHLgUoL00fY25YKVbcz6ajELIpHe+ieNd9h6PhdxOH0t6oGOHdMUNjlhGucjI6+sI71ww0dDhyejPhB2yuENsmqnWDezVrftDWy4xZsf4hgOdQRElCNtqVpaw4RikyKWAKvYY8f7JRiO7me2AT34UccFPwSG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RDMbgFrt; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6a0d1032362so10595116d6.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087921; x=1715692721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Dzq1v7dj+VBVNk1zZzFNzIZj2cxfHYcizI+MBp1ZX8=;
        b=RDMbgFrtVCgPuxbnWbZH1qbBZ7pa/VfszDw/xgHARRfziEaMkRLGuDthwezlyexIIg
         +I+DgiQD8mukDI8r8lffQ73cBecqHxyhKEi8kTzHeKh1Jq99YJML+K5uJIZvtHl5r95C
         G+WqWVekOUJH4IrPCpBsTu1obb6pWA8Bpo9dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087921; x=1715692721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Dzq1v7dj+VBVNk1zZzFNzIZj2cxfHYcizI+MBp1ZX8=;
        b=ALHBXddRNRzYXdna2p2yWcO3swZoswLQBgeUfqaMT3mSVWbo8vqItMVtzVeuMEHoq6
         NWkVkRHEUb9Nu4BGI1zgrM4pCxDsyxDy5oe3fIlgTqyRJmFoaGeAAdailWcoh4ZboIGy
         AoCcFxFV06nn9q6mUxgdOzobPqwS/Ikj2wR7K56x1wMnmiWCLaWsO3BLE7PBYwi48bb3
         JZDJEtE59idr9POgvXgFN0l8U3tGHorRBtywWtIkxCzleY5LQnZqpxqvy4/EoiGREY4E
         pTjB0Vaqiq7WTvINpOykiblO9Lq2DQ8DLgLUjgz+bGMa+1dkCliOLkKnQKFFKczY42mi
         RLFw==
X-Gm-Message-State: AOJu0YyUD/tL9cCBBJTNl20Wm9+03RXepIhrKyi2bPkg81FqDwGx9ItL
	W9j11p0clAvT8/rp7BgpYwzdSsM9wa5swQ3gp7mmw2z/2nnvCE7tKGAoobOSnQ==
X-Google-Smtp-Source: AGHT+IEAUZYdUkG16+sKKGfbxJ3Nv32xMw8WTErK9sJC2vrPaqjhZxuw8OroCcIO1SEdeCxTaiebPw==
X-Received: by 2002:ad4:5be8:0:b0:6a0:55c6:9b47 with SMTP id k8-20020ad45be8000000b006a055c69b47mr16507653qvc.37.1715087921664;
        Tue, 07 May 2024 06:18:41 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:38 +0000
Subject: [PATCH 12/18] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-12-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
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

The struct hfi_session_get_property_pkt is always used to fectch a
single property. Make that explicit in the code and avoid a single
element array at the end of the struct.

This change fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:194:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 8 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 3418d2dd9371..520ff8a587e6 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -401,8 +401,8 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.size = sizeof(*pkt);
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
-	pkt->num_properties = 1;
-	pkt->data[0] = ptype;
+	pkt->one = 1;
+	pkt->data = ptype;
 
 	return 0;
 }
@@ -1106,11 +1106,11 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.size = sizeof(struct hfi_session_get_property_pkt);
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
-	pkt->num_properties = 1;
+	pkt->one = 1;
 
 	switch (ptype) {
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
+		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
 		break;
 	default:
 		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 6dff949c4402..e1dd0ea2be1a 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -190,8 +190,8 @@ struct hfi_session_resume_pkt {
 
 struct hfi_session_get_property_pkt {
 	struct hfi_session_hdr_pkt shdr;
-	u32 num_properties;
-	u32 data[1];
+	u32 one;
+	u32 data;
 };
 
 struct hfi_session_release_buffer_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


