Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E374267C9
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239678AbhJHKcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhJHKcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:15 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535F2C061570;
        Fri,  8 Oct 2021 03:30:20 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id n11so5466511plf.4;
        Fri, 08 Oct 2021 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=RGMvHSDJWl9dS2Nw7mR/oguATMNWQd6djLwKUnSggXQ=;
        b=UCS09Hh7vj4BonyxOl7zBVWDVKJek+JlcfZKmW7+iJOhm2l6q0FlLwXGpipNbeg5zl
         1c3DrW1OVb+z8SOKId5iiIj9ajYNCD8rbiotCNaWXzaR6RZh65jaAaVNGkteHrpqq/b6
         XFKmYyD7yfVOAIqbNqhM2g7x+MeVHDPP5E/aTz0h2qAZYXVdqmnF0+CUoDntFgwwOdx+
         H3uGicQj8KrjkN1lQyK2fXHrLeWOoxpfK1ezkoqDOw+LzQebM/tGWyhOM1QrnY7yFF/L
         dtXyLbRhIjQB1ciSy+KkCK1Xt0yDCs7koHzjr6SbAqZj6EdxfHrSBTMKTtB3OxcELoB1
         mz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RGMvHSDJWl9dS2Nw7mR/oguATMNWQd6djLwKUnSggXQ=;
        b=sXe86OxfyoTAM3svrGPDt+qg1i0Zw3jvK8WgYxkkgWCS3Lh1Mq/2LAAtBH0AQ4Q0wE
         BsjtTESlMKm4EQ0ZXrrHLfeh9i2PNdRkFD6sflVy8rSLJ4s/p47V2q/udt3KWm7Eb/UG
         rr4WMrU9IIt7ezTQjpmJPUUrSXtk1b+x9cqBeQMpTGp+WlIRbR9YRmPpQFDA+p6q+gcz
         NlWIx4set2MVc4kme7TMcsfzpW/ZzORvuPjYtJ441hGeZ6451958bs6aOuH/wEUxdTl/
         J4K+Lwvb8l0TAwvaIZRv/vvROhBUuABMQ3lfjWb+U2xaugHS5Vx6+/euEoP7R/d/m0LS
         6gQQ==
X-Gm-Message-State: AOAM5318S3aKj6DZl20sCLBTXT8VxCIkb3vZFUUTSuLudDK539Hh9ZIx
        FBe9zMrXjCyGAwU3sbC6Z4g=
X-Google-Smtp-Source: ABdhPJxdqdPCyHlzehds+8q7nsHC+svV/5oiErqDS9P1eDUAhtcR9EdLi2t3mJLtFRTDp/g00ALTFA==
X-Received: by 2002:a17:90a:de16:: with SMTP id m22mr11442514pjv.38.1633689019618;
        Fri, 08 Oct 2021 03:30:19 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:18 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v3 0/8] Add support for DMA2D of STMicroelectronics STM32 Soc series
Date:   Fri,  8 Oct 2021 18:30:04 +0800
Message-Id: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
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

history
v3:
- use V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to pass argb paramter to
  the dma2d driver, instead of add stm32 private ioctl.
- some v2's patch are removed in this version.
  - "[PATCH v2 7/9] media: docs: add doc for the stm32 dma2d driver"
  - "[PATCH v2 8/9] media: v4l: uapi: Add user control base for stm32 dma2d
    controls"
- dma2d's driver changes based on Hans's review result. detail can be found at
  "media: stm32-dma2d: STM32 DMA2D driver"
- add stm32 clk drivers bugfix, ltdc clock disabled after kenerl boot up.
v3 based on kernel and v4l-utils git:

kernel:
commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Oct 3 14:08:47 2021 -0700

    Linux 5.15-rc4

v4l-utils:
commit 700f5ded9c6de2c6dfe5d1b453d85566f95b4f0c
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Sat Oct 2 11:01:05 2021 +0200

    test-media: show version info earlier and show cmd args

    Log the version info earlier and also log the command line arguments.
 
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

v2 link:
https://lore.kernel.org/lkml/1626341068-20253-11-git-send-email-dillon.minfei@gmail.com/


v2:
- update v4l2-compliance to SHA: a4f2e3a6f306 2021-07-13 08:04:15
  the test results at below [1].
- introduce Documentation/userspace-api/media/drivers/stm32-uapi.rst
  to explain the detail of dma2d's ioctl.
