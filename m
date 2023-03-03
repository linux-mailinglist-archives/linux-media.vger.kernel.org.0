Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29CB6AA19D
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 22:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbjCCVli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 16:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjCCVlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 16:41:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A6F62DB3;
        Fri,  3 Mar 2023 13:41:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F864618F8;
        Fri,  3 Mar 2023 21:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE17C433D2;
        Fri,  3 Mar 2023 21:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677879676;
        bh=+O1tPn4wrXUQ1XEJE0xzcUDk4ho6GG93RTc/wxWagL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aoMp5hs2BP7hoLpJAAj8jg7qDMiCvoI7hzcdubZoNm9DpnNELIhpUpC70RJxx/Isp
         fOwHwua3ssnEUCKU9Kw0LJYd8PCYgHa2jLSDOf10GmT9NBhgCZm/izI+S/5RHqn3Hf
         kqfgzXgCln8w7UMeVJ7x9gJVL/1EZSUO6Im27qufbJLF584ZozTZRsFiFlBHt1aFmd
         67Ad5Qc1+hbGM2rZKIqGAK4ImwtKmgrvlTB18vERFlDnmjEGaIevWqDGLLEwUdA6WN
         7niDwp4JssL5bLYG8r9PGKbwDZETzcf3diu01UswnV78rQYP4EVX6wX5HzrLbqhDCY
         OMHBjNiFwJOCQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        syzbot <syzkaller@googlegroups.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 06/64] media: uvcvideo: Handle cameras with invalid descriptors
Date:   Fri,  3 Mar 2023 16:40:08 -0500
Message-Id: <20230303214106.1446460-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214106.1446460-1-sashal@kernel.org>
References: <20230303214106.1446460-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 41ddb251c68ac75c101d3a50a68c4629c9055e4c ]

If the source entity does not contain any pads, do not create a link.

Reported-by: syzbot <syzkaller@googlegroups.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index 7c4d2f93d3513..cc68dd24eb42d 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -37,7 +37,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 			continue;
 
 		remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
-		if (remote == NULL)
+		if (remote == NULL || remote->num_pads == 0)
 			return -EINVAL;
 
 		source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
-- 
2.39.2

