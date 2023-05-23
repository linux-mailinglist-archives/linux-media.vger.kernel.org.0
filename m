Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58AF70D809
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 10:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236190AbjEWI4g convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 23 May 2023 04:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbjEWI4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 04:56:32 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A687D119;
        Tue, 23 May 2023 01:56:29 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6BF78846B;
        Tue, 23 May 2023 16:56:27 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 16:56:27 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 16:56:27 +0800
From:   Jack Zhu <jack.zhu@starfivetech.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jack.zhu@starfivetech.com>,
        <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 0/5] Add support for external dphy
Date:   Tue, 23 May 2023 16:56:21 +0800
Message-ID: <20230523085626.3295-1-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for external D-PHY and JH7110 SoC which has a Cadence
MIPI-CSI2 RX controller. The driver is tested on VisionFive V2 board.

PLEASE NOTE: this patch series was spun off from the v4 of another series that
included CSI and ISP driver. You can check the comments for earlier version in
the link below. I'm sorry that the first version link has been lost.

v4 link: https://lore.kernel.org/all/20230413035541.62129-1-jack.zhu@starfivetech.com/
v3 link: https://lore.kernel.org/all/20230331121826.96973-1-jack.zhu@starfivetech.com/
v2 link: https://lore.kernel.org/all/20230310120553.60586-1-jack.zhu@starfivetech.com/

Current review status:
  - cdns,csi2rx.yaml:
      Reviewed by: Krzysztof Kozlowski
      Reviewed by: Laurent Pinchart
  - cdns-csi2rx.c
      Reviewed by: Laurent Pinchart
  - MAINTAINERS
      Reviewed by: Krzysztof Kozlowski
      Reviewed by: Laurent Pinchart

Thanks to everyone who reviewed my work !

Changes in v2:
- Matched reset names in bindings.

v1 link: https://lore.kernel.org/all/20230512102637.50917-1-jack.zhu@starfivetech.com/

Jack Zhu (5):
  media: dt-bindings: cadence-csi2rx: Convert to DT schema
  media: dt-bindings: cadence-csi2rx: Add resets property
  media: cadence: Add operation on reset
  media: cadence: Add support for external dphy
  media: cadence: Add support for JH7110 SoC

 .../devicetree/bindings/media/cdns,csi2rx.txt | 100 ---------
 .../bindings/media/cdns,csi2rx.yaml           | 201 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  | 107 ++++++++--
 4 files changed, 294 insertions(+), 115 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml

-- 
2.34.1

