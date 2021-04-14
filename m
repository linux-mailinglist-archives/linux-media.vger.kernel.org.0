Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8531335EDCB
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349440AbhDNGwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349441AbhDNGw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:52:29 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55E3C061574;
        Tue, 13 Apr 2021 23:52:08 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so5479441pja.5;
        Tue, 13 Apr 2021 23:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G23TTNVgIun57CL6w4lwJkbSul+rqhgrlhXqEqIU9Nw=;
        b=qh8VHJABwRk+vcTxeLgnZGGKbjkVm+6MH8aDaPJJBgv8dH0CXtwRo+II1u1ZJsok6N
         tQi+FkfDpu7B4FpLjrppR2JDRmuyvk+i3e76aMtZ2b35ggNmfT/Kgb/mknmeStJGqaaQ
         0Hq0hd5fXFVtKGlw6pTawhADFOylZEhSbzEGPsPalQlF0oMzKAiYNMLt0sb5HT1TYYgZ
         kW4qZcYLVSEPm4bUwt2fBuhy1+gU5p9m8ZKpVPlvBJVsQApO0ru98D26KiTbV4uc8Uw0
         n3ULqNJLe3ib0tMVNY0nOGRSW6coMYT4NbGbqsDvn/rr6oW3z3RVNrYFBurh8ppE1cyJ
         t1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G23TTNVgIun57CL6w4lwJkbSul+rqhgrlhXqEqIU9Nw=;
        b=Qm+JPyWUrFmKL+3xpUOgX9zUBofByLI+Pjym/RqyDA739MIZopyWpUmBRo2L/9rOJD
         +GbZrlpcHMLqg9otXwnZK6AgHYF7sVyT4IOAkh3wLetUg0BlEiE6wzIkaKvIrhBaVry2
         i2skOp1rkx7b12a2I/4bVlYhwXxmXbO84FjJjEW2Z1YCfWUPIpeoIbst9ioH7zVTd2dh
         OEiacSzpptSVam9p0YtdTOzZE8LiMBWA3eIc40XuqFEJZGbyMiFIsCbkuKUPvkw3dFvQ
         gXN6DQpEWLOE0nzfRgY+2wSR/EYNGPfiu/YKYjmUZJ7zW1brQ74mHHBcJaHasLMFXN3x
         56aw==
X-Gm-Message-State: AOAM532u+ex9tmSEXITkOkMH3v6VhcQH0KkM4vuRMHXCK/CARMQIoCB5
        OgWOEjGm5MGdobjAYQbAaQU=
X-Google-Smtp-Source: ABdhPJx9OJHDzHuBGWH3PCQW61yv6PHZwLLCm5NwuCn8eE+JaUyCVY7EhkPOSDBLtgafaMUm9KS3PQ==
X-Received: by 2002:a17:90a:318d:: with SMTP id j13mr2035517pjb.174.1618383128454;
        Tue, 13 Apr 2021 23:52:08 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id r11sm3775736pjp.46.2021.04.13.23.52.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:52:08 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC board dts support
Date:   Wed, 14 Apr 2021 14:51:54 +0800
Message-Id: <1618383117-17179-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
References: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
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
v2: no changes

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

