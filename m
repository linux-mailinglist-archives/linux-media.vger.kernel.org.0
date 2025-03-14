Return-Path: <linux-media+bounces-28238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA8A614E1
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A082D880BA5
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5B2202C53;
	Fri, 14 Mar 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3BJR+05"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A58202991;
	Fri, 14 Mar 2025 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966189; cv=none; b=b8Vxbm6cVZrELZmS5miYy0d9s24j4d2vv2uFYgplQMNrA29h65nilHWHZFPQfdIELqLedNE2YR7f30viN3jQZb2tw1z18tB5OHbH0ZvhNBfntU7qcA15U3G2sV+2qiTPAnHbHPXKB/Dr2rSPgtN04ZdK93dxQT4SyRAOEJFbX44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966189; c=relaxed/simple;
	bh=3cmE2i1Gz9lClv3Jfpe/1r3UhrAIU3SNzkgw702sHyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pzt4YLPEjyHrdNVFvjaL6QeP69sWH/rkKOVhwAc4ypqlJbnOWsaAq5Rl0SzyqQoiZrWN+gWcDZFAgdyuNMxpHOYr7vIOqScw2LNV39vYjidiTlwZ/tmmVMD53/kpo72NjVAQfHSz6Q9u2viludB7TscZeLQm/rFjhyotb5xtv2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3BJR+05; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so19330721fa.2;
        Fri, 14 Mar 2025 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966185; x=1742570985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2TBxm9b4Z7DvE3zMi2yjLlJGaJTiMHJTb4BUjWKoMs=;
        b=A3BJR+05HQePvJEAmwRku6BSqPbRDeOuNLH4A4mTHyYc8BDk87pNr2BQ9Vy+vsuSSn
         gIOJNudDSg8LMGeLaIYJVjD7/wK5hmWwR4hp5utJBqFK5BqYI5xbUtR5kgMkxTooczYx
         5DrG7AbTXwTjC4uDewRfRUuYyu+PcjtIiLHFeapM5CMr4mH0RCCRvJYTXfpf/JJEh406
         7ADi9NX5hQPSXAhwbWnS3Pmk2HuL8pHaOR6tihNlVI46kW9w3uuNOCDBVRTeoxVp4IcC
         gTNZ8F24U1u4HxXXPFXuKzs+Y91/i2z9GlNSBnZcdxACxw6e/YGMllXalVHYeV0HSlxI
         fi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966185; x=1742570985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2TBxm9b4Z7DvE3zMi2yjLlJGaJTiMHJTb4BUjWKoMs=;
        b=eR/I/I8VkHZpml+HgI/bKwl0diqZg/W48JeT9kPsiu/gv716neFvCwQeX4zX+ZvFcn
         hpjcrbNA8/kLjDObTsSH3oVb2PIpY5S0aZmWiMYepmZWltOCUrYmSTt4rVYmpbdGTLNJ
         VfEbQ0eeR8YnL72ya7YVSQBEzk992TvKfbQwe/ypS9FwWi7ARBhhly8PC0gPv4y7LjXl
         8Gzj/E6uEAZ1mWc2hwunVbF6dROpRRoRNyeKBInUg8T9keGTrmh2SfL1dYUcR+z40zJu
         qcVFcU80mzlzT/zEnhRmcrgujIL+q0J6VNq9Cl4RtbIa4JlIYA4EsmHVBErpZ3RRMZXO
         JP5w==
X-Forwarded-Encrypted: i=1; AJvYcCXCTitxXjcoKMPsRPuKsWsSHq4lBDLSUIyR5AJ88t6I9EtLV//3VVb29waSnDcXdiDusshSVXvsGmI52Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ZsFLEVNYbCAZC32fZ/jnxdPxSeC/pa3rWdWqE+AaLaxai+6t
	zDtJVL+n+cRjpOtsE6O4UBlMzpfiG8DgvlnhVpDcnkB+Q05wd/SzEymLF4nAWvM=
X-Gm-Gg: ASbGncsDmYIHVQmVQ/PFz7j7IS8AWt7/WKFJfTomnV9xONGrkidDhFQ8ED7FGIs1AIC
	nyBs4Oo4hypyB9g/k8WWqAQ35ERkNfH+DunLBEFrzCTX8KQhcroPBTgKnwF5NiIwCg5vqj9zOlw
	Ug45iOAPoQTy6mQgyU383zbGi6lBracJeLSDVcLi2RNaa5Wxwv6NFeWkcjZzJo6aJAeCtMq0Hjc
	G18/2cJipheAq2Ijf0zrXLTwmfIDTRX6w1rzI8U3ds8bwDcpFPyrK5BMsk2cb5ryzKhgNspVmOc
	rXQXIT5RSy7yKR7ngOrl59ixCyvJ2h6DBIeXjH/Bt980DwDMcvM0UVS/auk5JgdVo8Hc
X-Google-Smtp-Source: AGHT+IHz3UFJwnIa4DizqArqEXe7UJKpqN6ShlYP0/kZkaZxijazQ/Qj3vUgdb2JaYqJb+fk32p4pg==
X-Received: by 2002:a05:651c:198c:b0:30c:1441:9e84 with SMTP id 38308e7fff4ca-30c4a860201mr11324771fa.13.1741966185322;
        Fri, 14 Mar 2025 08:29:45 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:43 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 01/18] media: coda: Add print if irq isn't present
Date: Fri, 14 Mar 2025 18:29:22 +0300
Message-Id: <20250314152939.2759573-2-serghox@gmail.com>
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

Use dev_err_probe for print and return error if irq isn't present

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 289a076c3bcc..84b9b75b382e 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3178,7 +3178,7 @@ static int coda_probe(struct platform_device *pdev)
 	if (irq < 0)
 		irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(&pdev->dev, irq, "Failed to get irq 0 (bit)\n");
 
 	ret = devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
 			       CODA_NAME "-video", dev);
-- 
2.30.2


