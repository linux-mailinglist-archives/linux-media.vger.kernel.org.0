Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77560350592
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhCaRfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234442AbhCaRfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:33 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173D4C06174A;
        Wed, 31 Mar 2021 10:35:33 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso1535123wmi.3;
        Wed, 31 Mar 2021 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RKzjLcplK3Qj6N++ugVsRlEJA8YUUn4W3Fexo0s7VWk=;
        b=Y2kJKmF/QEmz1+0o48IS5Tb0knr0LPos4GWWgf3flr4f7Vinr2UFj65rRD9zQZ8AxU
         ES3d1m308XPWizeyaHi0Rd8DpZ7wQ0Tn3QaDTtf0yZRckbCxgAdIcMYD8dxA4tLilcjP
         spzCJ/XjFkJ08xXrn11ba5WuKKLsfBkvGyeB8wR1kmH7eXHYQBdKaBUdMhYpmLBJkuWv
         BULfWxBlA69G5kWTqLso3NZMyQvl5A6JBlI1tOcypC5cLxv8tq885Xs/sHFWvEUdFpxX
         9cJPGaTmoLTS+KVH3XmvTeR4Ze+KnDSJS6MPobSW77H/ns0B7HeZSavgR9y15B+kwNLG
         lChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RKzjLcplK3Qj6N++ugVsRlEJA8YUUn4W3Fexo0s7VWk=;
        b=JDbk/k9yrSPkhge1P/+OHtg1/bV9qZCDeMuJp0RjZX2fQWLW8D1FRGJVZ+4+Zxa00T
         08889owjf7EqsGxLhrPAgmGZkvIwFpnfdDyuonYbMQT+G3Bi+i3gfQi5saTYpq3OLRYx
         Q+TXgvwFJzwm+3QohAsIU9yVIWQfv7VRDY40sfDU1+Y0wr+WCGRtSdQOLGLWOSSg+lcO
         KYTqxEIYTni7uT0btDi58t5VWpm6SMeWr/IXtIX35T53D3ORo+B5oJ7u7cxy/7O7QDyO
         IH2huP8JF4Lew2GnHqTwucCl4TNA3WiANLjs8UIC1NM3Yujpba9VDFt9qbJPl8e5TLOB
         xJ7Q==
X-Gm-Message-State: AOAM5307kuexm8pHlZScpSLz/qecrsCT2zkCCdHKRQHuCTc4FiErOEda
        0JYYjKSlF14oUd6brrDf5HA=
X-Google-Smtp-Source: ABdhPJykb1Gm/yG5gTGpyJoWqqGtDWKZ9GLEauQ0tzwUU0osQDKIEr317Nvq1XzoroUShjfr7aJ+kA==
X-Received: by 2002:a05:600c:35cd:: with SMTP id r13mr4251681wmq.186.1617212131818;
        Wed, 31 Mar 2021 10:35:31 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:31 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v3 4/9] media: hantro: imx: remove unused include
Date:   Wed, 31 Mar 2021 18:35:15 +0100
Message-Id: <20210331173520.184191-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The current imx8 code does not use the jpeg encoder. Remove the
unnecessary include.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index cb1ac02c03d2..f36c1bd681ba 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 
 #include "hantro.h"
-#include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
-- 
2.31.1

