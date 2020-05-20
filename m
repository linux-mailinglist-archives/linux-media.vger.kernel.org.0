Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8B21DAFC0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 12:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgETKMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 06:12:20 -0400
Received: from aliyun-cloud.icoremail.net ([47.90.73.12]:43526 "HELO
        aliyun-sdnproxy-4.icoremail.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with SMTP id S1726224AbgETKMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 06:12:20 -0400
X-Greylist: delayed 725 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 May 2020 06:12:19 EDT
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app2 (Coremail) with SMTP id by_KCgDnzpG1_cRe4SSMAQ--.43211S4;
        Wed, 20 May 2020 17:51:53 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance on error
Date:   Wed, 20 May 2020 17:51:48 +0800
Message-Id: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgDnzpG1_cRe4SSMAQ--.43211S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW5ZF15Jr17CrWrKFy7trb_yoW3KFc_Cr
        s0qw1xu345Ar4xtr17K3W3ZrySvFWDua18tF1SyrW3Gw4jvFy3GrykZrnrC3ZrXay2gry2
        vr93uF1Syr4fAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbT8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK
        67AK6r4fMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxV
        CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
        6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
        WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
        6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8KZXUUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/staging/media/tegra-vde/vde.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index d3e63512a765..dd134a3a15c7 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -777,7 +777,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
-		goto unlock;
+		goto put_runtime_pm;
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
-- 
2.17.1

