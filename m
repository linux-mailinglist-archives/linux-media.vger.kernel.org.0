Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07E83E10B0
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 11:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238681AbhHEJAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 05:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbhHEJAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 05:00:18 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A236C061765;
        Thu,  5 Aug 2021 02:00:04 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id c3so4352875ilh.3;
        Thu, 05 Aug 2021 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H5iMGvMd+oUOXAVlGMwnWtSBluR6AoWUbfGaJJ1/2eI=;
        b=UoN6zHY7hOaWz/f9N0RLlNtxpJT0gfLch7bVLR+KA1HTJ5ltcmf4LW0zlXdYrXNw10
         mJb64hyVoiMXEtF9gGAg7bYUJatxZ2SQmeBumYdSKGruFixiyXWQjaIgXMS8Ey09r4Gn
         5XjdNhrzYEqbc3Birwzhhi5U/KEafTpWK2qJQNyeIhN2/iLsLEQSYCoxkD6Jltatk0o3
         tOnykSiloIwa9vEOU4gDcU/KARFivO1Evn40DzC3ci8rd/POfyuyL5lIsFchiweBAv1g
         pueyxNgpIBXu65vsNPFIzx5RlO3ZsY+p/+fFltyGJ5I1zWQurj3UMy8emNX5dZUvQ2k+
         ufYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H5iMGvMd+oUOXAVlGMwnWtSBluR6AoWUbfGaJJ1/2eI=;
        b=iIGrulSAZWLqqDxTW2A9ZFL+X8GJgELqlV0DacbcSOZHNCU1aZRYNGgwp3Sk3HCaRq
         HP6kP9JQU6xEahwlI97DqUlMMcODG/ZqtVo2bs7m5+fOruq9nIhuYPXmVBbfOKXXvK4c
         pMX3IhPOI8beCUX7wPVu3QzRp0KulRyb4dZuP45NQtfbvjRkQcYNSLBo5c0rp3yUB8ax
         us/AUfrJ1sr1/nu9c9v2Z2f9ju9gP+F0GHqjSOA1vlj+TXtS7stUkKTn6MluQrYOlebf
         hvOzSesXJqljzFwRxfnav+lYkY/pXxJT5ChR4SQgv7dcPq3YjIWqC+TfE2Oua4EFi2LK
         pl8A==
X-Gm-Message-State: AOAM5319VTKKYmNxsNVVGsr19yRhgXrxGfwz+Q3HawSY3V7WIGEngtWz
        3fQORAmaSXDGp5fL7u3LMFsfNrGt6F7VEshF/44=
X-Google-Smtp-Source: ABdhPJwE0mEQQgsx00FJCn61VC5E/yesJwSBtyW+l+PSZuUV0zS3KnVFUWkalmc8XI+pSqyUjI3fKqtUAwxHjGbA2lk=
X-Received: by 2002:a92:ddcf:: with SMTP id d15mr116338ilr.184.1628154003627;
 Thu, 05 Aug 2021 02:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 5 Aug 2021 16:59:27 +0800
Message-ID: <CAL9mu0LKkL29md9KSzVkacujUo2xRoAsJ6zHDkJJ=svB9GwkaQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add support for DMA2D of STMicroelectronics STM32
 Soc series
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        ezequiel@collabora.com, gnurou@gmail.com,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Just a gentle ping, could you help to take a look at patch (6 ~ 9) of
this v2 series.
Thanks.

Best Regards
Dillon

