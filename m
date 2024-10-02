Return-Path: <linux-media+bounces-18986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722D98D0F2
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01DBE1F23787
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3041C1E6DC3;
	Wed,  2 Oct 2024 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaxMtJy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420841CDA20;
	Wed,  2 Oct 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863967; cv=none; b=bbxqI0pGtIR6KkN4ReHCb/Opvf49Ys4bYuBWbCLwhWcVfCYikRRatVrUEIdzEG0cSpGMmzNmeNd9+cDeC6As/NPv65ivamQjm0MY8c9QnNOH3P8daiznHaFjV9YlrE50TBghOY73HdHIG39N3dJRsG28RU8bArsvYCwL24m1Fy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863967; c=relaxed/simple;
	bh=l6pfO8PNDZ3zKbuX+zqM/si1/c5wypRZiCuqbM1gxGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gPov6PZ7+cHRkeMTyyqDIxXBw+x+h2GtbzuDHmh7osL25xYaGGH2lDeXbfW/surJ2SI+VjVwAUW3adWJOHCy8B6lNNh9RMhfgfVt+48BpSoOTChOzESFPsGWjyWO0Q2i9eKhnnGSZ9NhIFnt3z+jOo1F4Xoy79Fr35r8633EabA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaxMtJy/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-719b17b2da1so4738355b3a.0;
        Wed, 02 Oct 2024 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727863965; x=1728468765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DFRmrs1aYDd2Uy/G88tFC9GJSWwmjg1iO70CGCj0pU=;
        b=KaxMtJy/7XD7rmAwFCIylx2lftBga2NSNLcDRJSzmQrQPN3thKfosBRss+ljHy72H5
         MJ3Gf5nZkSntVZnyGE8feY+6yPV2v7Seta/+gMHErNbF6EqjD6M/5bIiDjhApfrDPIym
         dAAfP9dvERMT3sGbDrP+q4df9RKU0ZB40s8dbL1HF1eId2y+4B17uZsejvmQokB4zJuV
         CSAE1cv9OZQRAoygLka5mzvhgAQjFhplc1sA9G6UgbeiZhUmccqdY64Q8KYafhGfH+Q7
         aN89TVUunMPwwAj2QGP7O8VH7gW8erq7r57Z8M6twR2Q3RaILE6YUWw6U4nvrXsY0wzj
         GQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727863965; x=1728468765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DFRmrs1aYDd2Uy/G88tFC9GJSWwmjg1iO70CGCj0pU=;
        b=Kj4bNryP58dRK49cnF91AsXOAqUxjw23ItgJ9wkz7HTUgzXIC7xN0vhczYDFFzZx7M
         UrkGQuFLVKYtEzbXRDN2W3lX3aeGg58Vz9sfxzjBpdebaniHfraCEdnTLhZUarWAB4NQ
         F7rrb+J8d6cthbITCbNZIMN1qDye9njxrMZi7Lb2hRftoy4b6jAFMR7bbL5K6fGbL0s3
         4vVMlEipRESYRacrF2ZH8Z9x+ZtV5+ccGrp3pE8Qm9HPB1CFrLvAF45NOasoGjTlCS0y
         PyFilwCNew0fdJ6FF83k5Yt1y+LuqGU+YkP5Ge6Z6Kk9ekiOGTmoDChQkYGOwdh/RsxJ
         pShA==
X-Forwarded-Encrypted: i=1; AJvYcCUjVCE8Cv30nEwAwaW54uEqlMMyBHc7OlyViiVV0uMEpKRu0E/U7FtDytxh7ySU+smeDrPJ/iOGplK7EUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp9APsU+YuFpmVtCCjqveJ/8TodnXocJs/srCdIN0LnRrbi0/N
	EhMFLgytudaagdo4m4X8x+KrK1izsbHeccdWx8MKDm1SZ511SdHUmkSfoIzi8yI=
X-Google-Smtp-Source: AGHT+IETJv+93j6PLhhd0lX/cgjxRgQaaFEuFJs9Q8REaxETgNW9ls1g7JP4pBezYy2jReZf6nLRcA==
X-Received: by 2002:a05:6a00:3c90:b0:714:1c0e:1336 with SMTP id d2e1a72fcca58-71dc5c4db9fmr4648162b3a.4.1727863965281;
        Wed, 02 Oct 2024 03:12:45 -0700 (PDT)
Received: from Hridesh-ArchLinux.mec.ac.in ([103.163.113.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26516189sm9742758b3a.97.2024.10.02.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 03:12:44 -0700 (PDT)
From: Hridesh MG <hridesh699@gmail.com>
To: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Hridesh MG <hridesh699@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] staging: media: fix spelling mistakes
Date: Wed,  2 Oct 2024 15:41:04 +0530
Message-ID: <20241002101106.56658-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix two minor spelling/grammar issues

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
Fixes:
	chunck -> chunk
	procotol -> protocol
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 34f574b0b521..af4205f4b038 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -639,7 +639,7 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
 				/*
 				 * FW workaround for a HW bug: if the first
 				 * chroma pixel is generated exactly at the end
-				 * of chunck scaler HW may not output the pixel
+				 * of chunk scaler HW may not output the pixel
 				 * for downscale factors smaller than 1.5
 				 * (timing issue).
 				 */
@@ -1416,7 +1416,7 @@ imgu_css_shd_ops_calc(struct imgu_abi_shd_intra_frame_operations_data *ops,
 }
 
 /*
- * The follow handshake procotol is the same for AF, AWB and AWB FR.
+ * The following handshake protocol is the same for AF, AWB and AWB FR.
  *
  * for n sets of meta-data, the flow is:
  * --> init
-- 
2.46.1

