Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 264A0191CA1
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 23:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgCXW0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 18:26:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38970 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbgCXW0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 18:26:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id a9so411801wmj.4
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2020 15:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llbNcbnPT+61B/q3/YSUbviN8jvQBWSqV94t0dwrgSQ=;
        b=kaxx88Vzk39Hy1CNo216C7Bs94n3sZmU/l5PsOsVs4VIVgrv2ZaiUROMzhdl/UpLG2
         QN1ybjQ57d10zZyB/tvjwKiY9ZcbNNtDxk57Low4uQDNIeizPzeTqk3sPYU931E6BSlP
         Z2Xu0bxsBXpSDph5+ymtxpsOAdtMj19vX6g+5owFQdshyU8bWHq/FpykmlAAp6lRiZbM
         CLd8nu2ycbU7mW+fQwwAKT2RR1YbxzLRj7auzwsQ0Sy20FV/xg2iRi6+x18bPaB80wp3
         TwW4sDHwgy59qL5iV6lFdIZOvrpp07Bz3UhmzTFUjc6ZtiqDbfewwZOk9RlLkKE6rvXr
         I+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llbNcbnPT+61B/q3/YSUbviN8jvQBWSqV94t0dwrgSQ=;
        b=FtBwxCbHYrl/IGlAIbitU1vcVyv2u6gpLSO2qR5JGiBs1NmgfHZpm6WDimGBgHzWrl
         cLlwv45CzQo0vf47sd0doNySsLTgjNcPEsnLPZV9vPrnbJYt2u5Z7EnJXVk8TxdOjxMy
         SnRcwXUu1rwCzyM+nSVbj0lYPAu14Bfnn6IUKcR+ZIYeivVII3bssacqnEq24i29aep3
         tHWYwT6SJ8DhlegetqO0qa/3m8Hw1aj+XB58G1DEA9LV5pcnbZQaWPeU/5PbN3luL/OA
         wJdcDpCzlTNwmF7ojYZ4enxzFgDGx0xaAvAe3ffIMK4rQp1xDKyvffngFrsZlA28L4yU
         D2Mg==
X-Gm-Message-State: ANhLgQ0HtRloSTFtp4/R8yxCpZOBpB7IFZ8t6C2Nt+dp4WKdck+1kZ4T
        7fD9aI3Kq2y9VFt8iiuqHMb03Zi0IvFcwXr4thJmNg==
X-Google-Smtp-Source: ADFU+vsG0nj44395z/UAObak79rRPUUYHl/3xZDq2WUC/z5Ac57Y6oHMkMzVCGmQsm+nwh4PxkOyxA/qp/kygUVXWw8=
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr176622wmj.183.1585088777147;
 Tue, 24 Mar 2020 15:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200324202844.1518292-1-jacopo@jmondi.org>
In-Reply-To: <20200324202844.1518292-1-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 24 Mar 2020 22:25:59 +0000
Message-ID: <CAPY8ntCM7MyP6xt-Bqg5pMLdqGSR=GW3mi3grEBn94nqhbLuRA@mail.gmail.com>
Subject: Re: [libcamera-devel] [PATCH 0/4] media: Register read-only sub-dev devnode
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Tue, 24 Mar 2020 at 20:25, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Add new functio v4l2_device_register_ro_subdev_nodes() to pair with
> v4l2_device_register_subdev_nodes() that allows a bridge driver to register the
> device node for its subdevices in read-only mode.
>
> devnode-centric (aka non-MC) bridge drivers control their subdevices through
> direct calls to v4l2 subdev operations and do not want userspace to be able
> to control the subdevice configuration by calling ioctls on the sub-device
> devnode. For this reason, they mostly refrain from registering any devnode at
> all for their subdevices.
>
> However it is sometimes required for userspace to access the sub-dev device
> nodes to collect information on the actual configuration, without changing
> the one currently applied to the device.
>
> This requirement became pressing while working on libcamera on devnode-centric
> platforms that do not expose any sub-device for their camera sensor to prevent
> userspace from changing their configuration. To allow them to register device
> node and being guaranteed to retain control of the subdevice configuration this
> series proposes a way to register device nodes in read-only to restrict
> access to all ioctls that could potentially affect the sub-dev configuration.
>
> Thanks
>    j
>
> Jacopo Mondi (4):
>   Documentation: media: Document read-only subdevice
>   media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()
>   media: bcm2835: Register sensor devnode as read-only
>   media: bcm2835: Fix trivial whitespace error

Minor point - you've sent this to linux-media. We (Raspberry Pi)
haven't pushed the bcm2835-unicam driver to mainline as yet (it's
still on the to-do list).
Yes, we need the core functionality that is in the first two patches,
but the last two aren't going to apply to any mainline tree.

  Dave

>  Documentation/media/kapi/v4l2-subdev.rst      | 38 +++++++++++++++++++
>  .../media/uapi/v4l/vidioc-g-dv-timings.rst    |  6 +++
>  Documentation/media/uapi/v4l/vidioc-g-std.rst |  6 +++
>  .../media/uapi/v4l/vidioc-subdev-g-crop.rst   |  9 +++++
>  .../media/uapi/v4l/vidioc-subdev-g-fmt.rst    |  8 ++++
>  .../v4l/vidioc-subdev-g-frame-interval.rst    |  8 ++++
>  .../uapi/v4l/vidioc-subdev-g-selection.rst    |  8 ++++
>  .../media/platform/bcm2835/bcm2835-unicam.c   |  4 +-
>  drivers/media/v4l2-core/v4l2-device.c         | 16 +++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 19 ++++++++++
>  include/media/v4l2-dev.h                      |  7 ++++
>  include/media/v4l2-device.h                   | 10 +++++
>  12 files changed, 136 insertions(+), 3 deletions(-)
>
> --
> 2.25.1
>
> _______________________________________________
> libcamera-devel mailing list
> libcamera-devel@lists.libcamera.org
> https://lists.libcamera.org/listinfo/libcamera-devel
