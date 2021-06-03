Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A78339A9F7
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 20:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhFCS1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 14:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhFCS07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 14:26:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DBAC06174A
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 11:25:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 96A631F434B7
Message-ID: <ef2d8511f870777147b295c8bc58c891feee9f70.camel@collabora.com>
Subject: Re: [RFC] media: v4l2: Adding mem2mem ftrace support
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Date:   Thu, 03 Jun 2021 15:25:05 -0300
In-Reply-To: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

On Mon, 2021-05-17 at 19:37 +0100, Emil Velikov wrote:
> Hi everyone,
> 
> This RFC aims to kick off a discussion about adding ftrace events in
> V4L2 and mem2mem in particular.
> 
> The goal is to aid both userspace and kernel developers alike by
> allowing them to trace their individual application/library and drivers,
> respectively.
> 

We'll need some developer-oriented docs, perhaps in Documentation/userspace-api/media/
or similar, with some examples and some guidelines.

Also, could you add some scripts somewhere to show us how these are used/enabled?

> 
> # Data provided
> 
> In order to correlate the components through their lifetime we need a
> few unique identifiers:
> 
>  - minor: the device minor, aka /dev/video
>    Useful, when multiple devices are present.
> 
>  - fh: file handle
>    Allows us to map the buffer, ioctl and mem2mem jobs.
> 
>  - fh: as a job instance... sort of
>    We also use it as to distinguish between the different jobs, as long
>    as we track the cancel/finish events.
> 
> 
> Additionally, for buffers we need:
>  - type: VIDEO_OUTPUT_MPLANE, VIDEO_CAPTURE_MPLANE, etc
>  - index: buffer index
>    Each buffer type has its own pool.
> 
> 
> # Event list and examples
> 
> Generic:
> 
> v4l2_ioctl_s_fmt: minor = 0, fh = 5068c670, type = VIDEO_OUTPUT_MPLANE,
> width=1280, height=720, ...
> 
> v4l2_qbuf: minor = 0, fh = 5068c670, index = 0, type =
> VIDEO_CAPTURE_MPLANE, bytesused = 0, ...
> v4l2_dqbuf: minor = 0, fh = 5068c670, index = 0, type =
> VIDEO_CAPTURE_MPLANE, bytesused = 0, ...
> 
> 
> Mem2mem specific:
> 
> v4l2_m2m_schedule: minor = 0, fh = 5068c670
> v4l2_m2m_schedule_failed: minor = 0, fh = 5068c670, reason = NO_SRC
> v4l2_m2m_queue_job: minor = 0, fh = 5068c670, src = 0, dst = 0
> Currently src and dst only show the buffer index. Buffer type can be
> deduced based on the type of job - encode or decode.
> 
> v4l2_m2m_run_job: minor = 0, fh = 5068c670
> v4l2_m2m_cancel_job: minor = 0, fh = 5068c670
> v4l2_m2m_finish_job: minor = 0, fh = 5068c670
> 
> v4l2_m2m_stream_on: minor = 0, fh = 5068c670, type = f9e16c2e
> v4l2_m2m_stream_off: minor = 0, fh = 5068c670, type = f9e16c2e
> 
> v4l2_m2m_buf_done: minor = 0, fh = 5068c670, index = 0, type =
> VIDEO_CAPTURE_MPLANE, state = DONE
> 

Do we need something to distinguish the Job ID?

Thanks,
Ezequiel

