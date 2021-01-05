Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50702EAD62
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbhAEOdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbhAEOdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 09:33:23 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07751C061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 06:32:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o13so73066898lfr.3
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 06:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RFz3s6uFRgUugW1okZRtJ1a8yuoGhyvmE74H8rFnYgQ=;
        b=pr0a39u7G1U/UKBhNQuPJnPvKKC9ymGrSsLnSM/t8rNaK9mq9xns0qtO3HTROEJbT/
         /KNtHSdUlVCYRl5PKdM2bukE73cvMKLNSHUgLEKxqnKConvdFfyJrlMFF9AA+PoCde7e
         D7IAzTaQK91slOqpR3DSQ1grWlvLPxvy7XqCsZVDIWmf+xo4+/Ijy+LCW6WtArYhRI8M
         LKV5pKo+VKd/Z0MyjjjpiuX7TjcgX9RoBrcZWKUMl0xopMTDDTakcItBnGqe9/QlEbDq
         dVnKJNJNJ1D9Pvn9LFwLfm77O7/wUvFqiyUmka7wieO5CeHwqqkpmhhH4QkVJMYUAjod
         VLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RFz3s6uFRgUugW1okZRtJ1a8yuoGhyvmE74H8rFnYgQ=;
        b=MqwJBFiCDDEOCrT/N7ChPSwvM3NBPI1TFQ70Sziah/nnGmipV4EyUlBC9HxIoz+oLm
         AafYf3VFhyYgJE8L6625B7LIfRb9rLoUwHZsyPmAXlaItQiD3rvOVicwuTbIvuSsLZaE
         rRl3D+xSI77460siiU1f/xOqoVqfqXvyCHe72Q6XDPOzFNteVp734uY6dV8mTvxYUWpV
         OuTk4Om9MBT/gJhsoZSAJoEAvzm5qrcT2QcqfnbIJzQ+yEZ24hO23j6MxN8ptT8TzKuS
         jsZj1m57ZrqQaLYZTThFhGsmo4R3SFU07lqtaT0WIO/jqF24PIeSh8rIpAjmzYIX61zM
         ebXg==
X-Gm-Message-State: AOAM530EZE4KMd4LR1/9DU5MhZ6cEXohU7FH/aVJyM0lWvBnsujzt3mF
        npgP2DFn9xf3q1z7cc859eD7upFieKCyJHD5MQ0=
X-Google-Smtp-Source: ABdhPJwZXP4pqjxO1Qq4WVj38Or6vTy0XvJDzV9UYkR8PczkW4Ske/QqTaFRhJnQ8suUJp1AVhcQ5x6shM3/bUcG8gk=
X-Received: by 2002:ac2:4431:: with SMTP id w17mr32450860lfl.223.1609857161504;
 Tue, 05 Jan 2021 06:32:41 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com> <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com> <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
 <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
In-Reply-To: <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Jan 2021 11:32:29 -0300
Message-ID: <CAOMZO5D1Lk6evyRZ08erQ3DaVgSHubGjGbK8dcKao=NS+m-PUA@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 5, 2021 at 10:45 AM Fabio Estevam <festevam@gmail.com> wrote:

> Just tested against next-20210105 and the original warning happens and
> csi is no longer probed.
>
> I am using the same dtb that worked on 5.4.84.
>
> It looks like we have a regression.

And here is a fix that allows csi to probe:
https://pastebin.com/raw/g6ijDf2N

Makes sense?

There is another error though: I do not see the message below as seen
on 5.4 kernel:
[   10.690711] imx-media: ov5640 1-003c:0 -> csi:0

And the same pipeline that worked with 5.4 does not work with linux-next:

# media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"
media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/320x240 field:none]"

# gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
video/x-raw, format=(string)UYVY, width=(int)320, height=(int)240,
framerate=(fraction)30000/1001, interlace-mode=(string)progressive,
colorim
etry=(string)1:4:7:1
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =
video/x-raw, format=(string)BGRx, width=(int)320, height=(int)240,
framerate=(fraction)30000/1001, interlace-mode=(string)progressive
/GstPipeline:pipeline0/GstFBDEVSink:fbdevsink0.GstPad:sink: caps =
video/[  421.495561] alloc_contig_range: [9c480, 9c4a6) PFNs busy
x-raw, format=(string)BGRx, width=(int)320, height=(int)240, fra[
421.504399] alloc_contig_range: [9c480, 9c4a6) PFNs busy
merate=(fraction)30000/1001, interlace-mode=(string)progressive
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: c[
421.520989] alloc_contig_range: [9c480, 9c4a6) PFNs busy
aps = video/x-raw, format=(string)UYVY, width=(int)320, height=([
421.533523] csi: pipeline start failed with -19
int)240, framerate=(fraction)30000/1001,
interlace-mode=(string)progressive, colorimetry=(string)1:4:7:1
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.106613417
Setting pipeline to NULL ...
Freeing pipeline ...
#

Any ideas?

Thanks
