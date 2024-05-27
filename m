Return-Path: <linux-media+bounces-12024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6728D0F00
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4891C20ED7
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA41667C8;
	Mon, 27 May 2024 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dzsnouHG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A47715F335
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844138; cv=none; b=ChyhN+C36hFTeNWs3I6MFyXffsZN0JQtolZcCmUE2c1UkpHjRC6nKfJdb7xvn+ZCmimKIMyJxYlZnLYSenHD+J4go2Aamb2AsIFYii/sA35qij4d6BLXmvRdvGCr5pvsvdpHedLZeywWzm1IKbL0CILpnQPQAQLHmatxTaDri2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844138; c=relaxed/simple;
	bh=JSygS4gzMJ/tHT/j3LMxdo2fBykWODOKPWAhI9tH2kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKyqT12BzxSybaZPu5bLAH+tL85zHab2KayvxbSUPx2pDcE6y6FoBrYc7KkJ4FRJMtX5CTSl1V9i1R7wtzKGQhytl1N4AiBYBT7MIS4gMMncr4Hu1zb7loe34RqduLumVfVIOAOefjyIJPTUpZIWrLL/+qTffm3jzpBNnH7sPBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dzsnouHG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43fb094da40so28066241cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844135; x=1717448935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nd4v7ke+Cy0nQV6qfaxBYuXvHeijlfFLOED6efio0lk=;
        b=dzsnouHG3jS54O7qwP2Equ3HYnxbcKBuse7ievqjO8sdON7g4hEZfDS8GgVTRQKLIw
         1kBszvjBzZea/pYD2Lbt+6s9FBIfcS+BN9ZMgWq2SLMu5WgOqPrH2MQA187J28XkNyjb
         SNhlnq8+PnSDl6B2hHnDQeEH50KUW7zuLlD4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844135; x=1717448935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nd4v7ke+Cy0nQV6qfaxBYuXvHeijlfFLOED6efio0lk=;
        b=bGLTQ72t+J5Nt1V9gbzBYcRPzUE9qYTmkrJxd2aXLPCuuKbSlByp7AJPjyVsdvY59y
         s0FoPBvIYUZ+NFJJVfu0qlFKuJTE+230vUJLLMH7I6kcWD5ayFP9Zq29drvTegwbybcH
         9+lTfc3C+J20VBUbn7EWrbXFPX/ll7X0397fO9o4NJ/x1pwLS/L/JwRqvII5EvSB9Usj
         BIB8Qx56peHGIAnNnKf6wi4ERs/17pFJVFcEqCpFNTwyEcNC2XZDmkFQXabQLWfEQk3N
         xeEn5OTIjlO8kQcUVMrClEDIqk8z8mAJc8zc03uUyrartpKibM5/cNa2A5Cq6XUrJbmD
         ERdg==
X-Gm-Message-State: AOJu0YyCEDmWPFbLqmu9mP0yhLO63iHunIWMEOe9T39Kmig3PZeihPkO
	hJydyzPruQ1FmC8uCgYfisbDZXk5Klm1KmcfvECcHBAs5F5BD1taDPjZx8IX0g==
X-Google-Smtp-Source: AGHT+IFrp5m4vKJTJulTHuvhixEpNuF0CZjI5X9x0U2J+O2dhe08H2Gd8tgo/a4lMVfyPDSv08IJGw==
X-Received: by 2002:a05:6214:2b9c:b0:6ab:9a03:ff96 with SMTP id 6a1803df08f44-6ab9cfbe9d3mr169298836d6.7.1716844135480;
        Mon, 27 May 2024 14:08:55 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:08:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:51 +0000
Subject: [PATCH v3 01/18] media: allegro: nal-hevc: Replace array[1] with
 arrray[N]
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-1-cda09c535816@chromium.org>
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

Structures that have a single element array as the last field can be
mistaken as a "flex array".

We could replace all the single element arrays in the structure with
single element fields, but this driver prefers to follow the ITU-T H.265
specification, which defines it as an array.

If we introduce a new define N_HRD_PARAMETERS, we make clear our
intentions.

This fixes this cocci warning:
drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/allegro-dvt/nal-hevc.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index eb46f12aae80..361e2f55c254 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -96,10 +96,11 @@ struct nal_hevc_vps {
 	unsigned int extension_data_flag;
 };
 
+#define N_HRD_PARAMS 1
 struct nal_hevc_sub_layer_hrd_parameters {
-	unsigned int bit_rate_value_minus1[1];
-	unsigned int cpb_size_value_minus1[1];
-	unsigned int cbr_flag[1];
+	unsigned int bit_rate_value_minus1[N_HRD_PARAMS];
+	unsigned int cpb_size_value_minus1[N_HRD_PARAMS];
+	unsigned int cbr_flag[N_HRD_PARAMS];
 };
 
 struct nal_hevc_hrd_parameters {

-- 
2.45.1.288.g0e0cd299f1-goog


