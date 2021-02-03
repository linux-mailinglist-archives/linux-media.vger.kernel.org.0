Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1419730D30B
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 06:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhBCF0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 00:26:50 -0500
Received: from mout02.posteo.de ([185.67.36.66]:37513 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231157AbhBCF0k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 00:26:40 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 9291B2400FC
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 06:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1612329941; bh=dxQduYF+0sys1gf2aDYuPQHYztkYah4vKLO+bypW4Gg=;
        h=Date:From:To:Cc:Subject:From;
        b=lW2EsX7mMFymibh3iOeDnvcmFvPoLs5jLgLffSfZO/YfAP+ktzI2w4v1TtjPZ2YIa
         IG2K1ys5LEJVEFPqM+y1LvKG97gUEuAgNfD79BFS0YWlSBrBSCE4c2crmk/djqi+HV
         epPWaPff1NWX75UMbJVvwSEHkyoAePcv53/L1WT7G122Lj58TXoyyy+EkMsIkTW2pt
         3/72tsZJY3q7+QUwlaJ6xhckqUkbqpKYLufOMwXNHB5ekc1HuOWMBWQEbiZqn/r1Cr
         SpyusOubl+//M3OKxi9uAyFVHLMqfyfXB/mxeh+pQIljqdHVqsGCR0iSBo+IKLm58d
         sicGLm5N+wwtw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DVqs06nsfz9rxH;
        Wed,  3 Feb 2021 06:25:40 +0100 (CET)
Date:   Wed, 3 Feb 2021 06:25:40 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv3 0/4] Add /sys media_dev attr for V4L/DVB devices
Message-ID: <20210203052540.bh7gnungml6l3gtv@basti-TUXEDO-Book-XA1510>
References: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hans,

I have tested your patch with the same routine, that we've discussed in
the previous mail series. Here are the results:
https://paste.debian.net/1183755/

You probably still have to adjust the compliance tool, right?

Here is how the media_dev node looks like for me:
```
basti@nanopct4:~$ cat /sys/class/video4linux/v4l-subdev3/media_dev
240:0
# corresponds to:
basti@nanopct4:~$ ls -l /dev/
...
crw-rw---- 1 root video   240,   0 Feb  3 06:10 media0
...
# leads to:
basti@nanopct4:~$ cat /sys/dev/char/240:0/model
rkisp1
```

Greetings and thank you,
Sebastian

On 02.02.2021 15:49, Hans Verkuil wrote:
>A long standing issue is how to find the associated media device for
>a V4L or DVB device node. This is primarily useful for applications
>like v4l2-ctl and v4l2-compliance.
>
>Until recently these applications relied on /sys and the fact that
>the media device was accessible in /sys via:
>
>/sys/class/video4linux/videoX/device/mediaY/
>
>But commit ee494cf377e1 ("media: v4l2-device: Link subdevices to their
>parent devices if available") broke that scheme for subdevices. That
>scheme was rather a hack anyway.
>
>Attempts to report the major/minor number of the media device via the
>public API (i.e. by extending VIDIOC_QUERYCAP or VIDIOC_SUBDEV_QUERYCAP)
>failed, so this patch series now just adds a media_dev attribute when a
>V4L or DVB device node is created. This attribute contains the major:minor
>of the media device. It is only created if the device node is actually
>associated with a media controller.
>
>The original idea for this v3 was to store the media device minor/major
>at the time of the device node registration, however the media device
>node is typically created last, so this information isn't known yet.
>
>Instead a new media_device_devt() function was added that returns the
>dev_t of the media device node safely.
>
>In addition a patch was added for vim2m to ensure that the v4l2_dev.mdev
>is set before video_register_device() to ensure that the media_dev
>attribute is created.
>
>This issue was reported by Sebastian Frick:
>
>https://lore.kernel.org/linux-media/20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510/T/#t
>
>Regards,
>
>        Hans
>
>Changes since v2: add new media_device_devt function.
>        Add vim2m patch: v4l2_dev.mdev was set too late.
>
>Changes since v1: use the is_visible callback to ensure the attribute
>        is only shown if mdev is non-NULL.
>
>Hans Verkuil (4):
>  vim2m: intialize the media device earlier
>  media-device: add media_device_devt function
>  v4l2-dev: add /sys media_dev attr for V4L2 devices
>  dvbdev: add /sys media_dev attr for DVB devices
>
> drivers/media/dvb-core/dvbdev.c    | 45 +++++++++++++++++++++++++++
> drivers/media/mc/mc-device.c       | 16 ++++++++++
> drivers/media/test-drivers/vim2m.c | 14 +++++----
> drivers/media/v4l2-core/v4l2-dev.c | 49 +++++++++++++++++++++++++++++-
> include/media/media-device.h       | 10 ++++++
> 5 files changed, 127 insertions(+), 7 deletions(-)
>
>-- 
>2.29.2
>
