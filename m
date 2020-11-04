Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062D52A6350
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgKDLbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:31:41 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:13887 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKDLbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:31:41 -0500
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Nov 2020 06:31:40 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604489499;
        s=strato-dkim-0002; d=fossekall.de;
        h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=iCi4l6/pYO4OvlL8hUeiwlmmscsyUGHmPaom4ypH9TE=;
        b=gPAfo/faZ6FI373MO102C+jLB5WVUUsGxXR155RnSDXxxA83XBUqxtcKG0LIXiOJsh
        ABlsM+ZU9rvBWM6YDwTR82j5UFLLzwjgkBfhW06CoRR3SiO0HlHhxhgZTYLNy6i2IGEp
        FRjDNIGnfvGeZxFkSkcjjVajYDmiBKLDv5KKy42uhclx7ArKhyY4nMAZGHnx8ttJJYkn
        bSGAHgwqNV1OPzj3M5474hgky40fTyNFVXjOVJRtCsP6YLzzAxAbXJAW5pGRyWcLxt0A
        Rfphc1/5E5+PO427jKCAGlWTx/Kezk+o3n8cvHsnhWzsIrjE4rCugXA/c4h2lYM3GwGV
        J84Q==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.0 AUTH)
        with ESMTPSA id y03490wA4BPdTqS
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate)
        for <linux-media@vger.kernel.org>;
        Wed, 4 Nov 2020 12:25:39 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <michael@fossekall.de>)
        id 1kaGv3-0002HN-N4
        for linux-media@vger.kernel.org; Wed, 04 Nov 2020 12:25:37 +0100
Date:   Wed, 4 Nov 2020 12:25:36 +0100
From:   Michael Klein <michael@fossekall.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: gpio-ir-recv: add recorder timeout property
Message-ID: <20201104112536.GA394971@a98shuttle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This optional property allows to set the recorder timeout via the
devicetree:

- linux,timeout-us: set the length of a space at which
   the recorder goes idle, specified in microseconds.

Signed-off-by: Michael Klein <michael@fossekall.de>
---
  .../devicetree/bindings/media/gpio-ir-receiver.txt          | 3 +++
  Documentation/devicetree/bindings/media/rc.yaml             | 6 ++++++
  drivers/media/rc/gpio-ir-recv.c                             | 4 +++-
  3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
index 108bf435b933..7aef3fe78322 100644
--- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
+++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
@@ -9,6 +9,8 @@ Optional properties:
  	  directory.
  	- linux,autosuspend-period: autosuspend delay time,
  	  the unit is milisecond.
+	- linux,timeout-us: set the length of a space at which
+	  the recorder goes idle, specified in microseconds.
  
  Example node:
  
@@ -17,4 +19,5 @@ Example node:
  		gpios = <&gpio0 19 1>;
  		linux,rc-map-name = "rc-rc6-mce";
  		linux,autosuspend-period = <125>;
+		linux,timeout-us = <125000>;
  	};
diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 8ad2cba5f61f..1f3e208a50a1 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -151,4 +151,10 @@ properties:
        - rc-xbox-dvd
        - rc-zx-irdec
  
+  linux,timeout-us:
+    description:
+      Set the length of a space at which the recorder goes idle, specified in
+      microseconds.
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+
  additionalProperties: true
diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 22e524b69806..a328b51a53c1 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -99,7 +99,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
  	rcdev->dev.parent = dev;
  	rcdev->driver_name = KBUILD_MODNAME;
  	rcdev->min_timeout = 1;
-	rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	if (of_property_read_u32(np, "linux,timeout-us", &rcdev->timeout)) {
+		rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	}
  	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
  	rcdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
  	rcdev->map_name = of_get_property(np, "linux,rc-map-name", NULL);
-- 
2.28.0
