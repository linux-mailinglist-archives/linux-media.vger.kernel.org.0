Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE264546DD
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237391AbhKQNJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:09:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237384AbhKQNJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:09:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8DFAD1F45D02
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637154411; bh=wZ+ibyByRP8u5Nw9zLsABoLUSn6ypgyqQXE3oYQlGbw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AK3GvCft6MfgelkZPcKOyO8dqcA+EyLc8C9eVChsGlAJHIiwtdfhj96cRRHukFfpP
         0syn5EJqfwK6OK7e4//ZIcGSpjtO5u/ruV1mOCHPGh3g3b0MTD2XbcK35sVYCqxaut
         wdbjW55YKbBewS5ZpHFAKtbpvcNiuDvC2Opzmc95jyHvUVrzHpDy8HGHzRch+X3LuL
         8tJC2WMFZaU8C76vJb0OTsHO5vNtQaUgWv+MId2bahJnK0q7NxMyBZwaMJe3Y2KMMH
         XhBhVL+SORnCkqTtkYMw1lG2kyEh3XvXhpEXqYogfOTTen2weSYBNj2ZJvs+JGgl1/
         L0H0jKHEvs91g==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH v2 2/7] media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is released
Date:   Wed, 17 Nov 2021 15:06:30 +0200
Message-Id: <20211117130635.11633-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The func v4l2_m2m_ctx_release waits for currently running jobs
to finish and then stop streaming both queues and frees the buffers.
All this should be done before the call to mtk_vcodec_enc_release
which frees the encoder handler. This fixes null-pointer dereference bug:

[gst-master] root@debian:~/gst-build# [  638.019193] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001a0
[  638.028076] Mem abort info:
[  638.030932]   ESR = 0x96000004
[  638.033978]   EC = 0x25: DABT (current EL), IL = 32 bits
[  638.039293]   SET = 0, FnV = 0
[  638.042338]   EA = 0, S1PTW = 0
[  638.045474]   FSC = 0x04: level 0 translation fault
[  638.050349] Data abort info:
[  638.053224]   ISV = 0, ISS = 0x00000004
[  638.057055]   CM = 0, WnR = 0
[  638.060018] user pgtable: 4k pages, 48-bit VAs, pgdp=000000012b6db000
[  638.066485] [00000000000001a0] pgd=0000000000000000, p4d=0000000000000000
[  638.073277] Internal error: Oops: 96000004 [#1] SMP
[  638.078145] Modules linked in: rfkill mtk_vcodec_dec mtk_vcodec_enc uvcvideo mtk_mdp mtk_vcodec_common videobuf2_dma_contig v4l2_h264 cdc_ether v4l2_mem2mem videobuf2_vmalloc usbnet videobuf2_memops videobuf2_v4l2 r8152 videobuf2_common videodev cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf elan_i2c elants_i2c sbs_battery mc cros_usbpd_charger cros_ec_chardev cros_usbpd_logger crct10dif_ce mtk_vpu fuse ip_tables x_tables ipv6
[  638.118583] CPU: 0 PID: 212 Comm: kworker/u8:5 Not tainted 5.15.0-06427-g58a1d4dcfc74-dirty #109
[  638.127357] Hardware name: Google Elm (DT)
[  638.131444] Workqueue: mtk-vcodec-enc mtk_venc_worker [mtk_vcodec_enc]
[  638.137974] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  638.144925] pc : vp8_enc_encode+0x34/0x2b0 [mtk_vcodec_enc]
[  638.150493] lr : venc_if_encode+0xac/0x1b0 [mtk_vcodec_enc]
[  638.156060] sp : ffff8000124d3c40
[  638.159364] x29: ffff8000124d3c40 x28: 0000000000000000 x27: 0000000000000000
[  638.166493] x26: 0000000000000000 x25: ffff0000e7f252d0 x24: ffff8000124d3d58
[  638.173621] x23: ffff8000124d3d58 x22: ffff8000124d3d60 x21: 0000000000000001
[  638.180750] x20: ffff80001137e000 x19: 0000000000000000 x18: 0000000000000001
[  638.187878] x17: 000000040044ffff x16: 00400032b5503510 x15: 0000000000000000
[  638.195006] x14: ffff8000118536c0 x13: ffff8000ee1da000 x12: 0000000030d4d91d
[  638.202134] x11: 0000000000000000 x10: 0000000000000980 x9 : ffff8000124d3b20
[  638.209262] x8 : ffff0000c18d4ea0 x7 : ffff0000c18d44c0 x6 : ffff0000c18d44c0
[  638.216391] x5 : ffff80000904a3b0 x4 : ffff8000124d3d58 x3 : ffff8000124d3d60
[  638.223519] x2 : ffff8000124d3d78 x1 : 0000000000000001 x0 : ffff80001137efb8
[  638.230648] Call trace:
[  638.233084]  vp8_enc_encode+0x34/0x2b0 [mtk_vcodec_enc]
[  638.238304]  venc_if_encode+0xac/0x1b0 [mtk_vcodec_enc]
[  638.243525]  mtk_venc_worker+0x110/0x250 [mtk_vcodec_enc]
[  638.248918]  process_one_work+0x1f8/0x498
[  638.252923]  worker_thread+0x140/0x538
[  638.256664]  kthread+0x148/0x158
[  638.259884]  ret_from_fork+0x10/0x20
[  638.263455] Code: f90023f9 2a0103f5 aa0303f6 aa0403f8 (f940d277)
[  638.269538] ---[ end trace e374fc10f8e181f5 ]---

Fixes: 4e855a6efa547 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index eed67394cf46..f898226fc53e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -214,11 +214,11 @@ static int fops_vcodec_release(struct file *file)
 	mtk_v4l2_debug(1, "[%d] encoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
 
+	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_enc_release(ctx);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 
 	list_del_init(&ctx->list);
 	kfree(ctx);
-- 
2.17.1

