Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349B41B9782
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 08:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgD0Gho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 02:37:44 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3308 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726246AbgD0Gho (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 02:37:44 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 54238A42E52E41032285;
        Mon, 27 Apr 2020 14:37:39 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 27 Apr 2020
 14:37:28 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
        <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <amd-gfx@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] drm/amdgpu: remove conversion to bool in amdgpu_device.c
Date:   Mon, 27 Apr 2020 14:36:55 +0800
Message-ID: <20200427063655.21169-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The '>' expression itself is bool, no need to convert it to bool again.
This fixes the following coccicheck warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3004:68-73: WARNING:
conversion to bool not needed here

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3d601d5dd5af..ad94de3632d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3000,7 +3000,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
 	adev->gfx.gfx_off_req_count = 1;
-	adev->pm.ac_power = power_supply_is_system_supplied() > 0 ? true : false;
+	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
 
 	/* Registers mapping */
 	/* TODO: block userspace mapping of io register */
-- 
2.21.1

