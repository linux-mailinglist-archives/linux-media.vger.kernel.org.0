Return-Path: <linux-media+bounces-4283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874083F2D3
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 03:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F412859AE
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 02:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B343C440C;
	Sun, 28 Jan 2024 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gBOPEVmy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BB15D1
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 02:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407945; cv=none; b=VD8eWjiTjfDkfCPGBbk316SnsmjHnXNQYhOwO+69EzXEYq1h06oAfGcCgnnLqef+m7BzcqKqWz56NNdZ6I0Jw/c1q4/yRWslzRRPRb8isoEVPP7SRSOVgb5PfSQ9rXLpLlK89XRh0BRwgnG5vLHTwNzQ59JHeSJoTn0RRpUbCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407945; c=relaxed/simple;
	bh=Nh29uFhKJi602G3prs8tELRuSaiBp8xa7lI2rXd2Wvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTb2PIF7hCxnUOIUTXQAr72spFW7b/pBp5MpVlx/VL3yosNk9e1Dow6+ZNqxC6HElZz0dGTWrPiNvEWn/RsOOfLdYWHBnVtPMcxSyVP+7ZL2AcQ1N+mtGyXF80/H40RV2I2AJl7yH3a6WpmEM6p5xgr34b97y9yRefWmO9EWyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gBOPEVmy; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a99f34cc8so2795261cf.2
        for <linux-media@vger.kernel.org>; Sat, 27 Jan 2024 18:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407942; x=1707012742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=;
        b=gBOPEVmyjaXkTxEgfMbxFFUjQaKuhD4isds40+acoBqC7SPRB1DO0aJ2GZ7bhpnEyH
         EooYm6VU8gcx7Tic8G60asyR0LCtbk4S3zpCJpH82rikHnCdfnRD2L3+BSIL8CBKrCj+
         XDgOgIgkTGG9KtO7k9uQs3RCtZwRidsEA95EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407942; x=1707012742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=;
        b=Yr96QTdmNjNZhdYdy9WTKYZbboYrTqKmQNhpK89iwOgFUoB+OfFQsufaqzbGYBt6cE
         pSRaeGijcA4buAalCIMldSrdAF8ShIgX1yQeTWkNvx7LTnIvBt9Hoaa8BU5LslOj/+Ge
         ZL2ZRppKt6frJlirzoNIqgGD/ajsAlH7UaAqUtVPp98zNUHAHlaj8blBbRLxg2fHx6gU
         mVOcbjYU2Z1KGBKrcCXMBiEQizMm3p8XjapttlAiHrcuV1Hy1mVjr6JQDHdk8ozdeZMp
         EgtaFsSi7JKTQL6/VxRNbCmB3GrsnCeIErWzRqFQkPxxIJwndq7HrysMr80GXOvaYbue
         toDw==
X-Gm-Message-State: AOJu0YzfMwbMPRhJruPEIbivMrPCBK7Dn4/nKpE3ndDXjaykfCTX17Pw
	QsCfrKCfkOGublqgIkRwZKQd8RNVav8FTvyMf5MI59Z9fZaUd9By5OlC3XKXtA==
X-Google-Smtp-Source: AGHT+IEEZr/G/RgBFCi06b4c43fIXB0Odt7evUICu34JTHlyZ3GvGTVQDDbpNKHMg99SUGIH+6qSbA==
X-Received: by 2002:a05:622a:49:b0:42a:8630:3dfd with SMTP id y9-20020a05622a004900b0042a86303dfdmr2871708qtw.87.1706407942502;
        Sat, 27 Jan 2024 18:12:22 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 28 Jan 2024 02:12:20 +0000
Subject: [PATCH 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-fix-clang-warnings-v1-1-1d946013a421@chromium.org>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
In-Reply-To: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

Building with LLVM=1 throws the following warning:
drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e4cf9d63e926..0a3827575753 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -757,7 +757,7 @@ static const struct video_device video_dev_template = {
 /**
  * vip_irq - interrupt routine
  * @irq: Number of interrupt ( not used, correct number is assumed )
- * @vip: local data structure containing all information
+ * @data: local data structure containing all information
  *
  * check for both frame interrupts set ( top and bottom ).
  * check FIFO overflow, but limit number of log messages after open.
@@ -767,9 +767,10 @@ static const struct video_device video_dev_template = {
  *
  * IRQ_HANDLED, interrupt done.
  */
-static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
+static irqreturn_t vip_irq(int irq, void *data)
 {
 	unsigned int status;
+	struct sta2x11_vip *vip = data;
 
 	status = reg_read(vip, DVP_ITS);
 

-- 
2.43.0.429.g432eaa2c6b-goog


