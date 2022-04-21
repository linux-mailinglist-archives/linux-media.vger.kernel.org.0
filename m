Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F4A50AC32
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442691AbiDUXqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442697AbiDUXqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:46:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73094DFE7
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:43:11 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70DA2156A;
        Fri, 22 Apr 2022 01:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584577;
        bh=6G6FkI/pwk64+6kq/iSTcUIrG2myQR7PZmGnGGJAy+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RsiV9ghVlBtoUdYfIEz/NvqSoiBtTX0fYsnmwqMA5WKSzw3pXM3wlTi4pbWQR5iBs
         RF0QcmQIlq7w5HoIpTAyWnW8az1/oahXZ8IIql84BPSu9NVNKuB9FJWRgYr9Ml5eGs
         D48eKRkj5hpP2okOdBZDkuH/Rpjx8b45QvceogDY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 21/21] media: rkisp1: Drop parentheses and fix indentation in rkisp1_probe()
Date:   Fri, 22 Apr 2022 02:42:40 +0300
Message-Id: <20220421234240.1694-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
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

Fix a small indentation issue to increase code readability, and drop
unneeded parentheses.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index c7ad1986e67b..97d569968285 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -486,9 +486,9 @@ static int rkisp1_probe(struct platform_device *pdev)
 		return PTR_ERR(rkisp1->base_addr);
 
 	for (i = 0; i < match_data->isr_size; i++) {
-		irq = (match_data->isrs[i].name) ?
-				platform_get_irq_byname(pdev, match_data->isrs[i].name) :
-				platform_get_irq(pdev, i);
+		irq = match_data->isrs[i].name
+		    ? platform_get_irq_byname(pdev, match_data->isrs[i].name)
+		    : platform_get_irq(pdev, i);
 		if (irq < 0)
 			return irq;
 
-- 
Regards,

Laurent Pinchart

