Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8612D6987
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 22:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393914AbgLJVRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 16:17:09 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:42003 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391281AbgLJVRI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 16:17:08 -0500
Received: by mail-ot1-f49.google.com with SMTP id 11so6295199oty.9;
        Thu, 10 Dec 2020 13:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjdSLtOzBPosggV3jRDhGiSxaYkS7MRdHVLaRRWPza0=;
        b=Ir6X0GAaZupMCdxz6P7oH9BCoj0nx7X0djSY6IG1cokyy8dxwS0EwlbdYwiPgYyWno
         w0NWrNFGOXZVjzucK8h5R5xs6vsEdV2H0tsPWj4ptlRPGm8jkN5RcTZr5ZogCdJdcXvU
         R3cKfvWUOs6KcNu7aqEbptOoR71nT7pZHUdoIxaPgeDy1AEEkrMVb93ni6npzY0pyNlC
         2Uv6/ZwOgoHvrYYUg/keXF+YoXNEfFtKbGs8F3w5OiwdF28nnTpxMEOt2KomAKeWq41n
         pkHtHgHQrwflmuSmvif5KoyxpysyAGW1kw4qF8dGiPvAdrNhpA5+B9Tam2lp2d4/tEUf
         +A4w==
X-Gm-Message-State: AOAM530cTLMFBmL6s22VtS3tab4gDu60sispG/qKEeK//CktVSr3Bb/X
        pt+eOlp1TWa0cOc6vuZAKn/NjsLmFQ==
X-Google-Smtp-Source: ABdhPJx+TvfFP3n7D3tdcANwKWQLDP74aXtIfa+ZKxBkmCwEwNqjtcb54c1aALYdQQtyPDjJVVTLLg==
X-Received: by 2002:a05:6830:1ad4:: with SMTP id r20mr1644647otc.354.1607634987577;
        Thu, 10 Dec 2020 13:16:27 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id m21sm1260217oos.28.2020.12.10.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:16:26 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: media: Convert video-interfaces.txt to schemas
Date:   Thu, 10 Dec 2020 15:16:20 -0600
Message-Id: <20201210211625.3070388-1-robh@kernel.org>
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
