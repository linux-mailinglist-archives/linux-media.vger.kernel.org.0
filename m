Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7743E5FF09B
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 16:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiJNOuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 10:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiJNOt6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 10:49:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86C027920
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 07:49:56 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ot12so11067442ejb.1
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIpSgzlvYmugkQQC5I1HA0hlfluEpXrt+wWyXIkqQxc=;
        b=oP1tRqPVUveyKExgXgd78A3XI4GqnDkiYd3aADuLfiyszUUgPQzxS4g4NFLBbfeNTS
         N9/Kt1D7/gX+Y01Z23EsuLnrcMxdM/A0Fl4odPOlzC1bPzHnvRgOSfs4SFcqT5/HvQNu
         55htXFmA9N4pyDcUuyLJpLDZgsD8OOa0+7hEbaOnsAhLJhUaH0jncHbTIreATgvPzQXL
         cW6RwxnF6nfI9NKxV0dQa1cwUC5MqlrY62r9ldKfQiv5K6kBQ8Ebm3691Vkjm2D3lAnC
         OKfjTjPv13w3pws1ErBM4Vr25IQZvIDToP80HEvcvKNK9b/4kH5DWCV9JD6RvHCQZHlF
         PQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIpSgzlvYmugkQQC5I1HA0hlfluEpXrt+wWyXIkqQxc=;
        b=bu5KRd6XiPpEbtf9HZeDw+I0L02+Ou1fOi1uYRj7775twKCjnUQhrMUJs+ol9Dcdja
         Z3F5OyNo8Mkila4konvRJkw/SRj5yzUlGkiVfL5QBqMBHWnIbEqtEYycRmc7XCIy9PcK
         HrN2jlombyQsyDV1oowoXsZVsbYngxAXgupWyfbn0ksnKoxLaz990K6Xr0b7hntIHPGC
         Vpsr1Aw7xr7bWyOox3IFiABH973Mxk5xzypAn03iK+wi+b63oD8RyEbmuSh+LoEWUJDx
         REw3HcXMb+1iXq7PnX9cMfUYuU6yMJUxHAtDtGOUsKZTcgEeOf8arMgZ0i4W/ZL+l02K
         D3zQ==
X-Gm-Message-State: ACrzQf3eIcDctwvrjJkfjDG6XY0Sy5AhomsMpimUfXP5yBz5khBgfMT3
        Mjao4PlJcH3mCIiBZoqp+/RPPV/VzlkeBo0fHxvgRg==
X-Google-Smtp-Source: AMsMyM4FqPtRFdFnOvgmTr8RdQFiZC5sah5KuAsRkJsi052ZItMDDOFMVkUNp9Xkh2QmzEbO6gJCOpZ4vM1jrKFLnZ0=
X-Received: by 2002:a17:907:1c98:b0:78d:3b08:33ef with SMTP id
 nb24-20020a1709071c9800b0078d3b0833efmr3971354ejc.175.1665758994668; Fri, 14
 Oct 2022 07:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok9iHi+1nyzxMfMA58QC5=H4H48ALBY+1e8eeTMsfbUY3A@mail.gmail.com>
 <20221013071846.dnp3o3pj747wnknt@uno.localdomain> <CAPY8ntAHvQX=XdrF3gUtDJTgwUoUe+fZwQG5B347+cz-FYeS9Q@mail.gmail.com>
 <CAFP0Ok_DJpRYdSZe=y0L7DqmzDFB8-GN671oZzTYRFMTVDsJDA@mail.gmail.com>
In-Reply-To: <CAFP0Ok_DJpRYdSZe=y0L7DqmzDFB8-GN671oZzTYRFMTVDsJDA@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 14 Oct 2022 15:49:38 +0100
Message-ID: <CAPY8ntBUhbxFGH9W8vQLkTT08H=bv895V7n0fC_y0LJO7xBVoA@mail.gmail.com>
Subject: Re: V4L2 M2M driver architecture question for a new hardware
To:     Karthik Poduval <karthik.poduval@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik

