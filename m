Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCF6357EB9
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhDHJJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:09:05 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:42634 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229600AbhDHJJF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 05:09:05 -0400
Received: from localhost.localdomain (unknown [10.192.24.118])
        by mail-app3 (Coremail) with SMTP id cC_KCgAHnz0MyG5gbiToAA--.50767S4;
        Thu, 08 Apr 2021 17:08:31 +0800 (CST)
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
Subject: [PATCH] media: imx: imx7-mipi-csis: Fix runtime PM imbalance in mipi_csis_s_stream
Date:   Thu,  8 Apr 2021 17:08:27 +0800
Message-Id: <20210408090827.32612-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgAHnz0MyG5gbiToAA--.50767S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw45ur1Utr4rCF48ZFykuFg_yoW8JFWrpr
        4xK34Fyry8JFn5CrZrA3W7Xr98G34Sk3s7Gry7G3WF9Fs5t3Wag34kta4YqF48WrWrA345
        AF1rJw1avFWjkr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY
        0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUb0D73UUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0JBlZdtTTcOgAQs8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When v4l2_subdev_call() fails, a pairing PM usage counter
decrement is needed to keep the counter balanced. It's the
same for the following error paths in case 'enable' is on.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a01a7364b4b9..2a3fff231a40 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -627,21 +627,26 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 			return ret;
 		}
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_noidle(&state->pdev->dev);
 			return ret;
+		}
 	}
 
 	mutex_lock(&state->lock);
 	if (enable) {
 		if (state->flags & ST_SUSPENDED) {
 			ret = -EBUSY;
+			pm_runtime_put_noidle(&state->pdev->dev);
 			goto unlock;
 		}
 
 		mipi_csis_start_stream(state);
 		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_noidle(&state->pdev->dev);
 			goto unlock;
+		}
 
 		mipi_csis_log_counters(state, true);
 
-- 
2.17.1

