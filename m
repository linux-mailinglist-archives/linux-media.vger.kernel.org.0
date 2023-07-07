Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA84E74AFB7
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 13:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjGGL1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 07:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjGGL0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 07:26:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7301FF7
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 04:26:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB72461926
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 11:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9701AC433C7;
        Fri,  7 Jul 2023 11:26:46 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/4] cec-gpio: drop the cec_gpio_free callback
Date:   Fri,  7 Jul 2023 13:26:40 +0200
Message-Id: <20230707112641.338232-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707112641.338232-1-hverkuil-cisco@xs4all.nl>
References: <20230707112641.338232-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the CEC pin framework now keeps track of the interrupt
and calls disable_irq when the kthread stops, there is no
longer any need for the cec-gpio driver to do this in the
free callback. So drop this code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 6413c0e8abcd..98dacb0919b6 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -159,11 +159,6 @@ static int cec_gpio_read_5v(struct cec_adapter *adap)
 	return gpiod_get_value(cec->v5_gpio);
 }
 
-static void cec_gpio_free(struct cec_adapter *adap)
-{
-	cec_gpio_disable_irq(adap);
-}
-
 static const struct cec_pin_ops cec_gpio_pin_ops = {
 	.read = cec_gpio_read,
 	.low = cec_gpio_low,
@@ -171,7 +166,6 @@ static const struct cec_pin_ops cec_gpio_pin_ops = {
 	.enable_irq = cec_gpio_enable_irq,
 	.disable_irq = cec_gpio_disable_irq,
 	.status = cec_gpio_status,
-	.free = cec_gpio_free,
 	.read_hpd = cec_gpio_read_hpd,
 	.read_5v = cec_gpio_read_5v,
 };
-- 
2.39.2

