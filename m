Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4891A190E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 02:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgDHAFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 20:05:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45468 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgDHAFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 20:05:16 -0400
Received: from [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880] (unknown [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 688EF284F73;
        Wed,  8 Apr 2020 01:05:09 +0100 (BST)
Subject: Re: [PATCH v2 0/3] media: add v4l2_pipeline_stream_{enable,disable}
 helpers
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
References: <20200403213312.1863876-1-helen.koike@collabora.com>
 <20200407193615.GG1716317@oden.dyn.berto.se>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <4be824ea-61e2-4624-4880-fccb4ff804cd@collabora.com>
Date:   Tue, 7 Apr 2020 21:05:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407193615.GG1716317@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/7/20 4:36 PM, Niklas Söderlund wrote:
> Hi Helen,
> 
> On 2020-04-03 18:33:09 -0300, Helen Koike wrote:
>> Hi,
>>
>> Media drivers need to iterate through the pipeline and call .s_stream()
>> callbacks in the subdevices.
>>
>> Instead of repeating code, add helpers for this.
>>
>> These helpers will go walk through the pipeline only visiting entities
>> that participates in the stream, i.e. it follows links from sink to source
>> (and not the opposite).
>>
>> Which means that in a topology like this https://bit.ly/3b2MxjI
>> calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
>> .s_stream(true) for rkisp1_resizer_selfpath.
>>
>> stream_count variable was added in v4l2_subdevice to handle nested calls
>> to the helpers.
>> This is useful when the driver allows streaming from more then one
>> capture device sharing subdevices.
>>
>> This patch came from the error I was facing when multistreaming from
>> rkisp1 driver, where stoping one capture would call s_stream(false) in
>> the pipeline, causing a stall in the second capture device.
>>
>> Also, the vimc patch https://patchwork.kernel.org/patch/10948833/ won't
>> be required with this patchset.
>>
>> This patchset was tested on rkisp1 and vimc drivers.
> 
> I'm just curious, with this series applied can I stream simultaneously 
> on multiple video devises using vimc?

No, this patch only removes the requirement of patch 1/3 in the series
"vimc: Allow multiple capture devices to use the same sensor", since the counter
is being added in the core, so it won't be required to add it for each subdevice.
The other patches in that series are still required.


Regards,
Helen

> 
>>
>> Other cleanup might be possible (but I won't add in this patchset as I
>> don't have the hw to test):
>> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/qcom/camss/camss-video.c#n430
>> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/omap3isp/isp.c#n697
>> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/stm32/stm32-dcmi.c#n680
>> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/xilinx/xilinx-dma.c#n97
>>
>> Changes in V2:
>> ====================
>> The first version was calling the s_stream() callbacks from sensor to
>> capture.
>>
>> This was generating errors in the Scarlet Chromebook, when the sensor
>> was being enabled before the ISP.
>>
>> It make sense to enable subdevices from capture to sensor instead (which
>> is what most drivers do already).
>>
>> This v2 drops the changes from mc-entity.c, and re-implement helpers in
>> v4l2-common.c
>>
>> Overview of patches:
>> ====================
>>
>> Path 1/3 adds the helpers in v4l2-common.c, allowing nested calls by
>> adding stream_count in the subdevice struct.
>>
>> Patch 2/3 cleanup rkisp1 driver to use the helpers.
>>
>> Patch 3/3 cleanup vimc driver to use the helpers.
>>
>> Helen Koike (3):
>>   media: v4l2-common: add helper functions to call s_stream() callbacks
>>   media: staging: rkisp1: use v4l2_pipeline_stream_{enable,disable}
>>     helpers
>>   media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers
>>
>>  drivers/media/platform/vimc/vimc-capture.c    |  28 +++--
>>  drivers/media/platform/vimc/vimc-streamer.c   |  49 +-------
>>  drivers/media/v4l2-core/v4l2-common.c         | 117 ++++++++++++++++++
>>  drivers/staging/media/rkisp1/rkisp1-capture.c |  76 +-----------
>>  include/media/v4l2-common.h                   |  28 +++++
>>  include/media/v4l2-subdev.h                   |   2 +
>>  6 files changed, 173 insertions(+), 127 deletions(-)
>>
>> -- 
>> 2.26.0
>>
> 
