Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB5327209D
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgIUKXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgIUKUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:49 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E29EC0613CF
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:49 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l15so11152681wmh.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XMf3TGfVECo8Ilq9E4yjhSEImTvnZ2dPgYfGTLgv0bk=;
        b=WW3lHzJn1qFTVR/w8nO2yUlxfSGExVtBeCWl6A36zih+tm7tGih+Mcp4mtuKNDRonA
         gEPCgPMmuLejb7S03ZvfayZwcGaM95eEtfWew1p4LADy4On0TJ52XS//VuL53Xsi44TI
         DEnPm8YPWL4S0ahxJFbSGQgq/GxjQc+u1j1TPjN8qVkPWQ13yY+1QaR2lcpmjYh+FIRl
         mAjkJOusuU65FsFqfG9f5pH5CXGfg+Nt6/kfD/MebtmgALFkMBNfiPMGwWKKXBDYznWA
         AKXZsFgHkRYHUbSpviarblJUweMi5vVU7vzMo6UE9kLxwTgK7RYnnT7+oUsrNb17XJNV
         oU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XMf3TGfVECo8Ilq9E4yjhSEImTvnZ2dPgYfGTLgv0bk=;
        b=HeUR2A/eck5Utcw39yg2Z9zgGgogFt2z0A0BhP4+j2XrE0oWO/KuF1TbjMaC/2hxRA
         uSOH/0WLynw46/bGP6krxBdLbXzAIkuJVitq2ZOAlS2rtEGLk1Ju5cJlqV/oaJpqp7lQ
         /Huc0D3p45GTr/q8w3aHRZXOLlsjtG6gO4IVFUStZflaKHXNnx2CFO/sz7pO6erQjU0c
         MR2cfJlwG+bAcPbG4vxXBOtYdkWPTaSgvydGAJJiWb5TuFFULRXPLTXDHIOKkqGMeV+e
         Sg1zfi3hrVKwgQ3HG9oT+p5RxTKE+fGS2zbDVWtyKVLjoM1Q8tsHrNsYhl+JfrW7Uo9V
         qcWg==
X-Gm-Message-State: AOAM530Ku1nH4EAICU5xjusv61Vtqs5NyMs0/oauqtOf+n3fmvFzDcjf
        miaFfp1a2Tr+WkdgDxp6FKKedQ==
X-Google-Smtp-Source: ABdhPJwLscV9pUAHVogHsXkwlXM0rs5yG9Zg1ezU4BZ8Y6KrmJb+etsGRk4200Pum4t0A/qFIxDRSQ==
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr15271283wmk.10.1600683648002;
        Mon, 21 Sep 2020 03:20:48 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:47 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 16/49] staging: media: zoran: do not print random guest 0
Date:   Mon, 21 Sep 2020 10:19:51 +0000
Message-Id: <1600683624-5863-17-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The slot 0 of guest is never initialized and so we print later random
data.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 0fb65fa4a3dd..a33de61a5e9b 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -158,6 +158,9 @@ static void dump_guests(struct zoran *zr)
 	if (zr36067_debug > 2) {
 		int i, guest[8];
 
+		/* do not print random data */
+		guest[0] = 0;
+
 		for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
 			guest[i] = post_office_read(zr, i, 0);
 
@@ -170,6 +173,10 @@ void detect_guest_activity(struct zoran *zr)
 	int timeout, i, j, res, guest[8], guest0[8], change[8][3];
 	ktime_t t0, t1;
 
+	/* do not print random data */
+	guest[0] = 0;
+	guest0[0] = 0;
+
 	dump_guests(zr);
 	pci_info(zr->pci_dev, "Detecting guests activity, please wait...\n");
 	for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
-- 
2.26.2

