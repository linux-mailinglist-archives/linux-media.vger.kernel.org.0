Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66E76F7D9A
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 09:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjEEHQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 03:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbjEEHQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 03:16:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFCE16360
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 00:16:51 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB5CE2CF;
        Fri,  5 May 2023 09:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683271005;
        bh=TzV7n9rCJvPHLZ+nnmt2ep69NG2aIhx+CemJjMlebTk=;
        h=From:To:Cc:Subject:Date:From;
        b=s7KtDmBXcyERsYFaoaMJW/stHy/+V7odzeMx2ntNggLo/MHJK2koSkFxO7qNigDqO
         bBDubB69mdLGrhL7RRs7XOu5mU0Wb2S6wm2N2ZA1fj4dHsFLhsuAJXMSY7gpkDdBaR
         blPMM5y3ad5UnlHyvLoM/CmhjglyCk0TAOmN7DYw=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "Guoniu . zhou" <guoniu.zhou@nxp.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        mchehab@kernel.org
Subject: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Date:   Fri,  5 May 2023 09:16:17 +0200
Message-Id: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

While looking at Guoniu Zhou patches I noticed that there were a few cleanups
related to the usage of frame_interval fileds for MIPI CSI-2 framerate
calculations.

No functional changes intended, just cleanups.

Guoniu: could you please test these on your setup as well ? A tested-by tag
would be useful!

Thanks
  j

Jacopo Mondi (2):
  media: ov5640: Remove unused 'framerate' parameter
  media: ov5640: Drop dead code using frame_interval

 drivers/media/i2c/ov5640.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

--
2.40.1

