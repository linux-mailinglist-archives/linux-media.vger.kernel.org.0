Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937793597AE
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 10:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhDIIXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 04:23:09 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:5298 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229846AbhDIIXI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 04:23:08 -0400
Received: from localhost.localdomain (unknown [222.205.72.8])
        by mail-app3 (Coremail) with SMTP id cC_KCgB3X77CDnBgNXvxAA--.16685S4;
        Fri, 09 Apr 2021 16:22:30 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] media: imx: imx7-mipi-csis: Fix runtime PM imbalance in mipi_csis_s_stream
Date:   Fri,  9 Apr 2021 16:22:25 +0800
Message-Id: <20210409082225.22461-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgB3X77CDnBgNXvxAA--.16685S4
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1UXFW8AryfAr4xGr43trb_yoWkurb_Gr
        1kKr9rXr1qyrWfW3WIkr45ZryIqFWIqa18Xr1vvFZIk3yDAF95Xr4vvr1kAw45GF42yF9r
        Gw4kJF9xurn7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb-kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE
        14v_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026x
        CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
        JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
        1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
        Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
        W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjNJ55UUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgkKBlZdtTUlDwACsk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When v4l2_subdev_call() fails, a pairing PM usage counter
decrement is needed to keep the counter balanced. It's the
same for the following error paths in case 'enable' is on.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Use pm_runtime_put() to balance the refcount.
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a01a7364b4b9..6f3e8a15e7c4 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -628,7 +628,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 		}
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
 		if (ret < 0)
-			return ret;
+			goto pm_put;
 	}
 
 	mutex_lock(&state->lock);
@@ -657,7 +657,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 
 unlock:
 	mutex_unlock(&state->lock);
-	if (!enable)
+pm_put:
+	if (!enable || (ret < 0))
 		pm_runtime_put(&state->pdev->dev);
 
 	return ret;
-- 
2.17.1

