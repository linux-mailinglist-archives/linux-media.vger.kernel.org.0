Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375474C0420
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 22:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbiBVVxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 16:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbiBVVxS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 16:53:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCABA144F
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 13:52:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 791ECB81CBC
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 21:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CE2C340E8;
        Tue, 22 Feb 2022 21:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645566770;
        bh=f+mA8d0I7jruQo26cgH+5jkZ6gNlGYawzYMWyr0d29E=;
        h=From:To:Cc:Subject:Date:From;
        b=MBtmXbAHly4hnvcLmT1LmXsZ7fBKNIHfKKobUGh9ciqHXhAucG6Xn+s+qlxdpCnZU
         MLIPVbQxNHYZbTE0wDlGlnaQvwZSWG4sTHW31toYnHljDgo91prxfdHxvkyQygYqWu
         r+L2eiFt+1VUzfAg0bX8ehIybgfnaBU2GqEtZKLpDjYXRPVJP2HUxadPtpfNmPp7LL
         ogSiYy0/NzqT49lgLVKwWvhTeYx6NUXy6FnWXDQE6FiwH3ESWZWeT+rp1dsB9NhUzW
         Vn4AN74n3WpkAe5Q0C/GOsiCjdd9F0htTKJ3PPGvdK5ueX8j6y2tGL8ndQImDqhNld
         8cFNRT2QkR6Sw==
From:   Mark Brown <broonie@kernel.org>
To:     Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] media: i2c: max2175: Use rbtree rather than flat register cache
Date:   Tue, 22 Feb 2022 21:52:44 +0000
Message-Id: <20220222215244.1908067-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; h=from:subject; bh=f+mA8d0I7jruQo26cgH+5jkZ6gNlGYawzYMWyr0d29E=; b=owGbwMvMwMWocq27KDak/QLjabUkhiTRqN8pTFULb7tHJlX94O43VuHe73vrAtsM7sIWPb7ODY3C bZKdjMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEUgLZ/6cUnK+tXvWqYEWjkZHoK5 v9G3ltlqx9d+hhL7eby5PWtQ/m+u0KZ25bfznFbPPcb+t8Xia/mvmV1V/MhW22/qKM6GPT7FlEt3F0 r6kLaJ/B9OKelZeUpACDo/GT6xwWHjyHA2y1K3cxhYXcSTu32sNyplly0rN/nPtLz5Y1KnMZMH771t jwwbdvuVXafcVsTZWz/vF/Q3V8LVuczKJeuCUs/ui3Wfj5472zmFzWLN9p5rpYMyv0hpUK73bLvHuT 3mYFizV3LFUyZ+j5rjvz85m7bgWKy4/+3FBayG2ofpJfLmFOoNgc3w2PdjgL1EoxHVm09oLY4vfpZa bZJtt9Y1l3PZz0p+pN6+pI/fzNAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The max2175 uses a flat register cache but supplies only a single default
value and has many volatile registers. This is a poor fit for a flat cache
since the cache will assume a default of zero for any register not yet
written which can lead to bugs for example when regmap_update_bits()
suppresses a noop write. A rbtree cache is a much better fit, this will
only cache default values and values that have been written to the device
with any reads of uncached values going to the hardware. Convert the driver
to use a rbtree cache.

Since the device is controlled via I2C the cost of manging the rbtree
should be immaterial compared to the cost of accessing the device.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/media/i2c/max2175.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index bc46a0957b40..0eea200124d2 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -257,7 +257,7 @@ static const struct regmap_config max2175_regmap_config = {
 	.reg_defaults = max2175_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(max2175_reg_defaults),
 	.volatile_table = &max2175_volatile_regs,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_RBTREE,
 };
 
 struct max2175 {
-- 
2.30.2

