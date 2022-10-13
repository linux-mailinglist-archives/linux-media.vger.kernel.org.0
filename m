Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1815FD57B
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 09:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiJMHSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 03:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiJMHSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 03:18:52 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FF23EA46
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 00:18:50 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4FDC8E0005;
        Thu, 13 Oct 2022 07:18:48 +0000 (UTC)
Date:   Thu, 13 Oct 2022 09:18:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Karthik Poduval <karthik.poduval@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: V4L2 M2M driver architecture question for a new hardware
Message-ID: <20221013071846.dnp3o3pj747wnknt@uno.localdomain>
References: <CAFP0Ok9iHi+1nyzxMfMA58QC5=H4H48ALBY+1e8eeTMsfbUY3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFP0Ok9iHi+1nyzxMfMA58QC5=H4H48ALBY+1e8eeTMsfbUY3A@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Karthik

On Wed, Oct 12, 2022 at 10:59:50PM -0700, Karthik Poduval wrote:
> Hi All,
>
> I have hardware that does some sort of image manipulation. The
> hardware takes 2 inputs.
> - image buffer
> - config param buffer
> and generates one output which is also an image buffer.
> The input and output images formats fall under standard image
> definitions of V4L2 like various YUV/RGB formats (interleaved or
> multiplanar).
>
> The config param buffer is kind of like a set of instructions for the
> hardware that needs to be passed with every input and output image
> which tells the hardware how to process the image.
> The hardware will be given different input images and output images
> every time and possibly different config param buffers too (in some
> cases). The config param buffers may have variable sizes too based on
> the nature of processing for that frame, but input and output images
> are fixed in size for a given context. I should also mention that the
> config param buffers are a few KBs in size so zero copy is a
> requirement. The config params buffers are written by userspace
> (possibly also driver in kernel space) and read by hardware.
>

This sounds very much how a regular M2M ISP driver works. I can't tell
about codecs as I'm no expert there, but I expect them to be similar,
so your use case is covered by existing drivers.

> Here were two mechanisms I had in mind while trying to design a V4L2
> M2M driver for this hardware.
> - Use a custom multiplanar input format where one plane is a config
> param buffer with remaining planes for input images (in case the input
> image is also multiplanar).

If you're wondering how to pass parameters to the HW I suggest to
consider registering an output video device node, where you simply
queue buffers with your parameters to.

Your HW could be modeled as a single subdevice with 3 video device
nodes, one output device for input images, one output device for
parameters, and one capture device for output images.

                   +-----------+
       +----+      | HW subdav |      +------+
       | In | ---> 0           0  --> | out  |
       +----+      |           |      +------+
                   +-----0-----+
                         ^
                         |
                     +--------+
                     | params |
                     +--------+

The parameters buffer can be of modeled using the v4l2_meta_format[1]
interface. The data format of the buffer could be defined as a custom
metadata format, you can see examples here [2]

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-meta.html#c.v4l2_meta_format
[2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/meta-formats.html#meta-formats

I suggest to look at the IPU3 and RkISP1 drivers for reference.

> - Use dmabuf heaps to allocate config param buffer. Tie this config
> param buffer fd to an input buffer (using request API). Driver would
> have to attach the config param buffer dmabuf fd, use it and detach.
>

You should be able to easily allocate buffers in the video device as
you would easily do and export them as dmabuf fds by using
VIDIOC_EXPBUF [3].

Once you have them you can map them in your application code and
write their content.

[3] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-expbuf.html

> Any comments/concerns about the above two mechanisms ?
> Any other better ideas ?
> Are there any existing V4L2 M2M mechanisms present to deal with per
> frame param buffers that are also zero copy ?
> Is the media request API able to do zero copy for setting compound
> controls for large (several KBs) compound controls ? (making the above
> dmabuf heap approach unnecessary)

Now, all the above assumes your parameters buffer is modeled as a
structure of parameters (and possibly data tables). If you are instead
looking at something that can be modeled through controls you might
have better guidance by looking at how codecs work, but there I can't
help much ;)

Hope it helps
   j
>
> --
> Regards,
> Karthik Poduval
