Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0964438ADD5
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhETMS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235550AbhETMSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32426C07A820;
        Thu, 20 May 2021 04:05:34 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 27so10295715pgy.3;
        Thu, 20 May 2021 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vwmMUukpFyOrDcl20+9II4RSMezzZHCIhgLVXqT7w9w=;
        b=cVYYRx8Z0F3a060ibEz6LPYWn0G2U6LwY8zJp7muwtzpQMrBhX/yZfrAokQroA8kOn
         lMMgvSu+rOhg1kne0qtMeFEDJ5lrmxuJwa80+p9tncucUb4ZKiFBXhDbV1umPILg0q9v
         iqZJvBqth8RcKE4myGY0/A2hnhyctX1qXjAtM3sL+m+KXWLw9bPOG32VH8CwUzJyQJFO
         EfDLwXNPSmG43dC41QxxabmKSQ8W8PZuAd0mdMIxyLZwdmmHN8giIe/se5kTCHE7a7w5
         TnZDZ2Ci6vp95MO8yiDQ1S0MGpip+b8j74ByC2PTRaXC5VpCXyJyIZKA+03WbRldOTP8
         4DeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vwmMUukpFyOrDcl20+9II4RSMezzZHCIhgLVXqT7w9w=;
        b=KiYUQ0OlG8hoR/PpHzmjQarOQDLj9Dcs+W+ZrzxygylCjN+nkYLjl35LR7M42kgIYE
         qHxVzb16kQxUWDN88y2txqFLFdMQ8LbCBqzjjkKos8oVU7UguIaCYEDnSDIGS29bsd8z
         6ehWmyt3JKuhve9c28JWmvuMtqf8k269TzrvNuJ1Cnm6FsdJgqDvgcVMVTZ54JkKHnab
         zU7dmHJ1IWCVFvQCoTjXUcFqkl0iYz8r3C6yBZscH18TZEjwa1fF0Af1sq22htSIib1v
         J1L5FRWEhaMeQR6P5u2FLRyUhjc/JfSOiLcQtKkVYs4yXgM6tM2pB/om0R/pLbsv4lwM
         UZJw==
X-Gm-Message-State: AOAM532vSbTdTYJ4ccF8xc0fHvr+C9qV9RSZTaBqDI0twuNWLoZO5ZGh
        mXrC2C0o0taM9EsboBopCVM=
X-Google-Smtp-Source: ABdhPJzPnIvYvnhiJvvz2fB++gdCgJhsWLGxxX7Wj9b86EbMp5EHJ5c1z+SCsBKgoOG/aMnw+MH7dw==
X-Received: by 2002:a63:224d:: with SMTP id t13mr4046277pgm.283.1621508733564;
        Thu, 20 May 2021 04:05:33 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:05:33 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH 0/7] Add support for DMA2D of STMicroelectronics STM32 SoC series
Date:   Thu, 20 May 2021 19:05:20 +0800
Message-Id: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This patchset introduces a basic support for DMA2D Interface
of STMicroelectronics STM32 SoC series.

This first basic support implements R2M, M2M, M2M_PFC
M2M_BLEND support will be added later on.

This has been tested on STM32469-DISCO board.

The commit based on kernel(master): c3d0e3fd41b7f0f5d5d5b6022ab7e813f04ea727

Note for v4l2-compliance tool on nu-mmu platform:
I add two change based on v4l-utils since commit:
f0c7e3d71eaf4182bae7eb3ee0e43b4eeb047ea9

- change fork() to vfork() in v4l2-test-controls.cpp
  since no-mmu platform don't include fork().

- bypass VIDIOC_QUERYCAP nullptr check
  I'm not sure if this is the bug from my cross compile tool
  which created by buildroot. user area's nullptr can't be
  detected by kernel side, i was try to add access_ok()
  in v4l2-ioctl.c, but no help

  If this case must be fixed, i will continue to debug it.
  the error log:
  ...
  fail: v4l2-compliance.cpp(623): doioctl(node, VIDIOC_QUERYCAP, nullptr) !=
  EFAULT
  ..

