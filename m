Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF3135EDC4
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349428AbhDNGw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349420AbhDNGwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:52:25 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4C4C061574;
        Tue, 13 Apr 2021 23:52:04 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so12011338pjb.0;
        Tue, 13 Apr 2021 23:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=P3M9lbZVn5961HQNiIEqo7PTEo34Ni2beEO/bjPPm58=;
        b=Chwvv6TKPPUeb9HRauR6suWLEQjMgzXIiiGrA/REGRYUFMGDbpmLYzyE4v3WYFCtEW
         u6zj4OgrOtDApaJDyJWGAJCfSNIbS0H5aHNF/KSBGFcVsjEvBrS4VVwZiVhTQYb00xHF
         WZuZL95zJ5MjzJTvbAUdjLyn2sMDmHYpjINUVCwPq2cd75hi7DYXLiPN5zOmkPK/fYA3
         403saSRHTBcIaqbcRvtEpsDs049ggg1bzW46zep3YxGUe7Qq1XXHfqZ+erskDJWFdDHT
         bV8vL+pONfm+wPytCac+zF0wuCG9JsrWNzRBhfLMQzTiTTWYUmdG7JNfvIhJkqnxBDww
         h8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P3M9lbZVn5961HQNiIEqo7PTEo34Ni2beEO/bjPPm58=;
        b=th5MKxHGDAAYrpPOI1xyCuG/sgUjcb3BSI+EblCvK6XWMqI83EnMBQZcfOvbZqYO3A
         yCnOwb2PdXQ6iW0Nejg4w7cgNsifPasfNtRQynKYnYM+c3ng8P4LcV6w3TcMowmb5Bix
         4ToMPq/1IxKE0WdxOJ1uD5y+JQgRw1Gd5HVnJAEDlrVG8MMqfgLwy+W9fVAP1QXWFrpr
         DJ8YYWUTXPu8nPrXXAe71sEHnKbTGNTL5kepJJNQcJuA7zn/8T4RltlvpYgSFZsxSavQ
         Fp2Aqw1CzaK4srcL24i/ko8pQs3eF9sOy3TOSlhKE3YR0CXeGzPL6BahNqjjj4g4NX76
         6pDA==
X-Gm-Message-State: AOAM533o6nJGF/oYVY0ciuiUsqWMr+fukhxw8TRKyYaxcnvNKHkczMYK
        rPhWhZLYhXEB4+H2N4XAYY8=
X-Google-Smtp-Source: ABdhPJysOS6DWbwFtG9ni85Go6GQI9yl6WthFH/XnAthhmKXvT4ZVdZqQ+RGtiPOX+++afXqZPRkZg==
X-Received: by 2002:a17:902:e882:b029:e6:caba:fff6 with SMTP id w2-20020a170902e882b02900e6cabafff6mr35507605plg.73.1618383123784;
        Tue, 13 Apr 2021 23:52:03 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id r11sm3775736pjp.46.2021.04.13.23.51.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:52:03 -0700 (PDT)
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
Subject: [PATCH v2 0/4] arm: imx: Add i.mx6q DaSheng COM-9XX SBC board support
Date:   Wed, 14 Apr 2021 14:51:53 +0800
Message-Id: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset aims to add kernel support on DaSheng COM-8XX SBC board
optimize ov2659 driver to handle xvclk on/off at proper stage to save power

changes based on master branch, since commit id:
89698becf06d341a700913c3d89ce2a914af69a2

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

v2:
- add "[PATCH v2 4/4] dt-bindings: add dasheng vendor prefix" to fix
  checkpatch.pl warning.

dillon min (4):
  dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC board dts
    support
  arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC board support
  media: i2c: ov2659: Add clk_prepare_enable(),  clk_disable_unprepare()
    to handle xvclk
  dt-bindings: add dasheng vendor prefix

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/imx6q-ds.dts                     |  17 +
 arch/arm/boot/dts/imx6qdl-ds.dtsi                  | 465 +++++++++++++++++++++
 drivers/media/i2c/ov2659.c                         |  24 +-
 6 files changed, 504 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi

-- 
2.7.4

