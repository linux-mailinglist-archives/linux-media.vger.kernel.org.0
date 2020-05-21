Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7838D1DC707
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 08:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgEUG2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 02:28:09 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:33482 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbgEUG2J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 02:28:09 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app3 (Coremail) with SMTP id cC_KCgCnr0NjH8Ze2nbmAA--.28907S4;
        Thu, 21 May 2020 14:27:51 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] media: staging: tegra-vde: fix runtime pm imbalance on error
Date:   Thu, 21 May 2020 14:27:45 +0800
Message-Id: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCnr0NjH8Ze2nbmAA--.28907S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWrZF15CFyUGr4xXF1UKFg_yoWkAwc_Cr
        s0gwnru34Yyw4xtw17K3W5ZrySvFWDWF40qa1FyF43Gw4jvFy3GrykZr1DCa1Duay29342
        vrZ3uF1avrn3CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbaAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
        aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
        x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
        McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
        1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAF
        wVW8AwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
        WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8
        JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJr
        UvcSsGvfC2KfnxnUUI43ZEXa7VUjY0PDUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgsHBlZdtOPFuAACsr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
the call returns an error code. Thus a pairing decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Remove unused label 'unlock'
---
 drivers/staging/media/tegra-vde/vde.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index d3e63512a765..3fdf2cd0b99e 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -777,7 +777,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
-		goto unlock;
+		goto put_runtime_pm;
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
@@ -843,8 +843,6 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 put_runtime_pm:
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
-
-unlock:
 	mutex_unlock(&vde->lock);
 
 release_dpb_frames:
-- 
2.17.1

