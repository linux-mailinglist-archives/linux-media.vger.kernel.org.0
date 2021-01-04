Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7F82E9B81
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 17:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbhADQ6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 11:58:51 -0500
Received: from mail-io1-f46.google.com ([209.85.166.46]:46126 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbhADQ6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 11:58:51 -0500
Received: by mail-io1-f46.google.com with SMTP id 81so25553054ioc.13;
        Mon, 04 Jan 2021 08:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oIJoHkuufEgXto+IHpHbDIhmP0P1hFczaPsDARxMm/Y=;
        b=NCaGOSigt+CcJPuxCTqfVlsAd/E1GSWXiRJwncNESMharoRxWckZrCslwODZtW8pn4
         y/7zfxYM2PaKws8jPwl8dOwQAVioX4fc0esHybABhlZVRZy1S52nZZ/4fYGjzHSqzxNy
         GAYsxD9b+jwuJTmonEEpDt6nGCYHaxMQAEQjByCTbFCraZ7NSFwTZC+tN5i8Pd8QA774
         bH1gpT0jZ0U5vZ27M0rkHcZB2ketQ8TDvktfBOUAne0kXD0YQZNllht0b7N3X+xxL/mW
         npQ/SIrVafuX5sS0GIeYlYGnBRMazx+Aq/dpfU9iDNLg1uNxEd5Z/+oqkKqPo7W5vuox
         TAuA==
X-Gm-Message-State: AOAM533pAFwRSFKXHwH8lwc65DIAggRUdphZzk1PFXNFxGjDTxJl2CoV
        2Sfg/uqkhGhpDQ+sxhzRGQ==
X-Google-Smtp-Source: ABdhPJw5uQ0G+vrbECx0JZGCERzbN5kMX+g/hNZb29bE0UzKPVUbNaNps40SOGI+YU3YrwiOjyaziw==
X-Received: by 2002:a02:6a0e:: with SMTP id l14mr63411370jac.58.1609779490082;
        Mon, 04 Jan 2021 08:58:10 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id a18sm42381528ilt.52.2021.01.04.08.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:58:09 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 0/2] dt-bindings: media: Convert video-interfaces.txt to schemas
Date:   Mon,  4 Jan 2021 09:58:06 -0700
Message-Id: <20210104165808.2166686-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts video-interfaces.txt to DT schema which in turn is
based on converting the graph binding to a schema. All the media users
are converted to use the graph and video-interfaces schemas.

Based on v5.11-rc2. Ideally this should be applied before anything else
for 5.12 and subsequent schemas use the graph and video-interfaces schemas.

Rob


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
 .../bindings/media/i2c/mipi-ccs.yaml          |  17 +-
 .../devicetree/bindings/media/i2c/ov5647.yaml |  20 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml |  22 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml      |  29 +-
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
 .../bindings/media/video-interfaces.yaml      | 344 ++++++++++
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  39 +-
 29 files changed, 923 insertions(+), 1238 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml

--
2.27.0
