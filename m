Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712E943ACB9
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhJZHNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhJZHNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:13:53 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E41C061745;
        Tue, 26 Oct 2021 00:11:30 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so1443720pji.5;
        Tue, 26 Oct 2021 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=SUMKtf85bop0hSiOLLsI+mCSnL6ft0JO0Sq8dEQ+/6E=;
        b=b7xUaUbPG76rZ62ZAUczT7m4H15qSOCO1Sudhvk/uM0kHcKveZv7+LRllmRs7xTxwD
         TuCC5BqQpe1L4SJXQaDr0FN+Ly4D8QDQao1OD0/mJwdGYKzB29lM2TdTTDbdW55ug309
         +UX25R18wPRSo5ZkqEfuqfh934eCpVSy7C4phLp48nxDTaV0qVXbm782CSCb0oCLYNmg
         MmJoCG3Vhjdt47FoOlYo3gHzYyJ/uCzSmKTnQ3AE92OHZ9DW1r4zJMk/goMU84N0ejiX
         GazOq+n7ve/OV34cF9kIpHHko8+mJrNO2rUj/7bsmE6OLi/3IiNi6kqqLWuzgYPKjke/
         uZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SUMKtf85bop0hSiOLLsI+mCSnL6ft0JO0Sq8dEQ+/6E=;
        b=ZsVQiOPAjy5OcUiGSm7aZofW0gXPmtWVgkueJrxjmANk4ML+XQHlu+bxOPCnrXHTqp
         bjGNuLrZ2jV48VPZoIJ4+VpP0Ky8jpBKEptpoGdspQX0mo8xfwVTQJK+lo84neJqnpN6
         9u5Idb/qxK4PS7uvVWNj4qIMiRd8p4mSgwInO74d4vFny64VNiuWD3hK/zDCUz6LrCGq
         4UNL7F8yVy60qzQF+aSPGGc8l6CNt1EciGeTCCg0Ute/mluepjlPZ2deU6GW76JDGCUc
         L0d4VRozvvpsQ/RShJNL3aDjf79y5bnkzbisKNn11fcNi5K0iS1sonhaHbnw93r9jjsv
         FBJA==
X-Gm-Message-State: AOAM530ZJEK0EV9UfX1ZAzp4eqNb7a/vFyZCgYruEDuuG3h8lG0j1kMT
        CZ4mMOPtiyXCmGoh8SNdYn4=
X-Google-Smtp-Source: ABdhPJzXtP+5ymqitlK1CB3Ok7S5IZGmopNCml93QEbF3aP0eyA89NtpOjYdVaSocs9uGpmLIWTSWg==
X-Received: by 2002:a17:90b:4f48:: with SMTP id pj8mr27072320pjb.246.1635232289607;
        Tue, 26 Oct 2021 00:11:29 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:29 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
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
        devicetree@vger.kernel.org, lkp@intel.com, kbuild-all@lists.01.org,
        llvm@lists.linux.dev
Subject: [PATCH v7 00/10] Add support for DMA2D of STMicroelectronics STM32 Soc series
Date:   Tue, 26 Oct 2021 15:11:12 +0800
Message-Id: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset introduces a basic support for DMA2D Interface
of STMicroelectronics STM32 SoC series.

This first basic support implements R2M, M2M, M2M_PFC
M2M_BLEND support will be added later on.

This has been tested on STM32469-DISCO board.

history

v7:
- fix compile test reported by lkp@intel.com, thanks.
- collect acked-by, reviewed-by from Gabriel, Patrice.

v6 link:
https://lore.kernel.org/lkml/1634633003-18132-1-git-send-email-dillon.minfei@gmail.com/

v6:
- use 2592x2592 instead of 0x3fff, 0xffff. [PATCH v6 10/10]
- add space in '(V4L2_CID_BASE+43)' to avoid checkpatch warrnings. [PATCH v6 08/10]

v5 link:
https://lore.kernel.org/lkml/1634533488-25334-1-git-send-email-dillon.minfei@gmail.com/

v5:
- rebase to media_tree https://git.linuxtv.org/media_tree.git/
- remove unused log from dma2d driver to avoid spam kernel log.
- fix 0xFFFFFF to 0xffffff, 2^24 to 2^24 -1, etc.
- introduce patch "media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting"
  to add V4L2_CID_COLORFX_CBCR entry.
