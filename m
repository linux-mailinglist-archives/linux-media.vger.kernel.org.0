Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C20372556
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 07:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhEDFLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 01:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhEDFLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 01:11:16 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F13DC0613ED;
        Mon,  3 May 2021 22:10:16 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id t21so4195554plo.2;
        Mon, 03 May 2021 22:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nTvjEP/PFj345lQfN7ypRUpJjHLaGUKVoBMm/L1bDXY=;
        b=dx0R5ULeOXQvzcDiricmjKcH/DQCAZMSCMCEVxlb1nLg9YyiRRSWkKur3Qps6/Guez
         W92aVObOnZwSyidXWHRWWCZam1DrFd4M7qRaD07ffcfFqKhGYQTmax8iPE17htI5bVyL
         7JjUQvUCyQCAuDaM6rv7aD05iuVLwqV6GgXvKL+SHWb1PKZsM6pHknTzGYBtBTzmaxE9
         sTZZ8jTybp9nzy3+PMXiZ4iCBNUiDWQ6Hi5/ER8XLUbR0dKRXvCJucqRc+3S7wwx4Nm3
         CWsTFpgrld0/L6dvoLRlgLPmZpFgPeP7D06mdQVP0h62KBb6MG4GADPziW4D0m96meYU
         9x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nTvjEP/PFj345lQfN7ypRUpJjHLaGUKVoBMm/L1bDXY=;
        b=bl0Xyv7UfPh9yf5tke/APHuN+DRcrSwBWczOoZF79Qbw4jQ0KH21ljnogniHgWP+4F
         A4yRQhelrKNhQnCC0W8upztYwBMLdeEH1GSWqozWEDGncmKujd/UzB5KV/tcOkiCufWr
         vX+6HFaLukGVb2HAtorqhQgICE7V4ibKHCbm5X3couI/eSKJk11J08YnBGt+94DGqP3F
         Rc0hQn8ByIYNMErCw8gsAGJIvrGehNyarcbE1eWyov7tnmCkVv+P1oAJr7CtiYUn+zCP
         J5fC5lBy1+sUaYPAGdb/tEpx1nVZigc5lF6dQQ1kLBC9ThC2LvlW5XrrJmDcRm0U582C
         t4RA==
X-Gm-Message-State: AOAM531L38SwaMwPQWS+mCG9NIqUum+3xOYc2F+wH7j4Be1FbZuunjNT
        f8E026LY2hmixNLcJHBTaU2JztqfDYz3UA==
X-Google-Smtp-Source: ABdhPJx+WC8/9gbUZ8Z9KL3cIsmCN6wasAYsYDgZOKjqWqBm6D/b0ZyVShaeH9G1iT0NzEcBuhMnDQ==
X-Received: by 2002:a17:903:248e:b029:ec:9c4f:765e with SMTP id p14-20020a170903248eb02900ec9c4f765emr24590922plw.17.1620105016068;
        Mon, 03 May 2021 22:10:16 -0700 (PDT)
Received: from localhost.localdomain ([63.143.61.57])
        by smtp.gmail.com with ESMTPSA id 3sm10457815pff.132.2021.05.03.22.10.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 22:10:15 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, mchehab+huawei@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 2/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC
Date:   Tue,  4 May 2021 13:09:51 +0800
Message-Id: <1620104993-5850-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
References: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

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

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---

v5:
- no code change, just change my git author name from lower case to higher case

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
1.9.1