On Fri, 14 Oct 2022 at 15:26, Karthik Poduval <karthik.poduval@gmail.com> w=
rote:
>
> Thanks for the reply Jacopo and Dave.
>
> On Thu, Oct 13, 2022, 2:25 AM Dave Stevenson <dave.stevenson@raspberrypi.=
com> wrote:
>>
>> Hi Karthik and Jacopo
>>
>> On Thu, 13 Oct 2022 at 08:18, Jacopo Mondi <jacopo@jmondi.org> wrote:
>> >
>> > Hello Karthik
>> >
>> > On Wed, Oct 12, 2022 at 10:59:50PM -0700, Karthik Poduval wrote:
>> > > Hi All,
>> > >
>> > > I have hardware that does some sort of image manipulation. The
>> > > hardware takes 2 inputs.
>> > > - image buffer
>> > > - config param buffer
>> > > and generates one output which is also an image buffer.
>> > > The input and output images formats fall under standard image
>> > > definitions of V4L2 like various YUV/RGB formats (interleaved or
>> > > multiplanar).
>> > >
>> > > The config param buffer is kind of like a set of instructions for th=
e
>> > > hardware that needs to be passed with every input and output image
>> > > which tells the hardware how to process the image.
>> > > The hardware will be given different input images and output images
>> > > every time and possibly different config param buffers too (in some
>> > > cases). The config param buffers may have variable sizes too based o=
n
>> > > the nature of processing for that frame, but input and output images
>> > > are fixed in size for a given context. I should also mention that th=
e
>> > > config param buffers are a few KBs in size so zero copy is a
>> > > requirement. The config params buffers are written by userspace
>> > > (possibly also driver in kernel space) and read by hardware.
>> > >
>> >
>> > This sounds very much how a regular M2M ISP driver works. I can't tell
>> > about codecs as I'm no expert there, but I expect them to be similar,
>> > so your use case is covered by existing drivers.
>> >
>> > > Here were two mechanisms I had in mind while trying to design a V4L2
>> > > M2M driver for this hardware.
>> > > - Use a custom multiplanar input format where one plane is a config
>> > > param buffer with remaining planes for input images (in case the inp=
ut
>> > > image is also multiplanar).
>> >
>> > If you're wondering how to pass parameters to the HW I suggest to
>> > consider registering an output video device node, where you simply
>> > queue buffers with your parameters to.
>> >
>> > Your HW could be modeled as a single subdevice with 3 video device
>> > nodes, one output device for input images, one output device for
>> > parameters, and one capture device for output images.
>> >
>> >                    +-----------+
>> >        +----+      | HW subdav |      +------+
>> >        | In | ---> 0           0  --> | out  |
>> >        +----+      |           |      +------+
>> >                    +-----0-----+
>> >                          ^
>> >                          |
>> >                      +--------+
>> >                      | params |
>> >                      +--------+
>>
>> The main drawback of this over the codec model of a single video
>> device with both an _OUTPUT and _CAPTURE queue is that you can not run
>> multiple instances simultaneously - there is no way to tie the
>> relevant clients together. I don't know whether supporting
>> simultaneous multiple clients is a requirement in this case, but that
>> may be a key decision in choosing how to represent the device.
>
>
> Yes multi context feature of V4L2 M2M is a requirement. Is it possible to=
 have a capture, output and param queues for M2M devices ? It's essentially=
 fits the M2M architecture but with a larger control param so we are lookin=
g for zero copy instead of relying on V4L2 ctrl's ioctl based approach.

AIUI You can't have multiple input (or output) queues as then it
becomes ambiguous as to which queue triggered a poll/select. With one
_OUTPUT queue it will trigger "write", and one _CAPTURE queue will
trigger "read". Add a 3rd queue and you don't know which one to query.

Using dma-heaps does work - we've used that in the bcm2835-isp driver
[1] for passing in lens shading tables (again several kB, but there
they are largely static).
In that case we need to jump through a couple of hoops to map the
dmabuf into the ISP control software's memory space as well, but
fundamentally it's very similar.

V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is necessary to handle the case where you:
- allocate a buffer from dma-heap and get fd N.
- pass the fd into the V4L2 driver, which acquires the underlying dmabuf.
- close the fd as userspace doesn't want it anymore.
- allocate a new buffer from dma-buf and get fd N again, but it is
referencing a new underlying dmabuf.
- pass the fd into V4L2 - the control framework would generally view
it as "no change" and not call your control handler :-(

If you configure userspace to hang on to the same dmabuf and update
it, then you need to add in some method to ensure the config buffer
isn't in use by your driver at the point you update it. And don't
forget about cache management.

I'll leave it for others to comment on whether it is really acceptable
to mainline to use a dmabuf fd in a control.

  Dave

[1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/staging/vc=
04_services/bcm2835-isp/bcm2835-v4l2-isp.c#L752

>> > The parameters buffer can be of modeled using the v4l2_meta_format[1]
>> > interface. The data format of the buffer could be defined as a custom
>> > metadata format, you can see examples here [2]
>> >
>> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev=
-meta.html#c.v4l2_meta_format
>> > [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/met=
a-formats.html#meta-formats
>> >
>> > I suggest to look at the IPU3 and RkISP1 drivers for reference.
>> >
>> > > - Use dmabuf heaps to allocate config param buffer. Tie this config
>> > > param buffer fd to an input buffer (using request API). Driver would
>> > > have to attach the config param buffer dmabuf fd, use it and detach.
>> > >
>> >
>> > You should be able to easily allocate buffers in the video device as
>> > you would easily do and export them as dmabuf fds by using
>> > VIDIOC_EXPBUF [3].
>> >
>> > Once you have them you can map them in your application code and
>> > write their content.
>> >
>> > [3] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vid=
ioc-expbuf.html
>> >
>> > > Any comments/concerns about the above two mechanisms ?
>> > > Any other better ideas ?
>> > > Are there any existing V4L2 M2M mechanisms present to deal with per
>> > > frame param buffers that are also zero copy ?
>> > > Is the media request API able to do zero copy for setting compound
>> > > controls for large (several KBs) compound controls ? (making the abo=
ve
>> > > dmabuf heap approach unnecessary)
>> >
>> > Now, all the above assumes your parameters buffer is modeled as a
>> > structure of parameters (and possibly data tables). If you are instead
>> > looking at something that can be modeled through controls you might
>> > have better guidance by looking at how codecs work, but there I can't
>> > help much ;)
>> >
>> > Hope it helps
>> >    j
>> > >
>> > > --
>> > > Regards,
>> > > Karthik Poduval
