Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB55F697C
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfKJOgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 09:36:15 -0500
Received: from sauhun.de ([88.99.104.3]:58556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbfKJOgP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 09:36:15 -0500
Received: from localhost (p54B3382A.dip0.t-ipconnect.de [84.179.56.42])
        by pokefinder.org (Postfix) with ESMTPSA id ED5C02C0114;
        Sun, 10 Nov 2019 15:36:12 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: remove wrong @cond from kdocs
Date:   Sun, 10 Nov 2019 15:36:07 +0100
Message-Id: <20191110143607.7989-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_subdev_call() is unconditional, so don't mention in the docs a
@cond parameter which does not exist.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/media/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 71f1f2f0da53..761aa83a3f3c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1090,7 +1090,7 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  * @sd: pointer to the &struct v4l2_subdev
  * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
  *     Each element there groups a set of callbacks functions.
- * @f: callback function that will be called if @cond matches.
+ * @f: callback function to be called.
  *     The callback functions are defined in groups, according to
  *     each element at &struct v4l2_subdev_ops.
  * @args...: arguments for @f.
-- 
2.20.1

