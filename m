Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0050F35ED00
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349149AbhDNGOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349111AbhDNGO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:14:29 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB0CC06175F;
        Tue, 13 Apr 2021 23:13:58 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id o123so13037065pfb.4;
        Tue, 13 Apr 2021 23:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U3l9Eg0luCztsPcduSjbrbRg/eBicXKHkIcuWSsOTBg=;
        b=PU01qG/68kgZiW0fvCFPb3EY9UBxJGpuCVDWACL7xo7b+U//15iH6EtiC8YLw4pVc2
         K29VstHfv6KeyoMQceg20zhPI5w3HMXqlKXI+U6lSUlrBbFEZ8oPUFMXix0PFlm3PJry
         ZivDa8HjFs2xTGxztCpHA8nRa+08nge2FMLDweTXDsjalRVBnDBBkLzM1DdwTBW6hcdG
         yYSMALPp7XVoy582JyaF8gemnZuTwsaUtlJ7nKUtTJsHAAqWRqBCJCxvlMwEmkQY5jmL
         FPp9gpMOP7NWswDJtEueboiLOC2mwQTC534Bih3/eb1q4htiqtZAU9wlLQFM6GniUQI2
         kqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U3l9Eg0luCztsPcduSjbrbRg/eBicXKHkIcuWSsOTBg=;
        b=IOxv6B2cIqiRC/pIlFdiLNcfk7mU3NXwCBRfkQUpX+ieBPZOL8AOocCziciQXQ+AnR
         7sDa3WMw8FxkfOgMPm7ztPV0ZaY/2mnvJ4Sn+Mh/i4nkWCpF77rML+lWaCtmjQ1MWtn3
         VMeJ6ySfV1uLJ5fGCDU462zgqTNZW08PRV0QY5oR00yWlIx1CcZJ76CzFIWmxJBu3qnq
         If5GnsPTJZXGWd9XSwnuRBS58VbHOvMd7q5GsclAOFjFfNGmpNFED9xrN3OEnk0JyC6f
         hf1RQ4wKXxEKpfJjyko9rF3DashrFFwvcjgQy1hOl/ZnL0xR42ZjVY58/+G/xmf33A6P
         vKdw==
X-Gm-Message-State: AOAM531nOSewy4bi0+Xc9mKPLtT5B6mBezYjskTeAp6gi7jqWQSfBQ1E
        +5zBhrfItCiiCS/kgIhGJofajfyx3/mo67n5Fjw=
X-Google-Smtp-Source: ABdhPJwnEM3KFiUmJ3NjGqsxylX4cgC5QiIW2LjULwGj8VBNfNKiOgs/sTQ8kpYrU1QlVhzoq+6H0A==
X-Received: by 2002:a63:d24c:: with SMTP id t12mr35048698pgi.111.1618380838380;
        Tue, 13 Apr 2021 23:13:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id d17sm13629071pfn.60.2021.04.13.23.13.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:13:58 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, shawnguo@kernel.org, krzk@kernel.org,
        linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC board dts support
Date:   Wed, 14 Apr 2021 14:13:45 +0800
Message-Id: <1618380827-16056-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618380827-16056-1-git-send-email-dillon.minfei@gmail.com>
References: <1618380827-16056-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

The DaSheng Com-9xx is and ARM based signle board computer (SBC)
featuring:
- i.MX6Q
- 2GiB LPDDR3 DRAM
- 8GiB eMMC 5.0 FLASH
- 4MiB SPI Flash
- USB 2.0 Host/Device
- Multiple multi-protocol RS232/RS485 Serial ports
- microSD socket
- 5V DC power input
- HDMI1.4a,1080p@60
- RGMIIx1 Gigabit Ethernet
- CSI0x1, connect with ov2659

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 297c87f45db8..24bdfbd4853f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -206,6 +206,7 @@ properties:
               - fsl,imx6q-sabreauto
               - fsl,imx6q-sabrelite
               - fsl,imx6q-sabresd
+              - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - karo,imx6q-tx6q           # Ka-Ro electronics TX6Q Modules
               - kiebackpeter,imx6q-tpc    # K+P i.MX6 Quad TPC Board
               - kontron,imx6q-samx6i      # Kontron i.MX6 Dual/Quad SMARC Module
-- 
2.7.4

