Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CC6215434
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 10:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbgGFIxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 04:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbgGFIxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 04:53:15 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5B2C08C5DF
        for <linux-media@vger.kernel.org>; Mon,  6 Jul 2020 01:53:14 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id j79so25929630qke.5
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2020 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=nn1O+W5EF/DppeDjb/j++wKQhD1vgt5fSJyldwn+gr0=;
        b=KYBdtG0lzBfVvrUkrfz0r108HsyZcZi/XmN0umNhNVvTlM8fpVEjbJi4SPx9oneLiM
         M/8fMNWhiR3NWpli+VYKaJb+41nmadZixzlqEtOcI3qlgwcOVpNbsaYN1CR+NxJ6ahb9
         tl/elsz1PQ1HtSXJRnyBvVduGH7Fnf5l5lJsNKenGYNnpEWBB8bQBPaIqms56clYlvxm
         4jkNvY3ATegxSVNYuaNUbhUY2ZhcrKN5J/clF6nFeiz2AYYE3LCM8/6FqACCevrRy2Mx
         9gLstIU0qSZz3YvbJymzIiTTKZapgKLyUA96aeuFV7wrYaG2xTdj34QN8KzWTwizXfhy
         wxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=nn1O+W5EF/DppeDjb/j++wKQhD1vgt5fSJyldwn+gr0=;
        b=OFrpe1q9cujoN8L7Hof8SpCf+GdW+JmG+k2ZtgNiRCA69hKhvbUJyRV/vNfreXvkT6
         s0fIdOZfHCi8YkvaCHMTlfoJ5Moc+o0MsgAo7NsmUKpkmJlTKzAN9Y+qEj1L+r0MPlb0
         c+PWHLhUaKRfmZ19H8c5HhlmVboV5NGm75y8HeB0lVEMSJRIqvys0hXgibzUJDh8hR6U
         gaaE9CzXBodOYLdHGZ+XfvjE6WqWeGOQTqnErpSUO2K1ZOLufVMEDBOyHHA0n5zuYuBw
         UrKCcuwGaLEPDe13JDP5oi+IAfvLIe6xcMgKlXufPByBP8ikfsc1QwPMq0v3pZUCYMhQ
         2Kdg==
X-Gm-Message-State: AOAM532mppaGyIqOIj/luwrba899gCzza+kqfgwZELsF/Bxr8DYkiSzg
        WpvHMaZjBoreeK0fGi5tcLdwxcnXCTaay/T8KG+PyD/P64SYhGXkpWdp61fREMgrv+I/F/KjuEv
        R78l/a1uQK7oL9d9AaOlL76J5kU8kxhhx9OUgYt4+3IL3aXWxk5M6hbZ60onQS0AlxLDD
X-Google-Smtp-Source: ABdhPJwG1fHRy4VggT3+PmM+BVlmrAXKXA76Zr3GApVvJaKpT8zYZUmtqmAOf+97SJeq844FjtnlNSsNxEk=
X-Received: by 2002:a0c:ab55:: with SMTP id i21mr46962478qvb.139.1594025593948;
 Mon, 06 Jul 2020 01:53:13 -0700 (PDT)
Date:   Mon,  6 Jul 2020 10:52:38 +0200
Message-Id: <20200706085240.1979622-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] media: cros-ec-cec: disable the device wakeup on remove
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dariusz Marcinkiewicz <darekm@chromium.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device is enabled for wake up while the driver is loaded.
For symmetry, disable wakeup when it is removed.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 2d95e16cd248..3881ed7bc3d9 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -277,8 +277,6 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cros_ec_cec);
 	cros_ec_cec->cros_ec = cros_ec;
 
-	device_init_wakeup(&pdev->dev, 1);
-
 	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
 						 DRV_NAME,
 						 CEC_CAP_DEFAULTS |
@@ -306,6 +304,8 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_probe_notify;
 
+	device_init_wakeup(&pdev->dev, 1);
+
 	return 0;
 
 out_probe_notify:
@@ -335,6 +335,8 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
 					 cros_ec_cec->adap);
 	cec_unregister_adapter(cros_ec_cec->adap);
 
+	device_init_wakeup(&pdev->dev, 0);
+
 	return 0;
 }
 
-- 
2.27.0.212.ge8ba1cc988-goog

