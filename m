Return-Path: <linux-media+bounces-14351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A656091C22C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 17:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C201282477
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7CD1C232C;
	Fri, 28 Jun 2024 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dmXw/0U1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DD1C2324
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587480; cv=none; b=U18iILg9oH0I/zCgCuZocgMJFMOWVuyKh1LoLYBgTkxCJOHFvXGWOQ7IQxQrn+zEOrm9doIWixdoHTqPhT/PtJ2faSKZLuHbMJgQVEyz7Q349SQNuucHrPuuVk8DybmsG2w27Xe6dzsR9xbvHEe1Et7U7S1zFwr/mXJpM5Kx67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587480; c=relaxed/simple;
	bh=IoUQMkRlutwZpLhi+B8muMB2qxCoEdTw4U8Kbs1pSW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q73LLhIyuqyeTZheBb71nytsOpnjKgTG9tOlIAn8poB3CEaGukawoGYWD8IH2pNDZ92RWu6FbKYn5dZsmjGSU9YuEaee9ZKgFUcnLHykqIMf8M2nOCUgp0zgXMlNxolsKSDya2CY2/0O5e4xhu0bnb/Qyykg516YduaG+10ePpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dmXw/0U1; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b593387daaso14363476d6.1
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719587478; x=1720192278; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewUlL1qV/fAyQa0r+zSGNQy6ZDoRG0k1rfyTSSVFaRw=;
        b=dmXw/0U1GLbuLv2UBIPbHuRAEAlffJYd+xeYvKdY+REIO7QH4Gi8jq4OLdTitVv1TY
         mBaOLXY6wd0+mcY51Jk2qlqtswIKdixPnlNN+QaszbPwnV5bFbRkD/b64/iZpfmlxppk
         t6Tii6QYaH1w49a4XRWryZ2wWJNqXcblByqy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587478; x=1720192278;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewUlL1qV/fAyQa0r+zSGNQy6ZDoRG0k1rfyTSSVFaRw=;
        b=l2p+SUjqyYJrhqatSugQ8H+rAKapWwsFk4Ph4nTA5r5035q2CVgzwKtPW91BHyTLZG
         SRwQdMXWDeflQM+o19yQxrgJHTkIhLCPbHfZw/eEe46vABeTGk4dScSt+G0kxpWIRj5q
         Ahx8eB3SBSD+0oSEttp4wHNA82AECUZ/BrwhuoipqQ6B6Cd0mBsbOavBuEzl9cyMeFMY
         XeR67TMdKz9JN/XCDF6UDJBgVX9SD0YG7KGuMscJWI4DIdxscN0OOXbcSeLr0YoOJOvX
         0dNDuewenxfEi7QfrTO31Y/smLdccJDXGSgf8ipzmsra9XX4VoSPjrCIf4qSRiLRIRsS
         5klQ==
X-Gm-Message-State: AOJu0YxFGyFsdv7sIQq+mAo8nnTL81kP8MSpIcFT0y98Vzb5enyikCAE
	z4GpG28/qaDvYNgFvEHTNatPr9QaHBeEgMznA03z4bQlUJGGgxuJ29HJWlnW/A==
X-Google-Smtp-Source: AGHT+IGWfSOemKkZb5msOxo57P5Pa0H8aUEVN9sUgcscdSX3cMREFWR8el+dHT96RwEANwnK0nKXcA==
X-Received: by 2002:a05:6214:224c:b0:6b5:101c:6473 with SMTP id 6a1803df08f44-6b5a5405c0cmr32591476d6.2.1719587477714;
        Fri, 28 Jun 2024 08:11:17 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e564455sm8532496d6.42.2024.06.28.08.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:11:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 28 Jun 2024 15:11:15 +0000
Subject: [PATCH] media: imx-pxp: Rewrite coeff expression
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-gcc5-v1-1-7cd56f04a6a8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJPSfmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3fTkZFNdc8NESzOLZHOLVEsLJaDSgqLUtMwKsDHRsbW1AEhi88h
 WAAAA
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

GCC5 cannot figure out that the expressions are constant, and that
triggers a build failure. Rewrite the expressions.

The following gcc5 error is workaround:

 #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
                                      ^
    BM_PXP_CSC1_COEF0_YCBCR_MODE |
    ^
 #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
                                      ^

drivers/media/platform/nxp/imx-pxp.c: In function 'pxp_setup_csc':
drivers/media/platform/nxp/imx-pxp.h:582:38: error: initializer element is not constant
drivers/media/platform/nxp/imx-pxp.c:374:4: note: in expansion of macro 'BM_PXP_CSC1_COEF0_YCBCR_MODE'
drivers/media/platform/nxp/imx-pxp.h:582:38: note: (near initialization for 'csc1_coef_bt601_lim[0]')
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
While implementing media-ci, we have found this build error with gcc5.
---
 drivers/media/platform/nxp/imx-pxp.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.h b/drivers/media/platform/nxp/imx-pxp.h
index 44f95c749d2e..ae4c6021c156 100644
--- a/drivers/media/platform/nxp/imx-pxp.h
+++ b/drivers/media/platform/nxp/imx-pxp.h
@@ -594,12 +594,17 @@
 	(((v) << 18) & BM_PXP_CSC1_COEF0_C0)
 #define BP_PXP_CSC1_COEF0_UV_OFFSET      9
 #define BM_PXP_CSC1_COEF0_UV_OFFSET 0x0003FE00
+
+/*
+ * We use v * (1 << 9) instead of v << 9, to workaround a gcc5 bug.
+ * The compiler cannot understand that the expression is constant.
+*/
 #define BF_PXP_CSC1_COEF0_UV_OFFSET(v)  \
-	(((v) << 9) & BM_PXP_CSC1_COEF0_UV_OFFSET)
+	(((v) * (1 << 9)) & BM_PXP_CSC1_COEF0_UV_OFFSET)
 #define BP_PXP_CSC1_COEF0_Y_OFFSET      0
 #define BM_PXP_CSC1_COEF0_Y_OFFSET 0x000001FF
 #define BF_PXP_CSC1_COEF0_Y_OFFSET(v)  \
-	(((v) << 0) & BM_PXP_CSC1_COEF0_Y_OFFSET)
+	((v) & BM_PXP_CSC1_COEF0_Y_OFFSET)
 
 #define HW_PXP_CSC1_COEF1	(0x000001b0)
 

---
base-commit: 6aa082910445aec6b1dc652a69c5178a555d8ca5
change-id: 20240628-gcc5-71a968c78e98

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


