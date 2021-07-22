Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5803D22DF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 13:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhGVLDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 07:03:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60840 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhGVLDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 07:03:21 -0400
Received: from [IPv6:2a02:810a:880:f54:9b:291e:f55f:ae5f] (unknown [IPv6:2a02:810a:880:f54:9b:291e:f55f:ae5f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 531C51F440D5;
        Thu, 22 Jul 2021 12:43:55 +0100 (BST)
Subject: Re: [GIT PULL FOR v5.15] Various fixes
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, rick.chang@mediatek.com,
        Bin Liu <bin.liu@mediatek.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
References: <4d9b08ca-ec5e-b75f-514c-950d2c2abd64@xs4all.nl>
 <20210722083423.12dc646e@coco.lan>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <25e07ad2-26c9-eb5a-4296-37c2ef6f26b2@collabora.com>
Date:   Thu, 22 Jul 2021 13:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722083423.12dc646e@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.07.21 08:34, Mauro Carvalho Chehab wrote:
> Hi Hans,
> 
> Em Tue, 20 Jul 2021 15:34:22 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:
>>
>>    media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)
>>
>> are available in the Git repository at:
>>
>>    git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15a
>>
>> for you to fetch changes up to 8e8ee611c5aa4e1ddb6efd1395f1dd16e13eca98:
>>
>>    media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats (2021-07-20 15:17:45 +0200)
> 
> It seems you forgot to add your own SOB at the patches on this series!
> 
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Dafna Hirschfeld (3):
>>        media: mtk-jpeg: fix setting plane paylod

I am actually not 100% sure about this patch. I think it is better if the driver maintainers review it

>>        media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
>>        media: rkisp1: cap: initialize dma buf address in 'buf_init' cb
>>
>> Dan Carpenter (2):
>>        media: v4l2-subdev: fix some NULL vs IS_ERR() checks
>>        media: rockchip/rga: fix error handling in probe
>>
>> Evgeny Novikov (1):
>>        media: platform: stm32: unprepare clocks at handling errors in probe
>>
>> Fabio Estevam (3):
>>        dt-bindings: adv7180: Introduce the 'reset-gpios' property
>>        media: i2c: adv7180: Print the chip ID on probe
>>        dt-bindings: adv7180: Introduce 'adv,force-bt656-4' property
>>
>> Frieder Schrempf (1):
>>        media: adv7180: Add optional reset GPIO
>>
>> Hans Verkuil (1):
>>        media/cec-core.rst: update adap_enable doc
>>
>> Matthew Michilot (1):
>>        media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
>>
>> Pavel Skripkin (3):
>>        media: go7007: fix memory leak in go7007_usb_probe
>>        media: go7007: remove redundant initialization
>>        media: stkwebcam: fix memory leak in stk_camera_probe
>>
>> Philipp Zabel (1):
>>        media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats
>>
>> Tom Rix (1):
>>        media: ti-vpe: cal: fix indexing of cal->ctx[] in cal_probe()
>>
>>   Documentation/devicetree/bindings/media/i2c/adv7180.yaml |  8 ++++++
>>   Documentation/driver-api/media/cec-core.rst              |  9 ++++---
>>   drivers/media/cec/platform/stm32/stm32-cec.c             | 26 +++++++++++++------
>>   drivers/media/i2c/adv7180.c                              | 66 ++++++++++++++++++++++++++++++++++++++++++-----
>>   drivers/media/platform/coda/coda-bit.c                   | 18 +++++++++----
>>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c          | 20 +++++++-------
>>   drivers/media/platform/rcar-vin/rcar-v4l2.c              |  4 +--
>>   drivers/media/platform/rockchip/rga/rga.c                | 27 +++++++++++++++----
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 ++++++++-
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-common.h   |  6 +----
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c   |  3 +--
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c    |  6 ++---
>>   drivers/media/platform/ti-vpe/cal.c                      |  6 ++---
>>   drivers/media/platform/vsp1/vsp1_entity.c                |  4 +--
>>   drivers/media/usb/go7007/go7007-driver.c                 | 26 -------------------
>>   drivers/media/usb/go7007/go7007-usb.c                    |  2 +-
>>   drivers/media/usb/stkwebcam/stk-webcam.c                 |  6 +++--
>>   drivers/staging/media/tegra-video/vi.c                   |  4 +--
>>   18 files changed, 167 insertions(+), 86 deletions(-)
> 
> 
> 
> Thanks,
> Mauro
> 
