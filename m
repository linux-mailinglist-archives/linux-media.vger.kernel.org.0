Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0139C2D6A9D
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 23:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404685AbgLJVRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 16:17:17 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:33837 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391281AbgLJVRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 16:17:14 -0500
Received: by mail-oi1-f179.google.com with SMTP id s75so7401939oih.1;
        Thu, 10 Dec 2020 13:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EVQxAwt3gsXOAfZvTHmVfp2kSIvp/AI5uu2sm31wTCo=;
        b=rKpuSYlJeJ3+b2t3DsKcl7stYNNXYKZsS0VeMNJTQrvk3Sus1vwlGcIkwhEcnivr0b
         aggyM4XO0W6xeQhGkO4O7MdBPBBXPRFQhermCBimW0i3PmKKCVWTgpEHcYh/Zs4B0tYD
         1fFbzLbWCdCoa/sf3nUtDnU+Zdw5DNHjhbeeLlr0j5DMBmu/zJXiMWoK0MqJvRtWHUYA
         XYHVl+WpFy0a9pCE256yS2TP64nF1fw6g8VGVgvWfrrS9BCn/ff5wzMFROfFjZoydERP
         ewIq5uT8PHBVRSd/x7QU/wmIi67bquoVox78eC+qE+Vf712kNrBHUFDLKlW0eU6avrUg
         6s9A==
X-Gm-Message-State: AOAM530qQb0EhKhWAX50D/qLVbZFZ7A8/z2+TpBF7mEYcF1M3crUb6tO
        2D4rfzXRbTh7Pisq0qNRWw==
X-Google-Smtp-Source: ABdhPJxYLBMjM2y47RN3jiD116dYusvBylFwLHLBtyUXwNg2KOzQk2Wm1D9uf3nxS1VFaa0dJnQy9g==
X-Received: by 2002:aca:5fc1:: with SMTP id t184mr6878917oib.10.1607634993045;
        Thu, 10 Dec 2020 13:16:33 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id m21sm1260217oos.28.2020.12.10.13.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:16:32 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 0/2] dt-bindings: media: Convert video-interfaces.txt to schemas
Date:   Thu, 10 Dec 2020 15:16:23 -0600
Message-Id: <20201210211625.3070388-4-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210211625.3070388-1-robh@kernel.org>
References: <20201210211625.3070388-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts video-interfaces.txt to DT schema which in turn is
based on converting the graph binding to a schema. All the media users
are converted to use the graph and video-interfaces schemas.

Based on media tree commit 7ea4d2329330. This is dependent on dt-schema
changes not yet committed[1]. Please review those too.

Rob

[1] https://github.com/devicetree-org/dt-schema/tree/of-graph


Rob Herring (2):
  media: dt-bindings: Convert video-interfaces.txt properties to schemas
  dt-bindings: media: Use graph and video-interfaces schemas

 .../media/allwinner,sun4i-a10-csi.yaml        |  11 +-
 .../media/allwinner,sun6i-a31-csi.yaml        |  12 +-
 .../bindings/media/i2c/adv7180.yaml           |  36 +-
 .../bindings/media/i2c/adv7604.yaml           |  37 +-
 .../bindings/media/i2c/aptina,mt9v111.yaml    |   4 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  30 +-
 .../devicetree/bindings/media/i2c/imx219.yaml |  21 +-
 .../bindings/media/i2c/maxim,max9286.yaml     | 101 +--
 .../bindings/media/i2c/mipi-ccs.yaml          |  15 +-
 .../devicetree/bindings/media/i2c/ov5647.yaml |  20 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml |  21 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml      |  30 +-
 .../bindings/media/i2c/ovti,ov2680.yaml       |   6 +-
 .../bindings/media/i2c/ovti,ov772x.yaml       |   9 +-
 .../bindings/media/i2c/sony,imx214.yaml       |  25 +-
 .../bindings/media/i2c/sony,imx274.yaml       |   3 +-
 .../bindings/media/marvell,mmp2-ccic.yaml     |  15 +-
 .../bindings/media/nxp,imx7-csi.yaml          |   5 +-
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  32 +-
 .../bindings/media/renesas,ceu.yaml           |  17 +-
 .../bindings/media/renesas,csi2.yaml          |  54 +-
 .../bindings/media/renesas,vin.yaml           | 113 +---
 .../bindings/media/rockchip-isp1.yaml         |  40 +-
 .../bindings/media/st,stm32-dcmi.yaml         |  18 +-
 .../devicetree/bindings/media/ti,cal.yaml     |  55 +-
 .../media/video-interface-devices.yaml        | 406 +++++++++++
 .../bindings/media/video-interfaces.txt       | 640 +-----------------
 .../bindings/media/video-interfaces.yaml      | 346 ++++++++++
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  39 +-
 29 files changed, 922 insertions(+), 1239 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml

--
2.25.1
