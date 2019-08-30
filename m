Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCE23A3F64
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 23:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfH3VGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 17:06:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55056 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbfH3VGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 17:06:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id k2so7266361wmj.4
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6JHAQ1Uk5UbFFdHI8qcQxJDUgbiHOpf5yDrxgceM8cE=;
        b=RmAAzFzgzyHH+7MRtvug7hXtAn7O455M2R41w+93MbvwMtqRFs5SaO6pa57Eb085I6
         W09BYE9SsFA43ZDQq4+8MM/6D8yyKQc41ZEoj6Ds1Y1X0RFhzesZHHGGNd6M0qzFuj+Y
         hr0ceZ3oVwvpeLIYDef+ew2MqyjRLUn/woGQu5JyWZ6y/ziMwJSnHu3C/2VdHz0r1I1J
         2vMjveFm+dRi6PF7Ul+y0R7OAAEG5ubvjQRQLz/+/FNHQNNkxmET0w5eKACaaZqQ24vA
         /7gaqxvmA5RNW6EUDpp9eEFgT0VAFz5bXVTK4MXrtFCinKrnPDTC9cquukiVKAqpDqQh
         PFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6JHAQ1Uk5UbFFdHI8qcQxJDUgbiHOpf5yDrxgceM8cE=;
        b=uoRyPWT2/R3/5k+H/ceTYWJ3CvZ82ExdxV7u+21lK9EznzZ2qC1cy73H7GY8+AtzT6
         OMicIl2iBHtNpytnIfonO04mOPY6aF6UdRpZA7rrf1R8iZ6ht9oZJ3Bjv7jh8VVCV3NZ
         kya43PoRxWGm1Czjz8bUDMiEtVIWUv5JA7kjDwpMxOc5MvI0zKRdzktpQv2Sf2j7H4Mv
         PhmuGP0oXINc0H6Q5kYhzUYXHdBFDh7iXYmlGKfLy7npsfUGG/oawRpZey5wXZIJ7hMf
         oD6eJexb+i6Z/3M6t/C39bzbPEE/mxCdqIphcwQ9QtvfvzfOSEPlqPhvckCdRn2m2Fck
         MhYg==
X-Gm-Message-State: APjAAAXe1NP8NWFjGLvJArH+DjXt2ic+vP5ojd1Pit5b8bqQJZGI0qcH
        8RDqIV8f0WxAel+xLXICYy4gSbSE
X-Google-Smtp-Source: APXvYqw0mXXeVA2Csiq68HEyOPiS9WNYs1r3k7k7OwKstOo7XK7XI2556ToLDQNu1RJhz7WNJPlsZQ==
X-Received: by 2002:a1c:6c0d:: with SMTP id h13mr19007613wmc.74.1567199158215;
        Fri, 30 Aug 2019 14:05:58 -0700 (PDT)
Received: from [172.30.88.166] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id z10sm3376990wrg.12.2019.08.30.14.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 14:05:57 -0700 (PDT)
Subject: Re: [PATCH 00/22] media: imx: Create media links in bound notifiers
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <b22199c2-c769-df1f-7ca2-335edc0869d2@gmail.com>
Date:   Fri, 30 Aug 2019 14:05:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Hans, etc.

Can you take a look at this series at some point? I think there's some 
good stuff in here.

Thanks,
Steve


