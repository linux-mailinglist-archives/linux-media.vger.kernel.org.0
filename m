Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA6E74AFB8
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 13:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjGGL1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 07:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjGGL0u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 07:26:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432C39E
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 04:26:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D34FD61926
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 11:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C52C433C9;
        Fri,  7 Jul 2023 11:26:47 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/4] cec-pin: only enable interrupts when monitoring the CEC pin
Date:   Fri,  7 Jul 2023 13:26:41 +0200
Message-Id: <20230707112641.338232-5-hverkuil-cisco@xs4all.nl>
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

The CEC interrupt is only needed if userspace wants to monitor
the CEC pin for an unconfigured CEC device. That gives it the
most precise CEC pin debugging results.

This avoids a corner case where the interrupt is enabled for
a short period when the adapter is about to be configured.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-pin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 8a3921fc9c99..330d5d5d86ab 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -982,7 +982,7 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 		}
 		if (pin->state != CEC_ST_IDLE || pin->ops->enable_irq == NULL ||
 		    pin->enable_irq_failed || adap->is_configuring ||
-		    adap->is_configured || adap->monitor_all_cnt)
+		    adap->is_configured || adap->monitor_all_cnt || !adap->monitor_pin_cnt)
 			break;
 		/* Switch to interrupt mode */
 		atomic_set(&pin->work_irq_change, CEC_PIN_IRQ_ENABLE);
@@ -1317,7 +1317,7 @@ void cec_pin_changed(struct cec_adapter *adap, bool value)
 
 	cec_pin_update(pin, value, false);
 	if (!value && (adap->is_configuring || adap->is_configured ||
-		       adap->monitor_all_cnt))
+		       adap->monitor_all_cnt || !adap->monitor_pin_cnt))
 		atomic_set(&pin->work_irq_change, CEC_PIN_IRQ_DISABLE);
 }
 EXPORT_SYMBOL_GPL(cec_pin_changed);
-- 
2.39.2

