Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B9D3FA61D
	for <lists+linux-media@lfdr.de>; Sat, 28 Aug 2021 15:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhH1N7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Aug 2021 09:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234426AbhH1N7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Aug 2021 09:59:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A98C061756
        for <linux-media@vger.kernel.org>; Sat, 28 Aug 2021 06:58:28 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m18so6606576lfl.10
        for <linux-media@vger.kernel.org>; Sat, 28 Aug 2021 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAqrhh0NjsS1NiF6y52GwC1WNZ8fFv7QabqGXyMXNbs=;
        b=kdLcdOq8BLF84ZXYoPQVgW8yMpxyosN1gbrJmpthXa8SFaG/s/wLq9QU+Xoczr/amK
         PMZH7IY8sOEcdTkqNC1HQq2qEDOnIMa5XokIsAx9Jb3fHZVME4rl4UF7x6Vzdm6xq58j
         swQpeYMr6R/i6YrUOwC2LH/KMEhKlhT5IVaCmASrY5l8CviVdUFFm0WCdr9dKXGzZSkD
         WFbAbtvnFnz/C+A70kfw1rM7YJszaweh05hGHYQCgUgUhu51HbV+jD9UODDge9GAzSTX
         biNXidrEP4heD1oiSlhO7p8upbThq24lTKseJflOWUsP9kOIjGYctIfy+kqnSawj2GgU
         BpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAqrhh0NjsS1NiF6y52GwC1WNZ8fFv7QabqGXyMXNbs=;
        b=DJSeoBSWlUHrUC9WoP32deBhSPvgshLaSHDzayOZ2Vvb74ZxKMdvBbzMbFJOAa1vF0
         wsph+fDma0Sfo97QH2Yi1ZLEYfz/5E6BvSmgTcu3hYUPpprmI5xaUEhchGmbz3MXhyC6
         QjDHzuZzW7TE2nJx0GDS3p0+5/ihYHg7yd/rLOMTQVwpPB5AsBep0zgrFRdcbDPlBHCD
         +DaPHLrv+FNiiOGpzotO0cJMgXn3i9BcTXM5JVnsxlrSZrh13juVPVqV0UNX1EFF4XqA
         JntDy5kl0w7ABjvYYA48bfOizRiqkByBv+CrUEkbw2Sjdm5Fcq2lGK7KgQrwvcScDqQW
         3Gog==
X-Gm-Message-State: AOAM533f7WmX1L0aRLXoooxEBYOD5Mn6q4enscQIHr5EiWeuXRPpWxmN
        zEedjb7wSThxBm0UDw1OORjWmUuHUhkyDTrwvwk7Zsv5
X-Google-Smtp-Source: ABdhPJxMNCAb8Lzo9ZXaOOzBGqWeJN8yT2aivWJ7E+EAGkONwpbrutIuyEf7FwuzUFKt3yv7oGsH9dZKtQAmSn6Byvc=
X-Received: by 2002:a05:6512:22c4:: with SMTP id g4mr8067873lfu.500.1630159106366;
 Sat, 28 Aug 2021 06:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210827130150.909695-1-festevam@gmail.com>
In-Reply-To: <20210827130150.909695-1-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 28 Aug 2021 10:58:15 -0300
Message-ID: <CAOMZO5BWBB=KA8yZgaEpii+TqCb9vJbvzi712uwVwGOqU8wE5g@mail.gmail.com>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 27, 2021 at 10:02 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Currently the driver only probes via platform data passed from
> board file.
>
> Allow to probe from device tree too.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi,
>
> I am currently sending this series as RFC because I was
> not able to get the TW9990 to work on a imx6sx board yet.
>
> # media-ctl -p
> Media controller API version 5.14.0
>
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info
> hw revision     0x0
> driver version  5.14.0
>
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "tw9910 2-0044":0 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
>
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]
>
> - entity 10: tw9910 2-0044 (1 pad, 1 link)
>              type V4L2 subdev subtype Decoder flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Source
>                 [fmt:UYVY8_2X8/640x480 field:interlaced-bt colorspace:smpte170m
>                  crop.bounds:(0,0)/640x480
>                  crop:(0,0)/640x480]
>                 -> "csi":0 [ENABLED,IMMUTABLE]
>
> I get the following error when setting up the pipeline:
>
> media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
> media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/800x480 field:any]"
>
> Opening media device /dev/media0
> Enumerating entities
> Found 3 entities
> Enumerating pads and links
> Setting up format UYVY8_2X8 800x480 on pad tw9910 2-0044/0
> Unable to set format: No such device or address (-6)
> Unable to setup formats: No such device or address (6)
>
> This -6 (ENXIO) error comes from:
>
> tw9910_set_frame() ---> tw9910_mask_set() ---> i2c_smbus_read_byte_data():
>
>
> static int tw9910_mask_set(struct i2c_client *client, u8 command,
>                            u8 mask, u8 set)
> {
>         s32 val = i2c_smbus_read_byte_data(client, command);
>
> I am able to dump TW9990 registers via i2cdetect and also via the probe
> function, so I2C access is OK.
>
> Not sure why I am getting these i2c_smbus_read_byte_data() errors.

I found the reason: the tw9910 driver was getting unpowered in the
incorrect place.
This problem was present prior to the DT conversion.

I will send a fix for it soon.

Thanks
