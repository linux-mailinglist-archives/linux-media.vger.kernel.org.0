Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02A41F76E0
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 12:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFLKpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 06:45:34 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57903 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726219AbgFLKpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 06:45:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id jhBgjnxcRK7ldjhBjjNJPz; Fri, 12 Jun 2020 12:45:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591958731; bh=UwdbdwfSNPwrcmDFFB2N0FFhFIjPtn1kAxKHOHGNRpA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BNoYpKBzMIuRdKwR9CycU852BQiUF/lzJ7GCkSHzlc+jZWcfEGMhxCqDuX0XpUSTy
         EL1BcMYJqR+iEUzoiAzXLONNZyJq80xvB4VvouZ0wySkP6hM3+qoyWyzR8LmE9AnEQ
         outJGTnGqjfEekzIE5zqp6ZGOfphKB6C6E5VWAlflIt5LSdD9dhjQbiMgAGwfDr27a
         KCTbl6EF75riuwUXAhL5YAa7P8ojoXYBwgN+mjpobQhciMY3zjN+Rtp0H4WEFvo1SD
         v35fnhWr/EUE6nbosmlCY4JqqnSEGChNtoxndjoyDfvuiDkz2Arv5yGB0tdT1T4g62
         C9CH5RYYw7/Lg==
Subject: Re: [PATCH 0/5] media-device: Report if graph is complete
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b40536d2-7e02-85d2-ccb4-3ae07294fafe@xs4all.nl>
Date:   Fri, 12 Jun 2020 12:45:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfA6XG5nmsIhON1lJT29g+Z7oqtFvWkn0QZIf50B6Ji1R3Dtfy6aXqifPmqElEEz0zMWinnt28u/qEGJsfYraX5YlryBNEAkUXhBTQ1LqaQPKWhJJ2Zsb
 qRV9SQN+p2nLjRnovnqa89LfxwNnV7BoVv3smRNmafpmW9sbS7gxfVap3qo3qw9oi98nyOZMbLp8x1ttkmQU75DN24xIuWdGE0VxhIMOXc+1LrxpdTi+X1gC
 3tPCqHKpl0GcwPuOB/3fCvLTRS3DOEXxf/CL8Cr/0FIS7k1pdRZcJARN95kfVwvY8CUr5LIPP5eCpO2pgxhxSP9PkALgDf8pe3pmWwvcva8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 11/06/2020 01:05, Niklas Söderlund wrote:
> Hi,
> 
> This series is an attempt to scratch an old itch, it's problematic to
> support unbind and then a second call to complete in v4l2-async. When
> the second complete call happens a lot of things can go wrong.
> 
> When v4l2-async complete callback is called multiple video devices are
> registered with video_register_device(). Then if a v4l2-async unbind
> happens they are unregistered with video_unregister_device().
> 
> Their are multiple problems with this, specially for R-Car VIN.
> 
> 1. Depending on which subdevice is unbound parts of the video pipeline
>    can still function. There are for example two CSI-2 receivers
>    connected to two different CSI-2 buses in the pipeline. If one of the
>    receivers are unbound the other can still function perfectly well.
>    But with the current setup everything goes away, this is bad for
>    operational safety.

But even with this series, the R-Car VIN will still wait at boot time until
the graph is completed before registering the devices, right?

So this doesn't solve the case where e.g. one of the two CSI-2 receivers
is broken or a sensor is broken, but you still want to be able to work
with the remaining pipeline.

> 
> 2. The struct video_device contains a static struct device, which in
>    turn contains a static struct kref. When the kref is release by
>    calling video_unregister_device() and then later trying to
>    re-register the video device video_register_device() the kref life
>    time management kicks in and produces warnings in later kernels or
>    OOPS in older ones.

This is a bug in the driver or v4l2 core code (I would need to know the
details first). And this should be fixed rather than basically papering
over it.

I think this relates to this kobject warnings:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg117573.html

> 
> It has been discussed in the past at various conferences that it could
> be OK to not video_unregister_device() if a v4l2-async unbind happens.
> The argument against it was that user-space needed a way to check if a
> pipeline was completely probed or not. And this used to be that the
> video devices where only present if everything was available.
> 
> It was agreed in principle that if an alternate way for media controller
> centric devices could be found to inform user-space of this fact could
> be found it would be OK to not unregister video devices in case of an
> unbind or even allow registering the video devices at probe time instead
> of at v4l2-async complete time.
> 
> This series aims to provide such a mechanism using the media device
> itself to report if the media graph is complete or not.

This series really addresses only a small corner case of a much larger
issue: what to do if for some reason only part of the media topology
comes up or if a part disappears/breaks during operation?

This larger issue requires a proper RFC.

It may well be that this complete flag is still needed when you look at
the big picture, but in this series it feels very much like a hack.

Regards,

	Hans

> 
> Niklas Söderlund (5):
>   uapi/linux/media.h: add flags field to struct media_v2_topology
>   media-device: Add a complete flag to struct media_device
>   v4l2-async: Flag when media graph is complete
>   mc-device.c: Report graph complete to user-space
>   rcar-vin: Do not unregister video device when a subdevice is unbound
> 
>  drivers/media/mc/mc-device.c                | 2 +-
>  drivers/media/platform/rcar-vin/rcar-core.c | 5 -----
>  drivers/media/v4l2-core/v4l2-async.c        | 5 +++++
>  include/media/media-device.h                | 2 ++
>  include/uapi/linux/media.h                  | 4 +++-
>  5 files changed, 11 insertions(+), 7 deletions(-)
> 