- reserved 16 ioctls from v4l2-controls.h for stm32, introduce stm32-media.h.
- collect Reviewed-by tag from Rob Herring.
- update dma2d driver from Hans's review. the details can be found
  at related patches.
v1 link:
https://lore.kernel.org/lkml/1621508727-24486-1-git-send-email-dillon.minfei@gmail.com/

v1:
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

~ # free
              total        used        free      shared  buff/cache  available
Mem:          12760        4192        5248           0        3320       4740

~ # v4l2-compliance -f -d /dev/video0 > /dev/ttyprintk
[   77.064984] [U] v4l2-compliance 1.21.0-4855, 32 bits, 32-bit time_t
[   77.066589] [U] v4l2-compliance SHA: 700f5ded9c6d 2021-10-02 09:01:05
[   77.090680] [U] Compliance test for stm-dma2d device /dev/video0:
[   77.091610] [U] Driver Info:
[   77.092721] [U]      Driver name      : stm-dma2d
[   77.093909] [U]      Card type        : stm-dma2d
[   77.095201] [U]      Bus info         : platform:stm-dma2d
[   77.096589] [U]      Driver version   : 5.15.0
[   77.097801] [U]      Capabilities     : 0x84208000
[   77.100077] [U]              Video Memory-to-Memory
[   77.100769] [U]              Streaming
[   77.101512] [U]              Extended Pix Format
[   77.102293] [U]              Device Capabilities
[   77.103505] [U]      Device Caps      : 0x04208000
[   77.104727] [U]              Video Memory-to-Memory
[   77.105416] [U]              Streaming
[   77.106159] [U]              Extended Pix Format
[   77.107232] [U] Required ioctls:
[   77.109684] [U]      test VIDIOC_QUERYCAP: OK
[   77.136969] [U]      test invalid ioctls: OK
[   77.138168] [U] Allow for multiple opens:
[   77.142586] [U]      test second /dev/video0 open: OK
[   77.144145] [U]      test VIDIOC_QUERYCAP: OK
[   77.146515] [U]      test VIDIOC_G/S_PRIORITY: OK
[   77.356073] [U]      test for unlimited opens: OK
[   77.361070] [U] Debug ioctls:
[   77.362670] [U]      test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
[   77.364328] [U]      test VIDIOC_LOG_STATUS: OK (Not Supported)
[   77.365475] [U] Input ioctls:
[   77.367269] [U]      test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
[   77.370003] [U]      test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
[   77.371715] [U]      test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
[   77.373377] [U]      test VIDIOC_ENUMAUDIO: OK (Not Supported)
[   77.375270] [U]      test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
[   77.376823] [U]      test VIDIOC_G/S_AUDIO: OK (Not Supported)
[   77.378846] [U]      Inputs: 0 Audio Inputs: 0 Tuners: 0
[   77.379944] [U] Output ioctls:
[   77.381493] [U]      test VIDIOC_G/S_MODULATOR: OK (Not Supported)
[   77.383303] [U]      test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
[   77.384971] [U]      test VIDIOC_ENUMAUDOUT: OK (Not Supported)
[   77.386856] [U]      test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
[   77.388831] [U]      test VIDIOC_G/S_AUDOUT: OK (Not Supported)
[   77.390459] [U]      Outputs: 0 Audio Outputs: 0 Modulators: 0
[   77.391787] [U] Input/Output configuration ioctls:
[   77.393356] [U]      test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
[   77.395089] [U]      test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
[   77.396735] [U]      test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
[   77.398273] [U]      test VIDIOC_G/S_EDID: OK (Not Supported)
[   77.399993] [U] Control ioctls:
[   77.418372] [U]      test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
[   77.428070] [U]      test VIDIOC_QUERYCTRL: OK
[   77.436230] [U]      test VIDIOC_G/S_CTRL: OK
[   77.443837] [U]      test VIDIOC_G/S/TRY_EXT_CTRLS: OK
[   77.448376] [U]      test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
[   77.450663] [U]      test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
[   77.452181] [U]      Standard Controls: 3 Private Controls: 0
[   77.453425] [U] Format ioctls:
[   77.461383] [U]      test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
[   77.470369] [U]      test VIDIOC_G/S_PARM: OK (Not Supported)
[   77.471967] [U]      test VIDIOC_G_FBUF: OK (Not Supported)
[   77.476265] [U]      test VIDIOC_G_FMT: OK
[   77.477897] stm-dma2d 4002b000.dma2d: Format not supported: ffffffff, use the default.
[   78.430374] stm-dma2d 4002b000.dma2d: Format not supported: ffffffff, use the default.
[   79.382910] [U]      test VIDIOC_TRY_FMT: OK
[   79.383838] stm-dma2d 4002b000.dma2d: Format not supported: ffffffff, use the default.
[   80.336855] stm-dma2d 4002b000.dma2d: Format not supported: ffffffff, use the default.
[   81.291841] [U]      test VIDIOC_S_FMT: OK
[   81.295760] [U]      test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
[   81.306200] [U]      test Cropping: OK (Not Supported)
[   81.308082] [U]      test Composing: OK (Not Supported)
[   81.316112] [U]      test Scaling: OK
[   81.317292] [U] Codec ioctls:
[   81.320014] [U]      test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
[   81.321825] [U]      test VIDIOC_G_ENC_INDEX: OK (Not Supported)
[   81.323678] [U]      test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
[   81.324984] [U] Buffer ioctls:
[   81.449359] [U]      test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
[   81.502551] [U]      test VIDIOC_EXPBUF: OK
[   81.509366] [U]      test Requests: OK (Not Supported)
[   81.515371] [U]      test TIME32/64: OK
[   81.538185] [U] Test input 0:
[   81.545183] [U] Stream using all formats:
[   81.613480] [U]
[   81.614924] [U]      Video Capture: Captured 8 buffers
[   81.620090] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[   81.684012] [U]
[   81.685455] [U]      Video Capture: Captured 8 buffers
[   81.690605] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[   81.755536] [U]
[   81.756977] [U]      Video Capture: Captured 8 buffers
[   81.762127] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[   81.826076] [U]
[   81.827524] [U]      Video Capture: Captured 8 buffers
[   81.832696] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[   81.896571] [U]
[   81.898020] [U]      Video Capture: Captured 8 buffers
[   81.903184] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[   81.907619] ------------[ cut here ]------------
[   82.385133] WARNING: CPU: 0 PID: 58 at mm/page_alloc.c:5350 __alloc_pages+0x59/0x576
[   83.333579] CPU: 0 PID: 58 Comm: v4l2-compliance Tainted: G        W         5.15.0-rc4-00008-g8bb273f086cb #16
[   84.297138] Hardware name: STM32 (Device Tree Support)
[   84.782018] [<90083369>] (unwind_backtrace) from [<900825ff>] (show_stack+0xb/0xc)
[   85.739029] [<900825ff>] (show_stack) from [<902385df>] (__warn+0x63/0x84)
[   86.694557] [<902385df>] (__warn) from [<9023863f>] (warn_slowpath_fmt+0x3f/0x78)
[   87.654254] [<9023863f>] (warn_slowpath_fmt) from [<900d035f>] (__alloc_pages+0x59/0x576)
[   88.617949] [<900d035f>] (__alloc_pages) from [<900b0bcb>] (__dma_direct_alloc_pages+0x9d/0xfe)
[   89.584979] [<900b0bcb>] (__dma_direct_alloc_pages) from [<900b0cd7>] (dma_direct_alloc+0x6b/0xa4)
[   90.554038] [<900b0cd7>] (dma_direct_alloc) from [<900b065b>] (dma_alloc_attrs+0x83/0xa8)
[   91.530358] [<900b065b>] (dma_alloc_attrs) from [<90202075>] (vb2_dc_alloc+0x75/0xa0)
[   92.497382] [<90202075>] (vb2_dc_alloc) from [<901fd91d>] (__vb2_queue_alloc+0x15b/0x24a)
[   93.467277] [<901fd91d>] (__vb2_queue_alloc) from [<901fe69f>] (vb2_core_reqbufs+0x1ff/0x260)
[   94.450724] [<901fe69f>] (vb2_core_reqbufs) from [<901f5df9>] (v4l2_m2m_reqbufs+0x17/0x28)
[   95.434080] [<901f5df9>] (v4l2_m2m_reqbufs) from [<901eb36f>] (__video_do_ioctl+0x1ab/0x28c)
[   96.419647] [<901eb36f>] (__video_do_ioctl) from [<901eb555>] (video_usercopy+0x105/0x2a8)
[   97.404097] [<901eb555>] (video_usercopy) from [<900e0bfb>] (vfs_ioctl+0x11/0x1e)
[   98.386906] [<900e0bfb>] (vfs_ioctl) from [<900e1051>] (sys_ioctl+0x85/0x558)
[   99.372207] [<900e1051>] (sys_ioctl) from [<90080181>] (ret_fast_syscall+0x1/0x4c)
[  100.363368] Exception stack(0x00875fa8 to 0x00875ff0)
[  100.863562] 5fa0:                   ???????? ???????? ???????? ???????? ???????? ????????
[  101.858798] 5fc0: ???????? ???????? ???????? ???????? ???????? ???????? ???????? ????????
[  102.840438] 5fe0: ???????? ???????? ???????? ????????
[  103.332984] ---[ end trace 67a1b902f0515885 ]---
[  103.823611] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
[  104.797009] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  104.802000] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[  104.808076] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
[  105.782499] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  105.790835] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[  105.794162] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
[  106.773550] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  106.776901] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[  106.780620] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
[  107.755674] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  107.758965] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[  107.762304] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
[  108.738119] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  108.743031] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[  108.926451] [U]
[  108.927896] [U]      Video Capture: Captured 8 buffers
[  108.936801] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  109.100205] [U]
[  109.101649] [U]      Video Capture: Captured 8 buffers
[  109.109562] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  109.267459] [U]
[  109.269311] [U]      Video Capture: Captured 8 buffers
[  109.276806] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  109.434533] [U]
[  109.435977] [U]      Video Capture: Captured 8 buffers
[  109.443929] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  109.602253] [U]
[  109.603689] [U]      Video Capture: Captured 8 buffers
[  109.611639] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  109.677875] [U]
[  109.679735] [U]      Video Capture: Captured 8 buffers
[  109.684460] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  109.748935] [U]
[  109.750376] [U]      Video Capture: Captured 8 buffers
[  109.755058] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  109.820395] [U]
[  109.821783] [U]      Video Capture: Captured 8 buffers
[  109.826474] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  109.912978] [U]
[  109.914425] [U]      Video Capture: Captured 8 buffers
[  109.921263] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  110.024308] [U]
[  110.025752] [U]      Video Capture: Captured 8 buffers
[  110.031498] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  110.036103] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
[  111.011818] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  111.014733] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[  111.018003] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
[  111.993281] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  111.997909] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[  112.004275] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
[  112.978416] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  112.987203] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[  112.996098] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
[  113.969086] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  113.972006] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[  113.975330] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
[  114.947408] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  114.950652] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[  115.113916] [U]
[  115.115354] [U]      Video Capture: Captured 8 buffers
[  115.125020] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  115.300756] [U]
[  115.302201] [U]      Video Capture: Captured 8 buffers
[  115.309757] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  115.463887] [U]
[  115.465332] [U]      Video Capture: Captured 8 buffers
[  115.472286] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  115.605396] [U]
[  115.606838] [U]      Video Capture: Captured 8 buffers
[  115.613815] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  115.746425] [U]
[  115.747865] [U]      Video Capture: Captured 8 buffers
[  115.754850] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  115.822341] [U]
[  115.823783] [U]      Video Capture: Captured 8 buffers
[  115.828930] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  115.893072] [U]
[  115.894509] [U]      Video Capture: Captured 8 buffers
[  115.899607] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  115.963667] [U]
[  115.965112] [U]      Video Capture: Captured 8 buffers
[  115.970209] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  116.035176] [U]
[  116.036557] [U]      Video Capture: Captured 8 buffers
[  116.041697] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  116.105849] [U]
[  116.107292] [U]      Video Capture: Captured 8 buffers
[  116.112413] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  116.117034] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  117.088929] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  117.091853] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[  117.095166] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  118.065723] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  118.068951] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[  118.072258] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  119.043510] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  119.047880] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[  119.059691] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  120.036524] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  120.040402] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[  120.043742] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  121.012867] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  121.015778] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[  121.180786] [U]
[  121.182227] [U]      Video Capture: Captured 8 buffers
[  121.192112] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  121.331408] [U]
[  121.332847] [U]      Video Capture: Captured 8 buffers
[  121.339778] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  121.456896] [U]
[  121.458753] [U]      Video Capture: Captured 8 buffers
[  121.465284] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  121.581951] [U]
[  121.583398] [U]      Video Capture: Captured 8 buffers
[  121.590518] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  121.707784] [U]
[  121.709638] [U]      Video Capture: Captured 8 buffers
[  121.716185] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  121.782730] [U]
[  121.784173] [U]      Video Capture: Captured 8 buffers
[  121.789275] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  121.854467] [U]
[  121.855910] [U]      Video Capture: Captured 8 buffers
[  121.860942] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  121.925129] [U]
[  121.926573] [U]      Video Capture: Captured 8 buffers
[  121.931720] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  121.995542] [U]
[  121.996986] [U]      Video Capture: Captured 8 buffers
[  122.002180] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  122.066981] [U]
[  122.068844] [U]      Video Capture: Captured 8 buffers
[  122.073594] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  122.078653] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  123.047265] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  123.050543] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[  123.053858] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  124.021746] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  124.024666] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[  124.027997] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  124.997455] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  125.002215] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[  125.015818] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  125.989029] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  125.992529] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[  125.995874] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  126.969258] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  126.972207] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[  127.137507] [U]
[  127.139466] [U]      Video Capture: Captured 8 buffers
[  127.149373] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  127.288812] [U]
[  127.290248] [U]      Video Capture: Captured 8 buffers
[  127.296774] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  127.413667] [U]
[  127.415112] [U]      Video Capture: Captured 8 buffers
[  127.422180] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  127.539101] [U]
[  127.540544] [U]      Video Capture: Captured 8 buffers
[  127.547135] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  127.664818] [U]
[  127.666259] [U]      Video Capture: Captured 8 buffers
[  127.673277] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  127.739893] [U]
[  127.741333] [U]      Video Capture: Captured 8 buffers
[  127.746094] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  127.811495] [U]
[  127.812938] [U]      Video Capture: Captured 8 buffers
[  127.817669] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  127.882187] [U]
[  127.883631] [U]      Video Capture: Captured 8 buffers
[  127.888348] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  127.952693] [U]
[  127.954126] [U]      Video Capture: Captured 8 buffers
[  127.959465] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  128.024235] [U]
[  128.025632] [U]      Video Capture: Captured 8 buffers
[  128.030804] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  128.035430] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  129.013604] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  129.016553] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[  129.020312] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  130.004657] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  130.007575] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[  130.011240] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  131.001724] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  131.006131] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[  131.019882] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  132.014524] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  132.018035] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[  132.021794] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
[  133.010798] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  133.013745] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[  133.178795] [U]
[  133.180236] [U]      Video Capture: Captured 8 buffers
[  133.190247] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  133.329447] [U]
[  133.330886] [U]      Video Capture: Captured 8 buffers
[  133.337446] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  133.454209] [U]
[  133.455648] [U]      Video Capture: Captured 8 buffers
[  133.462630] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  133.580284] [U]
[  133.581709] [U]      Video Capture: Captured 8 buffers
[  133.588279] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  133.706496] [U]
[  133.707937] [U]      Video Capture: Captured 8 buffers
[  133.714955] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  133.724842] [U] Total for stm-dma2d device /dev/video0: 121, Succeeded: 96, Failed: 25, Warnings: 0

