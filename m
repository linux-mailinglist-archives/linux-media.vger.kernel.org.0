Return-Path: <linux-media+bounces-48616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F7CB4C26
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 06:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 965D3301874C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 05:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EFF6BFCE;
	Thu, 11 Dec 2025 05:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTaTCFnQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842E286D4B
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 05:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430827; cv=none; b=CWdmbXJR76/5lh/XDlo9s2NQyny8SiqbNIk3M0ohCPsNzSfEnFotPxWnj1C7VCRwVAiGW5yBP77iu19axZAoG3nUa39kSWV6RAjc2gbgVsMg4y3lzED/vvfOp18mQU4sD60/Uv1LOJ+eu9fVxXl3UC8SMqG77Arakl/PKf1N6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430827; c=relaxed/simple;
	bh=kwwU4P8Lw5MZyU9jOpxUXjd3N0RZwzFufYNIL83H7d0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDq2BBRFaD5w+dAQS0P35h/rd4eGpPDTxReqN2hLPIHLn+i3IsBk4PQ7NZWVqWETwDLX96p/7gw88X/bohM3roGfhNhVvEpCApNsM7argAXMSC86ngiMhRtVHYDrXMl38Bd6Fs1/MERr1xR1HWP3nDN8sft0LAUwYbZ5rfVsDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTaTCFnQ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so636335a91.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 21:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765430823; x=1766035623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4B1VSMVPR1C6GZoVVS5E6qY+3U167GtCSzdGbajzq7M=;
        b=JTaTCFnQgm3U1w6u4SsT2uofGNGw18Q95f37JDxSMHILdZgl0C60wcAubPtGao6QOQ
         5PApe1h3JsiU2te6oxTALIFDphOHJiUOlQNcParFtZ0PFMf3Ko1CE5TQ8ULKxiKlFMy+
         LvGzYzOJxnz/ZiSFAxRs3Bac3j7gcCcaQxREzLf3DALNkqgN6QreC9UsUOZ3qt6HOddA
         RK7W0uE6eIhSNMty/EvH51MaZI7PRPbAFskEwGNLfkB9QXu7xHrisSvGg4wdqlyXiuKv
         93Zrls6UkT4QUv3WpXGPXUue6HRrOJTXFLUEhIcNBnJmuywzXskKxou+3eWyEkl0Yzmq
         R5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430823; x=1766035623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B1VSMVPR1C6GZoVVS5E6qY+3U167GtCSzdGbajzq7M=;
        b=qlkQV2vRJyfJUdK46wHzyEPi+ZLzCIdrB9VIOW/dRRFVjp42Sczj5g9LXycoYh2yFQ
         CFFjkzBJXUIDLj20ml3F4I8Ig2KHFk2m9eSTe6ILvMVv5dMd1rm+7wrS3mNQQsvheKzs
         V+Ucu3mVIfmOna1gg+HnqxyAUamjhNIUKo+Vb9SX+3vFUalS9JiNXQGHz+upsc8sHoBi
         VOsV4sNa3RoSN4GJPO0DhQSfw9UUb7odEaBPXmKlkWsfo5xhRqOrR9VpErsE2MzQoAoC
         jNqQxlGprUlkqszONJCQBAjD9LZ5jzpW5658hxO51VdB+fW29NWbbDfN82Xio4PbhSOM
         WXFg==
X-Forwarded-Encrypted: i=1; AJvYcCW+XPbs8NhJL3y5+SVx2EV8riJzaOlxg4jJ1dD9QToF7BlpPPJfHGtxa4zETp+/lABO3B3eLPlt00i8Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOGBE4IkkALrQZzEakEH5RwJZ+aV1cg+2UDsYbfASxnEQPZHx
	+9b78sIqhguvW5t0cBWz6l4StZdNewzac7ktXS/d56sZms7dYviO/hSa
X-Gm-Gg: AY/fxX7hiThTb2eN1CrLo6j+HBlZK8Bo8eAK34Oo5rT5jTpLacVXqQF9rqG9AqS0j8w
	DT5ePb0I4vomgcbCUkt9XCb5WE2bwzKXZCGIvsLYg2rbLKldYACqN6R4AQ1a1wp8fq+OXebe1mE
	r6a+bXQs4XzyssK44YhBJb/OPu9z5U1oSNyJr6O27FlgjGCeSeWkyFRlOrkgwuCA12PCQyC1gQ9
	S8KVr1YVKP+UCG0vvn3H9kWtkjVyPdisHgKzXS6GX+4RqD2ejvJMX3BqCKxfBWjp9CvxJvdWRB+
	DxQEbubQX0eWMipGWj5A9f+5kALhRDwflq4kwFlCoOkebf1v6mKUue6nEwkwmS3Aj9wwc971xhH
	5KWnPuftjhNUABn3mguvj+tcFcLjBKsRpnKItec3ee7/Uqmp7X5p21xq/oMpz+bDLbN2BOqKOTC
	54Vw8TfeXQvFeW9mpHtfM8D7YxbBH3
X-Google-Smtp-Source: AGHT+IEgiV35Oco2tiCD6K79ILkKFXONEvzhj4i2bB5192dudF0Egw4s72j/Nd0K0uccWEnscaKwBw==
X-Received: by 2002:a17:90b:4a88:b0:341:8ac7:24d3 with SMTP id 98e67ed59e1d1-34a72895d23mr4367080a91.34.1765430822964;
        Wed, 10 Dec 2025 21:27:02 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a92733507sm640351a91.10.2025.12.10.21.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:27:02 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix trailing statement
Date: Thu, 11 Dec 2025 05:26:51 +0000
Message-ID: <20251211052652.3589-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "trailing statements should be on next line"
by moving the return statement to a new line.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 .../atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
index 6a10d3545278..e422cca55022 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
@@ -35,7 +35,8 @@ ia_css_formats_dump(
     const struct sh_css_isp_formats_params *formats,
     unsigned int level)
 {
-	if (!formats) return;
+	if (!formats)
+		return;
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "video_full_range_flag", formats->video_full_range_flag);
 }
-- 
2.43.0


