Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1506F5B0CFA
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 21:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiIGTQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 15:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIGTQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 15:16:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AC1BFE93
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 12:16:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A414478;
        Wed,  7 Sep 2022 21:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662578163;
        bh=3jkxR+X/70IVeLJ1IQfhdLY0m1BJbMAZF3rAQGvv3tk=;
        h=From:To:Cc:Subject:Date:From;
        b=ddTBkoPNI/e8rcDLbCSfigfnSDyXfWm210JhmX0hGJU4j8/go4QfXfKMqMEkLMeFH
         akFoWzP8Wc+9XOwdMAyzSw+ZSQhLuPi/1LfWkoJmADkfmCy8oPZd0K1gfAxbxwojeI
         VAboKZISuzLOOPdpRB6pCrgtPIKK5s7yQHNuj54w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 0/3] media: imx: imx7-media-csi: Small fix and cleanups
Date:   Wed,  7 Sep 2022 22:15:44 +0300
Message-Id: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
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

This small series builds on top of [1]. It performs two small cleanups
(1/3 and 2/3) and fixes a, issue (in 3/3) in the imx7-media-csi driver.

Please see individual patches for details.

[1] https://lore.kernel.org/linux-media/20220907114737.1127612-1-paul.elder@ideasonboard.com

Laurent Pinchart (3):
  media: imx: imx7-media-csi: Move variable to loop scope
  media: imx: imx7-media-csi: Rename phys variables to dma_addr
  media: imx: imx7-media-csi: Clear BIT_MIPI_DOUBLE_CMPNT for <16b
    formats

 drivers/staging/media/imx/imx7-media-csi.c | 43 +++++++++++-----------
 1 file changed, 22 insertions(+), 21 deletions(-)

-- 
Regards,

Laurent Pinchart

