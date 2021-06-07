Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4931739DB12
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 13:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhFGLWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 07:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhFGLWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 07:22:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158DCC061766;
        Mon,  7 Jun 2021 04:20:43 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d] (unknown [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B526E1F42359;
        Mon,  7 Jun 2021 12:20:39 +0100 (BST)
Subject: Re: [PATCH 0/8] Additional features for Hantro HEVC
To:     Ezequiel Garcia <ezequiel@collabora.com>, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
 <d0e28e5b7ca686162116148c2b94a8e19520bc1b.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <74858817-e122-4731-3163-ed20c8b9df33@collabora.com>
Date:   Mon, 7 Jun 2021 13:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d0e28e5b7ca686162116148c2b94a8e19520bc1b.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 04/06/2021 à 18:49, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> Thanks for posting this so quickly.
>
> On Fri, 2021-06-04 at 15:06 +0200, Benjamin Gaignard wrote:
>> Basic HEVC support has been added to Hantro driver in this pull request:
>> https://www.spinics.net/lists/linux-media/msg193744.html
>>
>> Thanks to that it is now possible to support more features for this driver.
>>
>> The first patch allow to log the hardware performance per macroblock.
>> The second patch makes the driver use compressed reference frames to
>> reduce memory bandwidth consumption.
> As I commented, it would be nice to do some measurements here

The performances measured by the first patch (the number of macroblock per cycle) remain
the same because the goal of using compressed frames is to save memory bandwidth.
That doesn't impact what is measure by the Hantro hardware block itself.
To give you an example that is the result of decoding one of the fluster reference file.

gst-launch-1.0 filesrc location=AMP_A_Samsung_7.hevc ! h265parse ! v4l2slh265dec ! fakesink

cat /sys/kernel/debug/tracing/trace
#
# entries-in-buffer/entries-written: 17/17   #P:4
#
#                                _-----=> irqs-off
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
           <idle>-0       [000] d.h1   143.745124: hantro_hevc_perf: minor = 1,      180 cycles / mb
           <idle>-0       [000] d.h1   143.758086: hantro_hevc_perf: minor = 1,      172 cycles / mb
           <idle>-0       [000] d.h1   143.770829: hantro_hevc_perf: minor = 1,      167 cycles / mb
           <idle>-0       [000] d.h1   143.782757: hantro_hevc_perf: minor = 1,      166 cycles / mb
           <idle>-0       [000] d.h1   143.794866: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.808012: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.818225: hantro_hevc_perf: minor = 1,      166 cycles / mb
           <idle>-0       [000] d.h1   143.828063: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.838217: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.848728: hantro_hevc_perf: minor = 1,      172 cycles / mb
           <idle>-0       [000] d.h1   143.858677: hantro_hevc_perf: minor = 1,      167 cycles / mb
           <idle>-0       [000] d.h1   143.868576: hantro_hevc_perf: minor = 1,      166 cycles / mb
           <idle>-0       [000] d.h1   143.878431: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.888684: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.898827: hantro_hevc_perf: minor = 1,      166 cycles / mb
           <idle>-0       [000] d.h1   143.908645: hantro_hevc_perf: minor = 1,      165 cycles / mb
           <idle>-0       [000] d.h1   143.918772: hantro_hevc_perf: minor = 1,      165 cycles / mb

>
>> Patches 3 to 5 allow to decode and produce 10-bits P010 frames.
> I suppose this means that some 10-bit test vectors in Fluster HEVC
> test suite are now passing?
>
>> Patch 6 make usage of G2 post processor to scale down the frames.
>> Patches 7 and 8 add the support of HEVC scaling matrix by adding a new
>> control.
>>
> Ditto, the test vectors with scaling lists should now pass, any chance
> you post the test suite run before and after this series, just for reference?

Files like SLIST_A_Sony_5, SLIST_B_Sony_9, SLIST_C_Sony_4, SLIST_D_Sony_9 or
DBLK_A_MAIN10_VIXS_4 are now decoded by the driver.

fluster score is 70/147.
I think it could be better but, in few cases, it seems that the last frames
isn't retrieved by the userland stack but that need to be verify and debug
in an other series ;-)

Benjamin

>
> Thanks again,
> Ezequiel
>
>> All these patches enhance the HEVC support for Hantro (G2) hardware.
>> Unluckily they almost all touch the same pieces of code, where buffer
>> size, offset and addresses are set, so they have to be in this order.
>> They depend of the series pushed in this pull request:
>> https://www.spinics.net/lists/linux-media/msg193744.html
>>
>> Benjamin
>>
>> Benjamin Gaignard (8):
>>    media: hantro: Trace hevc hw cycles performance register
>>    media: hantro: Add support of compressed reference buffers
>>    media: hantro: hevc: Allow 10-bits encoded streams
>>    media: Add P010 video format
>>    media: hantro: hevc: Allow to produce 10-bit frames
>>    media: hantro: enumerate scaled output formats
>>    media: hevc: Add scaling matrix control
>>    media: hantro: Add scaling lists feature
>>
>>   .../media/v4l/ext-ctrls-codec.rst             |  45 +++++
>>   .../media/v4l/pixfmt-yuv-planar.rst           |   8 +
>>   .../media/v4l/vidioc-queryctrl.rst            |   6 +
>>   drivers/media/v4l2-core/v4l2-common.c         |   1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     |   6 +
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   4 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>>   drivers/staging/media/hantro/hantro.h         |   4 +
>>   drivers/staging/media/hantro/hantro_drv.c     |  32 +++-
>>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 175 ++++++++++++++++--
>>   drivers/staging/media/hantro/hantro_g2_regs.h |  12 ++
>>   drivers/staging/media/hantro/hantro_hevc.c    |  60 +++++-
>>   drivers/staging/media/hantro/hantro_hw.h      |   7 +
>>   drivers/staging/media/hantro/hantro_v4l2.c    |  10 +-
>>   drivers/staging/media/hantro/imx8m_vpu_hw.c   |   6 +
>>   drivers/staging/media/hantro/trace.h          |  40 ++++
>>   include/media/hevc-ctrls.h                    |  11 ++
>>   include/uapi/linux/videodev2.h                |   1 +
>>   18 files changed, 407 insertions(+), 22 deletions(-)
>>   create mode 100644 drivers/staging/media/hantro/trace.h
>>
>
