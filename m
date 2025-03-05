Return-Path: <linux-media+bounces-27622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D38A4FFB4
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08625174DD4
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914A7248877;
	Wed,  5 Mar 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzWEhalm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FAA22E400
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180006; cv=none; b=UDcXx6ZKXP/uSdKmTjry5CpGDNRl+x5xH6bSYh5klEv8zsLD6JLJUDtQUBnGUZSH+5U3DQqSuJ5PuWbd0MF7PNye+4HJuhzWif+Uqlkl36yFqwQoAp1/kF+snroalNR9ATtUtHzDpRQ62QS9qyIIhzck/s74TbasGG132OFLHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180006; c=relaxed/simple;
	bh=BvsTKZrTmJtBWMLNRcmoFZmyCAxTZH+npaWxoS3hl3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nx3bT0I1b8P7k9d3BIdi4KkTRU2XBeeovFC/vwsd91muD8TF6tDfMslXif5lSggd8OfRykQIGMSU3GOLrWx2kw3v+oE471uyXb2mcT55Fc2pbGZD0UV7jXQLKo9/+rOYtcH4g7p8vKNy5ivrjwAXvTdwtnm4cdUtK4sSbHVO/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzWEhalm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso6042663a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180002; x=1741784802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=;
        b=GzWEhalmhDsyQTnREW1kBlDeGGPadjXbWIbImd9oa9hF6Mdi6qXYkYmwyXM9p9+QKH
         JNtjf6+QaefbYFq9mY7R2AGQhUEENJRW1x6s541XoHeSyeHwUfalyzUFMaNtZmbos/3E
         yOuueveo5CZJIvzIrnhPRQOuUKDR/lm3484SnOzruNqjB5zxclw38uq5WE9oW3QlpMmp
         tkYilKpdP2/ZKXFwSPOG5XAspUkX/Sq3lG1CJuY7EBGjLG7o48TVdGgO2RTaEZExJ8+K
         tFpGQtl9wAjBXtIbHn0lVQ0iBp0ldiwWFaPG5G/cHWbyi7fngd7JWhodzqK/Bd51Oluc
         1Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180002; x=1741784802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=;
        b=Ge00nhPEWzYbbPUfbdM6XoI3IM+yyD3+swXXpJlhud7olGph2ICb231Lecut+ULGJz
         XfIoo4pHxjWv/mYNT1V8Hh84CAyyIWEgpCVvJ1hyB/0rQ6Pwgz2dq6o6uaC9QrvoyDlb
         p++X+oRFbSYTlyVM/vty7RWC6DG7OF+ID45QXbwqcA0DiYuiNqq2hde7mvDX7zkeaveq
         iRQf1w9dZ23uAFBg8B5hr6cOBWlhBEBTngBRap91C1GNdLwqkjv96La8YGXP9YDL5Zx0
         KwNtV1BNlpKK4MGksCJQJWhTbwojXUpl65XMowB4yBUUpboK6PPg2gi7CDtWVIzCvOMB
         9Bag==
X-Forwarded-Encrypted: i=1; AJvYcCWQJdoqWbKF9GzfcNZvjrqPrNLCEmL0GZ07Qq8qJkrOYh0fJSIWxAEeUjco0Qi/KqAiHLsN6t+z84PWEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynJPhimNviSH8i5IMkHm/jn3BQXWrw3qxZ+Gv2bbIyBaE7BNtr
	XE9eKn6OPcbN0bThVv0pLLPQKKlbtH1s28VIrw1IFcIAL1iVKco839h5gOk7DLs=
X-Gm-Gg: ASbGncsgsx97idTA+RSLDYxkK3Z2m+Q5us+5N7czFCuImPYcAKlGi13Hm3Vd2lGqt34
	xcy1DiUH0kO7GcQkodIsoe/2lyVqeKg3tYx0wIGHPyV+0erR2h6xFV38MAY2Y8Jt/XkzrptxiaH
	9ErWeh4vwX7xElfmO2EjCw02SNu2rYiBUV9J+CT/g9oZSEZpneC5/ayosdyy0c5rWgLBv4FRZB0
	QlSpg1uB1+IBOm+iub9PJ+juU7j0B+0b9Awdze2M/NEtjKIvg/ZPkuZJctd8MyA7fELgPdRTHei
	fj0gll2DhHE3bIbQdgFKfWUZXshpAl+t+vJWsTpftFAB3CVsJE4RQOb/Efg2u7YC1MbNUMcHfaj
	VQVdROXukBfKYCnC2ysYCNQ==
X-Google-Smtp-Source: AGHT+IEjtiBAYCTH0+e95UXzOpV6Qk/1lP6TuM4iQbwFmlqCq9fGF9wURhaIIhsi+UMHMk8/oJkTeQ==
X-Received: by 2002:a50:c8cd:0:b0:5e5:bcd6:4ad8 with SMTP id 4fb4d7f45d1cf-5e5bcd64d5amr155764a12.9.1741180002364;
        Wed, 05 Mar 2025 05:06:42 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:41 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 01/10] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Wed,  5 Mar 2025 14:04:07 +0100
Message-ID: <20250305130634.1850178-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0


