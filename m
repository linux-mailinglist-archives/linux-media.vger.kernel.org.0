Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71FFC521DFE
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346378AbiEJPWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345594AbiEJPUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E99F5418B
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DEA1061998
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8293C385CA;
        Tue, 10 May 2022 15:00:26 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/7] cec-pin: don't zero work_pin_num_events in adap_enable
Date:   Tue, 10 May 2022 17:00:17 +0200
Message-Id: <20220510150022.1787112-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
References: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
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

It's OK to keep the pending pin events when disabling or
enabling the 'adapter'. Zeroing this can cause a race condition
if this happens when the pin kthread is handling a pin event
and calls atomic_dec later, causing work_pin_num_events to become
negative.

Just leave pending events in the queue, they'll be read eventually.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-pin.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 4bd7be4e2edf..68353c5dc501 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -1123,9 +1123,6 @@ static int cec_pin_adap_enable(struct cec_adapter *adap, bool enable)
 	struct cec_pin *pin = adap->pin;
 
 	if (enable) {
-		atomic_set(&pin->work_pin_num_events, 0);
-		pin->work_pin_events_rd = pin->work_pin_events_wr = 0;
-		pin->work_pin_events_dropped = false;
 		cec_pin_read(pin);
 		cec_pin_to_idle(pin);
 		pin->tx_msg.len = 0;
@@ -1150,7 +1147,6 @@ static int cec_pin_adap_enable(struct cec_adapter *adap, bool enable)
 		cec_pin_to_idle(pin);
 		pin->state = CEC_ST_OFF;
 		pin->work_tx_status = 0;
-		atomic_set(&pin->work_pin_num_events, 0);
 		atomic_set(&pin->work_irq_change, CEC_PIN_IRQ_DISABLE);
 		wake_up_interruptible(&pin->kthread_waitq);
 	}
@@ -1338,6 +1334,7 @@ struct cec_adapter *cec_pin_allocate_adapter(const struct cec_pin_ops *pin_ops,
 		return ERR_PTR(-ENOMEM);
 	pin->ops = pin_ops;
 	hrtimer_init(&pin->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	atomic_set(&pin->work_pin_num_events, 0);
 	pin->timer.function = cec_pin_timer;
 	init_waitqueue_head(&pin->kthread_waitq);
 	pin->tx_custom_low_usecs = CEC_TIM_CUSTOM_DEFAULT;
-- 
2.34.1

