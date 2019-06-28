Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1BB598F0
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 13:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfF1LBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 07:01:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36255 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfF1LBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 07:01:07 -0400
Received: by mail-qt1-f195.google.com with SMTP id p15so5768887qtl.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IRBAmCCmBhwyXOJ1DcCXZIxfWYSluForxnz0fKJkRsI=;
        b=TxOwpL81cSRNEH+c9HvJse3ohnn5m4LFuWHavY7CsalrrgX2rO0hztXb0EKQbnXOJH
         GQcoRG4fwVLmGLPP6Qqt00qX45eKky2Ur/RiNxbRBhRNdwCBPiN9GNVeGv+8Z3SHnxzU
         m9WaaxeqhnDizLnx8nx2097BbtYACO213/EYSKsPIW1TtQWEEo1ndrdZo1iY+oODTn14
         JWFltI1srROXP+uxlrvXILSRexvIdNZOii9A/9WURENjQX1UHe7w1lHemEaPoUiNpUhN
         3YiWS/k9hsrcdMK4poUZKp5guhxkhw3fyI8Jo9rlvL/gKhyn3lu5NHGGs9J0Sc/ZalmI
         ugjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IRBAmCCmBhwyXOJ1DcCXZIxfWYSluForxnz0fKJkRsI=;
        b=dCv6pdd9liiy2+bc8oNVCmcvEiUmn2nnOGMIRA0YE0rvskVBDBMVyKTUYFrRtJNcuk
         avKJMiBME/0t6YQvILRe5+Fd3W2KUyi8uMVhCXAOWD/TZSZwKwRFHknCzO62/did+yF7
         EbJccUle94crDbQb4sx/mDmgRQT7f/kLiutOZ6b1Fu/mHzogOdErennFea9Yss8r9sIA
         wPjKGMw6xzL1HI5QA+eOC01hgiCh0CdJyVnZ+eQczIF99bmwulSBcMEXuwHyBcpQEsMf
         VRs08epmUvA6Qs6xyPLMYSYzLX51TLmK7R5EuiiHfBfPkxUJzFPothPv9D+Lbr0N2+b/
         NlGQ==
X-Gm-Message-State: APjAAAW3PUjwxczqM5vEHzxyYFmrq5JOJFMlYYy5xvi9ua0YB88G2J7O
        pfb1ktSdKnhZg2urOiKhSkc=
X-Google-Smtp-Source: APXvYqw/FSTLeYBIjdPyM/dxdGzQ/do+L0qmbuLYrraAPhs5TC3bN1ZpOoYhXD7PQYFW9as2g3epzQ==
X-Received: by 2002:a0c:ae35:: with SMTP id y50mr7545207qvc.204.1561719666515;
        Fri, 28 Jun 2019 04:01:06 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id x205sm825971qka.56.2019.06.28.04.01.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 04:01:05 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     slongerbeam@gmail.com, jacopo@jmondi.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] media: i2c: ov5640: Check for devm_gpiod_get_optional() error
Date:   Fri, 28 Jun 2019 08:00:34 -0300
Message-Id: <20190628110035.23930-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The power down and reset GPIO are optional, but the return value
from devm_gpiod_get_optional() needs to be checked and propagated
in the case of error, so that probe deferral can work.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/ov5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 759d60c6d630..afe7920557a8 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3022,9 +3022,14 @@ static int ov5640_probe(struct i2c_client *client,
 	/* request optional power down pin */
 	sensor->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
 						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->pwdn_gpio))
+		return PTR_ERR(sensor->pwdn_gpio);
+
 	/* request optional reset pin */
 	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset_gpio))
+		return PTR_ERR(sensor->reset_gpio);
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
 
-- 
2.17.1

