Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164C26E3F33
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 07:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjDQF4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 01:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjDQF4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 01:56:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D722D69;
        Sun, 16 Apr 2023 22:56:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35AC675B;
        Mon, 17 Apr 2023 07:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681710970;
        bh=Eg2chLrywh0vU+JklOGsxaRj3NbTqW10/iQm7BdTY2g=;
        h=From:To:Cc:Subject:Date:From;
        b=fmJ3I9vGu+7UMzOXwfk9HPxVkiSyHX2t+wH4J0KhbyxghlC3pPhI7M24kzSU8mAC4
         Xfxtg2I8pLuf2B+2Ygb3rS3PRqHZ7YVBgTgtTC9l0zBwLrD/jw5phA9GfpFpNMoUlk
         VoXccDtj6AkpwfhGUf9IMoDc7WVvKVfZrBnW39K4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mp: Enable CSIS and ISI in DT
Date:   Mon, 17 Apr 2023 08:56:25 +0300
Message-Id: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
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

This small patch series adds the CSIS and ISI devices in the i.MX8MP DT
to support cameras. The ISI DT bindings have just been merged and will
appear in v6.4, making this series a candidate for v6.5.

With these two patches, a board overlay can enable camera support by
instantiating the camera sensor, connecting it to a CSIS instance, and
enabling the CSIS and ISI nodes. The camera pipeline is supported by
V4L2 drivers.

Laurent Pinchart (2):
  arm64: dts: imx8mp: Add CSIS DT nodes
  arm64: dts: imx8mp: Add ISI DT node

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)


base-commit: 20af6be6bee4c3af80aac9b44b3d32d89824dde7
-- 
Regards,

Laurent Pinchart

