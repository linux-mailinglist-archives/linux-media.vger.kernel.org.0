Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD98642EE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 09:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfGJHdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 03:33:07 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50055 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726203AbfGJHdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 03:33:07 -0400
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea] ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
        by smtp-cloud7.xs4all.net with ESMTPA
        id l765hs3Xx0SBql768h6EFq; Wed, 10 Jul 2019 09:33:05 +0200
Subject: Re: [PATCH 0/7] media: vimc: Add a V4L2 output device
To:     Helen Koike <helen.koike@collabora.com>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org
References: <20190702154752.14939-1-andrealmeid@collabora.com>
 <00fb0dc3-0dd3-8d4c-9add-dba617f34d19@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7189e204-ba37-930b-1738-d192f45b0af5@xs4all.nl>
Date:   Wed, 10 Jul 2019 09:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <00fb0dc3-0dd3-8d4c-9add-dba617f34d19@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJn4V64Jwkyw136ol057A7+GTjeEH3D0xd5WMLLFnzbHpkVe/d6vjPDrNFzBXKx0VGLCpg+nqkWXRh4MSstFlWCvbGlRMwqdAeO0amRyP3klW7a1zieV
 8Qk9dx9DZNiLwlYYftUvIpo4Yp1SoTCRRIjjEqMesEaq1bs1m04TQq9th7Aqw99MLwH4Yh60aAJ4Wqmz3cUtLHze9HFMBQO0NYJ8t8S95vl03JxLCqpcVspQ
 weJ+EqG/v3VZlB/Pb08a6b2s6v9S9QjwSNFtdSkcu5EeuMZHGEl2WzIQ8WyvFvrFbzEiUgghbbj1cmtaORpF52MwVe8XqNwoPtNtuGm3MsLPVsYhkn3k1Y/7
 wkn+uS41KE155YXDQdu6bwiTlEy8PB82sBrSB8dLI9qwRMOVwZowIsXzpL3KvhZny8n4AEJdyNPf/nZZ4tTWuiw21+2/h3e79eLMQ9RiQgUEZFfurQg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/10/19 12:19 AM, Helen Koike wrote:
> Hi André,
> 
> Thanks for the patches.
> 
> On 7/2/19 12:47 PM, André Almeida wrote:
>> Hello,
>>
>> This patch adds a V4L2 output device on vimc, that comply with V4L2 API
>> for video output. If there is an output device and a capture device at the
>> same pipeline, one can get a video loopback pipeline feeding frames at
>> the output and then seeing them at the capture. It's possible to insert
>> vimc submodules at the pipeline to modify the image (e.g. a scaler).
>>
>> If one starts a streaming at the capture, with the output off, the
>> capture will display a noisy frame. If one starts a streaming at the
>> output with the capture off, the output will just consume the buffers,
>> without sending them to the pipeline. If both output and capture are
>> streaming, the loopback will happen.
> 
> I understand why it is done like this in vivid, but I was wondering, if we
> have a pipeline like:
> output -> capture
> Shouldn't streaming from the capture just stalls if there is no frame
> available in the output (i.e. streaming in the output is off) ? But then I'm
> not sure what the framerate in the capture would mean.
> 
> Hans, what do you think?

If you set up the pipeline like this:

Video Output -> Scaler -> Video Capture

Then this is a mem2mem device (except with two separate video devices) and
framerate doesn't apply anymore. And video capture will just stall if there
is no video output frame provided.

It's how e.g. omap3isp works.

Regards,

	Hans

> 
> Thanks,
> Helen
> 
>>
>> The patches 1 and 2 provide some ground to create the output
>> device. The patch 3 creates the device and modify how the vimc-streamer
>> was dealing with the s_stream callback on other vimc modules, to make
>> simpler implementing this callback at vimc-output. Patch 4 change the
>> behavior of the pipeline in order to be closer to a real life hardware.
>> Patches 5-7 updates the default pipeline and the documentation to
>> include the new output device.
>>
>> This is the result of v4l2-compliance after this patch series:
>> $ v4l2-compliance -m0 -s50
>> Grand Total for vimc device /dev/media0: 476, Succeeded: 476, Failed: 0,
>> Warnings: 0
>>
>> A git tree up to date with media-master and with this changes can be found
>> at: https://gitlab.collabora.com/tonyk/linux/tree/vimc/output
>>
>> In order to test it, one can follow these instructions:
>>
>> 1 - Configure the pipeline (requires v4l-utils):
>>
>> $ media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>> $ media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>> $ media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
>> $ media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
>> $ v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>> $ v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>> $ v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>> $ v4l2-ctl -z platform:vimc -e "RGB/YUV Input" -v width=640,height=480
>>
>> 2 - Use a userspace application:
>> 2.a gst-launch (requires gstreamer and gst-plugins-good):
>>
>> Feed frames into the output and grab from the capture (rescaled for
>> convenience):
>>
>> $ gst-launch-1.0 videotestsrc pattern=ball ! \
>> 	video/x-raw,width=640,height=480,format=RGB \
>> 	! v4l2sink device=/dev/video2 v4l2src device=/dev/video3 ! \
>> 	video/x-raw,width=1920,height=1440,format=RGB ! videoscale ! \
>> 	video/x-raw,width=640,height=480 ! videoconvert ! ximagesink
>>
>> 2.b qv4l2 (requires v4l-utils):
>>
>> Open the output device:
>>
>> $ qv4l2 -d2
>>
>> Open the capture device:
>>
>> $ qv4l2 -d3
>>
>> Start the streaming at both, at any order. You can change the frame
>> content at "Test Pattern Generator" -> "Test Pattern" on the output.
>>
>> Thanks,
>> 	André
>>
>> André Almeida (7):
>>   media: vimc: Create video module
>>   media: vimc: video: Add write file operation
>>   media: vimc: Create a V4L2 output device
>>   media: vimc: Send null buffer through the pipeline
>>   media: vimc: core: Add output device on the pipeline
>>   media: vimc.dot: Update default topology diagram
>>   media: vimc.rst: Add output device
>>
>>  Documentation/media/v4l-drivers/vimc.dot    |   4 +-
>>  Documentation/media/v4l-drivers/vimc.rst    |  12 +-
>>  drivers/media/platform/vimc/Makefile        |   4 +-
>>  drivers/media/platform/vimc/vimc-capture.c  | 356 +++----------------
>>  drivers/media/platform/vimc/vimc-common.h   |   5 +-
>>  drivers/media/platform/vimc/vimc-core.c     |   7 +-
>>  drivers/media/platform/vimc/vimc-debayer.c  |  14 +-
>>  drivers/media/platform/vimc/vimc-output.c   | 362 ++++++++++++++++++++
>>  drivers/media/platform/vimc/vimc-scaler.c   |  13 +-
>>  drivers/media/platform/vimc/vimc-sensor.c   |  10 +-
>>  drivers/media/platform/vimc/vimc-streamer.c |  24 +-
>>  drivers/media/platform/vimc/vimc-video.c    | 273 +++++++++++++++
>>  drivers/media/platform/vimc/vimc-video.h    | 130 +++++++
>>  13 files changed, 849 insertions(+), 365 deletions(-)
>>  create mode 100644 drivers/media/platform/vimc/vimc-output.c
>>  create mode 100644 drivers/media/platform/vimc/vimc-video.c
>>  create mode 100644 drivers/media/platform/vimc/vimc-video.h
>>

