Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDC6600AB2
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 11:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiJQJ3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 05:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiJQJ26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 05:28:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A6352802
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 02:28:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E72960F90
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 09:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE22DC433C1;
        Mon, 17 Oct 2022 09:28:31 +0000 (UTC)
Message-ID: <c0745c66-552e-f5e9-c035-80fc13fc712a@xs4all.nl>
Date:   Mon, 17 Oct 2022 11:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: V4L2 M2M driver architecture question for a new hardware
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Karthik Poduval <karthik.poduval@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAFP0Ok9iHi+1nyzxMfMA58QC5=H4H48ALBY+1e8eeTMsfbUY3A@mail.gmail.com>
 <20221013071846.dnp3o3pj747wnknt@uno.localdomain>
 <CAPY8ntAHvQX=XdrF3gUtDJTgwUoUe+fZwQG5B347+cz-FYeS9Q@mail.gmail.com>
 <CAFP0Ok_DJpRYdSZe=y0L7DqmzDFB8-GN671oZzTYRFMTVDsJDA@mail.gmail.com>
 <CAPY8ntBUhbxFGH9W8vQLkTT08H=bv895V7n0fC_y0LJO7xBVoA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAPY8ntBUhbxFGH9W8vQLkTT08H=bv895V7n0fC_y0LJO7xBVoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

On 10/14/22 16:49, Dave Stevenson wrote:
> Hi Karthik
> 
> On Fri, 14 Oct 2022 at 15:26, Karthik Poduval <karthik.poduval@gmail.com> wrote:
>>
>> Thanks for the reply Jacopo and Dave.
>>
>> On Thu, Oct 13, 2022, 2:25 AM Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
>>>
>>> Hi Karthik and Jacopo
>>>
>>> On Thu, 13 Oct 2022 at 08:18, Jacopo Mondi <jacopo@jmondi.org> wrote:
>>>>
>>>> Hello Karthik
>>>>
>>>> On Wed, Oct 12, 2022 at 10:59:50PM -0700, Karthik Poduval wrote:
>>>>> Hi All,
>>>>>
>>>>> I have hardware that does some sort of image manipulation. The
>>>>> hardware takes 2 inputs.
>>>>> - image buffer
>>>>> - config param buffer
>>>>> and generates one output which is also an image buffer.
>>>>> The input and output images formats fall under standard image
>>>>> definitions of V4L2 like various YUV/RGB formats (interleaved or
>>>>> multiplanar).
>>>>>
>>>>> The config param buffer is kind of like a set of instructions for the
>>>>> hardware that needs to be passed with every input and output image
>>>>> which tells the hardware how to process the image.
>>>>> The hardware will be given different input images and output images
>>>>> every time and possibly different config param buffers too (in some
>>>>> cases). The config param buffers may have variable sizes too based on
>>>>> the nature of processing for that frame, but input and output images
>>>>> are fixed in size for a given context. I should also mention that the
>>>>> config param buffers are a few KBs in size so zero copy is a
>>>>> requirement. The config params buffers are written by userspace
>>>>> (possibly also driver in kernel space) and read by hardware.
>>>>>
>>>>
>>>> This sounds very much how a regular M2M ISP driver works. I can't tell
>>>> about codecs as I'm no expert there, but I expect them to be similar,
>>>> so your use case is covered by existing drivers.
>>>>
>>>>> Here were two mechanisms I had in mind while trying to design a V4L2
>>>>> M2M driver for this hardware.
>>>>> - Use a custom multiplanar input format where one plane is a config
>>>>> param buffer with remaining planes for input images (in case the input
>>>>> image is also multiplanar).
>>>>
>>>> If you're wondering how to pass parameters to the HW I suggest to
>>>> consider registering an output video device node, where you simply
>>>> queue buffers with your parameters to.
>>>>
>>>> Your HW could be modeled as a single subdevice with 3 video device
>>>> nodes, one output device for input images, one output device for
>>>> parameters, and one capture device for output images.
>>>>
>>>>                    +-----------+
>>>>        +----+      | HW subdav |      +------+
>>>>        | In | ---> 0           0  --> | out  |
>>>>        +----+      |           |      +------+
>>>>                    +-----0-----+
>>>>                          ^
>>>>                          |
>>>>                      +--------+
>>>>                      | params |
>>>>                      +--------+
>>>
>>> The main drawback of this over the codec model of a single video
>>> device with both an _OUTPUT and _CAPTURE queue is that you can not run
>>> multiple instances simultaneously - there is no way to tie the
>>> relevant clients together. I don't know whether supporting
>>> simultaneous multiple clients is a requirement in this case, but that
>>> may be a key decision in choosing how to represent the device.
>>
>>
>> Yes multi context feature of V4L2 M2M is a requirement. Is it possible to have a capture, output and param queues for M2M devices ? It's essentially fits the M2M architecture but with a larger control param so we are looking for zero copy instead of relying on V4L2 ctrl's ioctl based approach.
> 
> AIUI You can't have multiple input (or output) queues as then it
> becomes ambiguous as to which queue triggered a poll/select. With one
> _OUTPUT queue it will trigger "write", and one _CAPTURE queue will
> trigger "read". Add a 3rd queue and you don't know which one to query.

