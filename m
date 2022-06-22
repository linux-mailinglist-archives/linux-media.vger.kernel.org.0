Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4A554DAD
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358520AbiFVOnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 10:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358498AbiFVOm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 10:42:59 -0400
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76E7E9C;
        Wed, 22 Jun 2022 07:42:53 -0700 (PDT)
X-QQ-mid: bizesmtp62t1655908917tmjedoje
Received: from ubuntu.localdomain ( [106.117.78.84])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Wed, 22 Jun 2022 22:41:53 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000E00A0000000
X-QQ-FEAT: rn/rQ7Qm5gX67lXyVwZnuBvoXStF0A11GZL0L2a0huP5Fu8c3BUwNAFMPzqCB
        SNGSgTxDdm4riWTeGPSeL2gBZuUAmVULiLmALS0suaWi2etCEyvYzJjttN1NPjJXWhPTnIj
        qRfB3K3q9ATKKyxy4+DmD28ffbRQ93fMqaJAoXaS7GQroEtYwTMk90kRQOzZHdUwpvRKYkD
        oetg8C0QffDT+b3RyEWRDStLXyTRkK6imcGptfK5TW4HnHORh/BplGTKczOBli5qOayZEEJ
        +VdQ1qU+VTrDGvnO3OYIe33lTyUdnacB+k7EMGNtuw34/FZOpwoIvBYFpx0T5hJLhEgiPt5
        GbYJfCaSFfy+rbdfye6Nm1FeU0WMCezucWc+jJJ
X-QQ-GoodBg: 0
From:   Jiang Jian <jiangjian@cdjrlc.com>
To:     awalls@md.metrocast.net, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiang Jian <jiangjian@cdjrlc.com>
Subject: [PATCH] [media] cx18: Fix typo in comments
Date:   Wed, 22 Jun 2022 22:41:51 +0800
Message-Id: <20220622144151.19267-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the repeated word 'and' from comments

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/media/pci/cx18/cx18-av-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index 76e5a504df8c..d3358643fb7d 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -180,7 +180,7 @@ static void cx18_av_initialize(struct v4l2_subdev *sd)
 	 */
 	cx18_av_and_or4(cx, CXADEC_CHIP_CTRL, 0xFFFBFFFF, 0x00120000);
 
-	/* Setup the Video and and Aux/Audio PLLs */
+	/* Setup the Video and Aux/Audio PLLs */
 	cx18_av_init(cx);
 
 	/* set video to auto-detect */
-- 
2.17.1

