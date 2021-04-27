Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6004B36BF13
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 08:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhD0GDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 02:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhD0GDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 02:03:52 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADB6AC061574;
        Mon, 26 Apr 2021 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
        Message-Id:MIME-Version:Content-Transfer-Encoding; bh=v7OI+JeiSL
        NOWCbMsyFE1LhROWob97JvYTX1veuCAAU=; b=ZWfrAn0f2Fhph6gtaTWDkhOFOM
        ySQ67mX//jP5+bixOfxos2EB/JBehAvPUrRuyAWGRt2RqpqDGaSpsFFBA3/KJuUW
        EbzF1JBtKyxpLO9aPjYXVGPDTMpSp2Er7gBNHVFfWK0SNieQefIa/N5nxQNEZjRW
        SN74mnNbxUzG5ngqY=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygDHz68RqYdgrVNQAA--.2285S4;
        Tue, 27 Apr 2021 14:02:57 +0800 (CST)
From:   Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To:     s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: [PATCH v2] media:exynos4-is: Fix a use after free in isp_video_release
Date:   Mon, 26 Apr 2021 23:02:55 -0700
Message-Id: <20210427060255.3318-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LkAmygDHz68RqYdgrVNQAA--.2285S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1UXFWfZF4rtF13tr4ktFb_yoWkurX_Z3
        48KFn7Xry5tr4jy3WqyFn5ZrW0yrZ8Xa93CanagFW2y3yUAFWxtF4qkrWfu3ZrGa17GFZ8
        Jrs8XF4UCr93CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbsAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
        YxC7MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjylk7UUUUU==
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In isp_video_release, file->private_data is freed via
_vb2_fop_release()->v4l2_fh_release(). But the freed
file->private_data is still used in v4l2_fh_is_singular_file()
->v4l2_fh_is_singular(file->private_data), which is a use
after free bug.

My patch set file->private_data to NULL after _vb2_fop_release()
to avoid the use after free.

Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 612b9872afc8..2e04589068b4 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -315,7 +315,8 @@ static int isp_video_release(struct file *file)
 	}
 
 	_vb2_fop_release(file, NULL);
-
+	file->private_data = NULL;
+
 	if (v4l2_fh_is_singular_file(file)) {
 		fimc_pipeline_call(&ivc->ve, close);
 
-- 
2.25.1


