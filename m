Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF3830F383
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 13:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbhBDMzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 07:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhBDMzq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 07:55:46 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5009C0613ED
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 04:55:05 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u14so3398044wri.3
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 04:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCzGeJDGR2lo2+C16mGIFeCfg8WIi6K3JCxqe1IQFHM=;
        b=EuPpKq+8GSaV0Iaqp5pWQiwyRwm0clUxgBwu+CEutRmvRzSuFPvDQmbtuuvE9cErrV
         xo+ZSFz7adIW3aBgaJOeVnO30QCbzaHunW9DWM6yRHmZGjTRiZ/89fpV/6CzqfW2OfR7
         Nbx2PUhn6z7vjJ8nAP9AE8OnS+O7uKOUTJLpeTlrZyKEy35GMgTgUBUMsiGrRtB7hEzt
         YMqlZVYLPqBGvb1RvViz695a4/dRsyS8yVHAV49XgigG8G1v46CBg5h5wi2e5gEwXIV3
         nEQlwHPgYFXGCHlXw2fPlLPBFrKga0LX6KcvUM0efuMmXKnl7nF/PJjnTTB3V6KRT9M1
         brsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCzGeJDGR2lo2+C16mGIFeCfg8WIi6K3JCxqe1IQFHM=;
        b=ZLPoNpbhTKoPEsxQ17j1pG4H4MyoIzhKw5t6mm7gC/m2cgYsvSK39iXqRppFWxo41v
         Z0RiqXVeikLNCIECOfYJ6vQ4WVxQuQbS0mmTrlUd5D4sQx2UFu+IqMVoRo/VixiQUWtl
         xmMglzaheBLDq7+ThZ6+9HF51+0aK9AjP9cri/6GQonglxaLJzrU0ciYSUz30R2Py/sj
         XA4EYczp9H9VisN07uR4KacpK8kqclzeqnlBZ4V30td4ZoPV+aQGal259fdAXKE7O1Qg
         sp9iIe5tJUYcjvyBRDJmIOIXq05CIsEgqB3XYJJQcBUsuJu1tsqpPmRrNwtwlBt2ppwN
         wmIQ==
X-Gm-Message-State: AOAM533+DOdBR4rXcXeJpm0IsWLwZVe/OwyMHeVV8Qc9WAQDawLvyrJ9
        FwPz9epyugmGRMn75wxtn6Soyg==
X-Google-Smtp-Source: ABdhPJxhDfWume8Ir8CUStFQnppxWU9nAyQOcbDGUnwv2isyXlFgTejhdHnfg+4phdveULbynzGK2w==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr8931768wru.283.1612443304476;
        Thu, 04 Feb 2021 04:55:04 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r15sm8200988wrj.61.2021.02.04.04.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 04:55:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dmitry.baryshkov@linaro.org
Subject: [PATCH] media: venus: core, venc, vdec: Fix probe dependency error
Date:   Thu,  4 Feb 2021 12:56:14 +0000
Message-Id: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit aaaa93eda64b ("media] media: venus: venc: add video encoder files")
is the last in a series of three commits to add core.c vdec.c and venc.c
adding core, encoder and decoder.

The encoder and decoder check for core drvdata as set and return -EPROBE_DEFER
if it has not been set, however both the encoder and decoder rely on
core.v4l2_dev as valid.

core.v4l2_dev will not be valid until v4l2_device_register() has completed
in core.c's probe().

Normally this is never seen however, Dmitry reported the following
backtrace when compiling drivers and firmware directly into a kernel image.

