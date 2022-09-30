Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8335F0D33
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 16:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiI3OPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 10:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiI3OOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 10:14:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E8B3DBE4
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 07:14:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AFB7B828F4
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 14:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE5DC433D6;
        Fri, 30 Sep 2022 14:14:48 +0000 (UTC)
Message-ID: <ae9e602d-580f-8f00-fea7-7ca4f8f52f2b@xs4all.nl>
Date:   Fri, 30 Sep 2022 16:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: meson/vdec: always init coef_node_start
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's hard for code analyzers to see that coef_node_start is
always initialized (and actually hard for humans as well!).

So change the last 'else if' to an 'else' so it is clear that
coef_node_startis always set.

This fixes a compile warning:

drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: 'coef_node_start' may be used uninitialized [-Wmaybe-uninitialized]
 1689 |                         coef_node_start = coef_node_start + 1;
      |                         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/meson/vdec/codec_vp9.c:1551:19: note: 'coef_node_start' was declared here
 1551 |         int node, coef_node_start, coef_count_node_start;
      |                   ^~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 897f5d7a6aad..cf0f58d982c8 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1649,8 +1649,7 @@ static void adapt_coef_probs(int prev_kf, int cur_kf, int pre_fc,
 			else if (coef_count_node_start ==
 					VP9_MV_BITS_1_COUNT_START)
 				coef_node_start = VP9_MV_BITS_1_START;
-			else if (coef_count_node_start ==
-					VP9_MV_CLASS0_HP_0_COUNT_START)
+			else /* node_start == VP9_MV_CLASS0_HP_0_COUNT_START */
 				coef_node_start = VP9_MV_CLASS0_HP_0_START;
 
 			den = count[coef_count_node_start] +
-- 
2.35.1

