Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9F9CA090
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 16:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730391AbfJCOqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 10:46:43 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:33556 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbfJCOqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 10:46:43 -0400
Received: by mail-lj1-f169.google.com with SMTP id a22so3111815ljd.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGap1M7x7siN59Y9bN/tco7EI3h7G/haqxZKUl5gYRg=;
        b=FoesvKeMUXHzkF/GBKAQ5aP0RSh5oB5ciSDaUTgRofajHkduvQXqC0wxyYBlkhpV2p
         1DNAvittZ3Z05OJT3OH3qn7IbkawPyCmLl/l8nbTT9KSypL7d+2D2H7vMmQFCv9+bXBz
         EFDCLRnSGEpfWXiqHscjq5zxjRrr1ST+rGmVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGap1M7x7siN59Y9bN/tco7EI3h7G/haqxZKUl5gYRg=;
        b=O36dgSgzzERtb4qWKCdx7C1rwZb5aSlkNvLUkFEDKi3zgBSUqMDOvGQ3qk7p6ub2xM
         s14NEZ7StWbO+/pUwOoh3+Vh3xyHOE0kuIZ6IzJGkelR6zkdg+kBKKoEGVS14KPhCA+9
         BlGvhQlbhwmsWqE5qaecQoG0YZ6BkKyCg/HyvF1RjpsFMs8C+BW7h2nUYHJEXeKCbSsh
         EKMUtpTEKGb2/3tPyjtv1xzeXXHkTd2goOzxyaNfZlcDr9TTd/xABvw0ZLvMIN2htdRY
         ZC1k1nyETmkPXLo6KxZs2a8vVjfb1YwIT4yydMjQPKjCPjnAXCt0HMYjL7ZLlkHFyUn/
         SQQw==
X-Gm-Message-State: APjAAAUx8GcTVa1fuy59xY8cUwZq8xMWh1sn1rxU8AxWJnw4O1uhYEED
        U5hxi3jT4F/MaBX4qrkC7D+gmQ==
X-Google-Smtp-Source: APXvYqyhdEVfVFTOA5zS/DnVqxR9zl8+LnWWWMZ8K7de/LbLzfU+inkqP9BD34T0KaV45RO+4JiAjw==
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr6303059ljg.164.1570113999499;
        Thu, 03 Oct 2019 07:46:39 -0700 (PDT)
Received: from turia.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id p27sm503900lfo.95.2019.10.03.07.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 07:46:38 -0700 (PDT)
From:   Daniel Gomez <daniel@qtec.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Daniel Gomez <daniel@qtec.com>
Subject: [PATCH] media: imx214: Fix stop streaming
Date:   Thu,  3 Oct 2019 16:46:24 +0200
Message-Id: <20191003144624.17899-1-daniel@qtec.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stop video streaming when requested.

When s_stream is called to stop the video streaming, if/else condition calls
start_streaming function instead of the one for stopping it.

Fixes: 436190596241 ("media: imx214: Add imx214 camera sensor driver")
Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

You can find some logs before/after running in the hardware. Notice 0x100
register is for starting/stopping the video streaming from the imx214 sensor.

* Before patch:

# media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_ispif0":0[1],"msm_ispif0":1->"msm_vfe0_rdi0":0[1]'
# media-ctl -d /dev/media0 -V '"imx214 3-001a":0[fmt:SRGGB10/1920x1080],"msm_csiphy0":0[fmt:SRGGB10/1920x1080],"msm_csid0":0[fmt:SRGGB10/1920x1080],"msm_ispif0":0[fmt:SRGGB10/1920x1080],"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080]'
# yavta -f SRGGB10P -s 1920x1080 -n 1 --capture=5 /dev/v4l/by-path/platform-a34000.camss-video-index0
Device /dev/v4l/by-path/platform-a34000.camss-video-index0 opened.
Device `Qualcomm Camera Subsystem' on `platform:a34000.camss' (driver 'qcom-camss') supports video, capture, with mplanes.
Video format set: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
 * Stride 2400, buffer size 2592000
Video format: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
 * Stride 2400, buffer size 2592000
1 buffers requested.
length: 1 offset: 4093609832 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff84b6b000.
0 (0) [-] none 0 2592000 B 30.682759 30.705111 4.697 fps ts mono/EoF
1 (0) [-] none 1 2592000 B 30.749391 30.771609 15.008 fps ts mono/EoF
2 (0) [-] none 2 2592000 B 30.816042 30.838225 15.004 fps ts mono/EoF
3 (0) [-] none 3 2592000 B 30.882690 30.904992 15.004 fps ts mono/EoF
4 (0) [-] none 4 2592000 B 30.949333 30.971543 15.005 fps ts mono/EoF
Captured 5 frames in 0.501681 seconds (9.966480 fps, 0.000000 B/s).
1 buffers released.
# v4l2-dbg -d /dev/v4l-subdev19 -g 0x100
ioctl: VIDIOC_DBG_G_REGISTER
Register 0x00000100 = 1h (1d  00000001b)

* After patch:

# media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_ispif0":0[1],"msm_ispif0":1->"msm_vfe0_rdi0":0[1]'
# media-ctl -d /dev/media0 -V '"imx214 3-001a":0[fmt:SRGGB10/1920x1080],"msm_csiphy0":0[fmt:SRGGB10/1920x1080],"msm_csid0":0[fmt:SRGGB10/1920x1080],"msm_ispif0":0[fmt:SRGGB10/1920x1080],"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080]'
# yavta -f SRGGB10P -s 1920x1080 -n 1 --capture=5 /dev/v4l/by-path/platform-a34000.camss-video-index0
Device /dev/v4l/by-path/platform-a34000.camss-video-index0 opened.
Device `Qualcomm Camera Subsystem' on `platform:a34000.camss' (driver 'qcom-camss') supports video, capture, with mplanes.
Video format set: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
 * Stride 2400, buffer size 2592000
Video format: SRGGB10P (41415270) 1920x1080 field none, 1 planes:
 * Stride 2400, buffer size 2592000
1 buffers requested.
length: 1 offset: 3764913896 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb62f7000.
0 (0) [-] none 0 2592000 B 31.283473 31.306390 4.697 fps ts mono/EoF
1 (0) [-] none 1 2592000 B 31.350115 31.372475 15.006 fps ts mono/EoF
2 (0) [-] none 2 2592000 B 31.416765 31.439728 15.004 fps ts mono/EoF
3 (0) [-] none 3 2592000 B 31.483410 31.505791 15.005 fps ts mono/EoF
4 (0) [-] none 4 2592000 B 31.550058 31.573025 15.004 fps ts mono/EoF
Captured 5 frames in 0.502440 seconds (9.951430 fps, 0.000000 B/s).
1 buffers released.
# v4l2-dbg -d /dev/v4l-subdev19 -g 0x100
ioctl: VIDIOC_DBG_G_REGISTER
Register 0x00000100 = 0h (0d  00000000b)

 drivers/media/i2c/imx214.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 159a3a604f0e..24659cb0d083 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -785,7 +785,7 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		if (ret < 0)
 			goto err_rpm_put;
 	} else {
-		ret = imx214_start_streaming(imx214);
+		ret = imx214_stop_streaming(imx214);
 		if (ret < 0)
 			goto err_rpm_put;
 		pm_runtime_put(imx214->dev);
--
2.20.1

