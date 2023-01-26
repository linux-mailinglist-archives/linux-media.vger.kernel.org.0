Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFD667CF35
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjAZPHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbjAZPHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5DA48A24
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 989DF6188C
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211FAC4339C;
        Thu, 26 Jan 2023 15:07:04 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 05/17] media: usb: dvb-usb-v2: af9015.c: return 0 instead of 'ret'.
Date:   Thu, 26 Jan 2023 16:06:45 +0100
Message-Id: <20230126150657.367921-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 'ret' is known to be 0, just return '0'. This fixes two smatch warnings:

af9015.c:1168 af9015_rc_query() warn: missing error code? 'ret'
af9015.c:1177 af9015_rc_query() warn: missing error code? 'ret'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Antti Palosaari <crope@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/af9015.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9015.c b/drivers/media/usb/dvb-usb-v2/af9015.c
index d33514acc2b5..4014f7d07330 100644
--- a/drivers/media/usb/dvb-usb-v2/af9015.c
+++ b/drivers/media/usb/dvb-usb-v2/af9015.c
@@ -1165,7 +1165,7 @@ static int af9015_rc_query(struct dvb_usb_device *d)
 	/* If any of these are non-zero, assume invalid data */
 	if (buf[1] || buf[2] || buf[3]) {
 		dev_dbg(&intf->dev, "invalid data\n");
-		return ret;
+		return 0;
 	}
 
 	/* Check for repeat of previous code */
@@ -1174,7 +1174,7 @@ static int af9015_rc_query(struct dvb_usb_device *d)
 		dev_dbg(&intf->dev, "key repeated\n");
 		rc_repeat(d->rc_dev);
 		state->rc_repeat = buf[6];
-		return ret;
+		return 0;
 	}
 
 	/* Only process key if canary killed */
-- 
2.39.0