On Thu, 15 Jul 2021 at 17:24, <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> This patchset introduces a basic support for DMA2D Interface
> of STMicroelectronics STM32 SoC series.
>
> This first basic support implements R2M, M2M, M2M_PFC
> M2M_BLEND support will be added later on.
>
> This has been tested on STM32469-DISCO board.
>
> history
>
> v2:
> - update v4l2-compliance to SHA: a4f2e3a6f306 2021-07-13 08:04:15
>   the test results at below [1].
> - introduce Documentation/userspace-api/media/drivers/stm32-uapi.rst
>   to explain the detail of dma2d's ioctl.
> - reserved 16 ioctls from v4l2-controls.h for stm32, introduce stm32-medi=
a.h.
> - collect Reviewed-by tag from Rob Herring.
> - update dma2d driver from Hans's review. the details can be found
>   at related patches.
> v1 link:
> https://lore.kernel.org/lkml/1621508727-24486-1-git-send-email-dillon.min=
fei@gmail.com/
>
> v1:
> The commit based on kernel(master): c3d0e3fd41b7f0f5d5d5b6022ab7e813f04ea=
727
>
> Note for v4l2-compliance tool on nu-mmu platform:
> I add two change based on v4l-utils since commit:
> f0c7e3d71eaf4182bae7eb3ee0e43b4eeb047ea9
>
> - change fork() to vfork() in v4l2-test-controls.cpp
>   since no-mmu platform don't include fork().
>
> - bypass VIDIOC_QUERYCAP nullptr check
>   I'm not sure if this is the bug from my cross compile tool
>   which created by buildroot. user area's nullptr can't be
>   detected by kernel side, i was try to add access_ok()
>   in v4l2-ioctl.c, but no help
>
>   If this case must be fixed, i will continue to debug it.
>   the error log:
>   ...
>   fail: v4l2-compliance.cpp(623): doioctl(node, VIDIOC_QUERYCAP, nullptr)=
 !=3D
>   EFAULT
>   ..
>
> My changes on v4l2-compliance:
>
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp
> b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 90a5036..a25fe4f 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -620,7 +620,7 @@ static int testCap(struct node *node)
>
>         memset(&vcap, 0xff, sizeof(vcap));
>         // Must always be there
> -       fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) !=3D EFAULT)=
;
> +       //fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) !=3D EFAUL=
T);
>         fail_on_test(doioctl(node, VIDIOC_QUERYCAP, &vcap));
>         fail_on_test(check_ustring(vcap.driver, sizeof(vcap.driver)));
>         fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));
>
> with v4l2-compliance test log (with above modification):
> since the stm32f469-disco ram limitation, there are 25 failed on
> dma_alloc_coherent()
>
> Really appreciate if someone can help to test this patch on the STM32429I=
-EVAL
> evaluation board (https://www.st.com/en/evaluation-tools/stm32429i-eval.h=
tml)
> 8M x 32-bit SDRAM, 1M x 16-bit SRAM and 8M x 16-bit NOR Flash
>
> / # free
>             total       used       free     shared    buffers     cached
> Mem:        15604       6104       9500     0         0           2488
> -/+ buffers/cache:      3616       11988
>
> [1] v4l2-compliance test result:
>
> ./v4l2-compliance -s -f -d /dev/video0 &
> [1] 34 ./v4l2-compliance -s -f -d /dev/video0
> / # v4l2-compliance 1.21.0-4831, 32 bits, 32-bit time_t
> v4l2-compliance SHA: a4f2e3a6f306 2021-07-13 08:04:15
>
> Compliance test for stm-dma2d device /dev/video0:
>
> Driver Info:
>         Driver name      : stm-dma2d
>         Card type        : stm-dma2d
>         Bus info         : platform:stm-dma2d
>         Driver version   : 5.14.0
>         Capabilities     : 0x84208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
>
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)[
>
> Control ioctls:
>  test VIDIOC_QUERY_EX _CTRL/QUERY ENU: 55.029750] stm-dma2d 4002b000.dma2=
d: Format not supported: =E2=96=92=E2=96=92=E2=96=92=E2=96=92, use the defa=
ult.
> OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G[S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS  OK
>         test VI I C_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test 55DIOC_G/S_JP.784007] stm-dma2d 4002b000.dma2d: Format not s=
upported: =E2=96=92=E2=96=92=E2=96=92=E2=96=92, use the default.
> EGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private[Controls: 2
>
> For a  ioctls:
>         5est VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK0m
>         test VI.IOC_G/S_PAR5: OK (Not 50538] stm-dma2d 4002b000.dma2d: Fo=
rmat not supported: =E2=96=92=E2=96=92=E2=96=92=E2=96=92, use the default.
> Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test[V DIOC_G_FM : OK
>         test VID5OC_T7Y_FMT: OK
> .316175] stm-dma2d 4002b000.dma2d: Format not supported: =E2=96=92=E2=96=
=92=E2=96=92=E2=96=92, use the default.
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Test input 0:
>
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
> [   59.905900] use of bytesused =3D=3D 0 is deprecated and will be remove=
d in the future,
> [   60.665190] use the actual size instead.
>         Video Capture: Captured 58 buffers
>         test MMAP (no poll): OK
>         Video Capture: Captured 58 buffers
>         test MMAP (select): OK
>         Video Capture: Captured 58 buffers
>         test MMAP (epoll): OK
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
>
> Stream using all formats:
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1:=
 OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1:=
 OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1:=
 OK
> [   83.015780] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -3235=
84 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8=
-8) 16383x65535: FAIL
> [   83.959807] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -3235=
84 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB[8-8-8-8) 16383x 553  -> RGB3 (24- it R8B 8-8-84=
 16383x65535: FAIL
> .899851] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 fai=
led
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB 8-8-8-8)[16383x65535 -> RGBP (16-bit RGB  -6-5)=
 16383x65535: FA L
> 85.848108] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 f=
ailed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5=
-5) 16[83x65535: F IL
>   86.802223] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584=
 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4=
