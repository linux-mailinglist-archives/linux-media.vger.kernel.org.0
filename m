Return-Path: <linux-media+bounces-28247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50961A614F0
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DABA1B63A2A
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69F026AD9;
	Fri, 14 Mar 2025 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ7a3f3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFF7204C1A;
	Fri, 14 Mar 2025 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966205; cv=none; b=JaznK8MVJyCXxxGxctFomahV0BhBhXxjmMVypdOhBLk4Ze4zrK2Py47c9u8VISEW696Ac/Ow71J6wzxYrYytD3+ixtXN3X/dekrQ+FY3QRxzYsfJe/b6NoxLS9fhb2Dd25mICpUDnfg/70FLJaOp7Lcf5jJxVFDq/PKkPSyodIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966205; c=relaxed/simple;
	bh=dGiPk5gHk0jZtPoBAGfSfcUe54P8x+UUdkfV6S8GJHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KC0aoQ3fhe70k2Ll0o4BoVvuXQjM3DBTUSwfFxsP7vzU0DRtmm/fp0KxyLGjgHe4DrbWmPbXQ6m1lFgqMfjyvo85D1ZqqLLXivNuv6Bxg6kprurO8rpaf/S4EKRwXSl6obxDGuKaB0ChbaRDyhKA7/sDcE3/yV2cjQEDYggXbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ7a3f3i; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bee1cb370so23675231fa.1;
        Fri, 14 Mar 2025 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966201; x=1742571001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqS4B4CwOyh2E3bKnakWiJheI/mGxkNpZiMGFD31Fmo=;
        b=nQ7a3f3iluVK60f/a54y7gj3gpDNNesn8+ZhERVqgFFX1sao4J9VwxjXzIowcWRLSX
         Vjxxw7StOTaqjIVZ3wArKbPyHN2ugIExCyrEVAUGo1gUrRqq0EJmuso3u9HKeBrYk/Cy
         Xr+EXxmHiKPdhMw8obgJ715Fv6nrXXBb+eH3kHXNXURv+yPoT8IKt3H2v6TJyqUYKk+W
         U9pg7tYbphGa62tLaSJx+lUsdBaZibNIatn5jNlpAQS44CbldCv5DVXINRRWyzBrzq2T
         1H3/C7pKoQtTOVnm1NKDpjzkIY9OMkfMuOTSJ45a8zkiHdY+oGYYhQ1cOt54Z0/sIaOh
         6GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966201; x=1742571001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqS4B4CwOyh2E3bKnakWiJheI/mGxkNpZiMGFD31Fmo=;
        b=DUsdn5kNkV7asWvyZT1IBf+a8rColuMKQCIoqpuiFD0YA4Fxo9m97c3SgJC79um8qz
         SNZruKcfzsXXzRtU8tkqbFmc6U5u4kG3BBber6tFgawXCk5D4Yzy1gYZotvnru/r1LQr
         0dzzcp6Cj4iFXv+ritxFEuO1GWAjL9p+y39RgvsB05PVNMmNVGdymnyuBdRFL2yFBIso
         zafMleyR3N6UcISPgIjYOmSLJqrfBJvgZBlB2MXSlMniv2KHYKPv8XreEtd5lcfgffO5
         fQSJ4/pOzKL17s2k1ZdqqWuqrH48HFMpSUmojQRdjjhyssJ56/io1+ITYfuysOPPEIV8
         6ybg==
X-Forwarded-Encrypted: i=1; AJvYcCUAxZyXlL4v4VZgrLlVzIBAM8FuUDgxuoM5hVLjH2vbNxxedgshjwVjNOvGCbtjPW+w92HK6CdTAYLV+FI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5j6IqSLPW6ESbhKmkSP9YsrMjRb5gvcfEsuNvhkG5OBXWSh5U
	AirQ7mUbcY+kKYmSIbnwKYsk0v4eK2eOHqze1AYn2POQi8+tyJIVbl3jD9GBhrQ=
X-Gm-Gg: ASbGncvdcnz3YC+feM0C3GVFQ8s5a/09K+RtmUVyfo4C/P6aJbn2UZEnIzHlC8UcOfU
	M79mff988taZcbBfSHJNZ8F0iSUUjs48Zt30ksHHI8QEcf6Mtre1gJ9rad/UMASYLXIAY130mqC
	jJxMFyf2jfUzAo3Woswy80Q42djTL/NoNr7PesI4UriXB3KRG1VxlL2N8AS6wWr8qbivHAMUVog
	ErltCMoOstLRSuNF2m1zv+C3Jqtg6JxjbN2EtDvLrBYZxdaDQ3rdCMkvhSBX4QlDVWByzqqNc77
	1i/bZwbajMsBFSqfYxB7ZUVKeHCJ/z5iBu0mdhLjEZC5M8RhdXAui5AOM/kqrONw+3g7
X-Google-Smtp-Source: AGHT+IHtI6ZtSYX8gnrK5ojjc7dzjYkGzFn5hTA/QPbvLx15yRXMM8+IoboeXbttICCT4M9mxEpVOQ==
X-Received: by 2002:a2e:9818:0:b0:30c:111d:d7b8 with SMTP id 38308e7fff4ca-30c4a8601ebmr9563091fa.10.1741966200700;
        Fri, 14 Mar 2025 08:30:00 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:00 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 10/18] media: coda: Remove double setting of stop flag
Date: Fri, 14 Mar 2025 18:29:31 +0300
Message-Id: <20250314152939.2759573-11-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Remove double setting flag 'CODA_BIT_STREAM_END_FLAG' and corresponding
write to the coda's register. The flag is already set when system calls
v4l2 function stop_streaming()->..-<coda_bit_stream_end_flag().
And this was the second write of this flag.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-bit.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 515eb8be4b86..05d62c7bc692 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -1611,13 +1611,6 @@ static int coda_prepare_encode(struct coda_ctx *ctx)
 	coda_write(dev, pic_stream_buffer_size / 1024,
 		   CODA_CMD_ENC_PIC_BB_SIZE);
 
-	if (!ctx->streamon_out) {
-		/* After streamoff on the output side, set stream end flag */
-		ctx->bit_stream_param |= CODA_BIT_STREAM_END_FLAG;
-		coda_write(dev, ctx->bit_stream_param,
-			   CODA_REG_BIT_BIT_STREAM_PARAM);
-	}
-
 	if (dev->devtype->product != CODA_DX6)
 		coda_write(dev, ctx->iram_info.axi_sram_use,
 				CODA7_REG_BIT_AXI_SRAM_USE);
-- 
2.30.2