- thanks to Hans's patch, open nullptr check in v4l2-compliance, update new
  test result. thanks.
  https://lore.kernel.org/linux-media/3acd9ee4-5a58-6ed4-17fe-61596a5252b8@xs4all.nl/

v4 link:
https://lore.kernel.org/lkml/bc8e1cd1-0013-9062-88b6-fddca535919f@xs4all.nl/

v4:
- replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
  V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
  in current. thanks Hans.
v3 link:
https://lore.kernel.org/lkml/1633689012-14492-1-git-send-email-dillon.minfei@gmail.com/

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

with v4l2-compliance test log (with above modification):
since the stm32f469-disco ram limitation, there are 25 failed on
dma_alloc_coherent()

Really appreciate if someone can help to test this patch on the STM32429I-EVAL
evaluation board (https://www.st.com/en/evaluation-tools/stm32429i-eval.html)
8M x 32-bit SDRAM, 1M x 16-bit SRAM and 8M x 16-bit NOR Flash

~ # free
              total        used        free      shared  buff/cache   available
Mem:          15648        4076        8260           0        3312        7632

~ # v4l2-compliance -f -d /dev/video0 > /dev/ttyprintk
[  234.919026] [U] v4l2-compliance 1.21.0-4855, 32 bits, 32-bit time_t
[  235.880625] [U] v4l2-compliance SHA: 700f5ded9c6d 2021-10-02 09:01:05
[  236.877059] [U] Compliance test for stm-dma2d device /dev/video0:
[  237.835965] [U] Driver Info:
[  238.311502] [U] 	Driver name      : stm-dma2d
[  238.787381] [U] 	Card type        : stm-dma2d
[  239.255574] [U] 	Bus info         : platform:stm-dma2d
[  239.722920] [U] 	Driver version   : 5.15.0
[  240.183388] [U] 	Capabilities     : 0x84208000
[  240.640809] [U] 		Video Memory-to-Memory
[  241.095669] [U] 		Streaming
[  241.540812] [U] 		Extended Pix Format
[  241.978288] [U] 		Device Capabilities
[  242.409891] [U] 	Device Caps      : 0x04208000
[  242.841150] [U] 		Video Memory-to-Memory
[  243.265246] [U] 		Streaming
[  243.680040] [U] 		Extended Pix Format
[  244.092896] [U] Required ioctls:
[  244.499208] [U] 	test VIDIOC_QUERYCAP: OK
[  244.943985] [U] 	test invalid ioctls: OK
[  245.346521] [U] Allow for multiple opens:
[  245.749312] [U] 	test second /dev/video0 open: OK
[  246.526863] [U] 	test VIDIOC_QUERYCAP: OK
[  246.929589] [U] 	test VIDIOC_G/S_PRIORITY: OK
[  247.548185] [U] 	test for unlimited opens: OK
[  247.936192] [U] Debug ioctls:
[  248.311265] [U] 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
[  249.058547] [U] 	test VIDIOC_LOG_STATUS: OK (Not Supported)
[  249.802868] [U] Input ioctls:
[  250.173701] [U] 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
[  250.914653] [U] 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
[  251.657517] [U] 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
[  252.408231] [U] 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
[  253.166559] [U] 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
[  253.933560] [U] 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
[  254.695551] [U] 	Inputs: 0 Audio Inputs: 0 Tuners: 0
[  255.082805] [U] Output ioctls:
[  255.462189] [U] 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
[  256.218699] [U] 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
[  256.997586] [U] 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
[  257.796012] [U] 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
[  258.609978] [U] 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
[  259.453435] [U] 	Outputs: 0 Audio Outputs: 0 Modulators: 0
[  260.303571] [U] Input/Output configuration ioctls:
[  260.741454] [U] 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
[  261.618607] [U] 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
[  262.517280] [U] 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
[  263.427620] [U] 	test VIDIOC_G/S_EDID: OK (Not Supported)
[  264.344630] [U] Control ioctls:
[  264.833262] [U] 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
[  265.763394] [U] 	test VIDIOC_QUERYCTRL: OK
[  266.247635] [U] 	test VIDIOC_G/S_CTRL: OK
[  266.730244] [U] 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
[  267.651495] [U] 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
[  268.573048] [U] 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
[  269.503304] [U] 	Standard Controls: 3 Private Controls: 0
[  269.976154] [U] Format ioctls:
[  270.458701] [U] 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
[  271.395051] [U] 	test VIDIOC_G/S_PARM: OK (Not Supported)
[  272.316304] [U] 	test VIDIOC_G_FBUF: OK (Not Supported)
[  273.242824] [U] 	test VIDIOC_G_FMT: OK
[  273.719213] [U] 	test VIDIOC_TRY_FMT: OK
[  274.187524] [U] 	test VIDIOC_S_FMT: OK
[  274.643930] [U] 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
[  275.547089] [U] 	test Cropping: OK (Not Supported)
[  276.446375] [U] 	test Composing: OK (Not Supported)
[  277.347458] [U] 	test Scaling: OK
[  277.800218] [U] Codec ioctls:
[  278.245926] [U] 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
[  279.140451] [U] 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
[  280.023765] [U] 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
[  280.910844] [U] Buffer ioctls:
[  281.466649] [U] 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
[  282.381634] [U] 	test VIDIOC_EXPBUF: OK
[  282.830946] [U] 	test Requests: OK (Not Supported)
[  283.698629] [U] 	test TIME32/64: OK
[  284.157170] [U] Test input 0:
[  284.594093] [U] Stream using all formats:
[  288.379647] [U] 	                                                  
[  289.111860] [U] 	Video Capture: Captured 8 buffers
[  289.487473] [U] 	BA24 (32-bit ARGB 8-8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  293.012687] [U] 	                                                  
[  293.629532] [U] 	Video Capture: Captured 8 buffers
[  293.947618] [U] 	BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  296.900762] [U] 	                                                  
[  297.387693] [U] 	Video Capture: Captured 8 buffers
[  297.643353] [U] 	BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  299.994539] [U] 	                                                  
[  300.426567] [U] 	Video Capture: Captured 8 buffers
[  300.669991] [U] 	BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  303.087504] [U] 	                                                  
[  303.519269] [U] 	Video Capture: Captured 8 buffers
[  303.757695] [U] 	BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  304.244993] stm-dma2d 4002b000.dma2d: dma alloc of size 26873856 failed
[  304.745438] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  305.257392] [U] 	BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> BA24 (32-bit ARGB 8-8-8-8) 2592x2592: FAIL
[  305.781175] stm-dma2d 4002b000.dma2d: dma alloc of size 26873856 failed
[  306.321901] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  306.902217] [U] 	BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> RGB3 (24-bit RGB 8-8-8) 2592x2592: FAIL
[  307.528929] stm-dma2d 4002b000.dma2d: dma alloc of size 26873856 failed
[  308.174441] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  308.848959] [U] 	BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> RGBP (16-bit RGB 5-6-5) 2592x2592: FAIL
[  309.535999] stm-dma2d 4002b000.dma2d: dma alloc of size 26873856 failed
[  310.217444] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  310.943592] [U] 	BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> AR15 (16-bit ARGB 1-5-5-5) 2592x2592: FAIL
[  311.713854] stm-dma2d 4002b000.dma2d: dma alloc of size 26873856 failed
[  312.508128] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  313.338010] [U] 	BA24 (32-bit ARGB 8-8-8-8) 2592x2592 -> AR12 (16-bit ARGB 4-4-4-4) 2592x2592: FAIL
[  317.675312] [U] 	                                                  
[  318.494207] [U] 	Video Capture: Captured 8 buffers
[  318.931776] [U] 	BA24 (32-bit ARGB 8-8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  323.087768] [U] 	                                                  
[  323.775244] [U] 	Video Capture: Captured 8 buffers
[  324.126855] [U] 	BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  327.479277] [U] 	                                                  
[  328.005695] [U] 	Video Capture: Captured 8 buffers
[  328.284117] [U] 	BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  330.830015] [U] 	                                                  
[  331.260303] [U] 	Video Capture: Captured 8 buffers
[  331.497654] [U] 	BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  334.011389] [U] 	                                                  
[  334.440311] [U] 	Video Capture: Captured 8 buffers
[  334.677829] [U] 	BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  337.086566] [U] 	                                                  
[  337.517015] [U] 	Video Capture: Captured 8 buffers
[  337.756281] [U] 	RGB3 (24-bit RGB 8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  340.148849] [U] 	                                                  
[  340.579169] [U] 	Video Capture: Captured 8 buffers
[  340.823597] [U] 	RGB3 (24-bit RGB 8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  343.230816] [U] 	                                                  
[  343.661231] [U] 	Video Capture: Captured 8 buffers
[  343.899455] [U] 	RGB3 (24-bit RGB 8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  346.276450] [U] 	                                                  
[  346.707406] [U] 	Video Capture: Captured 8 buffers
[  346.950489] [U] 	RGB3 (24-bit RGB 8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  349.363029] [U] 	                                                  
[  349.794791] [U] 	Video Capture: Captured 8 buffers
[  350.034303] [U] 	RGB3 (24-bit RGB 8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  350.526018] stm-dma2d 4002b000.dma2d: dma alloc of size 20156416 failed
[  351.023695] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  351.536683] [U] 	RGB3 (24-bit RGB 8-8-8) 2592x2592 -> BA24 (32-bit ARGB 8-8-8-8) 2592x2592: FAIL
[  352.060944] stm-dma2d 4002b000.dma2d: dma alloc of size 20156416 failed
[  352.603734] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  353.185847] [U] 	RGB3 (24-bit RGB 8-8-8) 2592x2592 -> RGB3 (24-bit RGB 8-8-8) 2592x2592: FAIL
[  353.814453] stm-dma2d 4002b000.dma2d: dma alloc of size 20156416 failed
[  354.463286] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  355.138479] [U] 	RGB3 (24-bit RGB 8-8-8) 2592x2592 -> RGBP (16-bit RGB 5-6-5) 2592x2592: FAIL
[  355.826797] stm-dma2d 4002b000.dma2d: dma alloc of size 20156416 failed
[  356.510828] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  357.237230] [U] 	RGB3 (24-bit RGB 8-8-8) 2592x2592 -> AR15 (16-bit ARGB 1-5-5-5) 2592x2592: FAIL
[  358.008304] stm-dma2d 4002b000.dma2d: dma alloc of size 20156416 failed
[  358.803816] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  359.630589] [U] 	RGB3 (24-bit RGB 8-8-8) 2592x2592 -> AR12 (16-bit ARGB 4-4-4-4) 2592x2592: FAIL
[  363.960327] [U] 	                                                  
[  364.781066] [U] 	Video Capture: Captured 8 buffers
[  365.214046] [U] 	RGB3 (24-bit RGB 8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  369.359436] [U] 	                                                  
[  370.047235] [U] 	Video Capture: Captured 8 buffers
[  370.411149] [U] 	RGB3 (24-bit RGB 8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  373.744081] [U] 	                                                  
[  374.268922] [U] 	Video Capture: Captured 8 buffers
[  374.538707] [U] 	RGB3 (24-bit RGB 8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  377.084393] [U] 	                                                  
[  377.514706] [U] 	Video Capture: Captured 8 buffers
[  377.759132] [U] 	RGB3 (24-bit RGB 8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  380.203358] [U] 	                                                  
[  380.637202] [U] 	Video Capture: Captured 8 buffers
[  380.872188] [U] 	RGB3 (24-bit RGB 8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  383.271589] [U] 	                                                  
[  383.700928] [U] 	Video Capture: Captured 8 buffers
[  383.943595] [U] 	RGBP (16-bit RGB 5-6-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  386.328863] [U] 	                                                  
[  386.764962] [U] 	Video Capture: Captured 8 buffers
[  386.999766] [U] 	RGBP (16-bit RGB 5-6-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  389.410754] [U] 	                                                  
[  389.843266] [U] 	Video Capture: Captured 8 buffers
[  390.087088] [U] 	RGBP (16-bit RGB 5-6-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  392.471763] [U] 	                                                  
[  392.905730] [U] 	Video Capture: Captured 8 buffers
[  393.146591] [U] 	RGBP (16-bit RGB 5-6-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  395.568817] [U] 	                                                  
[  396.000735] [U] 	Video Capture: Captured 8 buffers
[  396.239683] [U] 	RGBP (16-bit RGB 5-6-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  396.726035] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  397.228167] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  397.740467] [U] 	RGBP (16-bit RGB 5-6-5) 2592x2592 -> BA24 (32-bit ARGB 8-8-8-8) 2592x2592: FAIL
[  398.265046] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  398.806330] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  399.386895] [U] 	RGBP (16-bit RGB 5-6-5) 2592x2592 -> RGB3 (24-bit RGB 8-8-8) 2592x2592: FAIL
[  400.014307] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  400.661722] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  401.334815] [U] 	RGBP (16-bit RGB 5-6-5) 2592x2592 -> RGBP (16-bit RGB 5-6-5) 2592x2592: FAIL
[  402.022646] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  402.705189] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  403.429313] [U] 	RGBP (16-bit RGB 5-6-5) 2592x2592 -> AR15 (16-bit ARGB 1-5-5-5) 2592x2592: FAIL
[  404.199336] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  404.993926] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  405.824722] [U] 	RGBP (16-bit RGB 5-6-5) 2592x2592 -> AR12 (16-bit ARGB 4-4-4-4) 2592x2592: FAIL
[  410.123611] [U] 	                                                  
[  410.945529] [U] 	Video Capture: Captured 8 buffers
[  411.378867] [U] 	RGBP (16-bit RGB 5-6-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  415.488227] [U] 	                                                  
[  416.177766] [U] 	Video Capture: Captured 8 buffers
[  416.538441] [U] 	RGBP (16-bit RGB 5-6-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  419.826273] [U] 	                                                  
[  420.354543] [U] 	Video Capture: Captured 8 buffers
[  420.636913] [U] 	RGBP (16-bit RGB 5-6-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  423.163619] [U] 	                                                  
[  423.594915] [U] 	Video Capture: Captured 8 buffers
[  423.832290] [U] 	RGBP (16-bit RGB 5-6-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  426.311384] [U] 	                                                  
[  426.741478] [U] 	Video Capture: Captured 8 buffers
[  426.982107] [U] 	RGBP (16-bit RGB 5-6-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  429.371663] [U] 	                                                  
[  429.806431] [U] 	Video Capture: Captured 8 buffers
[  430.040867] [U] 	AR15 (16-bit ARGB 1-5-5-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  432.455072] [U] 	                                                  
[  432.887528] [U] 	Video Capture: Captured 8 buffers
[  433.131724] [U] 	AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  435.531286] [U] 	                                                  
[  435.969388] [U] 	Video Capture: Captured 8 buffers
[  436.205712] [U] 	AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  438.632679] [U] 	                                                  
[  439.067025] [U] 	Video Capture: Captured 8 buffers
[  439.307189] [U] 	AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  441.703205] [U] 	                                                  
[  442.135816] [U] 	Video Capture: Captured 8 buffers
[  442.379741] [U] 	AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  442.867674] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  443.364265] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  443.879575] [U] 	AR15 (16-bit ARGB 1-5-5-5) 2592x2592 -> BA24 (32-bit ARGB 8-8-8-8) 2592x2592: FAIL
[  444.408321] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  444.954042] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  445.542126] [U] 	AR15 (16-bit ARGB 1-5-5-5) 2592x2592 -> RGB3 (24-bit RGB 8-8-8) 2592x2592: FAIL
[  446.167742] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  446.813974] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  447.484183] [U] 	AR15 (16-bit ARGB 1-5-5-5) 2592x2592 -> RGBP (16-bit RGB 5-6-5) 2592x2592: FAIL
[  448.169137] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  448.857907] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  449.586237] [U] 	AR15 (16-bit ARGB 1-5-5-5) 2592x2592 -> AR15 (16-bit ARGB 1-5-5-5) 2592x2592: FAIL
[  450.354594] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  451.147715] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  451.969070] [U] 	AR15 (16-bit ARGB 1-5-5-5) 2592x2592 -> AR12 (16-bit ARGB 4-4-4-4) 2592x2592: FAIL
[  456.270179] [U] 	                                                  
[  457.092815] [U] 	Video Capture: Captured 8 buffers
[  457.527337] [U] 	AR15 (16-bit ARGB 1-5-5-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  461.646816] [U] 	                                                  
[  462.336816] [U] 	Video Capture: Captured 8 buffers
[  462.699807] [U] 	AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  466.018352] [U] 	                                                  
[  466.552070] [U] 	Video Capture: Captured 8 buffers
[  466.828635] [U] 	AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  469.335696] [U] 	                                                  
[  469.773367] [U] 	Video Capture: Captured 8 buffers
[  470.010331] [U] 	AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  472.487852] [U] 	                                                  
[  472.925831] [U] 	Video Capture: Captured 8 buffers
[  473.167824] [U] 	AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  475.552623] [U] 	                                                  
[  475.985703] [U] 	Video Capture: Captured 8 buffers
[  476.229768] [U] 	AR12 (16-bit ARGB 4-4-4-4) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[  478.654381] [U] 	                                                  
[  479.086506] [U] 	Video Capture: Captured 8 buffers
[  479.326295] [U] 	AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[  481.714968] [U] 	                                                  
[  482.146937] [U] 	Video Capture: Captured 8 buffers
[  482.390623] [U] 	AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[  484.807477] [U] 	                                                  
[  485.238512] [U] 	Video Capture: Captured 8 buffers
[  485.477276] [U] 	AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[  487.860325] [U] 	                                                  
[  488.292229] [U] 	Video Capture: Captured 8 buffers
[  488.533258] [U] 	AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[  489.019563] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  489.515301] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  490.029317] [U] 	AR12 (16-bit ARGB 4-4-4-4) 2592x2592 -> BA24 (32-bit ARGB 8-8-8-8) 2592x2592: FAIL
[  490.556478] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  491.097922] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  491.688235] [U] 	AR12 (16-bit ARGB 4-4-4-4) 2592x2592 -> RGB3 (24-bit RGB 8-8-8) 2592x2592: FAIL
[  492.312625] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  492.957251] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  493.626205] [U] 	AR12 (16-bit ARGB 4-4-4-4) 2592x2592 -> RGBP (16-bit RGB 5-6-5) 2592x2592: FAIL
[  494.309810] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  494.997367] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  495.724499] [U] 	AR12 (16-bit ARGB 4-4-4-4) 2592x2592 -> AR15 (16-bit ARGB 1-5-5-5) 2592x2592: FAIL
[  496.490971] stm-dma2d 4002b000.dma2d: dma alloc of size 13438976 failed
[  497.282391] [U] 		fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[  498.101859] [U] 	AR12 (16-bit ARGB 4-4-4-4) 2592x2592 -> AR12 (16-bit ARGB 4-4-4-4) 2592x2592: FAIL
[  502.390697] [U] 	                                                  
[  503.210399] [U] 	Video Capture: Captured 8 buffers
[  503.643633] [U] 	AR12 (16-bit ARGB 4-4-4-4) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[  507.747367] [U] 	                                                  
[  508.434468] [U] 	Video Capture: Captured 8 buffers
[  508.784910] [U] 	AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[  512.102183] [U] 	                                                  
[  512.630437] [U] 	Video Capture: Captured 8 buffers
[  512.906497] [U] 	AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[  515.423391] [U] 	                                                  
[  515.863057] [U] 	Video Capture: Captured 8 buffers
[  516.100521] [U] 	AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[  518.575789] [U] 	                                                  
[  519.013201] [U] 	Video Capture: Captured 8 buffers
[  519.256483] [U] 	AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[  519.746238] [U] Total for stm-dma2d device /dev/video0: 121, Succeeded: 96, Failed: 25, Warnings: 0
*** BLURB HERE ***

