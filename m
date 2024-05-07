Return-Path: <linux-media+bounces-11065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F98BE90F
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C0B5B21016
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC61116C69B;
	Tue,  7 May 2024 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XxRE+I/T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B5816C434
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099233; cv=none; b=Gkr1P2kk1VQtxzWxUBk0tVpV1GCD76d3o2o9QVBs4hcQ0o02/QsRxeD2PO2eE+grewXyHovGqEkTEHjtRSPOPHfIt7HbwDqx+Mt4h4PGrlpcehR3AChH4CUZAu7+KUTewTGsRx4m/KsggyLcxBhHfbWpkz2r36NvnVzAXWK9FsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099233; c=relaxed/simple;
	bh=znTu4kcBZIJ40DAZAzE4ZarYw+mhmMYgFA8GYOICILk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuQVBEND0tONHGzQjLggSE4NdQzcuDktJfArroWpgW88uHnFAScdOq100J+yV1Su/EAMSOq1Hx6xZNMaiSdVWcLKbUKGhnrk/3JOEehxkKuzL7ALJcGvs8LbPRZitHpwtkSQGo0i8dzOlstUs4+MPxwcD6N3uBoYuWjmgcoy+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XxRE+I/T; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43cff222427so13955391cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099231; x=1715704031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvJOy5lJ/u6e9yHF9m7H/WFxuEXKyxfgmG432+rwWPs=;
        b=XxRE+I/TVdkqbZ70usqG6oIolpD7Sj1GI79dpPrxojndgCxNE+f3K4rMKKp8kAloPI
         xre8gfimtXQ3UyvB9XzsGI1YzMX9GjUk2eo3Tjjy5/K1mJV8rdIWoM/2LXzeFkJmrtD4
         JnmiYRf9UYJ8zhJolP5zKBVR8EUE66AeQ9nY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099231; x=1715704031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvJOy5lJ/u6e9yHF9m7H/WFxuEXKyxfgmG432+rwWPs=;
        b=C5zETEPcGqB8qBn/0QfyC/ftM4+Zs0nNcqsLCwnMTXVlcr/0XpkXlIX8gNpJa+EKlO
         iwxVBFC4dBco4aItfN73weUVYmiozXBQPdmBJCLBlY0HJq6k6D5ZS6t0QY8MfBsVeBnM
         q5XVNBjR7nokzJyLDQCREe6Lb3UuNMjROl46dEP906bATzSwlwmDiGEe4It/JJiPAYnT
         tzFL5biKBiBmFHwrmFy5efFPRMnmQXNvFt3jHOGaVn1y0NLDFvqE64006i1z4SWV9/Zh
         lErXXkFCcrRPNMmgVhjizuz73G3dmGpRKKnIaAOn6ECvXiXKsHxQTRrzEpcZGQ4DYtim
         L6og==
X-Gm-Message-State: AOJu0YymY1UclLh0IjSd7rZn4pjMGThTDXeSpqLyx3FXvF1/IHfNUfC2
	pxZHUWfJCY9CgLWWv5NVQVicOYQ7/9Gf3XuJM5Axcrr6iRx7B49facSp+9qyxg==
X-Google-Smtp-Source: AGHT+IH7wfmDbfR6Z2qEtq3pMk9IgeemDK1hAb5WzD+t2OuchV1RCwEJOdhdz0vPw5QCvormiuhN7g==
X-Received: by 2002:ac8:5882:0:b0:437:c024:73f3 with SMTP id d75a77b69052e-43dbef87227mr2207121cf.44.1715099230572;
        Tue, 07 May 2024 09:27:10 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:06 +0000
Subject: [PATCH v2 01/18] media: allegro: nal-hevc: Refactor
 nal_hevc_sub_layer_hrd_parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-1-7aea262cf065@chromium.org>
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

Replace all the single elements arrays with the element itself.

Pahole shows the same padding and alignment for x86 and arm in both
situations.

This fixes this cocci warning:
drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/allegro-dvt/allegro-core.c |  6 +++---
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 11 +++--------
 drivers/media/platform/allegro-dvt/nal-hevc.h     |  6 +++---
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index da61f9beb6b4..369bd88cc0ae 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1852,14 +1852,14 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 	hrd->dpb_output_delay_length_minus1 = 30;
 
 	hrd->bit_rate_scale = ffs(channel->bitrate_peak) - 6;
-	hrd->vcl_hrd[0].bit_rate_value_minus1[0] =
+	hrd->vcl_hrd[0].bit_rate_value_minus1 =
 		(channel->bitrate_peak >> (6 + hrd->bit_rate_scale)) - 1;
 
 	cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size) * 1000;
 	hrd->cpb_size_scale = ffs(cpb_size) - 4;
-	hrd->vcl_hrd[0].cpb_size_value_minus1[0] = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
+	hrd->vcl_hrd[0].cpb_size_value_minus1 = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
 
-	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
+	hrd->vcl_hrd[0].cbr_flag = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 
 	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
 
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
index 9cdf2756e0a3..575089522df5 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.c
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -210,14 +210,9 @@ static void nal_hevc_rbsp_vps(struct rbsp *rbsp, struct nal_hevc_vps *vps)
 static void nal_hevc_rbsp_sub_layer_hrd_parameters(struct rbsp *rbsp,
 						   struct nal_hevc_sub_layer_hrd_parameters *hrd)
 {
-	unsigned int i;
-	unsigned int cpb_cnt = 1;
-
-	for (i = 0; i < cpb_cnt; i++) {
-		rbsp_uev(rbsp, &hrd->bit_rate_value_minus1[i]);
-		rbsp_uev(rbsp, &hrd->cpb_size_value_minus1[i]);
-		rbsp_bit(rbsp, &hrd->cbr_flag[i]);
-	}
+	rbsp_uev(rbsp, &hrd->bit_rate_value_minus1);
+	rbsp_uev(rbsp, &hrd->cpb_size_value_minus1);
+	rbsp_bit(rbsp, &hrd->cbr_flag);
 }
 
 static void nal_hevc_rbsp_hrd_parameters(struct rbsp *rbsp,
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index eb46f12aae80..afa7a9d7d654 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -97,9 +97,9 @@ struct nal_hevc_vps {
 };
 
 struct nal_hevc_sub_layer_hrd_parameters {
-	unsigned int bit_rate_value_minus1[1];
-	unsigned int cpb_size_value_minus1[1];
-	unsigned int cbr_flag[1];
+	unsigned int bit_rate_value_minus1;
+	unsigned int cpb_size_value_minus1;
+	unsigned int cbr_flag;
 };
 
 struct nal_hevc_hrd_parameters {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


