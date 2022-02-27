Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FDE4C5EA2
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 21:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiB0Uer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 15:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbiB0Ueq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 15:34:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C5B5BD35;
        Sun, 27 Feb 2022 12:34:09 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95841478;
        Sun, 27 Feb 2022 21:34:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645994047;
        bh=dCm4hvIp+vzGElq2BpdvN8zxpXQC5nkO6nbJPgScX3Y=;
        h=From:To:Cc:Subject:Date:From;
        b=ac94/InGRSFx08w8zNBRAbNzIWko02IMkzsgcHGTyOo9QF9upj0ieoH3W4sGVM4LF
         +c3gVv3JVY4ixPcWRZmAu/uaUUuam1qFNBPFqPbhywjbzJWP+zyoXY+YyJpP0m3jJJ
         SzgEzaQQGTyo0UkWEPXenNd5IIxabQSDuza2mYVc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 0/2] dt-bindings: Add macros for video interface bus types
Date:   Sun, 27 Feb 2022 22:33:50 +0200
Message-Id: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
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

If the idea is accepted, and if desired, I can convert the DT sources to
use the new macros. How should I then split that, one big patch, one
patch per SoC vendor (easy for arm64, but how about arm ?), ... ?

Laurent Pinchart (2):
  dt-bindings: media: Add macros for video interface bus types
  dt-bindings: Use new video interface bus type macros in examples

 .../display/bridge/analogix,anx7625.yaml         |  3 ++-
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml  |  3 ++-
 .../bindings/media/i2c/ovti,ov772x.yaml          |  3 ++-
 .../bindings/media/marvell,mmp2-ccic.yaml        |  3 ++-
 .../bindings/media/microchip,xisc.yaml           |  3 ++-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml |  4 +++-
 include/dt-bindings/media/video-interfaces.h     | 16 ++++++++++++++++
 7 files changed, 29 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

-- 
Regards,

Laurent Pinchart

