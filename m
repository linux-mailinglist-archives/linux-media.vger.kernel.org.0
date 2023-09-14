Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1ED87A0C5D
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240880AbjINSRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240790AbjINSRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153D01FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:16:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DEF52C95;
        Thu, 14 Sep 2023 20:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715322;
        bh=hxO5ELXUDqf8C+GXi6h9zp5Y0C0ti7aQMHjo9+p4SHo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vE6uQO04JhLISdq5CmdwYjl0Zmsq0IYgDJMJnOPpy+gExuNg3I4UAL75rV0QKvruO
         8obE5qt+56+FB84ZpPor54O5ysLQAZCHHDW9fEvxHZ+wqD42O/TXkgHbtacUjnkFz1
         Aku4o/j6OhK0XCpQDozbBOWmZQodVZ403bEkJXoI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH 03/57] media: i2c: hi846: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:10 +0300
Message-ID: <20230914181704.4811-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .s_stream() operation shall not be called to start streaming
on an already started subdev, or stop streaming on a stopped subdev.
Remove the check that guards against that condition.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/hi846.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index fa0038749a3b..746e1f75f9d0 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1607,9 +1607,6 @@ static int hi846_set_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (hi846->streaming == enable)
-		return 0;
-
 	mutex_lock(&hi846->mutex);
 
 	if (enable) {
-- 
Regards,

Laurent Pinchart