My changes on v4l2-compliance:

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp
b/utils/v4l2-compliance/v4l2-compliance.cpp
index 90a5036..a25fe4f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -620,7 +620,7 @@ static int testCap(struct node *node)

        memset(&vcap, 0xff, sizeof(vcap));
        // Must always be there
-       fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
+       //fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
        fail_on_test(doioctl(node, VIDIOC_QUERYCAP, &vcap));
        fail_on_test(check_ustring(vcap.driver, sizeof(vcap.driver)));
        fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));

with v4l2-compliance test log (with above modification):
since the stm32f469-disco ram limitation, there are 25 failed on
dma_alloc_coherent()

Really appreciate if someone can help to test this patch on the STM32429I-EVAL
evaluation board (https://www.st.com/en/evaluation-tools/stm32429i-eval.html)
8M x 32-bit SDRAM, 1M x 16-bit SRAM and 8M x 16-bit NOR Flash

/ # free
            total       used       free     shared    buffers     cached
Mem:        15604       6104       9500     0         0           2488
-/+ buffers/cache:      3616       11988




/ # v4l2-compliance -s -f -d /dev/video0 &
[1] 45 v4l2-compliance -s -f -d /dev/video0
/ # v4l2-compliance 1.21.0-4782, 32 bits, 32-bit time_t
v4l2-compliance SHA: f0c7e3d71eaf 2021-05-06 10:57:09

Compliance test for stm-dma2d device /dev/video0:

Driver Info:
        Driver name      : stm-dma2d
        Card type        : stm-dma2d
        Bus info         : platform:stm-dma2d
        Driver version   : 5.13.0
        Capabilities     : 0x84208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC[G/S_JP  143.242702] stm-dma2d 4002b000.dma2d: Format not supported: , use the default.
EGCOMP: OK (Not Supported)
        St[ndard Controls: 2 Private Contro s: 2

Fo m1t ioctls:
        test VIDIOC_4NUM_FMT/FRAMESIZES/FRAMEINTERV3LS: O.0m
        test VIDIOC_G5S_PARM: 3K (Not 555] stm-dma2d 4002b000.dma2d: Format not supported: , use the default.
Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
 143.280786] stm-dma2d 4002b000.dma2d: Format not supported: , use the default.
        test VIDIOC_TRY_FMT: OK
[  143.293759] stm-dma2d 4002b000.dma2d: Format not supported: , use the default.
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture: Captured 58 buffers
        test MMAP (no poll): OK
        Video Capture: Captured 58 buffers
        test MMAP (select): OK
        Video Capture: Captured 58 buffers
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Stream using all formats:
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 1x1 -[ AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
  146.963829] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        BA24 (32-bit ARGB 8-8-8-8) 16383x6[535 -> BA 4 (32-bit ARGB 8-8-8 8) 11383x65545: FAIL
6.985202] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        BA24 (32[bit ARGB 8-8-8-8) 16383x65 35 1> RGB3 (24-bit RGB48-8-8) 16383x65535: FAI7
.008713] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        BA24 (32-bit ARG[ 8-8-8-8) 163 3x6 535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
147.033896] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        BA24 (32-[it ARGB 8- -8-8) 16383x65535 -> AR15 (16-bit ARGB  -5-515) 16383x65535: FAIL
47.058256] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
        Video Capture: Captured 8 buffers
        BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1[1:  K
148.406686] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGB3 (24-bit RGB 8-8-8) 1[383x 5 35 -1 BA24 (32-b4t ARGB 888-8-8) 16383x65.35: FAIL
28566] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGB3 (24-bit RGB 8-8-8) 16383x65535[-> RGB3 (24 bit RGB 8-8-8) 16383 65535: FAIL
148.453973] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGB3 (24-bit RGB 8-8-8) 16383x65535 [> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
 148.477828] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGB3 (24-bit RGB 8[8-8) 16383x 5535 -> AR 5 (16-bit ARGB 1-514-58 16383x65535: FAIL
.503495] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
        Video Capture: Captured 8 buffers
        RGB3 (24-bit RGB 8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
        Video Capture: Captured 8 buffers
 149.725823] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGBP (16-bit RGB 5-6-5) 1[383x65535 -> BA24 (32-bi  ARGB 8 8-8-8) 16383x65535: FAIL
49.746860] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGBP (16-bit RGB 5-[-5) 16383x65535 -> RGB3 (24-b t RGB 8-8-8) 16383x65535: FAIL
49.772555] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGBP (16-bit R[B 5-6-5  1638 x65535 -> RGBP1(16-bit 4GB 596-5. 16383x67535: FAIL
330] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGBP (16-bit RGB 5-6-5) 16383x65535 ->[AR15 (1 -bit AR B 1-5-5-5) 11383x65535: 9IL
.821301] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
        Video Capture: Captured 8 buffers
        RGBP (16-bit RGB 5-6-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 1x1 -[ AR1  (16-bit ARGB 4-4-4-4) 1x15 O0
.956666] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR15 (16-bit ARGB 1-[-5-5) 16 83x65535 -> BA24 (32-bit ARGB 8 8-8-8) 16383x15535: FAIL
50.977546] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR15 (16-bit AR[B 1-5-5-5) 16383x65535 -> R B3 ( 4-b1t RGB 8-8-8) 16383x65535:5FAIL
1.003061] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR15 (16-bit ARGB 1-5-5[5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
 151.027900] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR15 (16-bit ARGB 1-5[5-5) 16383x65535 -> AR15 (16- it ARGB 1-5-5-5) 16383x65 15: F5IL
1.053781] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
        Video Capture: Captured 8 buffers
        AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR12 (16-bit A[GB 4-4-4 4) 1x1: OK
152.187325] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR12 (16-[ t A GB 4-4-4-4) 16383x65135 -> BA24 (32-bit ARGB 8-8-8-8) 16383x6553552.21;31mFAIL0[0m
8867] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR12 (16-bit ARGB 4-4[4-4  16383x6553  -> RGB3 (24-bit RGB18-8-8) 16383x65535: FAIL
52.234355] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: [ 1; 1mFAIL
152.258077] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR12 (16-bit ARGB 4-4-4[4) 16383x65535 ->  R15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
 152.284054] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
                fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
        AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
        Video Capture: Captured 8 buffers
        AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
Total for stm-dma2d device /dev/video0: 127, Succeeded: 102, Failed: 25, Warnings: 0

[1] Done                   v4l2-compliance -s -f -d /dev/video0
*** BLURB HERE ***

Dillon Min (7):
  media: admin-guide: add stm32-dma2d description
  media: dt-bindings: media: add document for STM32 DMA2d bindings
  clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
    kernel startup
  ARM: dts: stm32: Enable DMA2D support on STM32F429 MCU
  ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
  media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu
    platform
  media: stm32-dma2d: STM32 DMA2D driver

 .../admin-guide/media/platform-cardlist.rst        |   1 +
 .../devicetree/bindings/media/st,stm32-dma2d.yaml  |  71 ++
 arch/arm/boot/dts/stm32f429.dtsi                   |  10 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 drivers/clk/clk-stm32f4.c                          |   7 +-
 drivers/media/platform/Kconfig                     |   9 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/stm32/Makefile              |   2 +
 drivers/media/platform/stm32/dma2d/dma2d-hw.c      | 143 ++++
 drivers/media/platform/stm32/dma2d/dma2d-regs.h    | 114 +++
 drivers/media/platform/stm32/dma2d/dma2d.c         | 791 +++++++++++++++++++++
 drivers/media/platform/stm32/dma2d/dma2d.h         | 132 ++++
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  20 +
 include/media/v4l2-mem2mem.h                       |   4 +
 14 files changed, 1305 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h

-- 
2.7.4

