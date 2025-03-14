Return-Path: <linux-media+bounces-28244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B699A614ED
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89FBC7AAB45
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5E32046B3;
	Fri, 14 Mar 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr9p+hu+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C32045A0;
	Fri, 14 Mar 2025 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966200; cv=none; b=NNDpJ5FXpGVql7LYCbuTseBTZSgfRyZ305lsStiiNIxMXFT4QV44KvbOyBrpHNvhqRQZuNKlpXy818yICdvEXePqG72IOEP6ZSKUkg+9uBVsOrBzBTNYcu4OZeEALIBpvA1SL1d8XsEU1QJIf0L3yo99QLsk9H0CFMcFs9mm3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966200; c=relaxed/simple;
	bh=F85xUi/UAHMny6c6TSIiGL9bA21s135Gdddyr3EpVHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e464+P2cmYeFv8QJXzINT4ELDu9bnbFuNqWSyT7WMVrrKB72yenNLbQfhf8gxDoQydwV5In5K6Ic2epCuPlZ9Uh0sfo4DaP0CIzZcT8eQC8/OCdgh9mm+KLfhlehDDa3UddJxLuI3FNYzH1ov9b0YxrftFYaIzn/pF3QvTKu+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr9p+hu+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307bc125e2eso24927761fa.3;
        Fri, 14 Mar 2025 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966196; x=1742570996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIOyg9U7oN/4rti1p3xjWta08jOexNwOZk/0TKQp7eQ=;
        b=Hr9p+hu+bEiJt41pO1+zMU34eop4wdA8skQYIm4XIlEd+7iOEXNjD57QTCgWr/BMWl
         gCL69lXZInm47KRzHDRrAm+Z6e1MV8+ii9LcIGAUe4W1/NFMRmK7cYlrib6dSggOqS9Q
         3sExMSK1qYqaAvrv5ZzFDrAYwI9dq3X/16HfXtqBjc84TiWaOUkk+5ePNQLlam96IWib
         AOWhqBsGggR1jJgqF6vrmG5R/xPpsREgErXURZ/+X2sZTR+ePGzn/NzzfmSbJlqpbZo1
         OIWUKPwsvfVfAslaTCw5tkgPW4sDCYp25PVy4eOFEA3W3aocaEq46SIwHrJENnQW/pV+
         852A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966196; x=1742570996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIOyg9U7oN/4rti1p3xjWta08jOexNwOZk/0TKQp7eQ=;
        b=f7Gi29bS/Vq9tqBDbxJraTwDjTbdxIioDiqX2k4mskZ05JosPZDI5jwAT1KkT0P8E+
         WFNphsN+d3xafcm0FwiFXR4upHJp8VMf9Mewbb6yspYdEzGfFV2bKK+AM7wcsh19fj38
         L5lad5pJTM1odgz3V3jlp2LWYH0oThAESqvTiU3hSgOsVuS7smKJT4wPYcACzoldW+Zg
         jhPTV8d/eE71KsUOVOlgUlzvCu7Dn1Ulz/cZ1gSmWut9Gsd3bnU9bk8vutnZIZnDqri9
         ab3D2jl1PjGg0VhAFsPYz1BO70yA2Ahh+MDPtf46Y2SAn3a/EZ5zPUZ+TeC0uyfa2gDM
         4qWg==
X-Forwarded-Encrypted: i=1; AJvYcCVFdMCPHWx1HuJWTMQkNoTEUTcMBe2/qr+3sVuOmkWVZSEcAK3rqycdPIuspmQmBeuLeDFS4y3GwBxjUMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvaZ00PLfIoffu9f1oAgxSHpxwC3A0g2deY/rviH8MhoBRB767
	8e3QMGiA7Y3xDGohzkW1rbK+9ef5tNy3Tkg0nuTLFDv4biPKRJCcXzhy3bSERoU=
