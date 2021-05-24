Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D5838E47D
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhEXKsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:48:32 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:56560 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232426AbhEXKsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:48:30 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UZw1ezY_1621853215;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UZw1ezY_1621853215)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 24 May 2021 18:47:01 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     alexander.deucher@amd.com
Cc:     christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/amdgpu: remove unreachable code
Date:   Mon, 24 May 2021 18:46:53 +0800
Message-Id: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the function amdgpu_uvd_cs_msg(), every branch in the switch
statement will have a return, so the code below the switch statement
will not be executed.

Eliminate the follow smatch warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
ignoring unreachable code.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 82f0542..375b346 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
 		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
 		return -EINVAL;
 	}
-	BUG();
-	return -EINVAL;
 }
 
 /**
-- 
1.8.3.1

