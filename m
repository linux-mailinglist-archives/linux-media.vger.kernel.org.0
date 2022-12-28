Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13865658516
	for <lists+linux-media@lfdr.de>; Wed, 28 Dec 2022 18:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbiL1RHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Dec 2022 12:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbiL1RGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Dec 2022 12:06:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC07FF71
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 09:02:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56BEA61562
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 17:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F63C433D2;
        Wed, 28 Dec 2022 17:02:28 +0000 (UTC)
Message-ID: <69624c54-7cbd-7362-c468-f8ffea9614be@xs4all.nl>
Date:   Wed, 28 Dec 2022 18:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alice Yuan <alice.yuan@nxp.com>, Robby Cai <robby.cai@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for 6.2] media: v4l2-ctrls-api.c: move ctrl->is_new = 1 to the
 correct line
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patch that fixed string control support somehow got mangled when it was
merged in mainline: the added line ended up in the wrong place.

Fix this.

Fixes: 73278d483378 ("media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1")
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 3d3b6dc24ca6..002ea6588edf 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -150,8 +150,8 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 			 * then return an error.
 			 */
 			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
-			ctrl->is_new = 1;
 				return -ERANGE;
+			ctrl->is_new = 1;
 		}
 		return ret;
 	default:
