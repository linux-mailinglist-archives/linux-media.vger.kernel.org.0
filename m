Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6C55A5B53
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 07:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiH3F7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 01:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH3F73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 01:59:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB45AE208
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 22:59:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39C78B8162D
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 05:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A226AC433D6
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 05:59:25 +0000 (UTC)
Message-ID: <8b942502-929e-e404-7ddb-f8a2ba9afdd1@xs4all.nl>
Date:   Tue, 30 Aug 2022 07:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] dvb-frontends/drxk: initialize err to 0
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

Fix a compiler warning:

drivers/media/dvb-frontends/drxk_hard.c: In function 'drxk_read_ucblocks':
drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: 'err' may be used uninitialized [-Wmaybe-uninitialized]
 6673 |         *ucblocks = (u32) err;
      |                     ^~~~~~~~~
drivers/media/dvb-frontends/drxk_hard.c:6663:13: note: 'err' was declared here
 6663 |         u16 err;
      |             ^~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 47d83e0a470c..9807f5411996 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -6660,7 +6660,7 @@ static int drxk_read_snr(struct dvb_frontend *fe, u16 *snr)
 static int drxk_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
 {
 	struct drxk_state *state = fe->demodulator_priv;
-	u16 err;
+	u16 err = 0;
 
 	dprintk(1, "\n");
 
