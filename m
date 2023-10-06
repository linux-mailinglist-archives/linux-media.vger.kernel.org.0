Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09DF7BB4DC
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjJFKJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbjJFKJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:09:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321EAF0
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:09:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA25DC433CA;
        Fri,  6 Oct 2023 10:09:01 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 7/9] media: i2c: tc358746: check fmt validity
Date:   Fri,  6 Oct 2023 12:08:48 +0200
Message-Id: <b4a9369bf923c0a3b90cf0e8ccee8ee2178403fc.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check if the format was really found.

Fixes smatch warning:

drivers/media/i2c/tc358746.c:790 tc358746_set_fmt() error: 'fmt' dereferencing possible ERR_PTR()

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/tc358746.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 566f5eaddd57..ce612a47ba84 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -784,8 +784,12 @@ static int tc358746_set_fmt(struct v4l2_subdev *sd,
 	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, TC358746_SINK);
 
 	fmt = tc358746_get_format_by_code(format->pad, format->format.code);
-	if (IS_ERR(fmt))
+	if (IS_ERR(fmt)) {
 		fmt = tc358746_get_format_by_code(format->pad, tc358746_def_fmt.code);
+		// Can't happen, but just in case...
+		if (WARN_ON(IS_ERR(fmt)))
+			return -EINVAL;
+	}
 
 	format->format.code = fmt->code;
 	format->format.field = V4L2_FIELD_NONE;
-- 
2.40.1

