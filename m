Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB5F3775D9
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 10:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhEIIN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 May 2021 04:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhEIIN5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 May 2021 04:13:57 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C0E8C061573;
        Sun,  9 May 2021 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
        Message-Id:MIME-Version:Content-Transfer-Encoding; bh=rFc2GaVRxX
        MDaJX17XmxIUk885oq3wi+tU+2OaHEO+8=; b=NpIr7LPgnwoHDWni11Y/d9ccEu
        VyVbfLnD6HIm6YNSZy6YXAvi+itfW8OjW41wXZWYfXp7vNJOWTWr3CfWMUiAn0rn
        QmJgy9n1+oUbk81JhbPvUlAqaNqHHUWzjTUbY/HU6UeXvuhpA4gv0zR0c9HL0gxd
        fDt/jFgK8a6x+PSOs=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygB3fp57mZdgexysAA--.2165S4;
        Sun, 09 May 2021 16:12:43 +0800 (CST)
From:   Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To:     s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: [PATCH v4] media:exynos4-is: Fix a use after free in isp_video_release
Date:   Sun,  9 May 2021 01:12:31 -0700
Message-Id: <20210509081231.4139-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LkAmygB3fp57mZdgexysAA--.2165S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW5XFykJF4xJw47AryUAwb_yoW8Ar17pF
        98Kw4ftrWjqw1kJ3srt3W2gFyrGanYqF9a9Fs7ua4rA3Z8XF12vFn3ta4UuFyjkrn7Aw4a
        qr10qr97JF4Y9F7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
        rcIFxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjWSoPUUUUU==
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In isp_video_release, file->private_data is freed via
_vb2_fop_release()->v4l2_fh_release(). But the freed
file->private_data is still used in v4l2_fh_is_singular_file()
->v4l2_fh_is_singular(file->private_data), which is a use
after free bug.

My patch uses a variable 'is_singular_file' to avoid the uaf.
v3: https://lore.kernel.org/patchwork/patch/1419058/

Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 612b9872afc8..3335fec509cb 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -306,17 +306,20 @@ static int isp_video_release(struct file *file)
 	struct fimc_is_video *ivc = &isp->video_capture;
 	struct media_entity *entity = &ivc->ve.vdev.entity;
 	struct media_device *mdev = entity->graph_obj.mdev;
+	bool is_singular_file;
 
 	mutex_lock(&isp->video_lock);
 
-	if (v4l2_fh_is_singular_file(file) && ivc->streaming) {
+	is_singular_file = v4l2_fh_is_singular_file(file);
+
+	if (is_singular_file && ivc->streaming) {
 		media_pipeline_stop(entity);
 		ivc->streaming = 0;
 	}
 
 	_vb2_fop_release(file, NULL);
 
-	if (v4l2_fh_is_singular_file(file)) {
+	if (is_singular_file) {
 		fimc_pipeline_call(&ivc->ve, close);
 
 		mutex_lock(&mdev->graph_mutex);
-- 
2.25.1


