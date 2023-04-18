Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8101C6E6820
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 17:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjDRPbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 11:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjDRPbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 11:31:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2CD9025;
        Tue, 18 Apr 2023 08:30:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E583DE5;
        Tue, 18 Apr 2023 17:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681831846;
        bh=8PExUxGcJcf3IdDR2iWR40y+VItNepSBG/5LHkOCG7E=;
        h=From:To:Cc:Subject:Date:From;
        b=SX74eg9zLxIo5VBNJHjPvAc6qz2DQEW8Z//pIbOo54Cd0ed11ibiR3OZdggtFN/SS
         Mqf7PqNqOA2U7h3NQ0fstCxOz2LyVCiQh59I8hmojYfz4FB0Bo2RBFS9OB3GQ5febB
         ZaSEOB8rc42MIbesolpYhTVb8rRFxJPM6HYdWUro=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH v2 0/2]  arm64: dts: imx8mp: Enable CSIS and ISI in DT
Date:   Tue, 18 Apr 2023 18:31:02 +0300
Message-Id: <20230418153104.21337-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 102 ++++++++++++++++++++++
 1 file changed, 102 insertions(+)


base-commit: 6a8f57ae2eb07ab39a6f0ccad60c760743051026
-- 
Regards,

Laurent Pinchart

