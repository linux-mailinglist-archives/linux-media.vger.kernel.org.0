Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA2020F6B4
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 16:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgF3OGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 10:06:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33932 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgF3OGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 10:06:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EB79C2A4A4C
Message-ID: <3603b92a1fa0334b8d4cccd27f7a42b2cccec646.camel@collabora.com>
Subject: Re: how to use stateless-mpeg2-vp8-h264-v4 on imx8m with vpu?
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Tue, 30 Jun 2020 11:05:59 -0300
In-Reply-To: <b168fa37-d129-ec3d-748e-d6ddcfef616f@puri.sm>
References: <9722da8a-42bf-e7e5-b6dd-8a3c0eff2f76@puri.sm>
         <c2e7408b627cf76d4939a7eef216bba9d5b0b7c6.camel@collabora.com>
         <b168fa37-d129-ec3d-748e-d6ddcfef616f@puri.sm>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-06-30 at 15:37 +0200, Martin Kepplinger wrote:
> On 30.06.20 14:59, Ezequiel Garcia wrote:
> > Hi Martin,
> > 
> > On Tue, 2020-06-30 at 13:16 +0200, Martin Kepplinger wrote:
> > > Hi Ezequiel,
> > > 
> > > On the Librem 5 (imx8mq) I try to decode a (h264) full hd video file
> > > using the VPU.
> > > 
> > > I'm running the following tree that doesn't change much, but adds the
> > > VPU dts description:
> > > https://source.puri.sm/martin.kepplinger/linux-next/-/commits/5.8-rc3/librem5___vpu
> > > (output of "v4l-ctl --all" at the bottom).
> > > 
> > 
> > OK, this means the VPU is enabled with the Hantro driver, so far so good.
> > 
> > > I now run your version of ffmpeg:
> > > https://gitlab.collabora.com/ezequiel/ffmpeg/-/commits/stateless-mpeg2-vp8-h264-v4
> > > (with minor build fixes) but simply doing "ffplay <file>" seems like not
> > > using /dev/video0
> > > 
> > > Is this supposed to work? If so, do I need to know anything about ffmpeg
> > > to be able to test this? How do you verify that the v4l2 mem2mem device
> > > (vpu) is being used?
> > > 
> > 
> > Not sure what state the branch is on, and also IIRC you should use that together
> > with mpv for proper zero-copy operation.
> > 
> > I think the libre elec community can help you with that, as they maintain
> > proper ffmpeg/mpv branches.
> 
> thanks for the hint.
> 
> > Do you need this to work with ffmpeg, or is GStreamer also OK?
> 
> gstreamer would be equally fine (or easier as I've used that before) for
> me. Last time I checked I think I'd have to build many more libraries
> from source in order to test though. That's the only reason why I've
> tried ffmpeg.
> 

In my experience, using gst-build is not too hard;
combined with meson, it's really fast to cross build.

There are a couple articles:

https://www.collabora.com/news-and-blog/blog/2020/03/19/getting-started-with-gstreamer-gst-build/
https://www.collabora.com/news-and-blog/blog/2020/05/15/cross-compiling-with-gst-build-and-gstreamer/

.. or tl;dr off the top of my head, hope it works:

(host) cd whatever_your_nfs_rootfs_is/gst-build
(host) meson --cross-file /home/user/meson-cross/arm64.txt build
(host) ninja -C build

(The second article explains how to generate a cross-file)

Then on the target:

(target) cd gst-build/
(target) ./gst-uninstalled.py

Few examples that have worked out of the box. The GL ones
might or might not work, depending on your support.

gst-launch-1.0 filesrc location=/$1  ! parsebin ! decodebin3 ! fakevideosink
gst-launch-1.0 -ev filesrc location=$1 ! decodebin3  ! videoconvert ! video/x-raw,format=YUY2 ! glupload ! glfiltercube ! glimagesink
gst-launch-1.0 -ev filesrc location=$1 ! decodebin3  ! videoconvert ! video/x-raw,format=NV12 ! kmssink

You'll have VPU interrupts and should see nice CPU usage. The GStreamer filter element that decodebin3 should pick up is "v4l2slh264dec".

Let us know if it works :-)

Thanks,
Ezequiel

