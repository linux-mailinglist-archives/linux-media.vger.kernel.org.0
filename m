Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645F02A8254
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 16:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731008AbgKEPi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 10:38:27 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:17150 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbgKEPi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 10:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604590704;
        s=strato-dkim-0002; d=fossekall.de;
        h=In-Reply-To:References:Message-ID:Subject:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3/PcyM/l/9H+hlNAgtQDHAtlA4KPvhoQcMLvAC/QXUM=;
        b=lur4dViTnQBydGncHItV/+vjISaaduU0uUvtkVsu97P6ThiLMfaDVvF/7Ahs8bbPi7
        Bcbs4M36DEv5XhI5TaIQER3ErrxlDK8fkt3FEj9cDZBtwX9RK+DfqytlP9rqC/6TlG3m
        tZNzxNWwDkaImKlZwl9xC3rAn7MT9NIrqSnuM/nCukAeBBg0JSdDOwy7rmBl5jMoGNNh
        tcIzUb7a/JHBixavG2W2kp3e+kFLGKIqvuzLrkTK76ZxWm0h3n2hGv57zy6oZG4yaBeW
        QFBGjWWrK8ZOtDRT4BIFzdHQuRfgiy9EgrNYpRZG/2q1Zq99yDZSvkBJuGVmXkCeMLs3
        H3JA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.2 AUTH)
        with ESMTPSA id 6072cdwA5FZL0Ik
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate)
        for <linux-media@vger.kernel.org>;
        Thu, 5 Nov 2020 16:35:21 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <michael@fossekall.de>)
        id 1kahIG-0002NT-8y
        for linux-media@vger.kernel.org; Thu, 05 Nov 2020 16:35:20 +0100
Date:   Thu, 5 Nov 2020 16:35:18 +0100
From:   Michael Klein <michael@fossekall.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: rc: gpio-ir-recv: add recorder timeout property
Message-ID: <f6113028e0f22e319172f2f074e64250f0238263.1604589023.git.michael@fossekall.de>
References: <cover.1604589023.git.michael@fossekall.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604589023.git.michael@fossekall.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This optional property allows to set the recorder timeout via the
devicetree:

- linux,timeout-us: set the length of a space at which
  the recorder goes idle, specified in microseconds.

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 drivers/media/rc/gpio-ir-recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 22e524b69806..eb3e56c27c29 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -99,7 +99,8 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	rcdev->dev.parent = dev;
 	rcdev->driver_name = KBUILD_MODNAME;
 	rcdev->min_timeout = 1;
-	rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	if (of_property_read_u32(np, "linux,timeout-us", &rcdev->timeout))
+		rcdev->timeout = IR_DEFAULT_TIMEOUT;
 	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rcdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rcdev->map_name = of_get_property(np, "linux,rc-map-name", NULL);
-- 
2.28.0
