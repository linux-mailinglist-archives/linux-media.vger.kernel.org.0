Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F49274AFB5
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 13:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjGGL1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 07:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjGGL0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 07:26:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134991FFF
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 04:26:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A686161926
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 11:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B25C433CA;
        Fri,  7 Jul 2023 11:26:44 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/4] cec-gpio: specify IRQF_NO_AUTOEN when requesting irq
Date:   Fri,  7 Jul 2023 13:26:38 +0200
Message-Id: <20230707112641.338232-2-hverkuil-cisco@xs4all.nl>
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

Use IRQF_NO_AUTOEN rather than manually disabling the requested
interrupt.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index ff34490fd869..6413c0e8abcd 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -215,13 +215,11 @@ static int cec_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(cec->adap);
 
 	ret = devm_request_irq(dev, cec->cec_irq, cec_gpio_irq_handler,
-			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
 			       cec->adap->name, cec);
 	if (ret)
 		goto del_adap;
 
-	cec_gpio_disable_irq(cec->adap);
-
 	if (cec->hpd_gpio) {
 		cec->hpd_irq = gpiod_to_irq(cec->hpd_gpio);
 		ret = devm_request_threaded_irq(dev, cec->hpd_irq,
-- 
2.39.2

