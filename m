Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0821F649A25
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 09:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiLLIh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 03:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiLLIhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 03:37:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B77BEF
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 00:37:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F71160F1E
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 08:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3894C433EF;
        Mon, 12 Dec 2022 08:37:51 +0000 (UTC)
Message-ID: <5719e87b-4af9-4a4d-223d-f8cdbf3e6a2f@xs4all.nl>
Date:   Mon, 12 Dec 2022 09:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alice Yuan <alice.yuan@nxp.com>, Robby Cai <robby.cai@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.1] media: v4l2-ctrls-api.c: add back dropped
 ctrl->is_new = 1
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

The patch adding support for dynamically allocated arrays accidentally
dropped the line setting ctrl->is_new to 1, thus new string values were
always ignored.

Fixes: fb582cba4492 ("media: v4l2-ctrls: add support for dynamically allocated arrays.")
Reported-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d0a3aa3806fb..002ea6588edf 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -151,6 +151,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 			 */
 			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
 				return -ERANGE;
+			ctrl->is_new = 1;
 		}
 		return ret;
 	default:
-- 
2.35.1

