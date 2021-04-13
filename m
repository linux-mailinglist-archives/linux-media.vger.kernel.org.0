Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1ACC35DD6C
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345392AbhDMLF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:05:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:17384 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345383AbhDMLFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311933; x=1649847933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U90qG+leZn3JSkP9inW3UaZFAjPWm2hW2k3b48yZzD0=;
  b=Yb2f2MLMM13ZaZ9OiglVk2NkwinNejQT7KWhDTJxKkUW8behEE7RWUyw
   CE48sWo9aPigAChMBnJSfOqpQRvxTthPFB5FKzOCH8LlCv4qUw/bNJI5D
   gFP+n+cNehODYe5rfCnlc5QTpdwPo4rwmKgpvKPRfU/snYkM2FC3Y0fpn
   CbI9Yg6q5WRJ0WfBCiK4Z8VK9vfE8Q5uBcSif3EfOIqCgh2NCnl2iFnEs
   AfdDlHs+kfOczP/BOw/GlVfwdn49Qfl01LKLMe9pvwPdM7HM2dKmOOM1w
   04967iq1UjJ2lrW1ubs0t3NiDXhZsJOx2lHl3hKKFdKLY/B2/7sVr/y5z
   Q==;
IronPort-SDR: vRFPWV5FeHSRgDaM1UG4JoPso/PgiNEHYj17WWfPwYnmezu4EXvLmPK4KANFIkjCurylvB4MkQ
 uduKIziYxJylDbfbAWTEbZ9bJCLsl+uX2neL+7U/4q06+9uYKOzYToHGU1mbFAzK5FLrLgT2zd
 JAmAbRo2etFMSOQKtrK/LdkzFIngEgOqplnsNGe0Q0Tac2QmjKpoA5c8MMNGEkZKZa8O43eqCb
 HPYEZcnNMVPorpbAjA8vMqYRcUtVpWUuZX5ttW8b2YujKF5O2EPNuTj3uYtaorVUEYyQZiF7ip
 xzE=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="116804623"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:05:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:05:33 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:05:23 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 32/33] MAINTAINERS: update ISC driver bindings file
Date:   Tue, 13 Apr 2021 13:57:30 +0300
Message-ID: <20210413105731.610028-33-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ISC driver was converted to yaml. Update maintainers file.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04e6df934eb0..95e3c7b7f934 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11720,7 +11720,7 @@ MICROCHIP ISC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/media/atmel-isc.txt
+F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	drivers/media/platform/atmel/atmel-isc-base.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	drivers/media/platform/atmel/atmel-isc.h
-- 
2.25.1

