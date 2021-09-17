Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8815E40F065
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 05:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243964AbhIQD3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 23:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbhIQD3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 23:29:36 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA42C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 20:28:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d42so5451029lfv.10
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 20:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gjv2HeYE57kIcDMfqRZm5PHUioM6h8++UzjAgDIu0yg=;
        b=PBT2LR/aZSe4my27hRK5DRn2Cs2+TP/oa2m2GqxAjxzDzQIRarazbM8W6urunZISi+
         Z3KnU9jrIdJDDcsSvpKHzKTNG/vXMf1xeATisFT/gej70uWT5XNEZS5EeYsL8rVG4aEl
         VPbKbhp7HoTjq58Bjzm9dGToKo8iEensi5CErzOgF0LLmlOUrqbdUS4T2sI2zORVq3uS
         9tTNUBjzxiNMFh0R4eb05uN8HBrn1igHZq+rGtARPkOHwowzVghlzM3e/Yvo/28V6Ixm
         OlwIAJ15qkCbee18C4xwPYoTnH9F5ZHpSNWrOsOwlRJlmycvYB3VmCeK8gyvxdJvmcJW
         1R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gjv2HeYE57kIcDMfqRZm5PHUioM6h8++UzjAgDIu0yg=;
        b=cs+y0YIPONaS2DooN2nVPrQ0LODRbSw28tRhabOGbzUHHj1W8Rmepw9NPCnDSbcHwq
         GtkrqTTFwbPNu1ohgnAXaatxeqc2alLnebKsXVD9VbhCIfcHlM2a1NBKiNIzQrUwL45n
         Hxb8Bv0+DUivd1krdXDZJxkC8KfcmxL1dALtTYQ/tB4Yh3uF0DJsKnzIqU1Pv9vvMojQ
         fNhI2Acko7I26DDqUPJrNmh8Q/LaiPaBoXjuQVdZgkAUK3jIdSjP+ExYnxixe8mb2CiK
         VZbUKOBMp/6I3ytgqFeC7D3va8ILb+ySbQsAKKmSXGI/ke8vayglcdruqO0b3UFzF+j/
         5M6A==
X-Gm-Message-State: AOAM532SVMkXYhUneW77urPCWd6ePeJeMKeCNUruLeznsIwEY3q15PBb
        1Fp288XQetY2DqRbhrloynu7GSQDEidKRihuifYntfhT1G4=
X-Google-Smtp-Source: ABdhPJwxaVJMRM/pz0TyTKGslxKxB/N79S2296QFk9fGAJDOFeaVn7M82Gx8+p2i68GJGF3cHtOJKdTWP7IOMq4rjAE=
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr6799517lfq.79.1631849293119;
 Thu, 16 Sep 2021 20:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210827130150.909695-1-festevam@gmail.com> <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
 <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
 <CAOMZO5BzK5VtRUn7rqb+b84HoyiDy34e35aJ196J0TpCvL4vtA@mail.gmail.com>
 <CE93P5UJVABP.3TTVALU1H36DR@arch-thunder> <CAOMZO5C0NtrYxa-45ma-MoSKqzbdbiSO-2riXJnaH8eC2ZjnXg@mail.gmail.com>
 <CEBNF9DXWSZV.8SKHYF4QGS18@arch-thunder>
In-Reply-To: <CEBNF9DXWSZV.8SKHYF4QGS18@arch-thunder>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 17 Sep 2021 00:28:01 -0300
Message-ID: <CAOMZO5Be-eB-2jzmsdwruQyz7kc9JDhjSq4bCk=PDBCHhvKXsg@mail.gmail.com>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Thu, Sep 16, 2021 at 7:05 PM Rui Miguel Silva <rui.silva@linaro.org> wrote:

> So, it seems like it is not configuring the pads, don't you need to do
> a media-ctl -V in the csi:0?

Thanks for the suggestion. I tried passing media-ctl -V to csi:0:

# v4l2-ctl --device /dev/v4l-subdev1 --set-standard PAL
Standard set to 000000ff
# media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
# media-ctl -l "'csi':1 -> 'csi capture':0[1]"
# media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x576
field:interlaced-bt]"
# media-ctl -v -V "'csi':0 [fmt:UYVY8_2X8/720x576 field:interlaced-bt]"

Does this look correct?

Opening media device /dev/media0
Enumerating entities
Found 3 entities
Enumerating pads and links
Setting up format UYVY8_2X8 720x576 on pad tw9910 2-0044/0
Format set: UYVY8_2X8 720x576
Setting up format UYVY8_2X8 720x576 on pad csi/0
Format set: UYVY8_2X8 720x576
Opening media device /dev/media0
Enumerating entities
Found 3 entities
Enumerating pads and links
Setting up format UYVY8_2X8 720x576 on pad csi/0
Format set: UYVY8_2X8 720x576

# v4l2-ctl --stream-mmap -d /dev/video1
[   50.969910] priv->vdev.compose.width is 640
[   50.974685] fmt_src.format.width is 720
[   50.978659] priv->vdev.compose.height is 480
[   50.983208] compose.height is 576
[   50.986646] imx7-csi 2214000.csi: capture format not valid
VIDIOC_STREAMON returned -1 (Broken pipe)

but still getting the width/height mismatch.

# media-ctl -p
Media controller API version 5.15.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
pad0: Sink
[fmt:UYVY8_2X8/720x576 field:none colorspace:srgb xfer:srgb ycbcr:601
quantization:lim-range]
<- "tw9910 2-0044":0 [ENABLED,IMMUTABLE]
pad1: Source
[fmt:UYVY8_2X8/720x576 field:none colorspace:srgb xfer:srgb ycbcr:601
quantization:lim-range]
-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
pad0: Sink
<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: tw9910 2-0044 (1 pad, 1 link)
             type V4L2 subdev subtype Decoder flags 0
             device node name /dev/v4l-subdev1
pad0: Source
[fmt:UYVY8_2X8/720x576 field:interlaced-bt colorspace:smpte170m
crop.bounds:(0,0)/768x576
crop:(0,0)/768x576]
-> "csi":0 [ENABLED,IMMUTABLE]

Thanks



> or maybe dump the output of media-ctl -p and check the links and pads
> configurations.
>
> Hope this helps.
>
> Cheers,
>    Rui
