Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C19B4BB7A4
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 12:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbiBRLGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 06:06:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbiBRLGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 06:06:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF592944C3;
        Fri, 18 Feb 2022 03:05:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4979DB825D5;
        Fri, 18 Feb 2022 11:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E038BC340E9;
        Fri, 18 Feb 2022 11:05:52 +0000 (UTC)
Message-ID: <8fc62c9a-4c36-41ab-2551-998962fdfa04@xs4all.nl>
Date:   Fri, 18 Feb 2022 12:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC v2 0/8] Move HEVC stateless controls out of staging
Content-Language: en-US
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, jonas@kwiboo.se, nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com, knaerzche@gmail.com, jc@kynesim.co.uk
References: <20220215110103.241297-1-benjamin.gaignard@collabora.com>
 <d33e96db-8cd0-08a5-7e73-742187ea6de5@xs4all.nl>
 <8ea4b561-2d46-3d40-73a1-2fe4d92c095d@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8ea4b561-2d46-3d40-73a1-2fe4d92c095d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/02/2022 11:54, Benjamin Gaignard wrote:
> 
> Le 18/02/2022 à 10:59, Hans Verkuil a écrit :
>> Hi Benjamin,
>>
>> On 15/02/2022 12:00, Benjamin Gaignard wrote:
>>> This series aims to make HEVC uapi stable and usable for hardware
>>> decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
>>> and 2 out of the tree drivers (rkvdec and RPI).
>>>
>>> The 3 first patches are from Hans to implement v4l2 dynamic control
>>> feature which is need by patch 7 for V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET
>>> definition.
>>>
>>> Patch 4 move the existing uapi to stable, including definitions renaming
>>> and CID number change to fit with v4l2 naming.
>>>
>>> Patches 5 and 7 add fields needed for rkvdec and RPI decoders.
>>>
>>> Patches 6 is cleaning up the uapi of useless field.
>>> Patches 8 change one field description and name to define offset by
>>> bytes rather than by bits
>> I have some housekeeping questions:
>>
>> I have several older HEVC-related patches from you, which of those are still
>> valid?
>>
>> "[v4,0/9] Additional features for Hantro HEVC":
>> https://patchwork.linuxtv.org/project/linux-media/cover/20210625141143.577998-1-benjamin.gaignard@collabora.com/
>>
>> "media: hevc: fix pictures lists type":
>> https://patchwork.linuxtv.org/project/linux-media/patch/20210823082949.237716-1-benjamin.gaignard@collabora.com/
>>
>> "media: hantro: Trace hevc hw cycles performance register":
>> https://patchwork.linuxtv.org/project/linux-media/patch/20210823135606.633052-1-benjamin.gaignard@collabora.com/
>>
>> "media: hantro: Add support of compressed reference buffers"
>> https://patchwork.linuxtv.org/project/linux-media/patch/20210823162916.824336-1-benjamin.gaignard@collabora.com/
>>
>> Before moving the HEVC API out of staging I would prefer to have any remaining
>> issues fixed. So one series that adds any remaining fixes (i.e. from the older patches
>> mentioned above), and a second series on top that moves it out of staging.
> 
> Hi Hans,
> 
> They are all related to Hantro diver and, after post-proc patches, the internal driver design
> has change so they won't apply anymore. You can discard them.

OK, I'll mark them as Obsoleted.

> HEVC UAPI migration isn't not impacted by these patches.
> My plan is a finish the HEVC UAPI first, send patches to add features (compression, 10bits, scaling)
> to Hantro driver and finally move it out of staging too.
> If possible I would like to not make HEVC UAPI topic depends of Hantro features.
> 
> Does that makes sense for you ?

Well, only if you are absolutely certain that those features won't impact the uAPI.
The easiest way to do that is to implement them and show that it doesn't :-)

That's really my main concern: that those additions require uAPI changes.

Looking over those patches it appears that this is the only one touching on
the uAPI:

"media: hevc: fix pictures lists type":
https://patchwork.linuxtv.org/project/linux-media/patch/20210823082949.237716-1-benjamin.gaignard@collabora.com/

I haven't read all the comments in details, but it is something that needs to
be clarified.

Regards,

	Hans

> 
> Regards,
> Benjamin
> 
>>
>> That way I can mark the older patches as Superseded, and we have a
>> fresh series that we can discuss.
>>
>> Regards,
>>
>>     Hans
>>
>>> Benjamin
>>>
>>> Benjamin Gaignard (5):
>>>    media: uapi: Move HEVC stateless controls out of staging
>>>    media: uapi: Add fields needed for RKVDEC driver
>>>    media: uapi: Remove bit_size field from v4l2_ctrl_hevc_slice_params
>>>    media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET control
>>>    media: uapi: Change data_bit_offset definition
>>>
>>> Hans Verkuil (3):
>>>    videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>>>    v4l2-ctrls: add support for dynamically allocated arrays.
>>>    vivid: add dynamic array test control
>>>
>>>   .../userspace-api/media/drivers/hantro.rst    |   5 -
>>>   .../media/v4l/ext-ctrls-codec.rst             |  58 ++--
>>>   .../media/v4l/vidioc-queryctrl.rst            |   8 +
>>>   .../media/test-drivers/vivid/vivid-ctrls.c    |  15 ++
>>>   drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 ++++++--
>>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     | 182 ++++++++++---
>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  32 +--
>>>   drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
>>>   drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
>>>   drivers/staging/media/hantro/hantro_drv.c     |  27 +-
>>>   drivers/staging/media/hantro/hantro_hevc.c    |   8 +-
>>>   drivers/staging/media/sunxi/cedrus/cedrus.c   |  24 +-
>>>   .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
>>>   .../staging/media/sunxi/cedrus/cedrus_h265.c  |  13 +-
>>>   include/linux/hantro-media.h                  |  17 ++
>>>   include/media/hevc-ctrls.h                    | 250 ------------------
>>>   include/media/v4l2-ctrls.h                    |  48 +++-
>>>   include/uapi/linux/v4l2-controls.h            | 224 ++++++++++++++++
>>>   include/uapi/linux/videodev2.h                |   8 +
>>>   19 files changed, 640 insertions(+), 408 deletions(-)
>>>   create mode 100644 include/linux/hantro-media.h
>>>   delete mode 100644 include/media/hevc-ctrls.h
>>>

