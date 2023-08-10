Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5608E7779AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 15:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234085AbjHJNe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 09:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbjHJNe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 09:34:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB7DE7F
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 06:34:53 -0700 (PDT)
Received: from uno.localdomain (mob-5-90-14-125.net.vodafone.it [5.90.14.125])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10AC5D51;
        Thu, 10 Aug 2023 15:33:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691674423;
        bh=KRdKWU8Vho0/Z0DGrSZl4L7Uwnrp7CdP4lNUvwnJ6D0=;
        h=From:To:Cc:Subject:Date:From;
        b=nxuqeU/aC1c//q6Oi0N3D4M37YOEt3vOdgDrrJpRndTC+g1Fz9MZ6l7cnkx0TzChQ
         2Bhg/vArX3y6Qr6redfKi9H/kR7TtWnrKpMUSgtb05H9c/S5Y/7rYh4TPRahTZuMfI
         yGuKMkea7+dfP1eycVfQqpOuOeCiqwG+tScGb/oo=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: i2c: rdacm21: Fix uninitialized value
Date:   Thu, 10 Aug 2023 15:33:37 +0200
Message-Id: <20230810133337.14906-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following smatch warning:

drivers/media/i2c/rdacm21.c:373 ov10640_check_id() error: uninitialized
symbol 'val'.

Initialize 'val' to 0 in the ov10640_check_id() function.

Fixes: 2b821698dc73 ("media: i2c: rdacm21: Power up OV10640 before OV490")
Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/rdacm21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 3454f7d73121..a36a709243fd 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -351,7 +351,7 @@ static void ov10640_power_up(struct rdacm21_device *dev)
 static int ov10640_check_id(struct rdacm21_device *dev)
 {
 	unsigned int i;
-	u8 val;
+	u8 val = 0;

 	/* Read OV10640 ID to test communications. */
 	for (i = 0; i < OV10640_PID_TIMEOUT; ++i) {
--
2.40.1

