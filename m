Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8206327834D
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgIYIyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 04:54:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14236 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726990AbgIYIyN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 04:54:13 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0D95F710298451B1B7C5;
        Fri, 25 Sep 2020 16:54:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 25 Sep 2020 16:54:06 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH] drm/vc4: Deleted the drm_device declaration
Date:   Fri, 25 Sep 2020 16:51:38 +0800
Message-ID: <1601023898-29886-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drm_modeset_lock.h already declares struct drm_device, so there's no
need to declare it in vc4_drv.h

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8c8d96b..8717a1c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -19,7 +19,6 @@
 
 #include "uapi/drm/vc4_drm.h"
 
-struct drm_device;
 struct drm_gem_object;
 
 /* Don't forget to update vc4_bo.c: bo_type_names[] when adding to
-- 
2.7.4

