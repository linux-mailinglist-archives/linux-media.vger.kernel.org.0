Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A52751F90B
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiEIJv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 05:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiEIJT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 05:19:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5619CF7B
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 02:16:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4E8C614DF
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 09:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F71BC385AB;
        Mon,  9 May 2022 09:16:04 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/7] uvc_v4l2.c: avoid using iterator used outside loop
Date:   Mon,  9 May 2022 11:15:53 +0200
Message-Id: <20220509091553.2637089-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
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

Fixes these two smatch warnings:

drivers/media/usb/uvc/uvc_v4l2.c:885 uvc_ioctl_enum_input() warn: iterator used outside loop: 'iterm'
drivers/media/usb/uvc/uvc_v4l2.c:896 uvc_ioctl_enum_input() warn: iterator used outside loop: 'iterm'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 711556d13d03..ff3f04af4e21 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -871,6 +871,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 	struct uvc_video_chain *chain = handle->chain;
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
+	bool found_pin = false;
 	u32 index = input->index;
 	int pin = 0;
 
@@ -879,21 +880,25 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 		if (index != 0)
 			return -EINVAL;
 		list_for_each_entry(iterm, &chain->entities, chain) {
-			if (UVC_ENTITY_IS_ITERM(iterm))
+			if (UVC_ENTITY_IS_ITERM(iterm)) {
+				pin = iterm->id;
+				found_pin = true;
 				break;
+			}
 		}
-		pin = iterm->id;
 	} else if (index < selector->bNrInPins) {
 		pin = selector->baSourceID[index];
 		list_for_each_entry(iterm, &chain->entities, chain) {
 			if (!UVC_ENTITY_IS_ITERM(iterm))
 				continue;
-			if (iterm->id == pin)
+			if (iterm->id == pin) {
+				found_pin = true;
 				break;
+			}
 		}
 	}
 
-	if (iterm == NULL || iterm->id != pin)
+	if (!found_pin)
 		return -EINVAL;
 
 	memset(input, 0, sizeof(*input));
-- 
2.34.1

