Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6735540C2E8
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 11:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhIOJqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 05:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhIOJqq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 05:46:46 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B63C061574;
        Wed, 15 Sep 2021 02:45:28 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631699126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=08s6py4AmQdEpi5YfVEl+wG4NagSCRIxVMPXktX/crM=;
        b=t4/Q8rSn7Bc+OWxyIkPKJpbRYMWHgnvoF+4WNXe8xL+74ZVHbKC71VeQC5c6JzUGZd8AT3
        IK+dfeWt/1SVg4plMvphnDYgKUY3wQ934E/w+TxBoN/zspIUbuvWHboq9umQ8HwdkadW6B
        B02z27ChlVYY+Got+ERH8g/s+Nqw0OM=
From:   Yajun Deng <yajun.deng@linux.dev>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yajun Deng <yajun.deng@linux.dev>
Subject: [PATCH] media: v4l2-dev.h: move open brace after struct video_device
Date:   Wed, 15 Sep 2021 17:45:09 +0800
Message-Id: <20210915094509.17985-1-yajun.deng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: yajun.deng@linux.dev
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The open brace should be after a struct of define, that's good
for searching.

Signed-off-by: Yajun Deng <yajun.deng@linux.dev>
---
 include/media/v4l2-dev.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 6a4afd4a7df2..5cf1edefb822 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -260,8 +260,7 @@ struct v4l2_file_operations {
  *	Only set @dev_parent if that can't be deduced from @v4l2_dev.
  */
 
-struct video_device
-{
+struct video_device {
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	struct media_entity entity;
 	struct media_intf_devnode *intf_devnode;
-- 
2.32.0

