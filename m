Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619CD28E225
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 16:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727622AbgJNO2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 10:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgJNO2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 10:28:11 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE09AC061755;
        Wed, 14 Oct 2020 07:28:10 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d81so2494389wmc.1;
        Wed, 14 Oct 2020 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NR+coMmEPgMUMLXYwmX3BZxfCwOfWTDA5P95e2o4X8g=;
        b=ZzQ17A8+aTabWnWcaJVhea8YUu7gyQJEgT+0U2NPjEyLZIsU+DmL0vVAr2HW2nkAM4
         sRxQy9UkhzT1/OxpIVN5AEF4E5y3rH4dlJzyKtS2k9C2ayIpSTGAPgVXMgLxWcqPimS4
         MGINSVk84pDHfWLlbeVe/OTrWISZqK6fY000MXtMImid5DyGjjG4fgLP8XqXPx3Br39S
         xsydnyct+FzWoIxE0PbUpoRUWtWK0+vAmRuEPEuPOO56NYCUQ09wCEDlRbyuaVQ6oMWp
         5v8PN8KTrzNfYchsYltJKdEXKUHmENfvUYhdNXL1eINyublpofFtX7/we//zPNh5m3N7
         U3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NR+coMmEPgMUMLXYwmX3BZxfCwOfWTDA5P95e2o4X8g=;
        b=CpvawMfRgG/EbEIcucz6uLVGO9x/KaAaO/ho2eQZmLpUWlEDhT2VbcSGXYPWOSrRgH
         vXOzJsjv2a2m8Fy0LRDp2IMnfYeR8wb0/8CCAalvVJmuInIsSMT1i5IvdxUgsbzxplbt
         +rn2nS9g73cpoH5untNWhynC4iasdhDy8YD0OZRa/8ZjvPuiEaX4nkjJO+y0LuuLWar9
         z7qTQwoizelCX33XcSYZCqhd0hTzXfMPNXeHD85hbdADBTfJI0owWoNCCSPwxElO0FKy
         TbQXBPgqSuS6OEBrdF3KT6d3WkoZhDPU45I181VQsc4M0j67vxnfSSh/o/EyT3BhHCRz
         zWgw==
X-Gm-Message-State: AOAM531bg0RpEP5TZLcLCNNW7uuHvL5ax2IDZu88t5AgAMgPdzC3jYZx
        H8Tt5lMGy9cBo7Fip09qEVI=
X-Google-Smtp-Source: ABdhPJylVAwvZgAF5fnr/5T7ovUfw5ijDs5ksOTd3AhvRgc0YyjljMo6LOKE35CwylOQ84Q7z3xePQ==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr3714841wmh.21.1602685689416;
        Wed, 14 Oct 2020 07:28:09 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g5sm4068702wmi.4.2020.10.14.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 07:28:08 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 0/3] dt-bindings: media: imx7 and ov2680 updates to yaml
Date:   Wed, 14 Oct 2020 15:27:56 +0100
Message-Id: <20201014142759.726823-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update bindings documentation to json-schema yaml in imx7 csi, mipi csi and
ov2680 sensor media devices along the respective MAINTAINERS entry.

Cheers,
  Rui

v1 -> v2:
  Sakari Ailus - Patch 1/3:
  https://lore.kernel.org/linux-media/20201013160908.GC13341@paasikivi.fi.intel.com/
  - omit remote-endpoint
  - remove not needed clock-lanes and data-lanes


Rui Miguel Silva (3):
  dt-bindings: ov2680: convert bindings to yaml
  dt-bindings: imx7-csi: convert bindings to yaml
  dt-bindings: imx7-mipi-csi2: convert bindings to yaml

 .../devicetree/bindings/media/i2c/ov2680.txt  |  46 -----
 .../devicetree/bindings/media/i2c/ov2680.yaml | 109 +++++++++++
 .../devicetree/bindings/media/imx7-csi.txt    |  42 ----
 .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
 .../bindings/media/nxp,imx7-csi.yaml          |  84 ++++++++
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 181 ++++++++++++++++++
 MAINTAINERS                                   |   6 +-
 7 files changed, 377 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

-- 
2.28.0

