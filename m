Return-Path: <linux-media+bounces-2965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56281D8E2
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 12:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81C0F1C20B94
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 11:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A545363CB;
	Sun, 24 Dec 2023 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0xhWpr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006A3FE6
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-554dbe1857dso1738a12.3
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418563; x=1704023363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+A2sLdMYd9jrOu4aUtIFiY1f/32swGwSuhGRSvbimyg=;
        b=f0xhWpr9yAuT8pn3ZBNfas90r1lbC3N5IR7Gr0buY5B3uORUkmoPij2PA9MtJ2gGR4
         r6c2w2uhg3KCEJTADH9QJ6ynr+J13UB+KBnI9j6b0+I5UI8iUC8otz43UhzNH4RIHP8q
         gWX/5lSTNt0jihNQeVNvBgkKHQki1dMxjHra7LgqkHhjogWx9ZN7tzDZE4sVtZdubICR
         xWzpZIfm5nkLE2yLTBkfBz8Lwgw7zlwNH86pYrl6w6LBu9pDVnLr94W+qmOYea49H31K
         uh3hJIUzc1u1oeSHfTezjVIk4/E8jeDj1RLIyL5QRJnLpQVv/QnZhB9bq+FbLm6k7Rcv
         nSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418563; x=1704023363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+A2sLdMYd9jrOu4aUtIFiY1f/32swGwSuhGRSvbimyg=;
        b=RN+b6aQwsZ+SAXCu5X0L11jIA3xTj8/4PtHwiXn1BmJvxmL/8hvm1tj6dKTLx9Ip7Y
         B+IpTW/nZurtskGgb8/IFf14JPfvM29pc59pTWAiT7i+mCJz9IB64TvJUR887Cw4cPsP
         C4MubjIkpv+r5JOjQ1svsQApLea3mANQVlyx9Plwh044t4bb8mK7SFGlKZEN1QVNVuSG
         pcayX7X2HxTyi3PBMyMqAcWwSIaTiLZehnIApCWL/t8nqKk9m+OuMqAGAm5SvTGPpkzw
         1TSQ4z0t0IYZtRASCsE1d5XemNyb9xGDxRQ02AuOG9tRQ/uhruHE0cDnMUAfpPrYJ4wD
         IPNQ==
X-Gm-Message-State: AOJu0Yy8hqGP+pOm/4kZp3o6umIpghl8n5c3Nb7c5EprqR7KUWs/+Z5h
	iA5S1pva0ZVHM1Jj8yh1agdClofRDH5GIw==
X-Google-Smtp-Source: AGHT+IFiO4BeiGCukyoTdsjS7Uq7esREyuxI/9413ugA/P7Cwu/jb+Dq6hBnXpvSUiCHMkV3mLBjXQ==
X-Received: by 2002:aa7:cb50:0:b0:551:4f67:18df with SMTP id w16-20020aa7cb50000000b005514f6718dfmr2757054edt.59.1703418562841;
        Sun, 24 Dec 2023 03:49:22 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] media: fimc-lite: constify pointers to v4l2_pix_format_mplane
Date: Sun, 24 Dec 2023 12:49:07 +0100
Message-Id: <20231224114916.111433-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
References: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In few places functions do not modify pointed "struct
v4l2_pix_format_mplane", thus the pointer can point to const data for
additional safety and self-documenting intention of the function.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 7898c9bebb04..d1d860fa3454 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -738,7 +738,7 @@ static int fimc_lite_try_fmt_mplane(struct file *file, void *fh,
 static int fimc_lite_s_fmt_mplane(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
+	const struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
 	struct fimc_lite *fimc = video_drvdata(file);
 	struct flite_frame *frame = &fimc->out_frame;
 	const struct fimc_fmt *fmt = NULL;
-- 
2.34.1


