Return-Path: <linux-media+bounces-28242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91455A614EB
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E0248832E8
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6C420459A;
	Fri, 14 Mar 2025 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CK4geyJe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48420409B;
	Fri, 14 Mar 2025 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966198; cv=none; b=HSX/POz3sbcM+gigjgpr3hCbcQmZcL71oJcXqOCy4qOtAWgBeWzSYy1AWNLbNdnV3NPyeDrKEEwwWJ3apuklaQdyeDnhdpDNLpdijO+mF1n9fDYskgNvtNXQVPM1bU/iune5NE00K4t63PicfBvpImxPVyud0GLUjdc4hR0Eb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966198; c=relaxed/simple;
	bh=I7pVhZ1m4laGSD4+BO4jNvJfowqtXOPdcOK/Y3r1/sQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nq7/boTTYCtX8tYxWr72b2WbCy0FY3HV2E/b09QM2B76PaS3zP65TZRinWxINYiCbC5ARbJw/c69RToCJsJPjtudQ+7n4YhtJnhzZhCEwY8p8znLZ+uOw00ZK+5tndqcd5EsDFl5p1aDg7gP7BoP9qRMnxUWt+OMpjeS3v1+Qz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CK4geyJe; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3061513d353so26982721fa.2;
        Fri, 14 Mar 2025 08:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966194; x=1742570994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBp+MyC/2lSvCtiHJgVjLDnI7aoBViMmFmchAxQ69hQ=;
        b=CK4geyJeJHm3EBoCdlLIN28FzgAkaexz41GkxNs1ySooeEcZ+diKLKjnzUzFGBpSSJ
         NLc1NZYFDewyw2moyhc66LuJ+1I+ge0YVWV/KmG1wLrK+ES3rU6+cVyNDRERJs+B5w5o
         jS3BE/yj3/Z3TM+Kttm0uSAbccVyGyBTkdVRIK5MBSRYEMl67rXOdd1ITa9TNftL7sD6
         jPkkRSwdc1N1KQwyAowAINZqNJQ+/naxk41IRMoS0gOKMTR42ouZKmhNJTLNHJ3KXnKG
         Qpl5u4w2nzP3lusW3/LWF+Az+1vqiMQnFpXIto9gPIA8D7PNttDOdHgMiYACvZ0OE7Vq
         LBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966194; x=1742570994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBp+MyC/2lSvCtiHJgVjLDnI7aoBViMmFmchAxQ69hQ=;
        b=XA1OMrn5DNvw2MPaVJocCyA/W3g+Y75onZPKXJafAzdcjGoHLNXz9tptOA7Jv2DAd6
         SO+hFb0VyHZeahkvGJxOaDDfDK+BnU9KVmjLagWbDoaI6UL1V/pCkowDbyXj49wlIay7
         m6V0J8VMmLodLx0B4jlg2Cu68dzHFG+7kvulcgA5VwsCzXm0zKTCBTj7kF0YZuHUrTN4
         1pRA+3/5bMrJnWA4s6j5BLB6CHhzAFEFra3CmURGRsmWKDF264B7FE7DVEVBfrDglz8A
         +efufKowYkYS08DTjY2ystLpvJimrKrGwrSLudphCYAemEokrFu8kP50LfAPSTNi540c
         a1sg==
X-Forwarded-Encrypted: i=1; AJvYcCWsvRgZRHBt2qRLiUrueECIMo09dZOgX16haf8bLZT+9fbkUOEje1s9oWOYh06soyX6qKccqPIxv5Oeryk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMWzYLy+3CvOZq4G94GwXf5R1NWrBbY9nQaWyVjGGcYousAnH
	i/ndHTuJMRM2F+loSLEj62bFRK2fCkrrSePiUBV20e1Xr+GBVfpiGAQB00eobbE=
X-Gm-Gg: ASbGncuYamqVVc/knG6QWxgdxetRxWkKVuze/IDKKfGEIQqbsPP7KS9g+MoAADPKCto
	5d6FFPBttMshk59y550gVxiRWFHUIDpAL1vZ2B5vJa/ewSafAEzg96rQaSWk0q5BCj4sZIkMuVv
	sXRWDAJ7rSqhE8JX5fov7pHHsViDoeCJz7/Bza/Mm6sGkctl61kiKBhLpcTY7bR+O5O44oda5Ea
	gdj5+3O31vJGs1uMdJ0XbJ69aaW9VtO4NBwiLTk6MQmQLmms9WNVtuuF5fb7O3KF8HA5tnt/2yb
	NFW9HT1xvl+wxWXeb3iZAW2Fvz/y1ZIEls5vaXWbJ9pFRFqLyc0on1+wMArabyF/ie4Tvt679fr
	Lv3o=
X-Google-Smtp-Source: AGHT+IG6QmzrcKWEFKz5AmgDsW3ngveYSn6bnD0b9EFvZzQXH1KPuBgJtH1TC0C2lneQJGDjamI/gQ==
X-Received: by 2002:a2e:a370:0:b0:30b:c5e7:6e61 with SMTP id 38308e7fff4ca-30c4a875eb8mr9982751fa.20.1741966193506;
        Fri, 14 Mar 2025 08:29:53 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:53 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 05/18] media: coda: using threaded_irq for 0 (bit) interrupt
Date: Fri, 14 Mar 2025 18:29:26 +0300
Message-Id: <20250314152939.2759573-6-serghox@gmail.com>
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

Use threaded_irq for 0 (bit) interrupt instead of lowlevel locked irq.

Signed-off-by: Sergey Khimich <serghox@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 64ba17d8adfb..b240091cdc9d 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3184,8 +3184,10 @@ static int coda_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return dev_err_probe(&pdev->dev, irq, "Failed to get irq 0 (bit)\n");
 
-	ret = devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
-			       CODA_NAME "-video", dev);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					coda_irq_handler,
+					IRQF_ONESHOT,
+					CODA_NAME "-video", (void *)(dev));
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
 		return ret;
-- 
2.30.2


