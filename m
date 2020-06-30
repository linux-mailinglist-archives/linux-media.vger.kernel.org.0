Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A0F20F0B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 10:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731639AbgF3Ioe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 04:44:34 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53473 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731633AbgF3Ioc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 04:44:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qBsRjdldK0MRaqBsUjRY67; Tue, 30 Jun 2020 10:44:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593506670; bh=yTW+ptN7mJ/DZLR/ewRb1h9avIl1whQlVyzpsheqSAs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KpXEnXIo+S9lo8sSfd4yXhDrq8Gy75CBF8CPIl/9nhI+6VcwYN09DqhPYAJlYUzBS
         lLxMzCwv1JsTyj5/3xvnmCl2CBcGXa1wCvirJ4aHz3X6K0ESTpchf6S0y2ggmvmMM9
         kFWLy+NK6bkAITEpTDX59FwsjprkEInHMwYQPpH0lYMpVofKda86EllxLvYbwcnek3
         lH23jaagtI2cwbXq3A+Op56ypfgqA+hv0HTiQs4xo4EEOvTgbYQBsjECGxzvrf6V/G
         ufFNFaOHNRbufQcSlG3Tjq9wr5uaZsgB7XW83P+BuJnkDJtVtDyWKYFlnPV1LiiOWS
         MzAGP52uYWgwA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: i2c: imx219: take lock in
 imx219_enum_mbus_code/frame_size
Message-ID: <b4791885-c25c-f641-5123-cfa1c6adbde3@xs4all.nl>
Date:   Tue, 30 Jun 2020 10:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJgPKyBYCiGFFdRc8FSNk9U0HdlI3GLEIizMKnIfbVkeK8ANUp0KtlsLG9zggaYQI+p8SGW1tMXjVbMUmAcJ8qWUA88G5VYHhhlRXp8ahGift5KVj0Hf
 DOI1ySMRa5GcQ3vDBjtHeT544mypfQQU6CKfDpTwFaxhEdtgpPtVCLal9FE/zhTH0uxUk84nBJaX+A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These two functions did not take the imx219->mutex lock, but
imx219_get_format_code checks that that lock is taken, so it issues
a warning:

[    8.738717] WARNING: CPU: 2 PID: 60 at drivers/media/i2c/imx219.c:653 imx219_get_format_code+0xac/0xc0
[    8.748113] Modules linked in:
[    8.751214] CPU: 2 PID: 60 Comm: kworker/2:1 Tainted: G        W         5.8.0-rc1-arm64 #148
[    8.759821] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[    8.765806] Workqueue: events deferred_probe_work_func
[    8.771003] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[    8.776635] pc : imx219_get_format_code+0xac/0xc0
[    8.781390] lr : imx219_get_format_code+0xa8/0xc0
[    8.786143] sp : ffff800012a538f0
[    8.789495] x29: ffff800012a538f0 x28: ffff800012838e90
[    8.794867] x27: ffff0000f28c5800 x26: ffff800011161c68
[    8.800237] x25: ffff0000f2a5a3f8 x24: 0000000000000018
[    8.805605] x23: ffff0000f284ef18 x22: ffff0000f2a5a080
[    8.810974] x21: ffff0000f284ff00 x20: ffff0000f2a5a080
[    8.816343] x19: 000000000000300f x18: 00000000ffffffff
[    8.821712] x17: ffff800011c77268 x16: 00000000000040d7
[    8.827081] x15: 00000000000040d8 x14: 0000000000000000
[    8.832451] x13: 00000000000040d4 x12: ffff800011d19300
[    8.837819] x11: 00000000000208c0 x10: 0000000000000004
[    8.843188] x9 : 000000003baa2ecd x8 : 000000008b3f9c73
[    8.848558] x7 : 0000000000000008 x6 : 0000000000000034
[    8.853929] x5 : 0000000000000000 x4 : 0000000000000001
[    8.859297] x3 : ffff800010a2a8a8 x2 : ffff0000f84a8000
[    8.864666] x1 : 0000000000000000 x0 : 0000000000000000
[    8.870034] Call trace:
[    8.872515]  imx219_get_format_code+0xac/0xc0
[    8.876921]  imx219_enum_mbus_code+0x38/0x60
[    8.881241]  call_enum_mbus_code+0x50/0x70
[    8.885387]  tegra_vi_graph_notify_complete+0x290/0x5e8
[    8.890670]  v4l2_async_notifier_try_complete.part.0+0x48/0x68
[    8.896563]  v4l2_async_register_subdev+0x100/0x1c0
[    8.901497]  v4l2_async_register_subdev_sensor_common+0x70/0xf0
[    8.907477]  imx219_probe+0x590/0x728
[    8.911184]  i2c_device_probe+0xe4/0x2b0
[    8.915151]  really_probe+0xd8/0x330
[    8.918768]  driver_probe_device+0x58/0xb8
[    8.922909]  __device_attach_driver+0x84/0xc8
[    8.927315]  bus_for_each_drv+0x78/0xc8
[    8.931193]  __device_attach+0xe4/0x140
[    8.935072]  device_initial_probe+0x14/0x20
[    8.939301]  bus_probe_device+0x9c/0xa8
[    8.943179]  deferred_probe_work_func+0x74/0xb0
[    8.947759]  process_one_work+0x2c4/0x740
[    8.951813]  worker_thread+0x4c/0x430
[    8.955518]  kthread+0x158/0x178
[    8.958786]  ret_from_fork+0x10/0x1c
[    8.962401] irq event stamp: 63536
[    8.965846] hardirqs last  enabled at (63535): [<ffff800010082398>] el1_irq+0xd8/0x180
[    8.973846] hardirqs last disabled at (63536): [<ffff8000100a6484>] do_debug_exception+0x16c/0x258
[    8.982895] softirqs last  enabled at (63534): [<ffff800010080d4c>] _stext+0x54c/0x594
[    8.990896] softirqs last disabled at (63525): [<ffff8000100c8350>] irq_exit+0x100/0x138
[    8.999066] ---[ end trace ebfbcd84b75ef921 ]---
[    9.004354] ------------[ cut here ]------------

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/imx219.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f64c0ef7a897..0a546b8e466c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -808,7 +808,9 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= (ARRAY_SIZE(codes) / 4))
 		return -EINVAL;

+	mutex_lock(&imx219->mutex);
 	code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
+	mutex_unlock(&imx219->mutex);

 	return 0;
 }
@@ -818,11 +820,15 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
+	u32 code;

 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;

-	if (fse->code != imx219_get_format_code(imx219, fse->code))
+	mutex_lock(&imx219->mutex);
+	code = imx219_get_format_code(imx219, fse->code);
+	mutex_unlock(&imx219->mutex);
+	if (fse->code != code)
 		return -EINVAL;

 	fse->min_width = supported_modes[fse->index].width;
-- 
2.27.0