On 8/5/19 4:34 PM, Steve Longerbeam wrote:
> This series moves media link creation into the notifier bound callbacks
> in the subdevices required by imx.
>
> But to support the media graph on imx, a few improvements first needed
> to be made to media core.
>
> The default behavior of media_entity_get_fwnode_pad() fails when
> the entity has multiple sink and/or source pads. Wrt imx, there are
> three such entities: the imx6/7 csi-2 receivers, and the video mux.
> All of those however have a 1:1 mapping from port numbers to pad
> indeces.
>
> So instead of implementing .get_fwnode_pad op for those entities,
> or any other entities now or in the future that have multiple
> source/sink pads, it is better to modify the default behavior
> of media_entity_get_fwnode_pad() to first determine if the port
> number at the provided endpoint firmware node corresponds to a
> valid pad for the provided entity. That way the default behavior
> will work for such entities that implement 1:1 mappings, without
> requiring they implement the .get_fwnode_pad op. In other words,
> the old behavior of media_entity_get_fwnode_pad() required entities
> implement .get_fwnode_pad if they have multiple sink or source pads.
> The new behavior requires entities implement .get_fwnode_pad _only_
> if they have multiple sink or source pads, _and_ do not have 1:1
> port:pad mappings.
>
> Also, as part of the above work, it was discovered that all of the
> current callers of media_entity_get_fwnode_pad() are not using that
> function correctly. In all but one case the driver passes the firmware
> node of the subdevice itself to the function, not one of its endpoint
> nodes as the function expects. In more detail:
>
>    - Cadence MIPI-CSI2 Receiver: Calls media_entity_get_fwnode_pad()
>      in the subdev bound notifier callback, but passes sd->fwnode to
>      the function. This is usually the fwnode of the subdevice itself,
>      not one of its endpoint nodes. This only works now because there
>      are no implementations of the .get_fwnode_pad op. This will break
>      as soon as the bound subdevice implements the .get_fwnode_pad op.
>
>    - ST Micro MIPID02 CSI-2: Calls media_entity_get_fwnode_pad() in the
>      subdev bound notifier callback. Same issue as cadence driver, passes
>      sd->fwnode.
>
>    - Allwinner V3s CSI: Calls media_entity_get_fwnode_pad() in the
>      completion notifier callback. Same issue as cadence driver, passes
>      sd->fwnode.
>
>    - Renesas R-Car MIPI CSI-2 Receiver: Calls media_entity_get_fwnode_pad()
>      in the subdev bound notifier callback. In this case the driver passes
>      the async subdev descriptor match fwnode. Again for most subdevices,
>      this is the fwnode of the subdevice itself, not one of its endpoint
>      nodes. However on the Salvator-X platform, the bound subdevice happens
>      to be the ADV748x CSI-2 transmitter, which does indeed place the
>      endpoint node in the asd match fwnode. But the problem is that the
>      driver is now making assumptions about what subdevices it is binding
>      to.
>
> To resolve the above issues, this series adds a new function
> media_create_fwnode_pad_links(), which creates the media links from/to
> all pads on a remote entity, to/from a single specific local entity pad,
> using the remote's endpoint fwnodes. It's API makes it convenient to call
> from subdev bound notifier callbacks.
>
> Another function media_create_fwnode_links() is added that will create
> links from/to all pads on a remote entity, to/from all pads on a local
> entity. It's API also makes it convenient to call from subdev bound
> notifier callbacks, and can be called for entities that link to remote
> entities via multiple pads (for example the video-mux which has multiple
> sink pads that link to multiple bound subdevices).
>
> This series has been tested on i.MX6 SabreSD, SabreLite, and SabreAuto
> platforms, and the Renesas Salvator-X platform.
>
> The series needs testing on i.MX7, Cadence, ST Micro MIPID02, and
> Allwinner V3s platforms. Testing only needs to verify that the media
> graph is unchanged, no stream testing is required. If the media graph
> is broken, it means the subdevice(s) that bind to the drivers listed
> above need to implement the .get_fwnode_pad op.
>
>
> Steve Longerbeam (22):
>    media: entity: Pass entity to get_fwnode_pad operation
>    media: entity: Modify default behavior of media_entity_get_fwnode_pad
>    media: entity: Convert media_entity_get_fwnode_pad() args to const
>    media: Move v4l2_fwnode_parse_link from v4l2 to driver base
>    media: entity: Add functions to convert fwnode endpoints to media
>      links
>    media: adv748x: csi2: Implement get_fwnode_pad
>    media: rcar-csi2: Fix fwnode media link creation
>    media: cadence: csi2rx: Fix fwnode media link creation
>    media: sun6i: Fix fwnode media link creation
>    media: st-mipid02: Fix fwnode media link creation
>    media: v4l2-fwnode: Pass notifier to
>      v4l2_async_register_fwnode_subdev()
>    media: video-mux: Create media links in bound notifier
>    media: imx: mipi csi-2: Create media links in bound notifier
>    media: imx7-mipi-csis: Create media links in bound notifier
>    media: imx7-media-csi: Create media links in bound notifier
>    media: imx: csi: Implement get_fwnode_pad
>    media: imx: csi: Embed notifier in struct csi_priv
>    media: imx: csi: Create media links in bound notifier
>    media: imx: csi: Lookup endpoint fwnode with
>      media_entity_get_fwnode_pad
>    media: imx: Add is_ipu_internal_subdev()
>    media: imx: Use media_create_fwnode_links for external links
>    media: imx: TODO: Remove issues regarding media link creation
>
>   drivers/base/property.c                       |  63 ++++++
>   drivers/media/i2c/adv748x/adv748x-csi2.c      |  21 ++
>   drivers/media/i2c/st-mipid02.c                |  20 +-
>   drivers/media/mc/mc-entity.c                  | 209 +++++++++++++++++-
>   drivers/media/platform/cadence/cdns-csi2rx.c  |  27 +--
>   drivers/media/platform/rcar-vin/rcar-csi2.c   |  23 +-
>   .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  36 +--
>   drivers/media/platform/video-mux.c            |  30 ++-
>   drivers/media/platform/xilinx/xilinx-vipp.c   |  69 +++---
>   drivers/media/v4l2-core/v4l2-fwnode.c         |  50 +----
>   drivers/staging/media/imx/TODO                |  29 ---
>   drivers/staging/media/imx/imx-media-csi.c     |  92 +++++---
>   .../staging/media/imx/imx-media-dev-common.c  |  49 ++--
>   drivers/staging/media/imx/imx-media-of.c      | 114 ----------
>   drivers/staging/media/imx/imx-media-utils.c   |  33 +++
>   drivers/staging/media/imx/imx-media.h         |  13 +-
>   drivers/staging/media/imx/imx6-mipi-csi2.c    |  29 ++-
>   drivers/staging/media/imx/imx7-media-csi.c    |  54 +++--
>   drivers/staging/media/imx/imx7-mipi-csis.c    |  30 ++-
>   include/linux/fwnode.h                        |  14 ++
>   include/linux/property.h                      |   5 +
>   include/media/media-entity.h                  |  99 ++++++++-
>   include/media/v4l2-fwnode.h                   |  56 +----
>   23 files changed, 721 insertions(+), 444 deletions(-)
>

