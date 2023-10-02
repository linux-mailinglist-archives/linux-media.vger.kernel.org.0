Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CF37B4B95
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 08:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbjJBGmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 02:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbjJBGmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 02:42:38 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56941E5
        for <linux-media@vger.kernel.org>; Sun,  1 Oct 2023 23:42:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qnCdW-0004ba-22; Mon, 02 Oct 2023 08:42:34 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qnCdU-00ASh9-Qa; Mon, 02 Oct 2023 08:42:32 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
        (envelope-from <mgr@pengutronix.de>)
        id 1qnCdU-009nt2-2S;
        Mon, 02 Oct 2023 08:42:32 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, john@keeping.me.uk,
        alsi@bang-olufsen.dk, ruslan.bilovol@gmail.com,
        kernel@pengutronix.de
Subject: [PATCH] usb: gadget: u_audio: initialize spinlocks
Date:   Mon,  2 Oct 2023 08:42:31 +0200
Message-Id: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When using uac2 with lockdep enabled, the kernel is throwing this
message, due to uninitialized spinlocks. We initialize them now.

[   24.668867] The code is fine but needs lockdep annotation, or maybe
[   24.675878] you didn't initialize this object before use?
[   24.681910] turning off the locking correctness validator.
[   24.688038] CPU: 0 PID: 348 Comm: irq/43-dwc3 Tainted: G         C         6.5.0-20230919-1+ #14
[   24.697866] Hardware name: WolfVision PF5 (DT)
[   24.702831] Call trace:
[   24.705559]  dump_backtrace+0xac/0x130
[   24.709755]  show_stack+0x30/0x48
[   24.713456]  dump_stack_lvl+0x60/0xb0
[   24.717552]  dump_stack+0x18/0x28
[   24.721254]  register_lock_class+0x4e8/0x4f8
[   24.726029]  __lock_acquire+0x88/0x2130
[   24.730314]  lock_acquire+0x17c/0x338
[   24.734403]  _raw_spin_lock_irqsave+0x60/0x90
[   24.739274]  u_audio_get_capture_srate+0x34/0x68
[   24.744436]  afunc_setup+0x2d8/0x538
[   24.748431]  composite_setup+0x1a8/0x1ba8
[   24.752913]  configfs_composite_setup+0x88/0xc0
[   24.757974]  dwc3_ep0_interrupt+0x5e8/0xab8
[   24.762648]  dwc3_process_event_buf+0x424/0xbb0
[   24.767717]  dwc3_thread_interrupt+0x4c/0x90
[   24.772488]  irq_thread_fn+0x34/0xb8
[   24.776484]  irq_thread+0x1a0/0x290
[   24.780379]  kthread+0x10c/0x120
[   24.783985]  ret_from_fork+0x10/0x20

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/u_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 4a42574b4a7feb..9d9f906adf7c00 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1172,6 +1172,9 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	g_audio->uac = uac;
 	uac->audio_dev = g_audio;
 
+	spin_lock_init(&uac->c_prm.lock);
+	spin_lock_init(&uac->p_prm.lock);
+
 	params = &g_audio->params;
 	p_chmask = params->p_chmask;
 	c_chmask = params->c_chmask;
-- 
2.39.2

