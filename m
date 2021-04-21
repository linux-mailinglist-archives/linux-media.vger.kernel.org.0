Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E9436642D
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 05:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235028AbhDUDuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 23:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbhDUDtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 23:49:53 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EADC06138B;
        Tue, 20 Apr 2021 20:49:21 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d124so27362516pfa.13;
        Tue, 20 Apr 2021 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j6Q1Ttafvg3RYIba5QeR133X7wnkhYv9XJCe6pOlnfs=;
        b=tTfsw/wq+VpdV2pg/ecTrCNFFu200cYmd6OrO2UkoE1MLsdCWbWEBjO3Atrm+Mil2O
         XVSJnBq729VN7/zZzaalYo3tLuM1TAM13N6mWqRSp90VNBDOP00dAj+tAtNLNgfKPeyO
         wddSOs34+DzscBOWj44ZRr2V4BtZ2VYuTn8xfVTTMoO2FcVMAzBQlBQLGl1V/+Cakvrh
         JbhpU4Fcx7yOF5L6xdhE7PR04x5D7KxIW/bYC+y7G7fYdqL0gJ3T33O0+7qEh5O0Sl0f
         EW8XFU/Z/3zjXSkV9LrbHu60+7F4az4EAlHD1iaCv49+ADA3fvao1W3hjOc3ln/JxahK
         pPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j6Q1Ttafvg3RYIba5QeR133X7wnkhYv9XJCe6pOlnfs=;
        b=aa9wQMDMrdR7m/P6ORAT+3dHOkrHdWL71R6oeGKbWhaJewe+t2qr5PmFBwHOOagT2L
         7aGCwslG+nbR9AtBPKKpcG5NLwMtv2/KU3Pvh/15077nqP7EfYz/I90z/5it6xVrKznZ
         w7YxylYIbnfTFzUmRVD4Ed3bsWKpFcM/VJLUB90H7h0Rc5srII1ucc+S5+8jNMVh1v4O
         LYsG8cOvQQDbcFvHNUmVsxThsFd/o2362TyT1yvkBDST5ubZ9PznIgBFu6SG1huTYO5L
         UVqpnWKzD/WUy1pqO8z30aL6GcdbxllLWgx9r5f1BLsD1/GFnXTTsEZo/Pd0yUmbBq+V
         BNkg==
X-Gm-Message-State: AOAM5337xP6LkkjJTNnV1Uulo5qdrxi5v4cKNFzjljWqlpZWF/y35wPK
        Z6SLm/3UmUpyPkbmr4lWA7M=
X-Google-Smtp-Source: ABdhPJwjiRUEPVxDc13lpaDzcqgsqoL2MPO6JYjsKLJwsOexEj75js4Yn+Ug30AysOBj2UXeu1xAvg==
X-Received: by 2002:a65:4d4c:: with SMTP id j12mr19673103pgt.346.1618976961376;
        Tue, 20 Apr 2021 20:49:21 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id s43sm382555pfw.164.2021.04.20.20.49.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 20:49:21 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 2/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC
Date:   Wed, 21 Apr 2021 11:48:56 +0800
Message-Id: <1618976938-20834-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
References: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v4: add Reviewed-by, Acked-by

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

