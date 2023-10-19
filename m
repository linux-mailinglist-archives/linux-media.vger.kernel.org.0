Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159E47CF36B
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 11:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbjJSJCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 05:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbjJSJB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 05:01:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B73FE
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 02:01:49 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F09310FF;
        Thu, 19 Oct 2023 11:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697706100;
        bh=lK/bEA130soHMahWZcE98Y0uYsfbaFw7yK7wRb6MpGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QOFudJTK60vc7iogOvi1Ds5uNLR1gQgIWVMc1tBcuZPbB2F5zOAeenoQzq3ZY4J8w
         AQGIeVbo1USlcUQAB7gpiwYUo+y8BGUK7FtY+WktTm9RdNkMNtBjPByhDBIOZ/iu1b
         A4DSoeCf2nk7UIf73t1lgR8Qbk5PI+RnI/fLL688=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 2/3] staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
Date:   Thu, 19 Oct 2023 14:31:27 +0530
Message-Id: <20231019090128.430297-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019090128.430297-1-umang.jain@ideasonboard.com>
References: <20231019090128.430297-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
alias should be dropped from there.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
index 06bdc7673d4b..b74cb104e9de 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
@@ -311,12 +311,19 @@ static int snd_bcm2835_alsa_resume(struct vchiq_device *device)
 
 #endif
 
+static struct vchiq_device_id device_id_table[] = {
+	{ .name = "bcm2835-audio" },
+	{}
+};
+MODULE_DEVICE_TABLE(vchiq, device_id_table);
+
 static struct vchiq_driver bcm2835_alsa_driver = {
 	.probe = snd_bcm2835_alsa_probe,
 #ifdef CONFIG_PM
 	.suspend = snd_bcm2835_alsa_suspend,
 	.resume = snd_bcm2835_alsa_resume,
 #endif
+	.id_table = device_id_table,
 	.driver = {
 		.name = "bcm2835-audio",
 	},
@@ -326,4 +333,3 @@ module_vchiq_driver(bcm2835_alsa_driver);
 MODULE_AUTHOR("Dom Cobley");
 MODULE_DESCRIPTION("Alsa driver for BCM2835 chip");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("bcm2835-audio");
-- 
2.40.1

