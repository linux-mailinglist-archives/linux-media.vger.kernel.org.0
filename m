Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6746857C65A
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiGUIfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiGUIfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB4012AA2
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA16B13B9;
        Thu, 21 Jul 2022 10:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392551;
        bh=P++K1SGk+NHOnNVxrp8rGib6GBb6I3b2vyI6W91OFqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y6g9eRloP9UM3pUIh8xwuUn+KbyS+PjnqOPzaV0WGzI+xehUZ7Dtzm2aNDJPRBDZf
         i3ezdMXqYrNLYt+USZWg60o/0XQx7idNM/BqpInfHC6yq+UVs/gq6w7QMb/o9QF6BB
         kwgXLRP+qA6M1qbTJfrAefU87II2Pc/mtJ9p1W+U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 06/19] media: i2c: imx290: Drop regmap cache
Date:   Thu, 21 Jul 2022 11:35:27 +0300
Message-Id: <20220721083540.1525-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only two registers are ever read, and once only. There's no need to
cache values.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index f280ded2dac3..711282126c34 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -97,7 +97,6 @@ static const struct imx290_pixfmt imx290_formats[] = {
 static const struct regmap_config imx290_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
 };
 
 static const char * const imx290_test_pattern_menu[] = {
-- 
Regards,

Laurent Pinchart