Correct. The m2m framework assumes a single capture and a single output
queue. There are no plans to change that, and I'm not so sure I want
that anyway.

> 
> Using dma-heaps does work - we've used that in the bcm2835-isp driver
> [1] for passing in lens shading tables (again several kB, but there
> they are largely static).
> In that case we need to jump through a couple of hoops to map the
> dmabuf into the ISP control software's memory space as well, but
> fundamentally it's very similar.
> 
> V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is necessary to handle the case where you:
> - allocate a buffer from dma-heap and get fd N.
> - pass the fd into the V4L2 driver, which acquires the underlying dmabuf.
> - close the fd as userspace doesn't want it anymore.
> - allocate a new buffer from dma-buf and get fd N again, but it is
> referencing a new underlying dmabuf.
> - pass the fd into V4L2 - the control framework would generally view
> it as "no change" and not call your control handler :-(
> 
> If you configure userspace to hang on to the same dmabuf and update
> it, then you need to add in some method to ensure the config buffer
> isn't in use by your driver at the point you update it. And don't
> forget about cache management.
> 
> I'll leave it for others to comment on whether it is really acceptable
> to mainline to use a dmabuf fd in a control.

I have no problem with that, and indeed in that case you need that flag,
but that's exactly the sort of use-case it was designed for.

Stateless codecs use a /dev/mediaX device and an M2M /dev/videoX device.
The media device is used for the Request API through which you can associate
controls with the buffer that you send to the hardware. This can be used
for the params. For stateless decoders the parameters are controls, and
are not zero copy. The amount of data is limited. We also added support for
dynamic arrays since often array controls are small, but they can theoretically
be large. With dynamic arrays you can just pass what is needed, while still
allowing for worst-case behavior. Whether that is useful or not for you, I
don't know.

If you really need zero-copy, then passing a dmabuf fd as a control should
work fine. You'd be the first doing this, though, so you might encounter
issues that I overlooked...

The main issue with using a dmabuf fd is how to document and verify the
contents you pass. Basically it has to be documented as if it was a
compound control, not a dmabuf. Unless your device will only run on a
32 bit architecture, you will need to ensure that the data layout is
the same for 32 bit and 64 bit, and validation is a problem as well:
you will need to make your own control validation code that maps the
fd and checks the contents. By default the control framework will just
validate the fd itself, but you likely want to validate the contents.

Regards,

	Hans

> 
>   Dave
> 
> [1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c#L752
> 
>>>> The parameters buffer can be of modeled using the v4l2_meta_format[1]
>>>> interface. The data format of the buffer could be defined as a custom
>>>> metadata format, you can see examples here [2]
>>>>
>>>> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-meta.html#c.v4l2_meta_format
>>>> [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/meta-formats.html#meta-formats
>>>>
>>>> I suggest to look at the IPU3 and RkISP1 drivers for reference.
>>>>
>>>>> - Use dmabuf heaps to allocate config param buffer. Tie this config
>>>>> param buffer fd to an input buffer (using request API). Driver would
>>>>> have to attach the config param buffer dmabuf fd, use it and detach.
>>>>>
>>>>
>>>> You should be able to easily allocate buffers in the video device as
>>>> you would easily do and export them as dmabuf fds by using
>>>> VIDIOC_EXPBUF [3].
>>>>
>>>> Once you have them you can map them in your application code and
>>>> write their content.
>>>>
>>>> [3] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-expbuf.html
>>>>
>>>>> Any comments/concerns about the above two mechanisms ?
>>>>> Any other better ideas ?
>>>>> Are there any existing V4L2 M2M mechanisms present to deal with per
>>>>> frame param buffers that are also zero copy ?
>>>>> Is the media request API able to do zero copy for setting compound
>>>>> controls for large (several KBs) compound controls ? (making the above
>>>>> dmabuf heap approach unnecessary)
>>>>
>>>> Now, all the above assumes your parameters buffer is modeled as a
>>>> structure of parameters (and possibly data tables). If you are instead
>>>> looking at something that can be modeled through controls you might
>>>> have better guidance by looking at how codecs work, but there I can't
>>>> help much ;)
>>>>
>>>> Hope it helps
>>>>    j
>>>>>
>>>>> --
>>>>> Regards,
>>>>> Karthik Poduval
