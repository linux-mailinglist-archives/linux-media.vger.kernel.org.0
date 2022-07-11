Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A725702F6
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiGKMni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiGKMn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:43:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA4E3C8DB
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:43:28 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F29618D7;
        Mon, 11 Jul 2022 14:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543402;
        bh=b8MY2+DX2B5i2pNTVl6o3TEjHsD5MN1FKb1HY/KQTVc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GZ14HcQBoN33P8cTmITh949OJvMek4fkNMZOistFm+6sdzK27UHtmAvUwksff50R3
         kFF8BHIlg+AUp/Jh/8zsSaYjcTJc4UgDV29sRwI2ZzrXJVSGHsD17l5M1tAQJJM30M
         9cloe2FK+M9VnYHYE6lF+4hSBnhUiZVGz3xUlxc4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 05/46] media: rkisp1: Enable compilation on ARCH_MXC
Date:   Mon, 11 Jul 2022 15:42:07 +0300
Message-Id: <20220711124248.2683-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
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

