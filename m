Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5862A824F
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 16:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731221AbgKEPfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 10:35:44 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:28060 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730721AbgKEPfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 10:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604590542;
        s=strato-dkim-0002; d=fossekall.de;
        h=In-Reply-To:References:Message-ID:Subject:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=SrG7REyckMurQlHgTAHgDZfFeapRGEC/Xh1qebbvEeA=;
        b=C3wfdDyiyQj3lK/9DuSa1JJNjw9sHC1YL0RLeX6WvvXaGIUTnL4/xhgeGHIKqVRaet
        YhHYujgS42ce2V/cYx47vnfnyZ9spyI9Te1DvNkFaEdLVeVuj4aKsHVCTAQC5DKmkc1v
        x9xh+/mTTEF1NZYRiTt97KIAUrFxJtek7c2ivBEW1xK1eIbLeWeOazGEPmYAWMTZ6RRb
        mVwh5oDt/PzbwAVxHpT3WzMkrMfshjqamlTKYIEFli4SmG1LpnAUBJrpkvER4oGN02E5
        8Rw2T9GpGY1JeF70W3lfbj92l1ihvA7o/iVhjidVcNNOnxRzixWF/tOGCKr7HjU62GaH
        g9NQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.2 AUTH)
        with ESMTPSA id 6072cdwA5FZg0Io
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate)
        for <linux-media@vger.kernel.org>;
        Thu, 5 Nov 2020 16:35:42 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <michael@fossekall.de>)
        id 1kahIb-0002SS-1y
        for linux-media@vger.kernel.org; Thu, 05 Nov 2020 16:35:41 +0100
Date:   Thu, 5 Nov 2020 16:35:39 +0100
From:   Michael Klein <michael@fossekall.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: bindings: media: gpio-ir-receiver: add
 linux,timeout-us property
Message-ID: <b61c78925e89c239c3f6e7d7aa8a4c83e263515f.1604589023.git.michael@fossekall.de>
References: <cover.1604589023.git.michael@fossekall.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604589023.git.michael@fossekall.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add linux,timeout-us for gpio ir receiver.

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 .../devicetree/bindings/media/gpio-ir-receiver.txt          | 3 +++
 Documentation/devicetree/bindings/media/rc.yaml             | 6 ++++++
 2 files changed, 9 insertions(+)

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
-- 
2.28.0
