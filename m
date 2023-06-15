Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB627316FB
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 13:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344086AbjFOLjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 07:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343995AbjFOLi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 07:38:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28D52D51;
        Thu, 15 Jun 2023 04:38:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3027B63904;
        Thu, 15 Jun 2023 11:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2460C433C0;
        Thu, 15 Jun 2023 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686829081;
        bh=OU6nnv2G9WVBthz755bwpd8EJ+LMKuGvk/LoTtkIfD8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sdtsi1+qftbD/H7AwbXPq95M2VRR7Lks0ZWQYz7reHqyspzBEuxQbLX41XcpC6/yp
         /IBjnkg2/FQubBZ815UMNVd1Oh5zJNDnGuq8ZzgLGp/+2kCXacIJr/kBrczIY7YKK8
         2EYJLGWyzd9DQ7tpuHTTA0lMJA3h2MeYZ7cR1r/0QCef1EpPafA5Ip2u9f9BNAEpc9
         ehuTIVeN/dGTwGJ3lBdyo0cRdYlbOaJxMOak7vn6ol/Miy2s23IjQnLJrJmqzJK4AG
         x4oM6taycp46T+oYLxUDrXr9iksYtrNr2dugZzu/aOyJkgIHSiPoJ7WLOTnctWwtL6
         1Hf1trfoOaJpg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 11/19] media: cec: core: don't set last_initiator if tx in progress
Date:   Thu, 15 Jun 2023 07:37:11 -0400
Message-Id: <20230615113719.648862-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615113719.648862-1-sashal@kernel.org>
References: <20230615113719.648862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 73af6c7511038249cad3d5f3b44bf8d78ac0f499 ]

When a message was received the last_initiator is set to 0xff.
This will force the signal free time for the next transmit
to that for a new initiator. However, if a new transmit is
already in progress, then don't set last_initiator, since
that's the initiator of the current transmit. Overwriting
this would cause the signal free time of a following transmit
to be that of the new initiator instead of a next transmit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index ac18707fddcd2..b1512f9c5895c 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1090,7 +1090,8 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 	mutex_lock(&adap->lock);
 	dprintk(2, "%s: %*ph\n", __func__, msg->len, msg->msg);
 
-	adap->last_initiator = 0xff;
+	if (!adap->transmit_in_progress)
+		adap->last_initiator = 0xff;
 
 	/* Check if this message was for us (directed or broadcast). */
 	if (!cec_msg_is_broadcast(msg))
-- 
2.39.2

