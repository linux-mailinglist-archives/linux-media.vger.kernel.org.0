Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D9D2790A3
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbgIYSeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbgIYSeD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:03 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56859C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:03 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so2234465pjb.4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2WgdDjK1XgGHDaV6//v7/ddHloSVnhsSOt6qKeVAN5M=;
        b=GGQD8Zn6RT4a2zfkZ1kqX0OCG3TtfDAAOwAiN7cO/qtHrG8QyqIMQVqoUV9A0XTOTs
         tvsGDVZPZ/EVpZgTZAS/ito0R7Q/+ajPYRFrE6yikhVZFeFte2E8cucVT7ceQTGDeicm
         M0i1wupcDKk4ZZIIjfWZaLSi54TUvBgW32hnX/hXbnmt0RmV8sXdNON4hIFOqfKIiJs7
         exYlLP4/BiOzvwbIdkmLRRj3gwVh9hhmkZoQg7wX7S4aHi9Mvyq9OVWD8bcQgrJ3OpWc
         /1RS7MzBY5Q3wCZs7gaCcNgpehXkYaKFZUzHQ0ll7RVYs1kjm1xNtAVlijVpOpnll+Yj
         CzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2WgdDjK1XgGHDaV6//v7/ddHloSVnhsSOt6qKeVAN5M=;
        b=WHYMEoeVMuU2tlDGpJgJBV/5MaeVB54K9SoKB5keH43cgnMD3oiZh/xK1CstKNTdJh
         NvQMhDwFlD3YVAsRHpEefyhox9EQW2bMu7GPbTNICRoFxmYWEZqi1LbqWdE/CNE9df2p
         QU8qxi5X36Iby9GwW1yYTNss/aLzFZpVJLLG8cADX+wBh85T2J0VmtlQpMoSQC61mDqQ
         3NXtVy5mc8pb6cFjoVf07MYvGwhY0o68o9ctq/e4XR8zAyfZvQwXiQkBEKx2wrl0Gagy
         Dz6+RuLI/mquOhrS5O+nvW8dhgQuD38XK3QgXDmtOQYzgGV4v7k/lpSbtmTT8Z87e/7N
         26Bw==
X-Gm-Message-State: AOAM5315OhHuWCi4a9pH/p6vBeWt/dw6qakNqjKRcEoGTLgymHHFIzGg
        1yd3/vh3ZKCW7t/thcIQHUiRLw==
X-Google-Smtp-Source: ABdhPJwHEA/3I/bUPFTqLSSgHSU8z9ERjyAVkrO8MXOstvP+Z6ipHjkoXCShERNyM7pX5OIBe+e9Xg==
X-Received: by 2002:a17:90a:aa94:: with SMTP id l20mr777114pjq.95.1601058842891;
        Fri, 25 Sep 2020 11:34:02 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:02 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 28/47] staging: media: zoran: convert mdelay to udelay
Date:   Fri, 25 Sep 2020 18:30:38 +0000
Message-Id: <1601058657-14042-29-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As asked by checkpath, let's use udelay.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 0ecb044f8e8f..4c9f6eafd130 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -1332,9 +1332,9 @@ void zoran_init_hardware(struct zoran *zr)
 void zr36057_restart(struct zoran *zr)
 {
 	btwrite(0, ZR36057_SPGPPCR);
-	mdelay(1);
+	udelay(1000);
 	btor(ZR36057_SPGPPCR_SoftReset, ZR36057_SPGPPCR);
-	mdelay(1);
+	udelay(1000);
 
 	/* assert P_Reset */
 	btwrite(0, ZR36057_JPC);
-- 
2.26.2