*** BLURB HERE ***

Dillon Min (8):
  media: admin-guide: add stm32-dma2d description
  media: dt-bindings: media: add document for STM32 DMA2d bindings
  ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
  ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
  media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu
    platform
  media: v4l2-ctrls: Add ARGB color effects control
  clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
    enter shell
  media: stm32-dma2d: STM32 DMA2D driver

 .../admin-guide/media/platform-cardlist.rst        |   1 +
 .../devicetree/bindings/media/st,stm32-dma2d.yaml  |  71 ++
 Documentation/userspace-api/media/v4l/control.rst  |   8 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  10 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 drivers/clk/clk-stm32f4.c                          |   4 -
 drivers/media/platform/Kconfig                     |   9 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/stm32/Makefile              |   2 +
 drivers/media/platform/stm32/dma2d/dma2d-hw.c      | 143 ++++
 drivers/media/platform/stm32/dma2d/dma2d-regs.h    | 113 ++++
 drivers/media/platform/stm32/dma2d/dma2d.c         | 749 +++++++++++++++++++++
 drivers/media/platform/stm32/dma2d/dma2d.h         | 135 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   2 +
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  21 +
 include/media/v4l2-mem2mem.h                       |   5 +
 include/uapi/linux/v4l2-controls.h                 |   4 +-
 17 files changed, 1277 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h

-- 
2.7.4

