Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03F64D127E
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 09:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345029AbiCHIna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 03:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345002AbiCHIn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 03:43:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A5B6301
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 00:42:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 87522B81678
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 08:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C10C340EC;
        Tue,  8 Mar 2022 08:42:30 +0000 (UTC)
Message-ID: <ab8dc7f1-683c-618c-5b03-2615d06808ae@xs4all.nl>
Date:   Tue, 8 Mar 2022 09:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] m5mols/m5mols.h: document new reset field
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

The new reset field in struct m5mols_info was not documented,
add this.

This fixes a kerneldoc warning:

drivers/media/i2c/m5mols/m5mols.h:244: warning: Function parameter or member 'reset' not described in 'm5mols_info'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: aaaf357fa61c (media: m5mols: Convert to use GPIO descriptors)
---
diff --git a/drivers/media/i2c/m5mols/m5mols.h b/drivers/media/i2c/m5mols/m5mols.h
index b56eb0a8ee97..d8545d2280af 100644
--- a/drivers/media/i2c/m5mols/m5mols.h
+++ b/drivers/media/i2c/m5mols/m5mols.h
@@ -182,6 +182,7 @@ struct m5mols_version {
  * @stabilization: image stabilization control
  * @jpeg_quality: JPEG compression quality control
  * @set_power: optional power callback to the board code
+ * @reset: GPIO driving the reset pin of M-5MOLS
  * @lock: mutex protecting the structure fields below
  * @ffmt: current fmt according to resolution type
  * @res_type: current resolution type