Dillon Min (10):
  media: admin-guide: add stm32-dma2d description
  media: dt-bindings: media: add document for STM32 DMA2d bindings
  ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
  ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
  media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu
    platform
  media: videobuf2: Fix the size printk format
  media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
  media: v4l2-ctrls: Add RGB color effects control
  clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
    system enter shell
  media: stm32-dma2d: STM32 DMA2D driver

 .../admin-guide/media/platform-cardlist.rst        |   1 +
 .../devicetree/bindings/media/st,stm32-dma2d.yaml  |  71 ++
 Documentation/userspace-api/media/v4l/control.rst  |   9 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  10 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 drivers/clk/clk-stm32f4.c                          |   4 -
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   8 +-
 drivers/media/platform/Kconfig                     |  12 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/stm32/Makefile              |   2 +
 drivers/media/platform/stm32/dma2d/dma2d-hw.c      | 143 ++++
 drivers/media/platform/stm32/dma2d/dma2d-regs.h    | 113 ++++
 drivers/media/platform/stm32/dma2d/dma2d.c         | 739 +++++++++++++++++++++
 drivers/media/platform/stm32/dma2d/dma2d.h         | 135 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  21 +
 include/media/v4l2-mem2mem.h                       |   5 +
 include/uapi/linux/v4l2-controls.h                 |   4 +-
 18 files changed, 1283 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h

-- 
2.7.4

