Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B27D2CCAE8
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 01:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727293AbgLCANr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 19:13:47 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:37596 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCANr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 19:13:47 -0500
Received: by mail-io1-f52.google.com with SMTP id p187so244529iod.4;
        Wed, 02 Dec 2020 16:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjdSLtOzBPosggV3jRDhGiSxaYkS7MRdHVLaRRWPza0=;
        b=Vc/729mjE2DpwE0jldO/8qLXh7OwXO+acC8dElUEim4YbtjhzKlcf8MiHJpx+DoxhO
         LLT473D/AeEyEQM+/Yh9TV5PYwsOeNhH0oNuIzxNV5ouQNNcPSlXWMt4bFNKpiz20tWE
         wOVJt1zbxXDGS73iZp9zNCfWoHB85lBw9CkGfbnYhBHzA5oN3RezCmhioHaA91IXjl+k
         EogKs9aoabzF2r1HGuSxJuRDxLvXiqaiqH6Jw7miYEUP/G0yfQ7mDkrU7Q9FCJREKbzp
         5hdzNDHmEigeGLqAwK+qSM21+5HC6eHupOHvsdaYvmfJ6az9FurFNLr5XJJ5pxdmftxG
         OKWQ==
X-Gm-Message-State: AOAM530neCMse1fptYixlOvGjRboEi4/0I9ZHYm4RXtr73EfriS2vrMo
        21P26GXo7cbuSyhAjzHbYw==
X-Google-Smtp-Source: ABdhPJy2RDVShTjGBIAhbo1eYuIMmc4l/8Eoj6HOn0KOlrhRqAOF2Z9VUyFAC3VmjgThA+YUFikqHQ==
X-Received: by 2002:a6b:ea08:: with SMTP id m8mr977376ioc.140.1606954386186;
        Wed, 02 Dec 2020 16:13:06 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id n7sm174830ioa.34.2020.12.02.16.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:13:05 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: media: Convert video-interfaces.txt to schemas
Date:   Wed,  2 Dec 2020 17:13:00 -0700
Message-Id: <20201203001302.3407476-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts video-interfaces.txt to DT schema which in turn is
based on converting the graph binding to a schema. All the media users
are converted to use the graph and video-interfaces schemas.

Based on media tree commit a3f132df0e5f. This is dependent on dt-schema
changes not yet committed[1]. Please review those too.

Rob

[1] https://github.com/devicetree-org/dt-schema/tree/of-graph

Rob Herring (2):
  media: dt-bindings: Convert video-interfaces.txt properties to schemas
  dt-bindings: media: Use graph and video-interfaces schemas

 .../media/allwinner,sun4i-a10-csi.yaml        |  11 +-
 .../media/allwinner,sun6i-a31-csi.yaml        |  12 +-
 .../bindings/media/i2c/adv7180.yaml           |  35 +-
 .../bindings/media/i2c/adv7604.yaml           |  37 +-
 .../bindings/media/i2c/aptina,mt9v111.yaml    |   4 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  30 +-
 .../devicetree/bindings/media/i2c/imx219.yaml |  21 +-
 .../bindings/media/i2c/maxim,max9286.yaml     | 101 +--
 .../devicetree/bindings/media/i2c/ov5647.yaml |  20 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml |  21 +-
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
 .../media/video-interface-devices.yaml        | 405 +++++++++++
 .../bindings/media/video-interfaces.txt       | 640 +-----------------
 .../bindings/media/video-interfaces.yaml      | 344 ++++++++++
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  39 +-
 27 files changed, 901 insertions(+), 1211 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml

--
2.25.1
