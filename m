Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FED562674
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbiF3XH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiF3XH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:07:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F7E58FEB
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:07:52 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69548895;
        Fri,  1 Jul 2022 01:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630460;
        bh=uDD12vDq3fsahJmQwvQ3N8Bt1OOoJitjn4KcNjyDtM4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fK3DnrjhQX7pig+qc/VUsEEUepIXspuDf5TVCXInUPxEQNA4H3t/Ly3FIE9GyXxfA
         OtRIOiQolh+OnPPNYqBJa0aMoV9KZ6YuF4MVpyxduTVYgrw12JhAyvM808esLv1KQ1
         BtQB0KDM6IlS6sYcGYJhLaym6MlDFarP1N+Qvz+g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 05/55] media: rkisp1: Enable compilation on ARCH_MXC
Date:   Fri,  1 Jul 2022 02:06:23 +0300
Message-Id: <20220630230713.10580-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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

The ISP used by the Rockchip RK3399 is also found in the NXP i.MX8MP.
Enable compilation of the driver for the MXC architecture in addition to
ARCH_ROCKCHIP.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
index dabd7e42c193..731c9acbf6ef 100644
--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_ROCKCHIP_ISP1
 	tristate "Rockchip Image Signal Processing v1 Unit driver"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV && OF
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on ARCH_ROCKCHIP || ARCH_MXC || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-- 
Regards,

Laurent Pinchart

