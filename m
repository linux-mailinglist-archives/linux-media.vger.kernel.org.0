Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A783C63AA2E
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbiK1Nzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbiK1Nzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:55:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3183E95
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:55:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB43610A7
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 13:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C336C433C1;
        Mon, 28 Nov 2022 13:55:45 +0000 (UTC)
Message-ID: <a74a7352-d75e-e202-4a7e-6ffb552455a2@xs4all.nl>
Date:   Mon, 28 Nov 2022 14:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: i2c: tc358746: make DEFINE_RUNTIME_DEV_PM_OPS static
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

DEFINE_RUNTIME_DEV_PM_OPS should be static.

This fixes this sparse warning:

drivers/media/i2c/tc358746.c:1671:1: warning: symbol 'tc358746_pm_ops' was not declared. Should it be static?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 171309c62bb8..d1f552bd81d4 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1668,8 +1668,8 @@ static int tc358746_resume(struct device *dev)
 	return err;
 }

-DEFINE_RUNTIME_DEV_PM_OPS(tc358746_pm_ops, tc358746_suspend,
-			  tc358746_resume, NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(tc358746_pm_ops, tc358746_suspend,
+				 tc358746_resume, NULL);

 static const struct of_device_id __maybe_unused tc358746_of_match[] = {
 	{ .compatible = "toshiba,tc358746" },
