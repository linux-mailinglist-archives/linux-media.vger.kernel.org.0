Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A382E59F3E3
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 09:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiHXHCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 03:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbiHXHCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 03:02:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1D291087
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 00:02:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D4BF8B82374
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 07:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1554DC433D6;
        Wed, 24 Aug 2022 07:02:43 +0000 (UTC)
Message-ID: <584b87c8-2433-bfba-f044-7dadb663c4ef@xs4all.nl>
Date:   Wed, 24 Aug 2022 09:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] s5p_cec: limit msg.len to CEC_MAX_MSG_SIZE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I expect that the hardware will have limited this to 16, but just in
case it hasn't, check for this corner case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index ce9a9d922f11..0a30e7acdc10 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -115,6 +115,8 @@ static irqreturn_t s5p_cec_irq_handler(int irq, void *priv)
 				dev_dbg(cec->dev, "Buffer overrun (worker did not process previous message)\n");
 			cec->rx = STATE_BUSY;
 			cec->msg.len = status >> 24;
+			if (cec->msg.len > CEC_MAX_MSG_SIZE)
+				cec->msg.len = CEC_MAX_MSG_SIZE;
 			cec->msg.rx_status = CEC_RX_STATUS_OK;
 			s5p_cec_get_rx_buf(cec, cec->msg.len,
 					cec->msg.msg);
