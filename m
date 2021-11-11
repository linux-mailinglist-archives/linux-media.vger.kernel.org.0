Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5886E44D711
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 14:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhKKNUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 08:20:45 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:52147 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhKKNUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 08:20:45 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id l9xhmV6vzBazol9xhmbNf6; Thu, 11 Nov 2021 14:17:55 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 14:17:55 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com, acourbot@chromium.org,
        yunfei.dong@mediatek.com, hverkuil-cisco@xs4all.nl,
        tzungbi@google.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mtk-vcodec: Fix an error handling path in 'asid_allocator_init()'
Date:   Thu, 11 Nov 2021 14:17:51 +0100
Message-Id: <86d3e2db237bc35eb55bd46ef07fa13a39bcdff8.1636636541.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of error the 'media_device_init()' call is not balanced by a
corresponding 'media_device_cleanup()' call.

Add it, when needed, as already done in the remove function.

Fixes: 118add98f80e ("media: mtk-vcodec: vdec: add media device if using stateless api")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e6e6a8203eeb..8277c44209b5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -358,6 +358,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (dev->vdec_pdata->uses_stateless_api)
 		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
 err_reg_cont:
+	if (dev->vdec_pdata->uses_stateless_api)
+		media_device_cleanup(&dev->mdev_dec);
 	destroy_workqueue(dev->decode_workqueue);
 err_event_workq:
 	v4l2_m2m_release(dev->m2m_dev_dec);
-- 
2.30.2

