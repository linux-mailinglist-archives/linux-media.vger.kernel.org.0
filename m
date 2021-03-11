Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC306337816
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbhCKPlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbhCKPlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:07 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8B5C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:07 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v15so2394321wrx.4
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ssl1iA7M+yjQgL0tdJM6ww1IB2abRHT8PVziTs2Mluc=;
        b=uV0pMhDzaz1GVXPWhNOl4ltw/m0ib3QSPlmU13jsCAD8j6S3lXnGvfQ3eAZyyPWSvs
         MZf7igUMPMyehp6+5cD6v0XPVuQkjMta4RMSEWyq+3EtU0Y67Ruhi7hiQdXKSYfvFcWE
         qQk4sShgwwtyLz3koVtF7pOqfSv82Ds1bRNbHGFHzGnjDjTZcRLdWIov1YOK40/S/PAJ
         DAq50hONyoJBazW7n+ByyIklAD4ZFqntEDTbMQzp7ktvcJRnbUSjCT/qc8ug3bJt31XN
         SDb8c5VBi2xTTIxzQI1eFWTPpGJwaZpeGhkgZqfM3CKk9PYU/ihJAcN+2xg4QL5IRrVw
         uiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ssl1iA7M+yjQgL0tdJM6ww1IB2abRHT8PVziTs2Mluc=;
        b=UmvPlu1H4IwuD4/DF6K8kpbthe/oOBkRrmaTbWihVb3st8f9EvZitjVd4dztgdsuLn
         YApwEcHLX2HfMIoNe/yM3Z2J2WOmLwmGRUYv0Zx0hpNpAAI26qEnDZT0u6Tc6CHn/phN
         rB8ZWtXFdRoOhyJR2rjc73FmGbvAnNKgSFeSMvOGHGv0xEqMGZIQKMlYqA5Xvy96jrXq
         Zv+85jLcB/Awrxkjq8bRTO0KLSpmnnGz0p5J4DJCE/AUTt9Edidzh5w1oVrdJ59b105M
         tFHk7jWE9L+7wJ2iqApOtMd34XyCNU2YlBMRrtPyO5oBkO3mn/wcZVGAgqCgzizQhRE7
         cvjw==
X-Gm-Message-State: AOAM5316oxs+lX5Qp6EqmXCuiyKO0MYJBQPzySxFARNzhykjMyQ5fntE
        4fOYzhJmOP08MZ1BBK90kWA=
X-Google-Smtp-Source: ABdhPJykA0Zp7nDR2YtIXj7sKTeSrV/YQpNVe+k/BleazGZ0VeBDADL8vXMQnpYVTVzI+rrkLkkD/Q==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr9340135wrn.17.1615477265973;
        Thu, 11 Mar 2021 07:41:05 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:05 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v2 03/10] media: hantro: imx: remove duplicate dec_base init
Date:   Thu, 11 Mar 2021 15:40:48 +0000
Message-Id: <20210311154055.3496076-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The vpu->dec_base is already set by the hantro driver itself.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 1f48c1956cd2..cb1ac02c03d2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -150,7 +150,6 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
-	vpu->dec_base = vpu->reg_bases[0];
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
 
 	return 0;
-- 
2.30.1

