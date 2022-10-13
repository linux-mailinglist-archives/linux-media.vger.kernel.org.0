Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCA55FD6F5
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 11:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiJMJZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 05:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiJMJZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 05:25:12 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58F7543F1
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:25:08 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id d26so2555348eje.10
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul0bbdXyB6C80cHfP5yKdfBpafNpk4f+NWNnP9J9RHA=;
        b=Gn5VxKqgQsU2aJwHFtdIhvuMB41CkCGDENiyLfISy4+NWAUoAXgKQNhwPBJZVuY5mf
         3NlCPFeETxAP8igToEDKMwHxn80YJfh7zcOHDnZL/NXpSiyY96uxU4yIkwbuRE/Cq/S7
         79yvsh8vM3zUBeIOdh0lI9gGAS9A/np8FjLREoskBI54rsAr0d1rdVy8jAFfIAKDF4Wz
         /5xeVpjGZkUWrHLGztYXRdf7Q9QBkq5/WjoXAu3x33hREB7HRnf38jjxn7kYoX3rUxgl
         TAdGPfxjPctKdumvVfWXNPKjiyUqrbwgBlpsVipK3geN12PWJG0Pnz4VXmoPfvj/C7vi
         q3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ul0bbdXyB6C80cHfP5yKdfBpafNpk4f+NWNnP9J9RHA=;
        b=rnazvAKvYul4JppeOFG5R4vuuiMYVwBRjkXnxAoTpQQC9AAQt9EFNC2/jRQhl6n5On
         OWKYqlK7hDfF/f5hlCoxkvX5jLpURp5l11XdXUwoWTVUjiYY9tG4f/msKVM9wzBcdmFw
         lFqa/a2x32Pr5yA9dv+DVql9RgMFmrvuLqxTIJAP3FZw6GDHtHQDr2roCzRU4tPH3ElU
         cgZY9rUdcp3ISlwSZQzkiWfW8r+khQ8pZbzeCPWhEPlNEROhiMg5QR4dt67UDFN7VyYp
         bmaDZDdjqw1QLsqjwLII50Ee7GAGUjTOkHNAfYy7d9Uuu6CPW58U2tTGRjR/sesKyNdq
         DPXw==
X-Gm-Message-State: ACrzQf1xkdFFtJnnrcCJZxlMdkjAbM0k/BY9F0s3eK+PytkqouKCLxju
        L+BvjwPWjBEut6ugcGqNbRkA6Qi4t0wyER9lGzM96w==
X-Google-Smtp-Source: AMsMyM5VAvyEwMI2EXfkVUr7GtJjD18yeHN2uCxuV1GlwcozvX2dfNV3Xq3ecZ/Gcvp3qDHFR9TUs6nGiEDObS4U+7U=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr26857758ejb.294.1665653106666; Thu, 13
 Oct 2022 02:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok9iHi+1nyzxMfMA58QC5=H4H48ALBY+1e8eeTMsfbUY3A@mail.gmail.com>
 <20221013071846.dnp3o3pj747wnknt@uno.localdomain>
In-Reply-To: <20221013071846.dnp3o3pj747wnknt@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 13 Oct 2022 10:24:50 +0100
Message-ID: <CAPY8ntAHvQX=XdrF3gUtDJTgwUoUe+fZwQG5B347+cz-FYeS9Q@mail.gmail.com>
Subject: Re: V4L2 M2M driver architecture question for a new hardware
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Karthik Poduval <karthik.poduval@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik and Jacopo

On Thu, 13 Oct 2022 at 08:18, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello Karthik
>
> On Wed, Oct 12, 2022 at 10:59:50PM -0700, Karthik Poduval wrote:
> > Hi All,
> >
> > I have hardware that does some sort of image manipulation. The
> > hardware takes 2 inputs.
> > - image buffer
> > - config param buffer
> > and generates one output which is also an image buffer.
> > The input and output images formats fall under standard image
> > definitions of V4L2 like various YUV/RGB formats (interleaved or
> > multiplanar).
> >
> > The config param buffer is kind of like a set of instructions for the
> > hardware that needs to be passed with every input and output image
> > which tells the hardware how to process the image.
> > The hardware will be given different input images and output images
> > every time and possibly different config param buffers too (in some
> > cases). The config param buffers may have variable sizes too based on
> > the nature of processing for that frame, but input and output images
> > are fixed in size for a given context. I should also mention that the
> > config param buffers are a few KBs in size so zero copy is a
> > requirement. The config params buffers are written by userspace
> > (possibly also driver in kernel space) and read by hardware.
> >
>
> This sounds very much how a regular M2M ISP driver works. I can't tell
> about codecs as I'm no expert there, but I expect them to be similar,
> so your use case is covered by existing drivers.
>
> > Here were two mechanisms I had in mind while trying to design a V4L2
> > M2M driver for this hardware.
> > - Use a custom multiplanar input format where one plane is a config
> > param buffer with remaining planes for input images (in case the input
> > image is also multiplanar).
>
> If you're wondering how to pass parameters to the HW I suggest to
> consider registering an output video device node, where you simply
> queue buffers with your parameters to.
>
> Your HW could be modeled as a single subdevice with 3 video device
> nodes, one output device for input images, one output device for
> parameters, and one capture device for output images.
>
>                    +-----------+
>        +----+      | HW subdav |      +------+
>        | In | ---> 0           0  --> | out  |
>        +----+      |           |      +------+
>                    +-----0-----+
>                          ^
>                          |
>                      +--------+
>                      | params |
>                      +--------+

The main drawback of this over the codec model of a single video
device with both an _OUTPUT and _CAPTURE queue is that you can not run
multiple instances simultaneously - there is no way to tie the
relevant clients together. I don't know whether supporting
simultaneous multiple clients is a requirement in this case, but that
may be a key decision in choosing how to represent the device.

  Dave

> The parameters buffer can be of modeled using the v4l2_meta_format[1]
> interface. The data format of the buffer could be defined as a custom
> metadata format, you can see examples here [2]
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-meta.html#c.v4l2_meta_format
> [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/meta-formats.html#meta-formats
>
> I suggest to look at the IPU3 and RkISP1 drivers for reference.
>
> > - Use dmabuf heaps to allocate config param buffer. Tie this config
> > param buffer fd to an input buffer (using request API). Driver would
> > have to attach the config param buffer dmabuf fd, use it and detach.
> >
>
> You should be able to easily allocate buffers in the video device as
> you would easily do and export them as dmabuf fds by using
> VIDIOC_EXPBUF [3].
>
> Once you have them you can map them in your application code and
> write their content.
>
> [3] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-expbuf.html
>
> > Any comments/concerns about the above two mechanisms ?
> > Any other better ideas ?
> > Are there any existing V4L2 M2M mechanisms present to deal with per
> > frame param buffers that are also zero copy ?
> > Is the media request API able to do zero copy for setting compound
> > controls for large (several KBs) compound controls ? (making the above
> > dmabuf heap approach unnecessary)
>
> Now, all the above assumes your parameters buffer is modeled as a
> structure of parameters (and possibly data tables). If you are instead
> looking at something that can be modeled through controls you might
> have better guidance by looking at how codecs work, but there I can't
> help much ;)
>
> Hope it helps
>    j
> >
> > --
> > Regards,
> > Karthik Poduval
