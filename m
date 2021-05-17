Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D94A383C7E
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbhEQSj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 14:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQSj3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 14:39:29 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7662DC061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:12 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q5so7483642wrs.4
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mf7MUGFARqePOB7P0w6DNBDaMgW/aPgr1gz2d+UdhuU=;
        b=oLH4sQiElMsE4agFXU1EAJ3GdgfNQvvw7jvKMYh5ewvgRzQDIX3e3Vxw7cGHszT0X4
         gqekav5LtITBedSn+MYVd2kmlSgktNbxXHKzWUC2wSuvfRfqqt8r/r0e/TSTikKlqpQ0
         mymF8AOXov6Dij3SikdoUdn6UuiGsclj7j/d/zKojfRg9yYZUKJgw5GonK0GUJ4rG1dJ
         xMYtofESxTG9T0j/SRWlu+X7ZIHTPJA0rogLP1slieysNryHclBITQ+si3C7U+mF6pcw
         XQbJnpglG9WGjlPSZMKNNAHjKn8VuO09soQh/vanMkxEe20khO9MnmnpQqcjWF+q22zM
         fyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mf7MUGFARqePOB7P0w6DNBDaMgW/aPgr1gz2d+UdhuU=;
        b=ZZpxeRfX/FyojUoDTxXqB8j+4p3boPBY1i+e4lfNIc9mIpQLMi4ea3DMdtYT8IHpAj
         ioOLbQASerFwqB35nWpPzhFc8iiP1kU0esFI40dciXoj+NgDcWoWqZXbgWw68/YPB3CR
         Ag+F/+1r43OcZnUglJf2+BvLbyc8/9kYbZUXw/YUKlD0XaMZFXdXbXnI81eDXturN+OE
         F4B4nZD/BKHbM0B3/yjyRGBt9VreFqR8N/JJcB8v2EnvZ4yBIRbCKNEC69aqUmV1uipE
         7JoWkmYLE8p2Ch2to+WMXMqfXEy+K2FBCAQj0eNdLS2pZSAvfnB8SrfZVSOu1uSx2k7G
         0DtQ==
X-Gm-Message-State: AOAM531voh35qoNlN+tqXnwzfiTEWRcPzfySHKA7uAOQr7F/DBuDkvvB
        EvpYRxbZ8v3rr1ukCZKQg0g=
X-Google-Smtp-Source: ABdhPJw3ZjPNIFe7BuMQExVcbUbVkQbrUS4+yx0XJp0UMwXX/TxZJ8EITYH4irsqpQChRagEszu30g==
X-Received: by 2002:adf:9f51:: with SMTP id f17mr1274073wrg.3.1621276691262;
        Mon, 17 May 2021 11:38:11 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id f3sm18076625wrp.7.2021.05.17.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:38:10 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Subject: [RFC] media: v4l2: Adding mem2mem ftrace support
Date:   Mon, 17 May 2021 19:37:56 +0100
Message-Id: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

This RFC aims to kick off a discussion about adding ftrace events in
V4L2 and mem2mem in particular.

The goal is to aid both userspace and kernel developers alike by
allowing them to trace their individual application/library and drivers,
respectively.


# Data provided

In order to correlate the components through their lifetime we need a
few unique identifiers:

 - minor: the device minor, aka /dev/video
   Useful, when multiple devices are present.

 - fh: file handle
   Allows us to map the buffer, ioctl and mem2mem jobs.

 - fh: as a job instance... sort of
   We also use it as to distinguish between the different jobs, as long
   as we track the cancel/finish events.


Additionally, for buffers we need:
 - type: VIDEO_OUTPUT_MPLANE, VIDEO_CAPTURE_MPLANE, etc
 - index: buffer index
   Each buffer type has its own pool.


# Event list and examples

Generic:

v4l2_ioctl_s_fmt: minor = 0, fh = 5068c670, type = VIDEO_OUTPUT_MPLANE,
width=1280, height=720, ...

v4l2_qbuf: minor = 0, fh = 5068c670, index = 0, type =
VIDEO_CAPTURE_MPLANE, bytesused = 0, ...
v4l2_dqbuf: minor = 0, fh = 5068c670, index = 0, type =
VIDEO_CAPTURE_MPLANE, bytesused = 0, ...


Mem2mem specific:

v4l2_m2m_schedule: minor = 0, fh = 5068c670
v4l2_m2m_schedule_failed: minor = 0, fh = 5068c670, reason = NO_SRC
v4l2_m2m_queue_job: minor = 0, fh = 5068c670, src = 0, dst = 0
Currently src and dst only show the buffer index. Buffer type can be
deduced based on the type of job - encode or decode.

v4l2_m2m_run_job: minor = 0, fh = 5068c670
v4l2_m2m_cancel_job: minor = 0, fh = 5068c670
v4l2_m2m_finish_job: minor = 0, fh = 5068c670

v4l2_m2m_stream_on: minor = 0, fh = 5068c670, type = f9e16c2e
v4l2_m2m_stream_off: minor = 0, fh = 5068c670, type = f9e16c2e

v4l2_m2m_buf_done: minor = 0, fh = 5068c670, index = 0, type =
VIDEO_CAPTURE_MPLANE, state = DONE


# Testing and feasibility

While developing this series I've used them against the recent SAMA5D4
Hantro driver. As result I was able to measure:

 - No time differences when switching from hard to soft IRQ
 - Seemingly gstreamer issues decoding jobs, even before it has queued
   any buffers.
 - Notable 1ms queue times, when using gstreamer's new decodebin3
   element - relative to 50us when using decodebin.


# Open questions

As you may have noticed, a couple of places are not so friendly to
scripting and external tools. Here is what we can do:
 - add additional mem2mem job index identifier, so we can parse traces
   without having to track v4l2_m2m_cancel_job or v4l2_m2m_finish_job.
 - expand v4l2_m2m_queue_job() to include mode buffer details
   {src,dst}_buf { .index = foo, .type = bar, ... }


Thus looking for feedback from the overall community - is this something
we want, do the proposed trace events seem sufficient for your use-case?

Comments and reviews for the individual patches is more than welcome.

Thanks
Emil


Emil Velikov (5):
  media: v4l2: print the fh, during qbuf/dqbuf tracing
  media: v4l2: add VIDIOC_S_FMT tracing
  media: v4l2-mem2mem: add job tracing
  media: v4l2-mem2mem: add v4l2_m2m_buf_done trace point
  media: v4l2-mem2mem: add v4l2_m2m_stream_on/off tracepoints

 drivers/media/v4l2-core/v4l2-ioctl.c   |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c |  26 ++
 drivers/media/v4l2-core/v4l2-trace.c   |  11 +
 include/media/v4l2-mem2mem.h           |  21 +-
 include/trace/events/v4l2.h            | 357 ++++++++++++++++++++++++-
 include/uapi/linux/videodev2.h         |   1 +
 6 files changed, 411 insertions(+), 17 deletions(-)

-- 
2.31.1

