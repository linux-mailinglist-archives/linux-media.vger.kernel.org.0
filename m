Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1723600C5
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 06:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhDOEGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 00:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhDOEGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 00:06:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64162C061574;
        Wed, 14 Apr 2021 21:05:53 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id n38so15201361pfv.2;
        Wed, 14 Apr 2021 21:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+M/esBDgdJN+IYlD8b5uMvPcXSLWjPHZ5BPOuK+0fqA=;
        b=Esb/qSlgh+d0FgafxcfrSHbbUxkdLkzeENjtwwg33I5e6QE6ZF281IFm+5vIY23KQz
         /IAyNcoXStRPWHgo7GjRcaelC7tL0VymVRd1mOdZw9GsIkWWw+aum736KzyAc0Pit+Do
         OnRZqhUaAEnmTXsqwzOS8sS4SRN+BYdycp4Cg3/7bz9MW6ytGFN2Kztn8SRttdMGbUPy
         tQHgoeXGKSm6iqBrah9TdxwszIRVtTYBNCLlOUVJPkQActVVbpAgaqmy3ynmBhJHtE9d
         G5dFcQTXGl4biPRTXxcNKJce8SY5wpRS6HHMo9sqSJCt57JS3Jk/rWSXk+JeJonYJW4r
         G+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+M/esBDgdJN+IYlD8b5uMvPcXSLWjPHZ5BPOuK+0fqA=;
        b=ZJGTm+72ggyNrhfJ7W/ADkwnXeQXXw+/NXTsMFhM2CykJlSR/pucImYhkIlD+ZNd23
         HRxIKG/C/T4JdwJRMZe61IJc7KJOCU3XKoJwVYQ0/JDdT3lHXHETAYq/iY6DFpMkXUhg
         eYOmTQtZRNoN1uIITbI8w9MNkNQMIo9ZgwH9YgAyFPrC6YNbJbOjDc4b6bn8c/8+Sf2s
         /2xcuGnNXe9OIH0j3CcTME2Tr0c/Bn78OcEdz+lFzE/fEu7vTBUBM95j9jq1VTFZ+b5g
         wLl6c5F+FeYNDjlOzI8kNese00gNoPYfnJ+dT4HVxM/tsBrbi4dln23ahUELp3m/y+EW
         xA8A==
X-Gm-Message-State: AOAM530ps76dPK8+VUOypTZ146IbMKtR4/tTCStiUMXp1YNjkaQwCNFx
        UvBj9+865q+PczyEof9pWkg=
X-Google-Smtp-Source: ABdhPJwpJeJeMM6ZUfNzrNag5SQc1Hl1Q3YML0R2H6fCxU3aL6kYvV6vZi5RhXgV+g+V+eR9totWhw==
X-Received: by 2002:a65:6143:: with SMTP id o3mr1598840pgv.332.1618459552940;
        Wed, 14 Apr 2021 21:05:52 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id i17sm714406pfd.84.2021.04.14.21.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Apr 2021 21:05:52 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        shawnguo@kernel.org, krzk@kernel.org, linux@rempel-privat.de,
        s.riedmueller@phytec.de, matthias.schiffer@ew.tq-group.com,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3 2/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC
Date:   Thu, 15 Apr 2021 12:05:33 +0800
Message-Id: <1618459535-8141-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
v3: move 'ds,imx6q-sbc' after 'dmo,imx6q-edmqmx6' to follow the alphabetical
order.

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 297c87f45db8..598fb44c1bb8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -197,6 +197,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6D or emCON-MX6Q SoM on Avari Base
-- 
2.7.4

