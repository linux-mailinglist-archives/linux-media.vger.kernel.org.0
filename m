Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD37814FEE7
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2020 20:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgBBTar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Feb 2020 14:30:47 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53319 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgBBTar (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Feb 2020 14:30:47 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so5312466pjc.3
        for <linux-media@vger.kernel.org>; Sun, 02 Feb 2020 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=r4glOnpfVMfe0WZeMEZH8LVU6FN79TCIdy0GCormVas=;
        b=O+pTEWVDZK9l4NW+4sSI5JnRq/nYSizaWTRvwAq9aR8GPUo661IsMpA3iWyo8Mx2qM
         48AmOaoKGMHNG61gppUehYxVpmzBdJyuPUdLeJ+Ep2i6zmTgGqJu3xYfclmVpRKujIqP
         1rB6wUCooPs0YgvUzUVEXM9S1JJbHCvzpnbbBZguQSYDiP96m5CRUV5qd6pPrtwZXrCv
         /njlXPIdzMXPsEVbB+sGIzpQY4MyP2se2rGOUDHkAJpq5s4jwrt2hzVjGUu4n0hUwg0c
         Di3/yi0JWwR1NqCFXJ2s9qauxTOrphb02tt9Q2ZeSBJbIU5GXOFM56zjFzqMJbeakYzj
         INFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=r4glOnpfVMfe0WZeMEZH8LVU6FN79TCIdy0GCormVas=;
        b=nelyJXgYko9NjImJNNS9SEDvSAj+Ku9Z1OAyGd2x8KlmwDTrD1Duu2cqHOhD7P2h6A
         aolN/YXfPaEdZH0/cIqgW2t6C+lBXegw7nV4apHXTDI4hm256+2z2oJxMw5l7DYAdjmI
         RtHNX8B9X/42uyaupVpiIL/8kchclwyKSwKP5CE2THO6CMf3IHIkV/4XcCFCGMs/0fMw
         uk+ICko4QtQPfMGVRmCvMkw6ikBTaUvLclTWEE13VHi424MZC2xJ5lEEkL65uBUTcLht
         sDbnez5gR0blwosAeecZ5/o4TRsYjeBTyqLzvAKDmOKPbAo52k1GBuJmucg/2C3no2Gx
         Y4JA==
X-Gm-Message-State: APjAAAWk7WIl3xKXIzXl0G+qSvERRTT5qm7xTjyHLgYR8iwSvor8EpRD
        SJa9V/1qQHbGTb6CY+d+f3Yz5k/K
X-Google-Smtp-Source: APXvYqyUm3wVuBZffatalqI6xtiojblmSmynMfk1HYbyEgTuE+bRik5TxqzN3JK4QzG714a2FfcV4g==
X-Received: by 2002:a17:90a:cb8c:: with SMTP id a12mr25741309pju.71.1580671846315;
        Sun, 02 Feb 2020 11:30:46 -0800 (PST)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id p17sm16908691pfn.31.2020.02.02.11.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2020 11:30:45 -0800 (PST)
Subject: Re: [PATCH v2 00/23] media: imx: Create media links in bound
 notifiers
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <CAHCN7xLo3oOHOXZD54PGy=g-mZM6gMjpXSsALKRWsdBN2JajFg@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <c28d749a-6693-ea61-9f14-b06f685acfec@gmail.com>
Date:   Sun, 2 Feb 2020 11:30:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLo3oOHOXZD54PGy=g-mZM6gMjpXSsALKRWsdBN2JajFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On 12/16/19 9:20 AM, Adam Ford wrote:
> On Sun, Nov 24, 2019 at 1:08 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>> Move media link creation into the notifier bound callbacks in the
>> subdevices required by imx, making use of media_entity_get_fwnode_pad().
>>
>> In the process, improve the behavior of media_entity_get_fwnode_pad().
>> The function is also being used inconsistently by current callers, so
>> that is fixed in this serieas as well.
>>
>> The default behavior of media_entity_get_fwnode_pad() fails when
>> the entity has multiple sink and/or source pads. Wrt imx, there are
>> two such entities: the imx6 csi-2 receiver, and the video mux.
>>
>> Modify the default behavior of media_entity_get_fwnode_pad() to first
>> determine if the port number at the provided endpoint firmware node
>> corresponds to a valid pad for the entity. That way the default behavior
>> will work for any entities that implement 1:1 mappings, without requiring
>> they implement the .get_fwnode_pad op.
>>
>> In other words, the old behavior of media_entity_get_fwnode_pad() required
>> entities implement .get_fwnode_pad if they have multiple sink or source pads.
>> The new behavior requires entities implement .get_fwnode_pad only if they
>> have multiple sink or source pads, and do not have 1:1 port:pad mappings.
>>
>> Also, as part of the above work, it was discovered that all of the
>> current callers of media_entity_get_fwnode_pad() are not using that
>> function in a consistent way. In all but one case the driver passes the
>> firmware node of the subdevice itself to the function, not one of it
>> endpoint nodes as the function expects. In more detail:
>>
>>    - Cadence MIPI-CSI2 Receiver,
>>    - ST Micro MIPID02 CSI-2,
>>    - Allwinner V3s CSI,
>>    - Allwinner A10 CSI,
>>    - STM32 DCMI:
>>      These drivers call media_entity_get_fwnode_pad() in the subdev bound
>>      notifier callback, but passes sd->fwnode to the function. This is
>>      usually the fwnode of the subdevice itself, not one of its endpoint
>>      nodes. This only works now because there are no implementations of the
>>      .get_fwnode_pad op. This will break as soon as the bound subdevice
>>      implements the .get_fwnode_pad op.
>>
>>    - Renesas R-Car MIPI CSI-2 Receiver:
>>      Calls media_entity_get_fwnode_pad() in the subdev bound notifier
>>      callback. In this case the driver passes the async subdev descriptor
>>      match fwnode. Again for most subdevices, this is the fwnode of the
>>      subdevice itself, not one of its endpoint nodes. However on the
>>      Salvator-X platform, the bound subdevice happens to be the ADV748x
>>      CSI-2 transmitter, which does indeed place the endpoint node in the
>>      asd match fwnode. But the problem is that the driver is now making
>>      assumptions about what subdevices it is binding to.
>>
>> To resolve the above issues, this series adds a new function
>> media_create_fwnode_pad_links(), which creates the media links from/to
>> all pads on a remote entity, to/from a single specific local entity pad,
>> using the fwnode endpoint connections between them. It's API makes it
>> convenient to call from subdev bound notifier callbacks.
>>
>> Another function media_create_fwnode_links() is added that will create
>> links from/to all pads on a remote entity, to/from all pads on a local
>> entity. It's API also makes it convenient to call from subdev bound
>> notifier callbacks, and can be called for entities that link to remote
>> entities via multiple pads (for example the video-mux which has multiple
>> sink pads that link to multiple bound subdevices).
>>
>> This series has been tested on i.MX6Q SabreSD, SabreLite, and SabreAuto
>> platforms, and the Renesas Salvator-X platform.
>>
>> The series needs testing on i.MX7, Cadence, ST Micro MIPID02, STM32 DCMI,
>> and Allwinner V3s and A10 platforms. Testing only needs to verify that the
>> media graph is unchanged, no stream testing is required. If the media graph
>> is broken, it means the subdevice(s) that bind to the drivers listed
>> above need to implement the .get_fwnode_pad op.
>>
>> History:
>>
>> v2:
>> - rename/move the notifier-to-state inlines in imx7-mipi-csis.c and
>>    imx7-media-csi.c, suggested by Rui Silva.
>> - rewrite imx_media_create_links() to only add the missing media links
>>    from the imx6 MIPI CSI-2 receiver.
>>
> I finally got around to testing the whole series on my i.MX6Q device
> with a ov5640 sensor.
>
> I get some error messages, and I was hoping you might have some ideas
> or suggestion on what might be happening.
>
>
> # gst-launch-1.0 -v v4l2src device=/dev/video4 ! kmssink name=imx-drm connector-
> id=54 sync=0
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> /GstPipeline:pipeline0/GstKMSSink:imx-drm: display-width = 1920
> /GstPipeline:pipeline0/GstKMSSink:imx-drm: display-height = 1080
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> video/x-raw, format=(string)YUY2, width=(int)640, height=(int)480,
> framerate=(fraction)30/1, colorimetry[  260.606952] ipu2_csi0:
> pipeline start failed with -32
> =(string)bt601, interlace-mode=(string)progressive
> /GstPipeline:pipeline0/GstKMSSink:imx-drm.GstPad:sink: caps =
> video/x-raw, format=(string)YUY2, width=(int)640, height=(int)480,
> framerate=(fraction)30/1, colorimetry=(string)bt601,
> interlace-mode=(string)progressive
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> gstv4l2src.c(658): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.038167333
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> I visually verified my pipeline and tried to setup the video format
> for each node in the pipeline:
>
>   media-ctl --links "'ov5640 2-0010':0->'imx6-mipi-csi2':0[1]"
>   media-ctl --links "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
>   media-ctl --links "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
>   media-ctl --links "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"
>
>   media-ctl --set-v4l2 "'ov5640 2-0010':0[fmt:UYVY2X8/640x480 field:none]"
>   media-ctl --set-v4l2 "'imx6-mipi-csi2':0[fmt:UYVY2X8/640x480 field:none]"
>   media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY2X8/640x480 field:none]"
>   media-ctl --set-v4l2 "'ipu1_csi0_mux':0[fmt:UYVY2X8/640x480 field:none]"
>   media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY2X8/640x480 field:none]"
>   media-ctl --set-v4l2 "'ipu1_csi0':0[fmt:UYVY2X8/640x480 field:none]"
>   media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/640x480 field:none]"
>
>
> I don't see any missing entries in the pipeline, so I was hoping you
> might have some suggestions.