X-Gm-Gg: ASbGncsHObd6nQyi1tps3nrWqxQwNQQvKp6EcvISErUyxccNYZRELQch4kAxhbnLHDa
	kZCQOrH7cPl2ns5dHoa5zF8p1AMSmvMh2NvSabGFOGQYoKV078BGRzywnx7G4MAUivSynZwfA7J
	YfBTp1YTkvHCQC5P0gl7fwrGmAo9B5+8KXYVV+WvZAtPaxIepjPrPcNPCR66xEqbX8X/2cRNi/H
	fUFZGswV6qYLE+Ipt6CmmT4tjG27n5eb89Rd+YbXHfgZuedzFw8xckSoaAXOKtgO400AvAXA0Zp
	axkpyClt57R80oeyRLbe+h2gYjhDr984BVCqpO+REvZLj2zjB190/CPywXju4fOiybt8gi4wEYG
	ATSc=
X-Google-Smtp-Source: AGHT+IGI7akv8kxmPGyPe1epF+PCgNrUQ7LPeG2tv+/tXFRjBU3B63HCGyKWeADVlTHzDItEFj+/rg==
X-Received: by 2002:a05:651c:210a:b0:30b:bf6f:66a3 with SMTP id 38308e7fff4ca-30c4a875ec3mr12115761fa.17.1741966195869;
        Fri, 14 Mar 2025 08:29:55 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:55 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 07/18] media: coda: Add fake IRQ check
Date: Fri, 14 Mar 2025 18:29:28 +0300
Message-Id: <20250314152939.2759573-8-serghox@gmail.com>
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

From: Sergey Khimich <serghox@gmail.com>

Sometimes we receive fake interrupts. It's better to check
status register and trace fake irq if occurred.

Signed-off-by: Sergey Khimich <serghox@gmail.com>
---
 .../media/platform/chips-media/coda/coda-bit.c   | 16 +++++++++++++++-
 drivers/media/platform/chips-media/coda/trace.h  | 16 ++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 84ded154adfe..3e3bb3d64ec9 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -2635,9 +2635,23 @@ irqreturn_t coda_irq_handler(int irq, void *data)
 {
 	struct coda_dev *dev = data;
 	struct coda_ctx *ctx;
+	u32 status;
 
 	/* read status register to attend the IRQ */
-	coda_read(dev, CODA_REG_BIT_INT_STATUS);
+	status = coda_read(dev, CODA_REG_BIT_INT_STATUS);
+	if (!status) {
+		/*
+		 * Sometimes we received wrong interrupts
+		 * That's why we check status
+		 * and if one of it is zero - wait next interrupts
+		 * You need check your HW configuration
+		 */
+		dev_warn_ratelimited(dev->dev, "Fake irq status=0x%X\n",
+				     status);
+		trace_coda_wrong_irq(dev);
+		return IRQ_HANDLED;
+	}
+
 	coda_write(dev, 0, CODA_REG_BIT_INT_REASON);
 	coda_write(dev, CODA_REG_BIT_INT_CLEAR_SET,
 		      CODA_REG_BIT_INT_CLEAR);
diff --git a/drivers/media/platform/chips-media/coda/trace.h b/drivers/media/platform/chips-media/coda/trace.h
index abc6a01a74e9..15a96bab10ad 100644
--- a/drivers/media/platform/chips-media/coda/trace.h
+++ b/drivers/media/platform/chips-media/coda/trace.h
@@ -10,6 +10,22 @@
 
 #include "coda.h"
 
+TRACE_EVENT(coda_wrong_irq,
+	TP_PROTO(struct coda_dev *dev),
+
+	TP_ARGS(dev),
+
+	TP_STRUCT__entry(
+		__field(struct coda_dev *, dev)
+	),
+
+	TP_fast_assign(
+		__entry->dev = dev;
+	),
+
+	TP_printk(" dev = 0x%p", __entry->dev)
+);
+
 TRACE_EVENT(coda_bit_run,
 	TP_PROTO(struct coda_ctx *ctx, int cmd),
 
-- 
2.30.2


