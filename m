Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA3F36BD5D
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 04:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhD0CeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 22:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhD0CeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 22:34:13 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC62EC061574;
        Mon, 26 Apr 2021 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
        Message-Id:MIME-Version:Content-Transfer-Encoding; bh=Igzk5PmTAU
        DER6EmI3hYvYH4ERMb9GrQy7aidDxiQFs=; b=FA6GD9/9E2kcl9yj0RPl1R/6sn
        sSinb3yQKUVmUL6H+C0tj5+MFgP5oTPuYqqmVc8PmJE9iWXmaQZXLjLCJg1HIzma
        eavNyJB6NjvCJkgV6hkyCHjtfIZY4dZQ/8Dl0ZL26B37BaH3I4zaTD/cX7NcTvtb
        unEPr/axciZ49WqfA=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygAnL6_ud4dgFftOAA--.758S4;
        Tue, 27 Apr 2021 10:33:18 +0800 (CST)
From:   Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To:     s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: [PATCH] media:exynos4-is: Fix a use after free in isp_video_release
Date:   Mon, 26 Apr 2021 19:33:15 -0700
Message-Id: <20210427023315.4537-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LkAmygAnL6_ud4dgFftOAA--.758S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1UXFWfZF4rtF13tr4ktFb_yoWkCFc_u3
        48KFnrWrZ5tw4jy3WqyFn5ZrWFyrZ8Xa93CanagFW2y34UAF4xtF4qkrWI93ZrGa17GFZ8
        Jrs8XF1UCr93CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
        648v4I1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUbBMKJUUUUU==
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In isp_video_release, file->private_data is freed via
_vb2_fop_release()->v4l2_fh_release(). But the freed
file->private_data is still used in v4l2_fh_is_singular_file()
->v4l2_fh_is_singular(filp->private_data), which is a use
after free bug.

My patch set file->private_data to NULL after _vb2_fop_release()
to avoid the use after free.

Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 612b9872afc8..f414493258ad 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -315,6 +315,7 @@ static int isp_video_release(struct file *file)
 	}
 
 	_vb2_fop_release(file, NULL);
+	filp->private_data = NULL;
 
 	if (v4l2_fh_is_singular_file(file)) {
 		fimc_pipeline_call(&ivc->ve, close);
-- 
2.25.1