I tried the exactly equivalent pipeline on quad SabreSD and don't see 
any issue. But from your

ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed to allocate required memory.


it may be that you're platform was not able to allocate the buffer pools.


Steve

>
>> Steve Longerbeam (23):
>>    media: entity: Pass entity to get_fwnode_pad operation
>>    media: entity: Modify default behavior of media_entity_get_fwnode_pad
>>    media: entity: Convert media_entity_get_fwnode_pad() args to const
>>    media: Move v4l2_fwnode_parse_link from v4l2 to driver base
>>    media: entity: Add functions to convert fwnode endpoints to media
>>      links
>>    media: adv748x: csi2: Implement get_fwnode_pad
>>    media: rcar-csi2: Fix fwnode media link creation
>>    media: cadence: csi2rx: Fix fwnode media link creation
>>    media: sun6i: Fix fwnode media link creation
>>    media: st-mipid02: Fix fwnode media link creation
>>    media: stm32-dcmi: Fix fwnode media link creation
>>    media: sunxi: Fix fwnode media link creation
>>    media: v4l2-fwnode: Pass notifier to
>>      v4l2_async_register_fwnode_subdev()
>>    media: video-mux: Create media links in bound notifier
>>    media: imx: mipi csi-2: Create media links in bound notifier
>>    media: imx7-mipi-csis: Create media links in bound notifier
>>    media: imx7-media-csi: Create media links in bound notifier
>>    media: imx: csi: Implement get_fwnode_pad
>>    media: imx: csi: Embed notifier in struct csi_priv
>>    media: imx: csi: Create media links in bound notifier
>>    media: imx: csi: Lookup upstream endpoint with
>>      imx_media_get_pad_fwnode
>>    media: imx: Create missing links from CSI-2 receiver
>>    media: imx: TODO: Remove media link creation todos
>>
>>   drivers/base/property.c                       |  63 ++++++
>>   drivers/media/i2c/adv748x/adv748x-csi2.c      |  21 ++
>>   drivers/media/i2c/st-mipid02.c                |  20 +-
>>   drivers/media/mc/mc-entity.c                  | 209 +++++++++++++++++-
>>   drivers/media/platform/cadence/cdns-csi2rx.c  |  27 +--
>>   drivers/media/platform/rcar-vin/rcar-csi2.c   |  23 +-
>>   drivers/media/platform/stm32/stm32-dcmi.c     |  15 +-
>>   .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  27 +--
>>   .../platform/sunxi/sun4i-csi/sun4i_csi.h      |   1 -
>>   .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  36 +--
>>   drivers/media/platform/video-mux.c            |  30 ++-
>>   drivers/media/platform/xilinx/xilinx-vipp.c   |  69 +++---
>>   drivers/media/v4l2-core/v4l2-fwnode.c         |  50 +----
>>   drivers/staging/media/imx/TODO                |  29 ---
>>   drivers/staging/media/imx/imx-media-csi.c     |  92 +++++---
>>   .../staging/media/imx/imx-media-dev-common.c  |  60 ++---
>>   drivers/staging/media/imx/imx-media-of.c      | 114 ----------
>>   drivers/staging/media/imx/imx-media-utils.c   |  33 +++
>>   drivers/staging/media/imx/imx-media.h         |   5 +-
>>   drivers/staging/media/imx/imx6-mipi-csi2.c    |  29 ++-
>>   drivers/staging/media/imx/imx7-media-csi.c    |  55 +++--
>>   drivers/staging/media/imx/imx7-mipi-csis.c    |  30 ++-
>>   include/linux/fwnode.h                        |  14 ++
>>   include/linux/property.h                      |   5 +
>>   include/media/media-entity.h                  |  99 ++++++++-
>>   include/media/v4l2-fwnode.h                   |  56 +----
>>   26 files changed, 735 insertions(+), 477 deletions(-)
>>
>> --
>> 2.17.1
>>