-4) 16383x65535: FAIL
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 1x1 -> AR12 (16-bit[ARGB 4-4-4-4) 1x1: OK
>   89.086437] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -107398=
3488 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGB3 (24-bi[  GB 8-8-8) 16383x65535  > BA24 (32-bit A GB 8-8-8-8)=
 16383965505: FA.L
> 030474] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 =
failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
> 978755] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 =
failed035: 31mFAIL
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGB3 (24-bit RGB [-8-8) 16383 65535 -> RGBP (16-bit RGB 5-6-5) 16=
383x65535: FA L
> 91.923561] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -10739834=
88 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5)=
 16383x65535: FAIL
> [   92.885742] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073=
983488 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4)=
 16383x65535: FAIL
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x32=
0: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x32=
0: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         RGB3 (24-bit RGB 8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 1x1 -> AR12 (16-bit AR[B 4-4-4-4) 1x1: OK
>   95.008330] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323=
904 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
> 50176] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 fa=
iled83x95535: FAIL
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGBP (16-bit RGB 5-6-[) 16383x65535 -> R B3 (24-bit RG  8-8-8) 16=
383x65535: FAIL9[0m
> 6.895671] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904=
 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16=
383x65535: FAIL
> [   97.851563] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473=
23904 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGBP (16-bit [GB 5 6-5) 16383x6553  -> AR15 (16-bit ARGB 1-5-5-5)=
 16383x69535: FAIL.
>                                                                          =
                   791193] stm-dma2d 4002b000.dma2d: dma_alloc_coherd
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4)=
 16383x65535: FAIL
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x32=
0: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x32=
0: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         RGBP (16-bit RGB 5-6-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1:=
 OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1:=
 OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 1x1 -[ AR12 (16-bit  RGB 4-4-4-4) 1x1:=
 OK
> 100.827052] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473239=
04 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR15 (16-bit ARGB 1-5-5-5) 16383[655 5 -> BA24 (32-bit ARGB 8-8-8=
-8)  6383x65535: F0IL0m
> .764900] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 =
failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR15 (16-bit ARGB 1-5-5-5)[163 3x65535 -> RGB3 (24- it RGB 8-8-8)=
 16383x65535: AIL0[0m
> 2.704672] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904=
 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5)=
 16383x65535: FAIL
> [  103.656921] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473=
23904 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR15 (16-bit ARGB 1-5-5-5) 16383x65535[-> AR15 (16-bit ARGB 1 5-5=
-5) 16383x65535: FAIL
> 104.596785] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473239=
04 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4=
-4) 16383x65535: FAIL
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1:=
 OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1:=
 OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR12 (16-bit ARGB[4- -4-4) 1x1:=
 OK
>  106.636958] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323=
904 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR12 (16-bit ARGB[4-4-4-4) 16383x65535 -> BA24 (32-bit ARGB 8 8-8=
-8) 16383x65535:  [1;31mFAIL
> 107.578517] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473239=
04 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR12 (16-bit ARGB 4-4-[  ) 16383x65535 1> R0B3 (24-bit RGB 8-8-88=
 16383x65535: FAIL
> .527898] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 =
failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGBP (16-bit RGB 5-6-5)=
 16383x65535: FAIL
> [  109.495892] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473=
23904 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR12 (16-bit ARGB 4-4-4-4) 1638[x65535 -> AR15 (16-bit ARGB 1-5-5=
-5) 16383x6 535: FAIL
> 110.449341] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 21473239=
04 failed
>                 fail: v4l2-test-buffers.cpp(1300): q.reqbufs(node, 2)
>         AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR12 (16-bit ARGB 4-4-4=
-4) 16383x65535: FAIL
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGBP (16-bit RGB 5-6-5) 240=
x320: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) =
240x320: OK
>         Video Capture: Captured 8 buffers
>         AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) =
240x320: OK
> Total for stm-dma2d device /dev/video0: 127, Succeeded: 102, Failed: 25, =
Warnings: 0
>
> [1] Done                   ./v4l2-compliance -s -f -d /dev/video0
> *** BLURB HERE ***
>
> Dillon Min (9):
>   media: admin-guide: add stm32-dma2d description
>   media: dt-bindings: media: add document for STM32 DMA2d bindings
>   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>     kernel startup
>   ARM: dts: stm32: Enable DMA2D support on STM32F429 MCU
>   ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
>   media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu
>     platform
>   media: docs: add doc for the stm32 dma2d driver
>   media: v4l: uapi: Add user control base for stm32 dma2d controls
>   media: stm32-dma2d: STM32 DMA2D driver
>
>  .../admin-guide/media/platform-cardlist.rst        |   1 +
>  .../devicetree/bindings/media/st,stm32-dma2d.yaml  |  71 ++
>  .../userspace-api/media/drivers/index.rst          |   1 +
>  .../userspace-api/media/drivers/stm32-uapi.rst     |  22 +
>  arch/arm/boot/dts/stm32f429.dtsi                   |  10 +
>  arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
>  drivers/clk/clk-stm32f4.c                          |   7 +-
>  drivers/media/platform/Kconfig                     |   9 +
>  drivers/media/platform/Makefile                    |   1 +
>  drivers/media/platform/stm32/Makefile              |   2 +
>  drivers/media/platform/stm32/dma2d/dma2d-hw.c      | 143 ++++
>  drivers/media/platform/stm32/dma2d/dma2d-regs.h    | 113 +++
>  drivers/media/platform/stm32/dma2d/dma2d.c         | 796 +++++++++++++++=
++++++
>  drivers/media/platform/stm32/dma2d/dma2d.h         | 136 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c             |  21 +
>  include/media/v4l2-mem2mem.h                       |   5 +
>  include/uapi/linux/stm32-media.h                   |  12 +
>  include/uapi/linux/v4l2-controls.h                 |   5 +
>  18 files changed, 1355 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2=
d.yaml
>  create mode 100644 Documentation/userspace-api/media/drivers/stm32-uapi.=
rst
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
>  create mode 100644 include/uapi/linux/stm32-media.h
>
> --
> 2.7.4
>
