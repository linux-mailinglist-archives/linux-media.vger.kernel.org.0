Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEEC4CEC90
	for <lists+linux-media@lfdr.de>; Sun,  6 Mar 2022 18:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiCFRkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Mar 2022 12:40:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiCFRkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Mar 2022 12:40:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D195711146;
        Sun,  6 Mar 2022 09:39:22 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 429C9482;
        Sun,  6 Mar 2022 18:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646588361;
        bh=ywoVmQNqU9OcRFUjFQv8ux4/JC1YVycOwhZKUoi+QXY=;
        h=From:To:Cc:Subject:Date:From;
        b=S20ihGSyDvtZrPojmqTCirUA4Wt3g6Oo9v3J1+oqjVyht/DRyQQYonGg9RN+zUR70
         EOQAgBAxTKYih0l/3lxryFmZjATdk+fjHXVWZvlCc7Au67NoSPrqOUwy36pasAeBhN
         RzXnxIR33vlNEXRDh2vfiqBdtpE2taN2TsOcdugI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v2 0/3] dt-bindings: Add macros for video interface bus types
Date:   Sun,  6 Mar 2022 19:39:02 +0200
Message-Id: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series is the result of me getting a bus-type numerical
value wrong in a device tree file and spending too long debugging the
issue. Hopefully there's nothing controversial here.

Compared to v1, the PARALLEL bus type has been renamed to BT601, and
patch 3/3 now converts existing DT sources. See individual patches for a
detailed changelog.

I can split patch 3/3 per architecture or per board if desired, but
given that this is a mechanical change, and the patch is fairly small,
I'd rather keep it as-is and merge it as part of the series.

When writing 3/3 I noticed that the anx7625 bindings and the
corresponding driver badly misuse the bus type (mapping CCP2 to mean
MIPI DPI, and PARALLEL - now BT601 - to mean MIPI DSI). This misuse
hasn't reached a released mainline kernel as it got merged in v5.17-rc1,
so there may still be a chance to fix it. Let's discuss this in [1],
I'll update this series and rebase it on v5.18-rc1 once released based
on the outcome of the discussion.

[1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/

Laurent Pinchart (3):
  dt-bindings: media: Add macros for video interface bus types
  dt-bindings: Use new video interface bus type macros in examples
  ARM: dts: Use new media bus type macros

 .../display/bridge/analogix,anx7625.yaml         |  3 ++-
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml  |  3 ++-
 .../bindings/media/i2c/ovti,ov772x.yaml          |  3 ++-
 .../bindings/media/marvell,mmp2-ccic.yaml        |  3 ++-
 .../bindings/media/microchip,xisc.yaml           |  3 ++-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml |  4 +++-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi          |  4 +++-
 arch/arm/boot/dts/omap3-n900.dts                 |  5 +++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts  | 11 +++++++----
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi    |  4 +++-
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi    |  4 +++-
 arch/arm/boot/dts/stm32429i-eval.dts             |  3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts            |  3 ++-
 include/dt-bindings/media/video-interfaces.h     | 16 ++++++++++++++++
 14 files changed, 52 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

-- 
Regards,

Laurent Pinchart

