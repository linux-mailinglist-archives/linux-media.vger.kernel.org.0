Return-Path: <linux-media+bounces-11068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F98BE904
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9991B23468
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3793116D4E5;
	Tue,  7 May 2024 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XAmU4MYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4116C870
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099235; cv=none; b=UTr1HgBXgjqCVMrBIIB9ua4VnijNLboM9O+TUvXv/+IdDbKG9A5TKjp8n3Sd7sXUovYlXsHui77lu1PbcJAvy7PLAC9Qsb0a2/9YOiYemWwGp7XX5aXjS01hF4KMrZE0el++oqiw8XFImQy9gXpKhCDjeFuVrfFpTvVmVBuj5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099235; c=relaxed/simple;
	bh=OkrWWOrUN5GNEWioxP3gYdPUo0/0BfsqCVC0RCoziIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYsnMtiz/oi15lRYBKvkhGPzHTzdj4B3O6XslC+CLaebBiX0gU2aGsE51VRC8GP4Lhp1KaE7ym/sK3MDkaB6DyaAGSwekT+tkxGEH4ivQ2xMvT+wGv8BhauPqTaPhW7AwC6AD1LYm1XZ9q5RpP4z3jOGYqNmVc+nZDZSlE5UpJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XAmU4MYL; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43d2b4d4d3eso11665871cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099233; x=1715704033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/P1ujR64RjpeY3CCEbW1xPPMvUuqlT7weCmbLOLgyg=;
        b=XAmU4MYLi02oAxX+z7YpNhFUitd+z+s2/ZOhYAy6yaVetxmgXSpGURekWjjgAUa6jG
         VIm0RbDfmm7P0O5j9sHsPbV++h8J/7OD874thrmLJyGM9oeyexdvAe20zb52YWmfPcCe
         mQeE8LW6y4KVyL9iTrbV68gBhmLkSUAkRijBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099233; x=1715704033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/P1ujR64RjpeY3CCEbW1xPPMvUuqlT7weCmbLOLgyg=;
        b=FOIXjgJjE9HyX6Xrr8nhQYK1MC5WQMwFPYn/MFA2AOvVJNXfbwGIs8Mgf4cjRQDNcs
         8Z2EZt2laxm/Turea6TCdHo/uu9gAZ8oQ6j83cS9Yz1JZNHyDt/wyi3xFHWU9r65W8Ns
         Mo3iiXsVbYGWk2o2+cWT/9/0XGuL4j0SOJoDO4hNY2y+59bCXyfyffyh4xVo+CfGrvzx
         lnB37EnoXSfFys+mRASPNcEEQ6bRXW1cch/mkCqq+1gUnMrl45+FqqV+O9916cpQoIB+
         mCgLabJEixmRV2GXN7BNlaiTDNy/hZBc/eTFcjgD5si7lWymcskZI5KplzxBTyvs5WAM
         Xh0A==
X-Gm-Message-State: AOJu0YwQrin6BeYq0wtHuCguPzsQxnNg+9ugCGYsLjLYNreCewbV0N3p
	qtkIjdIcdetkQ5P+vsc+YvlRnnRv738HgPVXL4TE2baj4eCxbQaL2bIbGaM5sw==
X-Google-Smtp-Source: AGHT+IF13hjL17rg1ksLknz8RID4/qPhKnOZgs0TD68SX8wPAxraoJfg23Be6Og+r0EAzRQ8G/LBRw==
X-Received: by 2002:a05:622a:2994:b0:43c:748f:6e96 with SMTP id d75a77b69052e-43dbf622550mr1868001cf.39.1715099233022;
        Tue, 07 May 2024 09:27:13 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:09 +0000
Subject: [PATCH v2 04/18] media: dvb-frontend/mxl5xx: Use flex array for
 MBIN_SEGMENT_T
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-4-7aea262cf065@chromium.org>
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

Replace the older style one-element array with a flexible array member.
There does not seem to be any allocation for this struct in the code, so
no more code changes are required.

The following cocci warning is fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 3c5d75ed8fea..512ec979f96f 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
 
 struct MBIN_SEGMENT_T {
 	struct MBIN_SEGMENT_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


