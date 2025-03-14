Return-Path: <linux-media+bounces-28245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAEA614EF
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 102C1883750
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261AF20487D;
	Fri, 14 Mar 2025 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/aY8znW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3220468C;
	Fri, 14 Mar 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966201; cv=none; b=nfP/TtsQud06gllgPXU+sbtGcf4N84DA5cPZNlTikkXf4rsv1/E74lGwfqy8pRx07ODcJbju7VS3648XrSli7ReYtoFZ8CUjpLv6dhhVufhQ2KBv85RSVU2UrZ6iPh0bL/MkPAgPQlw+rpxUfJqYcGVh9iO/6Q9cdIrGW0VNPWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966201; c=relaxed/simple;
	bh=MfFb4TSsTHgExw/bNlC74LQEEiUK9q6S52JUN2e1ORk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d9hqzQPWXF3XusPIH0y5c+Nzg6kRQUbDwdcB48W6Uh7hEFy55RwmLWaZWEtlwBklYKp1hnwDht/OwBo/lHPdBGTCv+c46K4/8M79sV6t9NucrRcEQupw40jOthp/K1BsoZ65XWVMXj9xd28L19mImoUQAMgpxWsYaunc3HDPIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/aY8znW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bee1cb370so23674111fa.1;
        Fri, 14 Mar 2025 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966197; x=1742570997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3qPgF58XqoAN9wHQNtUoZdYc3+FfRSVf/6v5XtHat8=;
        b=j/aY8znWRRPzNR2YyaYejqryWrfZeDZrv2EZoFg6IgIEVMw2vJLWd3vrcHXqpDA/pt
         hU3wCbq4YuC6yejO0nBS9SiTPqrNYABL5ExYFG876TMu4Nh4HkcCNXyemBrzE3cjMyNX
         SPv4N1OUpIyG83Dhy0t4QRLgQc/e61IjthinWfXUXWJtebfh/sZciN8UEA2NTrF2G0/A
         eguLG2Z5bbqJVlKC34eb7HV38H3YV7k67AzvzNnLMKlkUh2oe3eWQ0tbsSe3+Y7MehQt
         djMgqY8uRR8CW7M2WWZv92AtiS06qDA2KjBFASDZGn7RLDJid+rKUQZvbOJSR1es+Nay
         1E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966197; x=1742570997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3qPgF58XqoAN9wHQNtUoZdYc3+FfRSVf/6v5XtHat8=;
        b=n5YwjRcawIoS+dcXFXvzH+K6Od9IFKVDe3LsJ/UvLEAtbxvxHaSr/5ri11AMvPG1Um
         af5q2Jh85KSxiWCIkBmeGzZDeFjKdBMKS14tTBzIiMmuuNwF/S34aLk8iFeMcELCNoc6
         Hj9Usu0j68D1pHsqpSulMoAxK7LnFzLnFFYQmxW1ilC6SHhcGnZT/eu705pU2GhFgQwg
         433O80DwBGEmbTVEGYsx1PFQUpGHh/L04iUA1vVafnMtyiAB+jViHVV9TSDjN+BPcq2r
         IUrSKncggn3qkVYdLFIMksOOmmfaRQGa3QQSCax2Wzki/rPBGVAMBBsBwTEqy7dKUPy6
         n7JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlJCsnYl7yG6pNzrnRtB6Qt3WNboH2/fwYCPPfnsROS3FpmSoP+V7CaIr0vtxB9TBqp+GCfr8pKR+vKrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycyBQuqiDgd8wfPnmrfpItMCLoWclSzPGvXW/BaflgkGtMHaf0
	uxIJLN5JJ8h6I5UE8uvyjcCaMInuXE2Xkn8Fs/w5c0J7+GI7lo9c5Xjtrq3lodk=
X-Gm-Gg: ASbGncuYxEC4pZxrEbGlO8thncN3tYzidtjonwstvmx3V5bSjgRp2aKsWnLu5/M/P3I
	Nhsl1PkwgxMZBCUcuKqeXIR6ERy5gEYQ+C8r7ILcxEP3R1il9s6Cl2l22NN9A3NH+EwQ8NONMtc
	W94EXUn95VHrEs5CKNFGFCW62k1zsYGFueWobNgyJIbFYegKCLZsBWwY99UrQhOa7rGg00pf0S4
	qKuo7bM2l72iATpJyfkdgB+zjnhIoQA/ZyEAgea5z4SHi4Qmzx7GZnUZ0yS3DaUrJ3wLI/kmfWU
	VKo/N1BoluXq+UgyXTb5HvQcRjEnziqiXW74azQQwOA/e2LYRCyFgTZgIdOK/fMf4MDM
X-Google-Smtp-Source: AGHT+IHgTYth9pH/kXh/erBIKy+KvKZ0VtBGgdOmgV7ecUxcICS+rSa4TpOtROBXtf1rdXnvvB96mg==
X-Received: by 2002:a05:651c:542:b0:30c:2e22:c893 with SMTP id 38308e7fff4ca-30c4a8d8c4emr11728251fa.23.1741966197228;
        Fri, 14 Mar 2025 08:29:57 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:56 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 08/18] media: coda: Add log to finish_encode if buffer is too small
Date: Fri, 14 Mar 2025 18:29:29 +0300
Message-Id: <20250314152939.2759573-9-serghox@gmail.com>
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

CODA_RET_ENC_PIC_FLAG flag means that bitstream buffer size
is not enough to save one frame data when buffer reset mode is used.
If this flag is set, currently encoded bitstream is corrupted.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-bit.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 3e3bb3d64ec9..515eb8be4b86 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -1641,6 +1641,7 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct coda_dev *dev = ctx->dev;
 	u32 wr_ptr, start_ptr;
+	int val;
 
 	if (ctx->aborting)
 		return;
@@ -1674,7 +1675,12 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	coda_dbg(1, ctx, "frame size = %u\n", wr_ptr - start_ptr);
 
 	coda_read(dev, CODA_RET_ENC_PIC_SLICE_NUM);
-	coda_read(dev, CODA_RET_ENC_PIC_FLAG);
+	val = coda_read(dev, CODA_RET_ENC_PIC_FLAG);
+	if (val > 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "Encode fail. Encode buffer is too small\n");
+		// TODO what to do next?
+	}
 
 	dst_buf->flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
 			    V4L2_BUF_FLAG_PFRAME |
-- 
2.30.2


