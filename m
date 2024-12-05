Return-Path: <linux-media+bounces-22660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D69E4C1E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 03:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1AC016A2B3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 02:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5048C12FB0A;
	Thu,  5 Dec 2024 02:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="YZeXvZB7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1041C92
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 02:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733364390; cv=none; b=I5Ov+BQUEBql2e/8u2u42OP8YcICAuHB+TBrmOspAfA/Na8Z6SFwx4otF2O6YApA4jssKzPnicmPi2dXvX9842yxhKU9YQBnYf7si7Xo9E5FRFQIfjjFZ1HBT10dsxWhwVy82gwvMDUPo92C4Un7eBswKi1576PBrsYuq4vc+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733364390; c=relaxed/simple;
	bh=PvL4ty465O0gXEqM6l5dED5Em/KnNqeiDWudV1T4YlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YQ0l8c0vWk5jaYxnecIboXZpaRSrwP2vkdBQ9Pj7kJwLRq79eDoEAW099e25eUSOC+WZIh/lFf3wlSnbqPyPmqhPETV/RnEQiDpjsG9iIvCXg5FwURm9HIRUHtt6nW0r3Ek33xZ9RWM7Dm3/RvWCS3qzdVO7VAB7nqhay1GQqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=YZeXvZB7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so312836a12.0
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733364387; x=1733969187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoGDTo7A8CS6K4D0GC7GVTzPWU+ZmRUHEcqjiJ/yLtQ=;
        b=YZeXvZB7Dx0bCCS6SWbPqHphvnkgX0eYu0r/lX6DgXbVqgHXTdl69W/bcIFLcLE3AQ
         bh49vWip5z1kUYLaPdnU5K7VvjbFD7D4k9Eia2ZaMhiHDrjmM6JUVDuj9zGFoqtDnByp
         8OAwA+wSD49lFZPg3XNjcgyYQfzTXiTF51NPzKtptRsdmFHxCo8Jks/hfm+W2GTskO6S
         SZ9JS0ohKaywfxgomoqZ3Fd/EOW+8DVdE2Xwusl2ql3XF+LbT17+CYsx8mLrUVE0/KbE
         cNeDR95zxxqJSYR/9IMC2FBx4j9aTFjrRdPxObqQ3OTK1wxTq7JUsYR9TA7kgtj0kKfe
         c4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733364387; x=1733969187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoGDTo7A8CS6K4D0GC7GVTzPWU+ZmRUHEcqjiJ/yLtQ=;
        b=QeACqoXWJ1EwGKMOuFFwfO0PGe9Q0BJ7qM10FpljaAZlCmlgPZqeNKdSakmb3n2rWd
         E27Ooi6bsKWkdKKhinoy5ncI3mESQeXuKQMKv4nPr9A8efKVfNtLuQbb/YQYbKue6HfG
         qYrrsJH5M+jn5txagxHBx8PmbUOZQbVzLuouydOo0srkZtLj3MhUYh1S99RQAipC0h1g
         gGwjrG16PISUWd3OSrn1DOpZYJxNKvofrlEmACF8OdmTmQiERQUciijfpa2Y572gy0CS
         bfd16/LmHX+1U7vtnxhRCGqe3fdLHrMtjVdyAJNzM8I5jXH9nTUSTBKtkzdJWsU57knq
         KH1g==
X-Gm-Message-State: AOJu0YwG/azdvkRSy15+xO1VkeMgrs005IINhxXMBJzmagIF7VQ461iI
	ja6OVrEp4uRPbiJOkOw/dQ3vhXSo1GF/9/PKgoNZa32LdgUXYovtIR+cCW2p90c=
X-Gm-Gg: ASbGnctEcbJDKMIher2A5B1lPgvybkF1XvEr6inqgtMH1GBadlPwEIwCNuTaOXnWla8
	Gn8m7pr6Bav98FTLF158eTTlSeez+jJBckek3i0XPFi0KHIkvDamcCLJQQBFT6vKx/h0e0QZ+pB
	wZVGTPDJA+WT1LrSYE6qa/feez61ln5UexS8b5RrxPYR4ZvVTGJ4hREh8VRvZPQa5K3z896oIgr
	pAyGREbp34pH9lb2RvAYDyFp2T3xsAYV8lKSqbOnx3+B59aEmlkMZnk4vdqBhXtz8/cZr2NiN+D
	ntjSvv72cVylmdjcRSDBmfPCEL9qDJ/sr20C
X-Google-Smtp-Source: AGHT+IEMQGQ9haEnIiek+i6F2ad+nH1y4duMoZ2FCyJT7SUT2ohdZy/Q+5DLin6QFV/sHFt2HxbBPA==
X-Received: by 2002:a17:90a:e70c:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-2ef0127597bmr10418078a91.31.1733364387530;
        Wed, 04 Dec 2024 18:06:27 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef1e965504sm1674804a91.1.2024.12.04.18.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:06:27 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: m.tretter@pengutronix.de,
	kernel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: platform: allgro-dvt: unregister v4l2_device on the error path
Date: Thu,  5 Dec 2024 11:06:21 +0900
Message-Id: <20241205020621.2051079-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In allegro_probe(), the v4l2 device is not unregistered in the error
path, which results in a memory leak. Fix it by calling
v4l2_device_unregister() before returning error.

Fixes: d74d4e2359ec ("media: allegro: move driver out of staging")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index e491399afcc9..eb03df0d8652 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3912,6 +3912,7 @@ static int allegro_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev,
 			 "failed to request firmware: %d\n", ret);
+		v4l2_device_unregister(&dev->v4l2_dev);
 		return ret;
 	}
 
-- 
2.34.1


