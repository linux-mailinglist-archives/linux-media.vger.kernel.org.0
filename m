Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22642E3115
	for <lists+linux-media@lfdr.de>; Sun, 27 Dec 2020 13:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgL0MXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Dec 2020 07:23:04 -0500
Received: from m15111.mail.126.com ([220.181.15.111]:59500 "EHLO
        m15111.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgL0MXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Dec 2020 07:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=EeQ64OxSk6Lgpq0NYh
        2skNXNACqermCASGbXx4NCP20=; b=X7ybtLWimHZ3JuDheqddp0wiFF8Z0SSmAR
        iUZ+JJ8R0rW7n/kYvDwyqKndnw+6BdUQEXA8St6EQfxegk9GHbwEYw3NQDQj+lo+
        fPp32biGou67XoCOzYxSymhQm5iLw8KS+7byKE12kMhjHZYgRZ32r6ZVbtN6ASQP
        Mpl9sfCSg=
Received: from localhost.localdomain (unknown [36.112.86.14])
        by smtp1 (Coremail) with SMTP id C8mowADX3DwsdOhf1VsQNA--.25891S2;
        Sun, 27 Dec 2020 19:46:53 +0800 (CST)
From:   Defang Bo <bodefang@126.com>
To:     airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, Defang Bo <bodefang@126.com>
Subject: [PATCH] drm/amd:avoid null pointer dereference when dev is not bound
Date:   Sun, 27 Dec 2020 19:46:44 +0800
Message-Id: <1609069604-3949767-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: C8mowADX3DwsdOhf1VsQNA--.25891S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4rAryUuF1xKr1rtr1xAFb_yoWfurc_ur
        W5ZFykXr43AF1vqr1ayr4fZasrtFnY9FWkWrn3ta9ayry3Z3yUZrWqqF10g3WxWa1xCF1D
        Z3Wqgr4Sy3ZF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1kR63UUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbiYw0I11x5bWrfHwAAsT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Why]
Similar to commit<0fa375e6>. If amdgpu_switcheroo_can_switch access
the drm_device when dev is not bound, a null pointer dereference can happen.

[How]
Add sanity checks to prevent it.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 37da353..f70e528 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1439,6 +1439,9 @@ static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
 static bool amdgpu_switcheroo_can_switch(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	if (!dev)
+		return false;
 
 	/*
 	* FIXME: open_count is protected by drm_global_mutex but that would lead to
-- 
2.7.4