[    5.259968] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[    5.269850] sd 0:0:0:3: [sdd] Optimal transfer size 524288 bytes
[    5.275505] Workqueue: events deferred_probe_work_func
[    5.275513] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[    5.441211] usb 2-1: new SuperSpeedPlus Gen 2 USB device number 2 using xhci-hcd
[    5.442486] pc : refcount_warn_saturate+0x140/0x148
[    5.493756] hub 2-1:1.0: USB hub found
[    5.496266] lr : refcount_warn_saturate+0x140/0x148
[    5.500982] hub 2-1:1.0: 4 ports detected
[    5.503440] sp : ffff80001067b730
[    5.503442] x29: ffff80001067b730
[    5.592660] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[    5.598478] x28: ffff6c6bc1c379b8
[    5.598480] x27: ffffa5c673852960 x26: ffffa5c673852000
[    5.598484] x25: ffff6c6bc1c37800 x24: 0000000000000001
[    5.810652] x23: 0000000000000000 x22: ffffa5c673bc7118
[    5.813777] hub 1-1:1.0: USB hub found
[    5.816108] x21: ffffa5c674440000 x20: 0000000000000001
[    5.820846] hub 1-1:1.0: 4 ports detected
[    5.825415] x19: ffffa5c6744f4000 x18: ffffffffffffffff
[    5.825418] x17: 0000000000000000 x16: 0000000000000000
[    5.825421] x15: 00000a4810c193ba x14: 0000000000000000
[    5.825424] x13: 00000000000002b8 x12: 000000000000f20a
[    5.825427] x11: 000000000000f20a x10: 0000000000000038
[    5.845447] usb 2-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
[    5.845904]
[    5.845905] x9 : 0000000000000000 x8 : ffff6c6d36fae780
[    5.871208] x7 : ffff6c6d36faf240 x6 : 0000000000000000
[    5.876664] x5 : 0000000000000004 x4 : 0000000000000085
[    5.882121] x3 : 0000000000000119 x2 : ffffa5c6741ef478
[    5.887578] x1 : 3acbb3926faf5f00 x0 : 0000000000000000
[    5.893036] Call trace:
[    5.895551]  refcount_warn_saturate+0x140/0x148
[    5.900202]  __video_register_device+0x64c/0xd10
[    5.904944]  venc_probe+0xc4/0x148
[    5.908444]  platform_probe+0x68/0xe0
[    5.912210]  really_probe+0x118/0x3e0
[    5.915977]  driver_probe_device+0x5c/0xc0
[    5.920187]  __device_attach_driver+0x98/0xb8
[    5.924661]  bus_for_each_drv+0x68/0xd0
[    5.928604]  __device_attach+0xec/0x148
[    5.932547]  device_initial_probe+0x14/0x20
[    5.936845]  bus_probe_device+0x9c/0xa8
[    5.940788]  device_add+0x3e8/0x7c8
[    5.944376]  of_device_add+0x4c/0x60
[    5.948056]  of_platform_device_create_pdata+0xbc/0x140
[    5.953425]  of_platform_bus_create+0x17c/0x3c0
[    5.958078]  of_platform_populate+0x80/0x110
[    5.962463]  venus_probe+0x2ec/0x4d8
[    5.966143]  platform_probe+0x68/0xe0
[    5.969907]  really_probe+0x118/0x3e0
[    5.973674]  driver_probe_device+0x5c/0xc0
[    5.977882]  __device_attach_driver+0x98/0xb8
[    5.982356]  bus_for_each_drv+0x68/0xd0
[    5.986298]  __device_attach+0xec/0x148
[    5.990242]  device_initial_probe+0x14/0x20
[    5.994539]  bus_probe_device+0x9c/0xa8
[    5.998481]  deferred_probe_work_func+0x74/0xb0
[    6.003132]  process_one_work+0x1e8/0x360
[    6.007254]  worker_thread+0x208/0x478
[    6.011106]  kthread+0x150/0x158
[    6.014431]  ret_from_fork+0x10/0x30
[    6.018111] ---[ end trace f074246b1ecdb466 ]---

This patch fixes by

- Making core.v4l2_dev into core->v4l_dev
- Only setting core->v4l2_dev when v4l2_device_register() completes
- Deferring encoder/decoder probe until core->v4l2_dev is set

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: aaaa93eda64b ("media] media: venus: venc: add video encoder files")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 14 +++++++++++---
 drivers/media/platform/qcom/venus/core.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c |  4 ++--
 drivers/media/platform/qcom/venus/venc.c |  4 ++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 07faed26c477..b4f1ae6ca146 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -231,6 +231,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct v4l2_device *v4l2_dev;
 	struct venus_core *core;
 	struct resource *r;
 	int ret;
@@ -239,6 +240,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core)
 		return -ENOMEM;
 
+	v4l2_dev = devm_kzalloc(dev, sizeof(*v4l2_dev), GFP_KERNEL);
+	if (!v4l2_dev)
+		return -ENOMEM;
+
 	core->dev = dev;
 	platform_set_drvdata(pdev, core);
 
@@ -331,10 +336,12 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_venus_shutdown;
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = v4l2_device_register(dev, v4l2_dev);
 	if (ret)
 		goto err_core_deinit;
 
+	core->v4l2_dev = v4l2_dev;
+
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
@@ -346,7 +353,7 @@ static int venus_probe(struct platform_device *pdev)
 	return 0;
 
 err_dev_unregister:
-	v4l2_device_unregister(&core->v4l2_dev);
+	v4l2_device_unregister(core->v4l2_dev);
 err_core_deinit:
 	hfi_core_deinit(core, false);
 err_venus_shutdown:
@@ -391,7 +398,8 @@ static int venus_remove(struct platform_device *pdev)
 	icc_put(core->video_path);
 	icc_put(core->cpucfg_path);
 
-	v4l2_device_unregister(&core->v4l2_dev);
+	v4l2_device_unregister(core->v4l2_dev);
+
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
 	venus_dbgfs_deinit(core);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 8328f7210d6c..baf4d01c18c9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -150,7 +150,7 @@ struct venus_core {
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
-	struct v4l2_device v4l2_dev;
+	struct v4l2_device *v4l2_dev;
 	const struct venus_resources *res;
 	struct device *dev;
 	struct device *dev_dec;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 9fbff40c4568..e5c81b59965b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1636,7 +1636,7 @@ static int vdec_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	core = dev_get_drvdata(dev->parent);
-	if (!core)
+	if (!core || !core->v4l2_dev)
 		return -EPROBE_DEFER;
 
 	platform_set_drvdata(pdev, core);
@@ -1656,7 +1656,7 @@ static int vdec_probe(struct platform_device *pdev)
 	vdev->fops = &vdec_fops;
 	vdev->ioctl_ops = &vdec_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
-	vdev->v4l2_dev = &core->v4l2_dev;
+	vdev->v4l2_dev = core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4b5ab0c790c9..ff2bf11bd89e 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1242,7 +1242,7 @@ static int venc_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	core = dev_get_drvdata(dev->parent);
-	if (!core)
+	if (!core || !core->v4l2_dev)
 		return -EPROBE_DEFER;
 
 	platform_set_drvdata(pdev, core);
@@ -1262,7 +1262,7 @@ static int venc_probe(struct platform_device *pdev)
 	vdev->fops = &venc_fops;
 	vdev->ioctl_ops = &venc_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
-	vdev->v4l2_dev = &core->v4l2_dev;
+	vdev->v4l2_dev = core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-- 
2.29.2

