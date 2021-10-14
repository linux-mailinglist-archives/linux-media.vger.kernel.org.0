Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AAF42D79F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhJNLES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 07:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhJNLER (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:04:17 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7B0C061570;
        Thu, 14 Oct 2021 04:02:11 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ayUwmQZ15k3b0ayUzmY7Zb; Thu, 14 Oct 2021 13:02:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634209330; bh=RhHhanmjky+xJptagDOFVoLInP7ku6NmJhxam/Br3QU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qvwHRy8UQkuP2InjlZU7UvL6po1AB9U14Yt5WCbIJikUqHURHaB+3f7A0FqI+eByi
         ZJGVjGLJyRpnj+YuumwvLcML7Kxc6jLDmyEouyMmLg+Dis35olWFXhVtiVTMEqIjuT
         R+GKPOBdynkcdvTDJa2O1ve1ZsRLrxKmEoVeOqi24h3N12GphH3mr72QeTLsXFdX8u
         HWjxJGOqZ0HJQabQHMlK0K+XQKt065dLDKIHv4iYF09Sf3shNxWCHdAkvpK6RWj/Nf
         iD4bretzvK0DflXm731tb1d1T72UWUqrZiDlcXEHn8oTy3ARtOLIW1hpTFCMaCgOFl
         hIEqazH1DK2oA==
Subject: Re: [PATCH v4 0/8] Add support for DMA2D of STMicroelectronics STM32
 Soc series
To:     dillon.minfei@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bc8e1cd1-0013-9062-88b6-fddca535919f@xs4all.nl>
Date:   Thu, 14 Oct 2021 13:02:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOmBi2X1b9q8/2DnbId3FBibS4wtkiH5Nq0vDxLyNeG4HC9Xm9L97MUhEUPsN4IQgWhRWDcIALTTHG+3d25pHWcVBvTIOkfX1wiO3ylO0E0fKaTycjpk
 OwcZqYTIlhLKk1X3kocOzWQZTMg/LdperOHclcWd46AnheZM62o9MCM85GH3tUgv2o9zUOvDWzcNJFLyHmdrTVDEPzPmU++hXtqtPU5bQDorKFKeTO7pFYoQ
 EUKkW+sd4+EipOuiSQxCMSi5G7KtEbPrbaUlim2ctuIVk4P26r6u60jh5vcRsk0KCTRiuabHCPacM7SvdDDvGMzUKzgBATYgSOE8dky/L6YifdMBJwZ/PJGN
 0CW/noFyoD6FAPfzJiUEaw2c1iMuOXkK/98nBPLE2btdIQlFbFwt1J9xKrNC10FvvIYJSE43puMgoop9YkCYYTFwQQ/X4HT0ZIJ9nRzFYWlmSe+fmoMIMWoW
 ExqGAc+6O8zns94NG4OhcB8VDhd08MwtvBYHbOLhsNvDFxOvPg54lYiTAUfHoto/aSywrSPUUOkH2sWxcAwPt0KnolBwg82RaQIHhfcMAIj2R5313y4+84Gb
 9TsV6Rvct2flEun+prQZASgMcRFq7hduy5QHRh+Vx28kgSc/LuoE9a9pcJPEW4GZX2CCKQ1eXTVMc3SG/8QqrDNYhf233Do7DFvU0IQxbFu+DgHVpP+O+iAc
 ejrO59qqYKKYqOTKzFChREewk9QduvNfqSspQwk8RGs4gNpPFbQH2DxMLSH3SlY2XuOPMJFaB+ru4IVgeiLKQyB+J44tU64ysUa1d99H6ICU9g85xBZM8W4w
 I9y/lrYI5cAkUM/1YugGZqwX3Ukw/qhI/6SIUDwNJOVfJgbbsMJO/7IpAwq2n3u4FqUFzHcG76VAsqnFXGTfQw11UT3zFqXz2sOrEYBir9xHwR8EHqFvYOzK
 HGqt2pJvsLqZnTa3GruEbEG9/Kw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2021 12:24, dillon.minfei@gmail.com wrote:
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
> v4:
> - replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
>   V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
>   in current. thanks Hans.
> v3 link:
> https://lore.kernel.org/lkml/1633689012-14492-1-git-send-email-dillon.minfei@gmail.com/
> 
> v3:
> - use V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to pass argb paramter to
>   the dma2d driver, instead of add stm32 private ioctl.
> - some v2's patch are removed in this version.
>   - "[PATCH v2 7/9] media: docs: add doc for the stm32 dma2d driver"
>   - "[PATCH v2 8/9] media: v4l: uapi: Add user control base for stm32 dma2d
>     controls"
> - dma2d's driver changes based on Hans's review result. detail can be found at
>   "media: stm32-dma2d: STM32 DMA2D driver"
> - add stm32 clk drivers bugfix, ltdc clock disabled after kenerl boot up.
> v3 based on kernel and v4l-utils git:
> 
> kernel:
> commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Oct 3 14:08:47 2021 -0700
> 
>     Linux 5.15-rc4
> 
> v4l-utils:
> commit 700f5ded9c6de2c6dfe5d1b453d85566f95b4f0c
> Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date:   Sat Oct 2 11:01:05 2021 +0200
> 
>     test-media: show version info earlier and show cmd args
> 
>     Log the version info earlier and also log the command line arguments.
>  
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> v2 link:
> https://lore.kernel.org/lkml/1626341068-20253-11-git-send-email-dillon.minfei@gmail.com/
> 
> 
> v2:
> - update v4l2-compliance to SHA: a4f2e3a6f306 2021-07-13 08:04:15
>   the test results at below [1].
> - introduce Documentation/userspace-api/media/drivers/stm32-uapi.rst
>   to explain the detail of dma2d's ioctl.
> - reserved 16 ioctls from v4l2-controls.h for stm32, introduce stm32-media.h.
> - collect Reviewed-by tag from Rob Herring.
> - update dma2d driver from Hans's review. the details can be found
>   at related patches.
> v1 link:
> https://lore.kernel.org/lkml/1621508727-24486-1-git-send-email-dillon.minfei@gmail.com/
> 
> v1:
> The commit based on kernel(master): c3d0e3fd41b7f0f5d5d5b6022ab7e813f04ea727
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
>   fail: v4l2-compliance.cpp(623): doioctl(node, VIDIOC_QUERYCAP, nullptr) !=
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
> -       fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
> +       //fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);

I believe the reason is that if CONFIG_MMU is not set, then access_ok will
always return true, thus allowing NULL pointers as arguments.

I think the media core needs to protect itself from that specific case.

I'll post a separate RFC patch that fixes this for the various core ioctl
handlers in drivers media. Please test with it to verify that it will correctly
handle this corner case.

<snip>

> [  175.899445] [U]      Video Capture: Captured 8 buffers
> [  175.904203] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
> [  175.909257] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed

Where does this error message come from? I'd like to know why the size is negative, it suggests
a wrong formatting string.

Regards,

	Hans

> [  176.887971] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  176.891254] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
> [  176.894591] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
> [  177.872809] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  177.875613] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
> [  177.879358] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
> [  178.859498] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  178.863900] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
> [  178.877499] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
> [  179.861912] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  179.865414] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
> [  179.869176] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -323584 failed
> [  180.847874] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  180.851154] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
> [  181.012396] [U]      Video Output: Frame #002 (select)
> [  181.023820] [U]      Video Output: Frame #003 (select)
> [  181.027866] [U]      Video Output: Frame #004 (select)
> [  181.033480] [U]      Video Output: Frame #005 (select)
> [  181.039683] [U]      Video Output: Frame #006 (select)
> [  181.044731] [U]      Video Output: Frame #007 (select)
> [  181.054462] [U]      Video Output: Frame #008 (select)
> [  181.057047] [U]      Video Output: Frame #009 (select)
> [  181.060148] [U]
> [  181.062534] [U]      Video Capture: Captured 8 buffers
> [  181.079381] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
> [  181.211005] [U]      Video Output: Frame #002 (select)
> [  181.216086] [U]      Video Output: Frame #003 (select)
> [  181.221810] [U]      Video Output: Frame #004 (select)
> [  181.227030] [U]      Video Output: Frame #005 (select)
> [  181.232749] [U]      Video Output: Frame #006 (select)
> [  181.237824] [U]      Video Output: Frame #007 (select)
> [  181.243524] [U]      Video Output: Frame #008 (select)
> [  181.246555] [U]      Video Output: Frame #009 (select)
> [  181.247687] [U]
> [  181.249550] [U]      Video Capture: Captured 8 buffers
> [  181.257051] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
> [  181.379887] [U]      Video Output: Frame #002 (select)
> [  181.384861] [U]      Video Output: Frame #003 (select)
> [  181.390275] [U]      Video Output: Frame #004 (select)
> [  181.395316] [U]      Video Output: Frame #005 (select)
> [  181.400843] [U]      Video Output: Frame #006 (select)
> [  181.405823] [U]      Video Output: Frame #007 (select)
> [  181.411116] [U]      Video Output: Frame #008 (select)
> [  181.414056] [U]      Video Output: Frame #009 (select)
> [  181.415187] [U]
> [  181.416633] [U]      Video Capture: Captured 8 buffers
> [  181.424542] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
> [  181.546524] [U]      Video Output: Frame #002 (select)
> [  181.551867] [U]      Video Output: Frame #003 (select)
> [  181.556967] [U]      Video Output: Frame #004 (select)
> [  181.562273] [U]      Video Output: Frame #005 (select)
> [  181.567476] [U]      Video Output: Frame #006 (select)
> [  181.572775] [U]      Video Output: Frame #007 (select)
> [  181.577885] [U]      Video Output: Frame #008 (select)
> [  181.581013] [U]      Video Output: Frame #009 (select)
> [  181.582141] [U]
> [  181.583584] [U]      Video Capture: Captured 8 buffers
> [  181.591533] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
> [  181.713820] [U]      Video Output: Frame #002 (select)
> [  181.719521] [U]      Video Output: Frame #003 (select)
> [  181.724220] [U]      Video Output: Frame #004 (select)
> [  181.729876] [U]      Video Output: Frame #005 (select)
> [  181.734685] [U]      Video Output: Frame #006 (select)
> [  181.740368] [U]      Video Output: Frame #007 (select)
> [  181.745185] [U]      Video Output: Frame #008 (select)
> [  181.748087] [U]      Video Output: Frame #009 (select)
> [  181.749610] [U]
> [  181.751056] [U]      Video Capture: Captured 8 buffers
> [  181.759012] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
> [  181.798926] [U]      Video Output: Frame #002 (select)
> [  181.802765] [U]      Video Output: Frame #003 (select)
> [  181.806506] [U]      Video Output: Frame #004 (select)
> [  181.810661] [U]      Video Output: Frame #005 (select)
> [  181.814404] [U]      Video Output: Frame #006 (select)
> [  181.818563] [U]      Video Output: Frame #007 (select)
> [  181.822249] [U]      Video Output: Frame #008 (select)
> [  181.824192] [U]      Video Output: Frame #009 (select)
> [  181.825320] [U]
> [  181.826762] [U]      Video Capture: Captured 8 buffers
> [  181.831920] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
> [  181.869600] [U]      Video Output: Frame #002 (select)
> [  181.873312] [U]      Video Output: Frame #003 (select)
> [  181.877055] [U]      Video Output: Frame #004 (select)
> [  181.881214] [U]      Video Output: Frame #005 (select)
> [  181.884958] [U]      Video Output: Frame #006 (select)
> [  181.890046] [U]      Video Output: Frame #007 (select)
> [  181.893793] [U]      Video Output: Frame #008 (select)
> [  181.895699] [U]      Video Output: Frame #009 (select)
> [  181.896828] [U]
> [  181.898693] [U]      Video Capture: Captured 8 buffers
> [  181.903395] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
> [  181.940908] [U]      Video Output: Frame #002 (select)
> [  181.944624] [U]      Video Output: Frame #003 (select)
> [  181.948778] [U]      Video Output: Frame #004 (select)
> [  181.952520] [U]      Video Output: Frame #005 (select)
> [  181.956269] [U]      Video Output: Frame #006 (select)
> [  181.960434] [U]      Video Output: Frame #007 (select)
> [  181.964171] [U]      Video Output: Frame #008 (select)
> [  181.966115] [U]      Video Output: Frame #009 (select)
> [  181.967247] [U]
> [  181.969039] [U]      Video Capture: Captured 8 buffers
> [  181.973749] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
> [  182.011230] [U]      Video Output: Frame #002 (select)
> [  182.014969] [U]      Video Output: Frame #003 (select)
> [  182.019098] [U]      Video Output: Frame #004 (select)
> [  182.022842] [U]      Video Output: Frame #005 (select)
> [  182.026583] [U]      Video Output: Frame #006 (select)
> [  182.030919] [U]      Video Output: Frame #007 (select)
> [  182.034663] [U]      Video Output: Frame #008 (select)
> [  182.036602] [U]      Video Output: Frame #009 (select)
> [  182.037730] [U]
> [  182.039583] [U]      Video Capture: Captured 8 buffers
> [  182.044294] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
> [  182.081844] [U]      Video Output: Frame #002 (select)
> [  182.085683] [U]      Video Output: Frame #003 (select)
> [  182.089794] [U]      Video Output: Frame #004 (select)
> [  182.093529] [U]      Video Output: Frame #005 (select)
> [  182.097275] [U]      Video Output: Frame #006 (select)
> [  182.102306] [U]      Video Output: Frame #007 (select)
> [  182.106058] [U]      Video Output: Frame #008 (select)
> [  182.107993] [U]      Video Output: Frame #009 (select)
> [  182.109717] [U]
> [  182.111164] [U]      Video Capture: Captured 8 buffers
> [  182.115800] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
> [  182.120866] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
> [  183.101917] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  183.104837] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
> [  183.108595] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
> [  184.088869] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  184.091774] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
> [  184.095134] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
> [  185.076687] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  185.081734] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
> [  185.089520] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
> [  186.075117] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  186.078050] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
> [  186.087047] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size -1073983488 failed
> [  187.067454] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  187.070722] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
> [  187.208952] [U]      Video Output: Frame #002 (select)
> [  187.213072] [U]      Video Output: Frame #003 (select)
> [  187.217909] [U]      Video Output: Frame #004 (select)
> [  187.230839] [U]      Video Output: Frame #005 (select)
> [  187.236159] [U]      Video Output: Frame #006 (select)
> [  187.241721] [U]      Video Output: Frame #007 (select)
> [  187.247706] [U]      Video Output: Frame #008 (select)
> [  187.250878] [U]      Video Output: Frame #009 (select)
> [  187.252028] [U]
> [  187.253484] [U]      Video Capture: Captured 8 buffers
> [  187.263075] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
> [  187.384437] [U]      Video Output: Frame #002 (select)
> [  187.390173] [U]      Video Output: Frame #003 (select)
> [  187.395043] [U]      Video Output: Frame #004 (select)
> [  187.400563] [U]      Video Output: Frame #005 (select)
> [  187.405436] [U]      Video Output: Frame #006 (select)
> [  187.410860] [U]      Video Output: Frame #007 (select)
> [  187.415903] [U]      Video Output: Frame #008 (select)
> [  187.419300] [U]      Video Output: Frame #009 (select)
> [  187.420445] [U]
> [  187.421882] [U]      Video Capture: Captured 8 buffers
> [  187.428304] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
> [  187.527404] [U]      Video Output: Frame #002 (select)
> [  187.532721] [U]      Video Output: Frame #003 (select)
> [  187.537565] [U]      Video Output: Frame #004 (select)
> [  187.542892] [U]      Video Output: Frame #005 (select)
> [  187.547735] [U]      Video Output: Frame #006 (select)
> [  187.552979] [U]      Video Output: Frame #007 (select)
> [  187.557815] [U]      Video Output: Frame #008 (select)
> [  187.560977] [U]      Video Output: Frame #009 (select)
> [  187.562108] [U]
> [  187.563568] [U]      Video Capture: Captured 8 buffers
> [  187.570508] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
> [  187.669153] [U]      Video Output: Frame #002 (select)
> [  187.673836] [U]      Video Output: Frame #003 (select)
> [  187.679199] [U]      Video Output: Frame #004 (select)
> [  187.683921] [U]      Video Output: Frame #005 (select)
> [  187.690806] [U]      Video Output: Frame #006 (select)
> [  187.694700] [U]      Video Output: Frame #007 (select)
> [  187.700031] [U]      Video Output: Frame #008 (select)
> [  187.702729] [U]      Video Output: Frame #009 (select)
> [  187.703862] [U]
> [  187.705315] [U]      Video Capture: Captured 8 buffers
> [  187.712301] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
> [  187.810853] [U]      Video Output: Frame #002 (select)
> [  187.815718] [U]      Video Output: Frame #003 (select)
> [  187.820886] [U]      Video Output: Frame #004 (select)
> [  187.825738] [U]      Video Output: Frame #005 (select)
> [  187.830998] [U]      Video Output: Frame #006 (select)
> [  187.835854] [U]      Video Output: Frame #007 (select)
> [  187.840962] [U]      Video Output: Frame #008 (select)
> [  187.843658] [U]      Video Output: Frame #009 (select)
> [  187.844808] [U]
> [  187.846267] [U]      Video Capture: Captured 8 buffers
> [  187.853233] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
> [  187.892982] [U]      Video Output: Frame #002 (select)
> [  187.896722] [U]      Video Output: Frame #003 (select)
> [  187.901814] [U]      Video Output: Frame #004 (select)
> [  187.905570] [U]      Video Output: Frame #005 (select)
> [  187.909747] [U]      Video Output: Frame #006 (select)
> [  187.913502] [U]      Video Output: Frame #007 (select)
> [  187.917221] [U]      Video Output: Frame #008 (select)
> [  187.919598] [U]      Video Output: Frame #009 (select)
> [  187.920744] [U]
> [  187.922187] [U]      Video Capture: Captured 8 buffers
> [  187.926949] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
> [  187.964548] [U]      Video Output: Frame #002 (select)
> [  187.968710] [U]      Video Output: Frame #003 (select)
> [  187.972450] [U]      Video Output: Frame #004 (select)
> [  187.976200] [U]      Video Output: Frame #005 (select)
> [  187.980386] [U]      Video Output: Frame #006 (select)
> [  187.984129] [U]      Video Output: Frame #007 (select)
> [  187.987832] [U]      Video Output: Frame #008 (select)
> [  187.990200] [U]      Video Output: Frame #009 (select)
> [  187.991334] [U]
> [  187.992794] [U]      Video Capture: Captured 8 buffers
> [  187.997518] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
> [  188.035225] [U]      Video Output: Frame #002 (select)
> [  188.039367] [U]      Video Output: Frame #003 (select)
> [  188.043100] [U]      Video Output: Frame #004 (select)
> [  188.046869] [U]      Video Output: Frame #005 (select)
> [  188.051043] [U]      Video Output: Frame #006 (select)
> [  188.054779] [U]      Video Output: Frame #007 (select)
> [  188.058952] [U]      Video Output: Frame #008 (select)
> [  188.060869] [U]      Video Output: Frame #009 (select)
> [  188.062007] [U]
> [  188.063481] [U]      Video Capture: Captured 8 buffers
> [  188.068199] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
> [  188.105750] [U]      Video Output: Frame #002 (select)
> [  188.110628] [U]      Video Output: Frame #003 (select)
> [  188.114400] [U]      Video Output: Frame #004 (select)
> [  188.118583] [U]      Video Output: Frame #005 (select)
> [  188.122346] [U]      Video Output: Frame #006 (select)
> [  188.126112] [U]      Video Output: Frame #007 (select)
> [  188.130297] [U]      Video Output: Frame #008 (select)
> [  188.132256] [U]      Video Output: Frame #009 (select)
> [  188.133395] [U]
> [  188.134832] [U]      Video Capture: Captured 8 buffers
> [  188.139980] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
> [  188.177179] [U]      Video Output: Frame #002 (select)
> [  188.181359] [U]      Video Output: Frame #003 (select)
> [  188.185092] [U]      Video Output: Frame #004 (select)
> [  188.189256] [U]      Video Output: Frame #005 (select)
> [  188.193014] [U]      Video Output: Frame #006 (select)
> [  188.196782] [U]      Video Output: Frame #007 (select)
> [  188.200966] [U]      Video Output: Frame #008 (select)
> [  188.202927] [U]      Video Output: Frame #009 (select)
> [  188.204076] [U]
> [  188.205539] [U]      Video Capture: Captured 8 buffers
> [  188.210672] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
> [  188.215307] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  189.195288] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  189.198221] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
> [  189.201999] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  190.181652] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  190.184584] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
> [  190.187942] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  191.169734] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  191.174128] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
> [  191.187757] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  192.173031] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  192.176513] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
> [  192.180243] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  193.160460] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  193.163402] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
> [  193.274947] [U]      Video Output: Frame #002 (select)
> [  193.280280] [U]      Video Output: Frame #003 (select)
> [  193.285134] [U]      Video Output: Frame #004 (select)
> [  193.293553] [U]      Video Output: Frame #005 (select)
> [  193.301976] [U]      Video Output: Frame #006 (select)
> [  193.313308] [U]      Video Output: Frame #007 (select)
> [  193.321840] [U]      Video Output: Frame #008 (select)
> [  193.324248] [U]      Video Output: Frame #009 (select)
> [  193.325401] [U]
> [  193.326861] [U]      Video Capture: Captured 8 buffers
> [  193.337747] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
> [  193.444950] [U]      Video Output: Frame #002 (select)
> [  193.450224] [U]      Video Output: Frame #003 (select)
> [  193.455052] [U]      Video Output: Frame #004 (select)
> [  193.460319] [U]      Video Output: Frame #005 (select)
> [  193.465127] [U]      Video Output: Frame #006 (select)
> [  193.470305] [U]      Video Output: Frame #007 (select)
> [  193.475099] [U]      Video Output: Frame #008 (select)
> [  193.477842] [U]      Video Output: Frame #009 (select)
> [  193.479391] [U]
> [  193.480851] [U]      Video Capture: Captured 8 buffers
> [  193.487404] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
> [  193.571393] [U]      Video Output: Frame #002 (select)
> [  193.576229] [U]      Video Output: Frame #003 (select)
> [  193.581437] [U]      Video Output: Frame #004 (select)
> [  193.586293] [U]      Video Output: Frame #005 (select)
> [  193.591485] [U]      Video Output: Frame #006 (select)
> [  193.596283] [U]      Video Output: Frame #007 (select)
> [  193.601494] [U]      Video Output: Frame #008 (select)
> [  193.604143] [U]      Video Output: Frame #009 (select)
> [  193.605292] [U]
> [  193.606751] [U]      Video Capture: Captured 8 buffers
> [  193.613713] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
> [  193.697074] [U]      Video Output: Frame #002 (select)
> [  193.702220] [U]      Video Output: Frame #003 (select)
> [  193.707044] [U]      Video Output: Frame #004 (select)
> [  193.712181] [U]      Video Output: Frame #005 (select)
> [  193.716969] [U]      Video Output: Frame #006 (select)
> [  193.722108] [U]      Video Output: Frame #007 (select)
> [  193.726946] [U]      Video Output: Frame #008 (select)
> [  193.730038] [U]      Video Output: Frame #009 (select)
> [  193.731174] [U]
> [  193.732631] [U]      Video Capture: Captured 8 buffers
> [  193.739533] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
> [  193.822311] [U]      Video Output: Frame #002 (select)
> [  193.827146] [U]      Video Output: Frame #003 (select)
> [  193.832330] [U]      Video Output: Frame #004 (select)
> [  193.837059] [U]      Video Output: Frame #005 (select)
> [  193.842231] [U]      Video Output: Frame #006 (select)
> [  193.847059] [U]      Video Output: Frame #007 (select)
> [  193.852850] [U]      Video Output: Frame #008 (select)
> [  193.855495] [U]      Video Output: Frame #009 (select)
> [  193.856643] [U]
> [  193.858101] [U]      Video Capture: Captured 8 buffers
> [  193.865073] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
> [  193.904824] [U]      Video Output: Frame #002 (select)
> [  193.909125] [U]      Video Output: Frame #003 (select)
> [  193.912856] [U]      Video Output: Frame #004 (select)
> [  193.916610] [U]      Video Output: Frame #005 (select)
> [  193.920775] [U]      Video Output: Frame #006 (select)
> [  193.924532] [U]      Video Output: Frame #007 (select)
> [  193.928706] [U]      Video Output: Frame #008 (select)
> [  193.930651] [U]      Video Output: Frame #009 (select)
> [  193.931794] [U]
> [  193.933234] [U]      Video Capture: Captured 8 buffers
> [  193.938007] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
> [  193.975577] [U]      Video Output: Frame #002 (select)
> [  193.979749] [U]      Video Output: Frame #003 (select)
> [  193.983475] [U]      Video Output: Frame #004 (select)
> [  193.987350] [U]      Video Output: Frame #005 (select)
> [  193.991683] [U]      Video Output: Frame #006 (select)
> [  193.995434] [U]      Video Output: Frame #007 (select)
> [  193.999608] [U]      Video Output: Frame #008 (select)
> [  194.001553] [U]      Video Output: Frame #009 (select)
> [  194.002712] [U]
> [  194.004171] [U]      Video Capture: Captured 8 buffers
> [  194.009333] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
> [  194.046472] [U]      Video Output: Frame #002 (select)
> [  194.050656] [U]      Video Output: Frame #003 (select)
> [  194.054421] [U]      Video Output: Frame #004 (select)
> [  194.059442] [U]      Video Output: Frame #005 (select)
> [  194.063218] [U]      Video Output: Frame #006 (select)
> [  194.066975] [U]      Video Output: Frame #007 (select)
> [  194.071160] [U]      Video Output: Frame #008 (select)
> [  194.073114] [U]      Video Output: Frame #009 (select)
> [  194.074265] [U]
> [  194.075723] [U]      Video Capture: Captured 8 buffers
> [  194.080748] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
> [  194.117903] [U]      Video Output: Frame #002 (select)
> [  194.122071] [U]      Video Output: Frame #003 (select)
> [  194.125830] [U]      Video Output: Frame #004 (select)
> [  194.130014] [U]      Video Output: Frame #005 (select)
> [  194.133781] [U]      Video Output: Frame #006 (select)
> [  194.137536] [U]      Video Output: Frame #007 (select)
> [  194.141720] [U]      Video Output: Frame #008 (select)
> [  194.143679] [U]      Video Output: Frame #009 (select)
> [  194.144831] [U]
> [  194.146297] [U]      Video Capture: Captured 8 buffers
> [  194.151510] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
> [  194.189253] [U]      Video Output: Frame #002 (select)
> [  194.192994] [U]      Video Output: Frame #003 (select)
> [  194.196765] [U]      Video Output: Frame #004 (select)
> [  194.200932] [U]      Video Output: Frame #005 (select)
> [  194.204676] [U]      Video Output: Frame #006 (select)
> [  194.208846] [U]      Video Output: Frame #007 (select)
> [  194.212618] [U]      Video Output: Frame #008 (select)
> [  194.214580] [U]      Video Output: Frame #009 (select)
> [  194.215730] [U]
> [  194.217192] [U]      Video Capture: Captured 8 buffers
> [  194.222410] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
> [  194.226996] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  195.208033] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  195.211335] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
> [  195.214694] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  196.195051] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  196.198000] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
> [  196.201760] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  197.187625] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  197.192418] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
> [  197.205998] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  198.201823] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  198.205331] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
> [  198.209147] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  199.200108] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  199.203095] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
> [  199.320434] [U]      Video Output: Frame #002 (select)
> [  199.331236] [U]      Video Output: Frame #003 (select)
> [  199.341665] [U]      Video Output: Frame #004 (select)
> [  199.347031] [U]      Video Output: Frame #005 (select)
> [  199.352378] [U]      Video Output: Frame #006 (select)
> [  199.358615] [U]      Video Output: Frame #007 (select)
> [  199.363360] [U]      Video Output: Frame #008 (select)
> [  199.366138] [U]      Video Output: Frame #009 (select)
> [  199.367286] [U]
> [  199.369727] [U]      Video Capture: Captured 8 buffers
> [  199.382735] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
> [  199.483770] [U]      Video Output: Frame #002 (select)
> [  199.489043] [U]      Video Output: Frame #003 (select)
> [  199.493805] [U]      Video Output: Frame #004 (select)
> [  199.499082] [U]      Video Output: Frame #005 (select)
> [  199.503887] [U]      Video Output: Frame #006 (select)
> [  199.509167] [U]      Video Output: Frame #007 (select)
> [  199.513904] [U]      Video Output: Frame #008 (select)
> [  199.516589] [U]      Video Output: Frame #009 (select)
> [  199.517738] [U]
> [  199.519612] [U]      Video Capture: Captured 8 buffers
> [  199.526169] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
> [  199.610204] [U]      Video Output: Frame #002 (select)
> [  199.614310] [U]      Video Output: Frame #003 (select)
> [  199.619549] [U]      Video Output: Frame #004 (select)
> [  199.624324] [U]      Video Output: Frame #005 (select)
> [  199.629555] [U]      Video Output: Frame #006 (select)
> [  199.634317] [U]      Video Output: Frame #007 (select)
> [  199.639537] [U]      Video Output: Frame #008 (select)
> [  199.642094] [U]      Video Output: Frame #009 (select)
> [  199.643240] [U]
> [  199.644701] [U]      Video Capture: Captured 8 buffers
> [  199.651701] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
> [  199.734579] [U]      Video Output: Frame #002 (select)
> [  199.739783] [U]      Video Output: Frame #003 (select)
> [  199.744573] [U]      Video Output: Frame #004 (select)
> [  199.749801] [U]      Video Output: Frame #005 (select)
> [  199.754565] [U]      Video Output: Frame #006 (select)
> [  199.760306] [U]      Video Output: Frame #007 (select)
> [  199.764463] [U]      Video Output: Frame #008 (select)
> [  199.767129] [U]      Video Output: Frame #009 (select)
> [  199.768671] [U]
> [  199.770128] [U]      Video Capture: Captured 8 buffers
> [  199.776725] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
> [  199.860726] [U]      Video Output: Frame #002 (select)
> [  199.865549] [U]      Video Output: Frame #003 (select)
> [  199.870735] [U]      Video Output: Frame #004 (select)
> [  199.875558] [U]      Video Output: Frame #005 (select)
> [  199.880566] [U]      Video Output: Frame #006 (select)
> [  199.885390] [U]      Video Output: Frame #007 (select)
> [  199.890633] [U]      Video Output: Frame #008 (select)
> [  199.893191] [U]      Video Output: Frame #009 (select)
> [  199.894336] [U]
> [  199.895803] [U]      Video Capture: Captured 8 buffers
> [  199.902832] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
> [  199.942759] [U]      Video Output: Frame #002 (select)
> [  199.946516] [U]      Video Output: Frame #003 (select)
> [  199.950683] [U]      Video Output: Frame #004 (select)
> [  199.954398] [U]      Video Output: Frame #005 (select)
> [  199.958570] [U]      Video Output: Frame #006 (select)
> [  199.962304] [U]      Video Output: Frame #007 (select)
> [  199.966066] [U]      Video Output: Frame #008 (select)
> [  199.968022] [U]      Video Output: Frame #009 (select)
> [  199.969581] [U]
> [  199.971038] [U]      Video Capture: Captured 8 buffers
> [  199.975816] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
> [  200.013529] [U]      Video Output: Frame #002 (select)
> [  200.017282] [U]      Video Output: Frame #003 (select)
> [  200.021558] [U]      Video Output: Frame #004 (select)
> [  200.025307] [U]      Video Output: Frame #005 (select)
> [  200.030378] [U]      Video Output: Frame #006 (select)
> [  200.034117] [U]      Video Output: Frame #007 (select)
> [  200.037879] [U]      Video Output: Frame #008 (select)
> [  200.040251] [U]      Video Output: Frame #009 (select)
> [  200.041403] [U]
> [  200.042867] [U]      Video Capture: Captured 8 buffers
> [  200.047628] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
> [  200.085144] [U]      Video Output: Frame #002 (select)
> [  200.089329] [U]      Video Output: Frame #003 (select)
> [  200.093098] [U]      Video Output: Frame #004 (select)
> [  200.096844] [U]      Video Output: Frame #005 (select)
> [  200.100998] [U]      Video Output: Frame #006 (select)
> [  200.104759] [U]      Video Output: Frame #007 (select)
> [  200.108913] [U]      Video Output: Frame #008 (select)
> [  200.110872] [U]      Video Output: Frame #009 (select)
> [  200.112025] [U]
> [  200.113496] [U]      Video Capture: Captured 8 buffers
> [  200.118262] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
> [  200.155831] [U]      Video Output: Frame #002 (select)
> [  200.160021] [U]      Video Output: Frame #003 (select)
> [  200.163785] [U]      Video Output: Frame #004 (select)
> [  200.167532] [U]      Video Output: Frame #005 (select)
> [  200.171854] [U]      Video Output: Frame #006 (select)
> [  200.175597] [U]      Video Output: Frame #007 (select)
> [  200.179764] [U]      Video Output: Frame #008 (select)
> [  200.181727] [U]      Video Output: Frame #009 (select)
> [  200.182877] [U]
> [  200.184354] [U]      Video Capture: Captured 8 buffers
> [  200.189552] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
> [  200.226713] [U]      Video Output: Frame #002 (select)
> [  200.230895] [U]      Video Output: Frame #003 (select)
> [  200.234668] [U]      Video Output: Frame #004 (select)
> [  200.239766] [U]      Video Output: Frame #005 (select)
> [  200.243529] [U]      Video Output: Frame #006 (select)
> [  200.247253] [U]      Video Output: Frame #007 (select)
> [  200.251598] [U]      Video Output: Frame #008 (select)
> [  200.253548] [U]      Video Output: Frame #009 (select)
> [  200.254697] [U]
> [  200.256156] [U]      Video Capture: Captured 8 buffers
> [  200.261363] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
> [  200.266028] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  201.257011] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  201.260312] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
> [  201.263677] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  202.253784] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  202.256738] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
> [  202.260626] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  203.252427] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  203.256851] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
> [  203.269821] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  204.266713] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  204.270659] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
> [  204.274034] stm-dma2d 4002b000.dma2d: dma_alloc_coherent of size 2147323904 failed
> [  205.265063] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
> [  205.268019] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
> [  205.389607] [U]      Video Output: Frame #002 (select)
> [  205.393699] [U]      Video Output: Frame #003 (select)
> [  205.401589] [U]      Video Output: Frame #004 (select)
> [  205.411222] [U]      Video Output: Frame #005 (select)
> [  205.416545] [U]      Video Output: Frame #006 (select)
> [  205.421934] [U]      Video Output: Frame #007 (select)
> [  205.427680] [U]      Video Output: Frame #008 (select)
> [  205.430785] [U]      Video Output: Frame #009 (select)
> [  205.431939] [U]
> [  205.433409] [U]      Video Capture: Captured 8 buffers
> [  205.443284] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
> [  205.547396] [U]      Video Output: Frame #002 (select)
> [  205.553106] [U]      Video Output: Frame #003 (select)
> [  205.557856] [U]      Video Output: Frame #004 (select)
> [  205.563067] [U]      Video Output: Frame #005 (select)
> [  205.567939] [U]      Video Output: Frame #006 (select)
> [  205.573170] [U]      Video Output: Frame #007 (select)
> [  205.578047] [U]      Video Output: Frame #008 (select)
> [  205.581229] [U]      Video Output: Frame #009 (select)
> [  205.582360] [U]
> [  205.583814] [U]      Video Capture: Captured 8 buffers
> [  205.590802] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
> [  205.673784] [U]      Video Output: Frame #002 (select)
> [  205.680126] [U]      Video Output: Frame #003 (select)
> [  205.684166] [U]      Video Output: Frame #004 (select)
> [  205.689508] [U]      Video Output: Frame #005 (select)
> [  205.694186] [U]      Video Output: Frame #006 (select)
> [  205.699520] [U]      Video Output: Frame #007 (select)
> [  205.704031] [U]      Video Output: Frame #008 (select)
> [  205.706640] [U]      Video Output: Frame #009 (select)
> [  205.707786] [U]
> [  205.709661] [U]      Video Capture: Captured 8 buffers
> [  205.716234] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
> [  205.799699] [U]      Video Output: Frame #002 (select)
> [  205.804297] [U]      Video Output: Frame #003 (select)
> [  205.809609] [U]      Video Output: Frame #004 (select)
> [  205.814253] [U]      Video Output: Frame #005 (select)
> [  205.819548] [U]      Video Output: Frame #006 (select)
> [  205.824186] [U]      Video Output: Frame #007 (select)
> [  205.829483] [U]      Video Output: Frame #008 (select)
> [  205.832055] [U]      Video Output: Frame #009 (select)
> [  205.833181] [U]
> [  205.834645] [U]      Video Capture: Captured 8 buffers
> [  205.841668] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
> [  205.925108] [U]      Video Output: Frame #002 (select)
> [  205.930444] [U]      Video Output: Frame #003 (select)
> [  205.935130] [U]      Video Output: Frame #004 (select)
> [  205.940509] [U]      Video Output: Frame #005 (select)
> [  205.945191] [U]      Video Output: Frame #006 (select)
> [  205.950506] [U]      Video Output: Frame #007 (select)
> [  205.955182] [U]      Video Output: Frame #008 (select)
> [  205.957826] [U]      Video Output: Frame #009 (select)
> [  205.959371] [U]
> [  205.960829] [U]      Video Capture: Captured 8 buffers
> [  205.967428] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
> [  205.977020] [U] Total for stm-dma2d device /dev/video0: 121, Succeeded: 96, Failed: 25, Warnings: 0
> *** BLURB HERE ***
> 
> Dillon Min (8):
>   media: admin-guide: add stm32-dma2d description
>   media: dt-bindings: media: add document for STM32 DMA2d bindings
>   ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
>   ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
>   media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu
>     platform
>   media: v4l2-ctrls: Add RGB color effects control
>   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>     system enter shell
>   media: stm32-dma2d: STM32 DMA2D driver
> 
>  .../admin-guide/media/platform-cardlist.rst        |   1 +
>  .../devicetree/bindings/media/st,stm32-dma2d.yaml  |  71 ++
>  Documentation/userspace-api/media/v4l/control.rst  |   9 +
>  arch/arm/boot/dts/stm32f429.dtsi                   |  10 +
>  arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
>  drivers/clk/clk-stm32f4.c                          |   4 -
>  drivers/media/platform/Kconfig                     |   9 +
>  drivers/media/platform/Makefile                    |   1 +
>  drivers/media/platform/stm32/Makefile              |   2 +
>  drivers/media/platform/stm32/dma2d/dma2d-hw.c      | 143 ++++
>  drivers/media/platform/stm32/dma2d/dma2d-regs.h    | 113 ++++
>  drivers/media/platform/stm32/dma2d/dma2d.c         | 748 +++++++++++++++++++++
>  drivers/media/platform/stm32/dma2d/dma2d.h         | 135 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   2 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c             |  21 +
>  include/media/v4l2-mem2mem.h                       |   5 +
>  include/uapi/linux/v4l2-controls.h                 |   4 +-
>  17 files changed, 1277 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
> 

