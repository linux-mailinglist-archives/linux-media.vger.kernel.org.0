Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E137BB4D5
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbjJFKI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbjJFKI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:08:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C172FD6
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:08:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADD8C433C8;
        Fri,  6 Oct 2023 10:08:53 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/9] staging: media: atomisp: drop check for reentrant .s_stream()
Date:   Fri,  6 Oct 2023 12:08:42 +0200
Message-Id: <f27c3713a56dc8dbe90c110349396fb70c6ee773.1696586632.git.hverkuil-cisco@xs4all.nl>
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

The subdev .s_stream() operation shall not be called to start streaming
on an already started subdev, or stop streaming on a stopped subdev.
Remove the check that guards against that condition.

Also fixes a smatch warning:

drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:446 gc0310_s_stream() warn: missing error code 'ret'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index c438accb0472..58cddf11c9ab 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -441,11 +441,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	dev_dbg(&client->dev, "%s S enable=%d\n", __func__, enable);
 	mutex_lock(&dev->input_lock);
 
-	if (dev->is_streaming == enable) {
-		dev_warn(&client->dev, "stream already %s\n", enable ? "started" : "stopped");
-		goto error_unlock;
-	}
-
 	if (enable) {
 		ret = pm_runtime_get_sync(&client->dev);
 		if (ret < 0)
@@ -497,7 +492,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 error_power_down:
 	pm_runtime_put(&client->dev);
 	dev->is_streaming = false;
-error_unlock:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
-- 
2.40.1

