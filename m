Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073F52B04FC
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 13:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbgKLMes (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 07:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgKLMes (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 07:34:48 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10952C0613D1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 04:34:48 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D36B71F4634A
Subject: Re: [PATCH v3 0/2] destage Rockchip ISP1 driver
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        dave.stevenson@raspberrypi.com
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20201106121937.1459948-1-helen.koike@collabora.com>
 <7eb69eee-996c-6efb-8bee-6276d16a61e3@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <6ff30595-16d0-590d-bb3b-7ff9f2e380d1@collabora.com>
Date:   Thu, 12 Nov 2020 09:34:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7eb69eee-996c-6efb-8bee-6276d16a61e3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/12/20 7:25 AM, Dafna Hirschfeld wrote:
> 
> 
> Am 06.11.20 um 13:19 schrieb Helen Koike:
>> Hello,
>>
>> Changes in v3:
>> - Moved Kconfig entry from M2M to Platform devices
>> - Rename description and comment to Parameters and Statistics.
>> - Patches squashed:
>> dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
>> media: MAINTAINERS: rkisp1: add path to dt-bindings
>> media: rockchip: rkisp1: destage Rockchip ISP1 driver
>> media: MAINTAINERS: Update rkisp1 files with new location
>>
>> Changes in v2:
>> - New patch updating MAINTAINERS file
>> - No changes in other patches
>>
>>> media-ctl -p
>> http://ix.io/2Cso
>>
>>> media-ctl --print-dot
>> http://ix.io/2Csp
>>
>>> v4l2-compliance -m0
>> http://ix.io/2Csk
> 
> Hello Dave,
> 
> I see the above link that the imx219 does not pass the compliance:
> 
> fail: v4l2-test-controls.cpp(830): failed to find event for control 'Exposure'
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> I see this patch on downstream
> "media: i2c: imx219: Declare that the driver can create events"
> 
> That adds the flag V4L2_SUBDEV_FL_HAS_EVENTS, I suspect that is the patch
> that fixes the compliance issue.
> 
> I can verify that and send the patch to the mailing list,
> is it ok with you?

Sure, thanks!

Helen

> 
> Thanks,
> Dafna
> 
> 
> 
>>
>>> v4l2-compliance -v -d /dev/video0 -s10
>> http://ix.io/2Csq
>>
>>> v4l2-compliance -v -d /dev/video1 -s10
>> http://ix.io/2Css
>>
>> Helen Koike (1):
>>    media: rockchip: rkisp1: destage Rockchip ISP1 driver
>>
>> Shunqian Zheng (1):
>>    media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format
>>
>>   .../bindings/media/rockchip-isp1.yaml         |  0
>>   .../media/v4l/pixfmt-meta-rkisp1.rst          |  2 +-
>>   MAINTAINERS                                   |  5 ++++-
>>   drivers/media/platform/Kconfig                | 18 ++++++++++++++++++
>>   drivers/media/platform/Makefile               |  1 +
>>   .../platform/rockchip}/rkisp1/Makefile        |  0
>>   .../rockchip}/rkisp1/rkisp1-capture.c         |  0
>>   .../platform/rockchip}/rkisp1/rkisp1-common.c |  0
>>   .../platform/rockchip}/rkisp1/rkisp1-common.h |  2 +-
>>   .../platform/rockchip}/rkisp1/rkisp1-dev.c    |  0
>>   .../platform/rockchip}/rkisp1/rkisp1-isp.c    |  0
>>   .../platform/rockchip}/rkisp1/rkisp1-params.c |  0
>>   .../platform/rockchip}/rkisp1/rkisp1-regs.h   |  0
>>   .../rockchip}/rkisp1/rkisp1-resizer.c         |  0
>>   .../platform/rockchip}/rkisp1/rkisp1-stats.c  |  0
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
>>   drivers/staging/media/Kconfig                 |  2 --
>>   drivers/staging/media/Makefile                |  1 -
>>   drivers/staging/media/rkisp1/Kconfig          | 19 -------------------
>>   drivers/staging/media/rkisp1/TODO             |  6 ------
>>   .../uapi/linux}/rkisp1-config.h               |  4 ----
>>   include/uapi/linux/videodev2.h                |  4 ++++
>>   22 files changed, 31 insertions(+), 35 deletions(-)
>>   rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (100%)
>>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
>>   delete mode 100644 drivers/staging/media/rkisp1/Kconfig
>>   delete mode 100644 drivers/staging/media/rkisp1/TODO
>>   rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (99%)
>>
