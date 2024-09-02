Return-Path: <linux-media+bounces-17369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F12968975
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA5B1F22A7F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0543C2101BD;
	Mon,  2 Sep 2024 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDtmVYQE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3541210194;
	Mon,  2 Sep 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286083; cv=none; b=FMmkBeKttAZKWw/IqVR2v0eo1ppc+9QvuOR2tAiiFVeOp+IHCxydq+xK4rcw7U3AuARRA2EhqERNKWvYNZeGmr1sRGa4YbgK0EuQuShVtDwbJqobyDh6ngaC+1ivRh/lnfiavILEgNhMmU+RLlKjsfiSMW4AtQs80nCxEW50JT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286083; c=relaxed/simple;
	bh=aSyUMv+phorKQkVAQmMtTKKipCQUv4QLRusinzzXTMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VPRbL4Rpec3QKKXy1Bm8vucpO0OJDDf+Nx91ILAq2phFKBPiNkWO0lZrLF5o1CoSwYJbrODGU2PvKumBKMZyhQ9h69X+yz+H8BSRRJBz3fM6ElmCogwywktxp8PnKU3h1jFPjzKnRLPoDWtmiYXfqIwHd6Y9GxPZcgGg2Xee8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDtmVYQE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f505118fso48726981fa.3;
        Mon, 02 Sep 2024 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725286080; x=1725890880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiC3B7wWel8g1IjOYuF3tkcRLgYjGThJArjLJQX88Ug=;
        b=NDtmVYQENKLBjNcLscAC59OT0ZdcputRfiNl8k1Uv8fy5V29RKP44QwPOthcsjemuX
         WVUcIBxMEIITpwzOe/T8uDFXoN+Pk8j3WLd9rcDafhH21UZyIqr7QkoSX8y7pfL10Fny
         N5a4j1CL/93ppU+GN4jB5m2eYQnKEgGBM0IVCzO4IPSeAMXZl7QT0mx7TVWjd77EVTzS
         ucArt7rqLugMfRyh6HTC9OZb6UxKJ3s+5pZdKwabqCcwR4jXLKBF7RzNsubB9KCTs1ZI
         bmnD0h7hDbSMhq/CDpxLIczANV8KEwZnnmd9kScria47OhJYzTnape7jmRo4GhKtyR1L
         e1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286080; x=1725890880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiC3B7wWel8g1IjOYuF3tkcRLgYjGThJArjLJQX88Ug=;
        b=FMcMQ0EJSA81lo8BwHQmTaU8oA21mXyuq4uXXjdZKmKclz5VAVf8zhggEhQT+1gmh9
         wiKqXeDe8b7ed9/MszQPv/A2C58UP1yqMaufeW29uPtTZrKYazU7vkjgOtiBc1tP68aO
         3sR6mlJAKoRApFwuWz12AGxAXAlORAMMRz0ooUUGUZeDqajsJnNdsCnMm8uc8HcTf22Y
         IENy20Jwr0xLP1IzZNNPgnV0VA6NSbbOxZCR0avIqT2+7IVTL7o2+DohjL7v6jII+F6j
         oTx+y6rjDQZeH9YDZbV+/vYU/IFW/hhsj8Kvk2ScbsCSeTy+PuP9V5J206KgizHkMImf
         3NJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/nL9xSM8W7HPrY0XnFR47EFmb3m2+lqNnalNVLD6hhdYUuHB3ykg/gjLzpHBkmgY8Pu0iQ43q04JC+6E=@vger.kernel.org, AJvYcCV/1cKs6w6X7VrOLQdFcUc/M1LOJJm8DQa3E1Z/GvLqcyVFUQrT8G1NQ5U/0tBMNq23rH19SlCbqCz5hQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/AdJh+GkgVs9vFQs9mSOiihXMcyAzzgMZQD77kpFd5jC9uQI
	/bARbX2H96PTsoSppkstEgP9Puaoiqh35iHuB3C4lHVB2fU0oxxfzmu6WZUn
X-Google-Smtp-Source: AGHT+IFoj5VV4GIPUolNGR2fXp6lt0IDaKyyQn244yprTyyO8JNuLOnzwjTsIlOH+K2Z1aj6fOdTTw==
X-Received: by 2002:a05:651c:549:b0:2ef:1d8d:2201 with SMTP id 38308e7fff4ca-2f6265841aemr53419881fa.23.1725286079480;
        Mon, 02 Sep 2024 07:07:59 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbd46b60bsm82240025e9.1.2024.09.02.07.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:07:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: mediatek: vcodec: Remove trailing space after \n newline
Date: Mon,  2 Sep 2024 15:07:58 +0100
Message-Id: <20240902140758.308202-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a extraneous space after a newline in a mtk_venc_debug message.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..59e56b81d5e0 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -515,7 +515,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 	struct venc_frame_info frame_info;
 	struct mtk_vcodec_enc_ctx *ctx = inst->ctx;
 
-	mtk_venc_debug(ctx, "frm_cnt = %d\n ", inst->frm_cnt);
+	mtk_venc_debug(ctx, "frm_cnt = %d\n", inst->frm_cnt);
 
 	if (MTK_ENC_IOVA_IS_34BIT(ctx)) {
 		gop_size = inst->vsi_34->config.gop_size;
-- 
2.39.2


