Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8D23DE9A5
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 11:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbhHCJXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 05:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbhHCJXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 05:23:05 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD7AC06175F
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 02:22:54 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EBC7AC6050; Tue,  3 Aug 2021 10:22:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627982571; bh=sNk2QzK8sQT0pf+e5DCO3Yr/im+YcbdF0rYPc1W8cCM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WSInzLqbHjNi9kOQbJ4vqYGG2SY8P1i5Gh0zyODHEdGeOhC7XofJKM6LetFgYUPDG
         M6ZyvDF+8t7TK9ta1DcxJsXmpHNVLvmAeq3pNbNLuKx0xLJt6vAcNPufVMegJ4iTCd
         TLqYMG0Fb7amPvyiq1HaDbABuxWOE0MvUSMie7Y5dc3JomPiNZe64qIWBt67u5OarH
         osp3IbUO91Xd1mCY94xeHeqD+GpVZVxZNQGVJZyjP6joZ4UN88mOzlpQKj47HbMjNG
         66JXoCfjzBH9Zp6UvvGWTVaKhR+FJPuzQMNQAr1nTZT6ciN037lgwXGVAGuNp/4mrV
         XKMw+e+mQuxuA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: streamzap: ensure rx resolution can be retrieved
Date:   Tue,  3 Aug 2021 10:22:51 +0100
Message-Id: <20210803092251.8392-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803092251.8392-1-sean@mess.org>
References: <20210803092251.8392-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The receiver resolution is not populated. The resolution can be used to for
various purposes like calculating the margins the decoder should use.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 9cd765e31c49..1cc5ebb85b6c 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -293,6 +293,7 @@ static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz)
 	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rdev->driver_name = DRIVER_NAME;
 	rdev->map_name = RC_MAP_STREAMZAP;
+	rdev->rx_resolution = SZ_RESOLUTION;
 
 	ret = rc_register_device(rdev);
 	if (ret < 0) {
-- 
2.31.1

