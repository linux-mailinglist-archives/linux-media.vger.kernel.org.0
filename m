Return-Path: <linux-media+bounces-2980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0981DB29
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC03281F37
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D12FBEE;
	Sun, 24 Dec 2023 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3gMYgXg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A3D27D
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3368fe4dcb1so2117461f8f.1
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432673; x=1704037473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifM++4CY2AN5j3GtGQa7Fr0Vq1Ud5nu9DCFmNuIoJ3U=;
        b=e3gMYgXgFLp98BqoHoMagxiQmv972B+LRdq+gRJhLpkVmBSDHIkjXlZ2fTc/q3kj/y
         lrjDZfeP078Ozy3vDjyl29t9siJMD6CwekThFMkvyQkMSB7+RcvBbhbkHTwZfVtu4l1/
         qxbLG2Rno64b2LnvsqHTs9bnV3yJ0ZQ+jXdQIw/W8L+8CXACdEo/ks4KnBLXhikz/CRq
         6yeuu5R3tVzBUFDe9Zu/2vOn+KAg3hKVOwTpoUtlMIx78L9XZHiJajLLCyo9qztbURQZ
         MU8uxJ9rE776/GnNKuRBNz38RlySear/Gs9y/KC54wISRBOY0x62hebXD2lsqo9GE/Nf
         UkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432673; x=1704037473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifM++4CY2AN5j3GtGQa7Fr0Vq1Ud5nu9DCFmNuIoJ3U=;
        b=DpgYZRMQc0QnVGAyu9YT1w2DwOjuqBVWNae/kdHVSwKE/CnJtR21v0i7r2KBraoxL1
         Uig6lEHCfBBs2itQ96Z+7rOH5tc/Fg8U4Ygy3eF/K+Aux8gRiZc6mSqj+0sHFCSTsQxi
         +rsT7mIkABMQ3QRdXsvVNnAcNyvWkWKg6lBGnOucDDb3eyb9vMxQWQHZEFi85o1sF4i+
         HQPysFPHQp6A4Z9yFC8b2PPD4gg5UHJRrqI+TQN0OAfRTE4r9OH38Z4/+SLBU2t6l/l9
         5IsjEuwifs/0qtbTmRj3J5ZFbtphhHAs3afnzLuvsxjW9ug1mh3wmzBElJkLws0gvEdG
         OWPQ==
X-Gm-Message-State: AOJu0Yww262XSavdofQ9Ymy6tPhRwi4Ys0B4ehxy5oPPqy3aHEQsOrXp
	E/dI8NgU/+3r/oy2qBIqK9ReKwzEpKh37w==
X-Google-Smtp-Source: AGHT+IFwIlNrqF36iOB2bMuUT0fvY1qEd29x+4+MoJx19qAPP0y2jMFEUhBFwGBNwv2sHSJjb3I5uA==
X-Received: by 2002:adf:e487:0:b0:336:78b0:fd8f with SMTP id i7-20020adfe487000000b0033678b0fd8fmr2382956wrm.101.1703432673212;
        Sun, 24 Dec 2023 07:44:33 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:02 +0100
Subject: [PATCH 03/15] media: s5p-mfc: drop unused get_*_def_fmt
 declarations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-3-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Bu9cKmlSyC4/w5f8uYZH7ftPdCwQqPqs5pc3w6+5vaA=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHQ7Vv8mNU/Uxpc1qvHr4xaSsKIi9poePFpf
 f1r5W1+qCOJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR0BAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PXBS8P/0/+FdDNeDmfyhqYQhdrJRxp2qcJMuijQWYPzsQDgjPRVBO
 NJ8iJQ6h/pgLk+m5IZb2ntaXqvFEcLen9D5qfsVlhAe1onMQ0RddeGTbHt5MOvhvYaLjqNj8UKU
 J0gEzk6CPonUJx43LnK9KqXnLnidnluft8XlSDV1OglcZcz4xjWwQhNjWZCheDrj4FXi5/gE2bs
 SYnE9zlFNyqW2nbX41UT9mUWJ8eodpQccfCfD7k+9T3FLjfV5MSsXiGkhoG8zLFHvSO6Pg8ce0U
 hizPucD1vLcRdk0DaCWXMub3nEPn1g0udl00uXCQAv8VGUAx81tkIoo3ycDEJPHJYpjOG4//wia
 EzUpsWX9z1USZuaDteTh3SEZo1KvjnQPk5f8lTQ9Wx9kc8UDQbia7zC9//iINuEUh/6Xj/9s9D7
 mv1VHCuzqrSBYJIWx1IN7y//BR+uBjqFWTHw5zrhFtK2nd8k42kEQjRNLvSFBFpLPjyl7x96nKg
 FEDCLxrKuB7vLuBQxDGcrBEFfd0rRfSYN/2rncGcXP1HS2ECGYPBgBPTYWStBVZ2izK4UtLCdcH
 7+tWsuIrfiKuUR8iah19nLR344GWe1pv8fdJ2mez9SCCAei/0oW/g1c6HIr7dkpi2krMENbI30t
 o+py0zYY1w12LYWVJSn5w8ssGHgEQA/1O0RSI
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

get_dec_def_fmt() and get_enc_def_fmt() do not have definitions, so
their declarations are pointless.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.h | 1 -
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.h
index 0c52ab46cff7..d4310966a0c2 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.h
@@ -12,7 +12,6 @@
 const struct s5p_mfc_codec_ops *get_dec_codec_ops(void);
 struct vb2_ops *get_dec_queue_ops(void);
 const struct v4l2_ioctl_ops *get_dec_v4l2_ioctl_ops(void);
-struct s5p_mfc_fmt *get_dec_def_fmt(bool src);
 int s5p_mfc_dec_ctrls_setup(struct s5p_mfc_ctx *ctx);
 void s5p_mfc_dec_ctrls_delete(struct s5p_mfc_ctx *ctx);
 void s5p_mfc_dec_init(struct s5p_mfc_ctx *ctx);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.h
index 3f1b1a037a4f..0cf08b8d40ff 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.h
@@ -12,7 +12,6 @@
 const struct s5p_mfc_codec_ops *get_enc_codec_ops(void);
 struct vb2_ops *get_enc_queue_ops(void);
 const struct v4l2_ioctl_ops *get_enc_v4l2_ioctl_ops(void);
-struct s5p_mfc_fmt *get_enc_def_fmt(bool src);
 int s5p_mfc_enc_ctrls_setup(struct s5p_mfc_ctx *ctx);
 void s5p_mfc_enc_ctrls_delete(struct s5p_mfc_ctx *ctx);
 void s5p_mfc_enc_init(struct s5p_mfc_ctx *ctx);

-- 
2.34.1


