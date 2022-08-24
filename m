Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8E859F3DE
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 09:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbiHXHB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 03:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235367AbiHXHA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 03:00:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D67883DE
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 00:00:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 948E5615E0
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 07:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3294C433C1
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 07:00:25 +0000 (UTC)
Message-ID: <acd71528-7e04-8a7e-0b0c-9748434ffe81@xs4all.nl>
Date:   Wed, 24 Aug 2022 09:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] tc358743: limit msg.len to CEC_MAX_MSG_SIZE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I expect that the hardware will have limited this to 16, but just in
case it hasn't, check for this corner case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index e18b8947ad7e..804b8ee8e4ab 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -964,6 +964,8 @@ static void tc358743_cec_handler(struct v4l2_subdev *sd, u16 intstatus,
 
 		v = i2c_rd32(sd, CECRCTR);
 		msg.len = v & 0x1f;
+		if (msg.len > CEC_MAX_MSG_SIZE)
+			msg.len = CEC_MAX_MSG_SIZE;
 		for (i = 0; i < msg.len; i++) {
 			v = i2c_rd32(sd, CECRBUF1 + i * 4);
 			msg.msg[i] = v & 0xff;
