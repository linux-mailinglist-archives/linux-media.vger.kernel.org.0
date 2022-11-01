Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2962614935
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 12:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbiKALez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 07:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiKALed (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 07:34:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA2F1C435;
        Tue,  1 Nov 2022 04:30:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EA47615AC;
        Tue,  1 Nov 2022 11:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF75C433C1;
        Tue,  1 Nov 2022 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667302223;
        bh=xF6SaqiHXRWHu13SpIZhjfbTsJONB7zD8WaO5tw8iAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NdJPxUkdwrptmBXnCF3hPHGCrdhAU0BRh9QLYkHBQ6Zfs/hrr65bxq44nYBzowLos
         tI/+mDBtkz7h7RRyaG0RFnN/il4+q8Bz7ShyzkDxrFyQz+4xxsl9nkBlR+SGxZmoHH
         tVIyiEBqSczWRPWEAHAQ6QgLkRiDeT9f9CWFP54JddgTtvx4bq+1Wic0QoN2hWhcqJ
         4yJW3qSr4GWEMNdwanPkjBzrtiJS5cZlMROtnw7BPhHcMec5/1aNCLoKw2NilsrPAB
         xHBsGVPrrA2l2iavuU9q1CqkkAOYcegwNK0TgGWappJcDoK2tE8BhmzAzwzvw5b5tZ
         qqBq34okH6IBw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, bleung@chromium.org,
        groeck@chromium.org, ajye_huang@compal.corp-partner.google.com,
        hellojacky0226@hotmail.com, zhuohao@chromium.org,
        scott_chao@wistron.corp-partner.google.com,
        linux-media@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 04/14] media: cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
Date:   Tue,  1 Nov 2022 07:30:00 -0400
Message-Id: <20221101113012.800271-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101113012.800271-1-sashal@kernel.org>
References: <20221101113012.800271-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 2dc73b48665411a08c4e5f0f823dea8510761603 ]

I expect that the hardware will have limited this to 16, but just in
case it hasn't, check for this corner case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 2d95e16cd248..f66699d5dc66 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -44,6 +44,8 @@ static void handle_cec_message(struct cros_ec_cec *cros_ec_cec)
 	uint8_t *cec_message = cros_ec->event_data.data.cec_message;
 	unsigned int len = cros_ec->event_size;
 
+	if (len > CEC_MAX_MSG_SIZE)
+		len = CEC_MAX_MSG_SIZE;
 	cros_ec_cec->rx_msg.len = len;
 	memcpy(cros_ec_cec->rx_msg.msg, cec_message, len);
 
-- 
2.35.1

