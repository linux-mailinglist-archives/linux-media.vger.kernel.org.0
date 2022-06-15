Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB0754D18C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 21:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346239AbiFOT0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 15:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345912AbiFOT0Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 15:26:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B2B39801;
        Wed, 15 Jun 2022 12:26:23 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B07CB5A9;
        Wed, 15 Jun 2022 21:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655321181;
        bh=dAyHwVNRR8uyNJA5GWvgJo1y3duV9FG9Vv/dBs/cbfs=;
        h=From:To:Cc:Subject:Date:From;
        b=fIbhjwJOFSkJMEetcr6ZmkuU9JteR/aKWsC8upZ5uFZcQrVugP5FPLn0W3HVuezbe
         rWpvpJw/xZSj4vgK4x2Z7Oq43WKcvDNs9oExl9c1EPFopT70bYDredxQp8YJhj9uC4
         REC0sFPhpDoJ+1QSO9s98dRArVzZCim6yl3RI+Tc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] media: imx: imx-mipi-csis: Add i.MX8MP support
Date:   Wed, 15 Jun 2022 22:25:58 +0300
Message-Id: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

This small patch series is a collection of independent patches that
collectively enable i.MX8MP support for the imx-mipi-csis CSI-2
receiver.

Technically speaking, only patch 4/4 is needed to get the driver working
on the i.MX8MP SoC. However, patch 1/4 fixes a related kernel log
warning, and patch 3/4 is required for integration with the ISP found in
that SoC. Patch 2/4 is the only one that is not strictly required, but
I've thrown it in the series as it has been developed as part of i.MX8MP
enablement.

Laurent Pinchart (4):
  media: imx: imx-mipi-csis: Set the subdev fwnode for endpoint matching
  media: imx: imx-mipi-csis: Add version register
  media: imx: imx-mipi-csis: Implement the .get_frame_desc() operation
  dt-bindings: media: nxp,imx-mipi-csi2: i.MX8MP support

 .../bindings/media/nxp,imx-mipi-csi2.yaml     | 11 +++--
 drivers/media/platform/nxp/imx-mipi-csis.c    | 41 +++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

