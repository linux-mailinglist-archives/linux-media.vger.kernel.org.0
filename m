Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F3067297
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 17:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfGLPjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 11:39:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50848 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGLPjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 11:39:32 -0400
Received: from [IPv6:2804:431:c7f5:673a:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f5:673a:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35C0828B06B;
        Fri, 12 Jul 2019 16:39:27 +0100 (BST)
Subject: Re: [PATCH 0/7] media: vimc: Add a V4L2 output device
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org
References: <20190702154752.14939-1-andrealmeid@collabora.com>
 <00fb0dc3-0dd3-8d4c-9add-dba617f34d19@collabora.com>
 <7189e204-ba37-930b-1738-d192f45b0af5@xs4all.nl>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <333e5df6-0e24-ff76-7e7f-bf338652f9ac@collabora.com>
Date:   Fri, 12 Jul 2019 12:38:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7189e204-ba37-930b-1738-d192f45b0af5@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 7/10/19 4:33 AM, Hans Verkuil wrote:
> On 7/10/19 12:19 AM, Helen Koike wrote:
>> Hi André,
>>
>> Thanks for the patches.
>>
>> On 7/2/19 12:47 PM, André Almeida wrote:
>>> Hello,
>>>
>>> This patch adds a V4L2 output device on vimc, that comply with V4L2 API
>>> for video output. If there is an output device and a capture device at the
>>> same pipeline, one can get a video loopback pipeline feeding frames at
>>> the output and then seeing them at the capture. It's possible to insert
>>> vimc submodules at the pipeline to modify the image (e.g. a scaler).
>>>
>>> If one starts a streaming at the capture, with the output off, the
>>> capture will display a noisy frame. If one starts a streaming at the
>>> output with the capture off, the output will just consume the buffers,
>>> without sending them to the pipeline. If both output and capture are
>>> streaming, the loopback will happen.
>> I understand why it is done like this in vivid, but I was wondering, if we
>> have a pipeline like:
>> output -> capture
>> Shouldn't streaming from the capture just stalls if there is no frame
>> available in the output (i.e. streaming in the output is off) ? But then I'm
>> not sure what the framerate in the capture would mean.
>>
>> Hans, what do you think?
> If you set up the pipeline like this:
>
> Video Output -> Scaler -> Video Capture

If the capture will stall if there's no frame from the video output, how
can I add support for this kind of pipeline at test-media? It would be
required to send frames to the output device while running
`v4l2-compliance` at the capture device to make testing possible.

Thanks,
    André

> Then this is a mem2mem device (except with two separate video devices) and
> framerate doesn't apply anymore. And video capture will just stall if there
> is no video output frame provided.
>
> It's how e.g. omap3isp works.
>
> Regards,
>
> 	Hans
>
>> Thanks,
>> Helen
>>
>>> The patches 1 and 2 provide some ground to create the output
>>> device. The patch 3 creates the device and modify how the vimc-streamer
>>> was dealing with the s_stream callback on other vimc modules, to make
>>> simpler implementing this callback at vimc-output. Patch 4 change the
>>> behavior of the pipeline in order to be closer to a real life hardware.
>>> Patches 5-7 updates the default pipeline and the documentation to
>>> include the new output device.
>>>
>>> This is the result of v4l2-compliance after this patch series:
>>> $ v4l2-compliance -m0 -s50
>>> Grand Total for vimc device /dev/media0: 476, Succeeded: 476, Failed: 0,
>>> Warnings: 0
>>>
>>> A git tree up to date with media-master and with this changes can be found
>>> at: https://gitlab.collabora.com/tonyk/linux/tree/vimc/output
>>>
>>> In order to test it, one can follow these instructions:
>>>
>>> 1 - Configure the pipeline (requires v4l-utils):
>>>
>>> $ media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>>> $ media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>>> $ media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
>>> $ media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
>>> $ v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>>> $ v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>>> $ v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>>> $ v4l2-ctl -z platform:vimc -e "RGB/YUV Input" -v width=640,height=480
>>>
>>> 2 - Use a userspace application:
>>> 2.a gst-launch (requires gstreamer and gst-plugins-good):
>>>
>>> Feed frames into the output and grab from the capture (rescaled for
>>> convenience):
>>>
>>> $ gst-launch-1.0 videotestsrc pattern=ball ! \
>>> 	video/x-raw,width=640,height=480,format=RGB \
>>> 	! v4l2sink device=/dev/video2 v4l2src device=/dev/video3 ! \
>>> 	video/x-raw,width=1920,height=1440,format=RGB ! videoscale ! \
>>> 	video/x-raw,width=640,height=480 ! videoconvert ! ximagesink
>>>
>>> 2.b qv4l2 (requires v4l-utils):
>>>
>>> Open the output device:
>>>
>>> $ qv4l2 -d2
>>>
>>> Open the capture device:
>>>
>>> $ qv4l2 -d3
>>>
>>> Start the streaming at both, at any order. You can change the frame
>>> content at "Test Pattern Generator" -> "Test Pattern" on the output.
>>>
>>> Thanks,
>>> 	André
>>>
>>> André Almeida (7):
>>>   media: vimc: Create video module
>>>   media: vimc: video: Add write file operation
>>>   media: vimc: Create a V4L2 output device
>>>   media: vimc: Send null buffer through the pipeline
>>>   media: vimc: core: Add output device on the pipeline
>>>   media: vimc.dot: Update default topology diagram
>>>   media: vimc.rst: Add output device
>>>
>>>  Documentation/media/v4l-drivers/vimc.dot    |   4 +-
>>>  Documentation/media/v4l-drivers/vimc.rst    |  12 +-
>>>  drivers/media/platform/vimc/Makefile        |   4 +-
>>>  drivers/media/platform/vimc/vimc-capture.c  | 356 +++----------------
>>>  drivers/media/platform/vimc/vimc-common.h   |   5 +-
>>>  drivers/media/platform/vimc/vimc-core.c     |   7 +-
>>>  drivers/media/platform/vimc/vimc-debayer.c  |  14 +-
>>>  drivers/media/platform/vimc/vimc-output.c   | 362 ++++++++++++++++++++
>>>  drivers/media/platform/vimc/vimc-scaler.c   |  13 +-
>>>  drivers/media/platform/vimc/vimc-sensor.c   |  10 +-
>>>  drivers/media/platform/vimc/vimc-streamer.c |  24 +-
>>>  drivers/media/platform/vimc/vimc-video.c    | 273 +++++++++++++++
>>>  drivers/media/platform/vimc/vimc-video.h    | 130 +++++++
>>>  13 files changed, 849 insertions(+), 365 deletions(-)
>>>  create mode 100644 drivers/media/platform/vimc/vimc-output.c
>>>  create mode 100644 drivers/media/platform/vimc/vimc-video.c
>>>  create mode 100644 drivers/media/platform/vimc/vimc-video.h
>>>
