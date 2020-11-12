Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6132B02AB
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 11:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgKLKZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 05:25:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59638 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgKLKZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 05:25:49 -0500
Received: from [IPv6:2003:c7:cf0a:2300:85f8:bedb:3423:44d5] (p200300c7cf0a230085f8bedb342344d5.dip0.t-ipconnect.de [IPv6:2003:c7:cf0a:2300:85f8:bedb:3423:44d5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A98311F4624B;
        Thu, 12 Nov 2020 10:25:39 +0000 (GMT)
Subject: Re: [PATCH v3 0/2] destage Rockchip ISP1 driver
To:     dave.stevenson@raspberrypi.com
References: <20201106121937.1459948-1-helen.koike@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Message-ID: <7eb69eee-996c-6efb-8bee-6276d16a61e3@collabora.com>
Date:   Thu, 12 Nov 2020 11:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106121937.1459948-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 06.11.20 um 13:19 schrieb Helen Koike:
> Hello,
> 
> Changes in v3:
> - Moved Kconfig entry from M2M to Platform devices
> - Rename description and comment to Parameters and Statistics.
> - Patches squashed:
> dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
> media: MAINTAINERS: rkisp1: add path to dt-bindings
> media: rockchip: rkisp1: destage Rockchip ISP1 driver
> media: MAINTAINERS: Update rkisp1 files with new location
> 
> Changes in v2:
> - New patch updating MAINTAINERS file
> - No changes in other patches
> 
>> media-ctl -p
> http://ix.io/2Cso
> 
>> media-ctl --print-dot
> http://ix.io/2Csp
> 
>> v4l2-compliance -m0
> http://ix.io/2Csk

Hello Dave,

I see the above link that the imx219 does not pass the compliance:

fail: v4l2-test-controls.cpp(830): failed to find event for control 'Exposure'
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

I see this patch on downstream
"media: i2c: imx219: Declare that the driver can create events"

That adds the flag V4L2_SUBDEV_FL_HAS_EVENTS, I suspect that is the patch
that fixes the compliance issue.

I can verify that and send the patch to the mailing list,
is it ok with you?

Thanks,
Dafna



> 
>> v4l2-compliance -v -d /dev/video0 -s10
> http://ix.io/2Csq
> 
>> v4l2-compliance -v -d /dev/video1 -s10
> http://ix.io/2Css
> 
> Helen Koike (1):
>    media: rockchip: rkisp1: destage Rockchip ISP1 driver
> 
> Shunqian Zheng (1):
>    media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format
> 
>   .../bindings/media/rockchip-isp1.yaml         |  0
>   .../media/v4l/pixfmt-meta-rkisp1.rst          |  2 +-
>   MAINTAINERS                                   |  5 ++++-
>   drivers/media/platform/Kconfig                | 18 ++++++++++++++++++
>   drivers/media/platform/Makefile               |  1 +
>   .../platform/rockchip}/rkisp1/Makefile        |  0
>   .../rockchip}/rkisp1/rkisp1-capture.c         |  0
>   .../platform/rockchip}/rkisp1/rkisp1-common.c |  0
>   .../platform/rockchip}/rkisp1/rkisp1-common.h |  2 +-
>   .../platform/rockchip}/rkisp1/rkisp1-dev.c    |  0
>   .../platform/rockchip}/rkisp1/rkisp1-isp.c    |  0
>   .../platform/rockchip}/rkisp1/rkisp1-params.c |  0
>   .../platform/rockchip}/rkisp1/rkisp1-regs.h   |  0
>   .../rockchip}/rkisp1/rkisp1-resizer.c         |  0
>   .../platform/rockchip}/rkisp1/rkisp1-stats.c  |  0
>   drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
>   drivers/staging/media/Kconfig                 |  2 --
>   drivers/staging/media/Makefile                |  1 -
>   drivers/staging/media/rkisp1/Kconfig          | 19 -------------------
>   drivers/staging/media/rkisp1/TODO             |  6 ------
>   .../uapi/linux}/rkisp1-config.h               |  4 ----
>   include/uapi/linux/videodev2.h                |  4 ++++
>   22 files changed, 31 insertions(+), 35 deletions(-)
>   rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (100%)
>   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
>   delete mode 100644 drivers/staging/media/rkisp1/Kconfig
>   delete mode 100644 drivers/staging/media/rkisp1/TODO
>   rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (99%)
> 
