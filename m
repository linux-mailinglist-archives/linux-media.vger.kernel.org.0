Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D38B30D484
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 09:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhBCIAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 03:00:45 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37227 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231738AbhBCIAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 03:00:42 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7D4slul1CE1Ic7D4wlHU5h; Wed, 03 Feb 2021 08:59:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612339199; bh=TOLLB3ew23avYS6JOfl7KTi+HABJ45/s8cNDCQDq4ao=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vrKVc8e436ExADb/YSwUis5j99xjkbC+YsakJCmNWYZYIPQ2gQg0olOmgp2Nnp/hy
         Diy5p7BjzQj1rBM2+harUcYWlnkIg1+MPJW9YE3ue9vlbiK35Z/6sTkbMM8HPrchER
         Zvi4bQRs2tn9Re0iO51+JIQPuRlRbyhCFJq8FpQ5T1i9cr8vb1KdZUOpWWyovqVD0a
         1S55uz9lQcm8Ug7yNUy60AUEGusU7uQRCxs7xvKCMUK9D6trkMTiah446FMpo6b8cU
         TENIu22EE43tPUEy3jVkAcNBwMt3JhpJgIhGpVGX68rEtwYr499lSv9FIN/exIObaY
         ZkMDPxT4pEmhw==
Subject: Re: [PATCHv3 0/4] Add /sys media_dev attr for V4L/DVB devices
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
 <20210203052540.bh7gnungml6l3gtv@basti-TUXEDO-Book-XA1510>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eb2a92be-e399-8b84-10d5-48c89c8b61d5@xs4all.nl>
Date:   Wed, 3 Feb 2021 08:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203052540.bh7gnungml6l3gtv@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLr0I//XJIKUAFbbmLJCfJr/HJXfauCEbPmaaTBzajlwoDr1QM9ogKZWE1WcYV6c6ZLOmt/xfz2kNO67vpp519Hp5k2Dw51Twc97rwO/bkePl0eD+Fip
 JskDi52qgGNgGQHt/sQb8BmXQlWpVKyLs9D5t77Difpr/YGPjzOYnDL1Tlv1DfiXFNktCTZ9mT9BvXYkUx3z4p0w2AvuPSIW5KO47XV4WFGAyetmzkibpP74
 tTgKvD2/HHpcyiRxpmT5+Hu6E18cYFXu6OpXG3h4lbJpBADwcUSDg1ENGK32sIC91CkSUOW31Ikh9ItdDqos2eoRqPkBM9LUQWIXQ/odNik=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/02/2021 06:25, Sebastian Fricke wrote:
> Hey Hans,
> 
> I have tested your patch with the same routine, that we've discussed in
> the previous mail series. Here are the results:
> https://paste.debian.net/1183755/
> 
> You probably still have to adjust the compliance tool, right?

That's correct. I'm waiting for this to get the OK before I work
on v4l-utils.

> 
> Here is how the media_dev node looks like for me:
> ```
> basti@nanopct4:~$ cat /sys/class/video4linux/v4l-subdev3/media_dev
> 240:0
> # corresponds to:
> basti@nanopct4:~$ ls -l /dev/
> ...
> crw-rw---- 1 root video   240,   0 Feb  3 06:10 media0
> ...
> # leads to:
> basti@nanopct4:~$ cat /sys/dev/char/240:0/model
> rkisp1

Nice.

Regards,

	Hans

> ```
> 
> Greetings and thank you,
> Sebastian
> 
> On 02.02.2021 15:49, Hans Verkuil wrote:
>> A long standing issue is how to find the associated media device for
>> a V4L or DVB device node. This is primarily useful for applications
>> like v4l2-ctl and v4l2-compliance.
>>
>> Until recently these applications relied on /sys and the fact that
>> the media device was accessible in /sys via:
>>
>> /sys/class/video4linux/videoX/device/mediaY/
>>
>> But commit ee494cf377e1 ("media: v4l2-device: Link subdevices to their
>> parent devices if available") broke that scheme for subdevices. That
>> scheme was rather a hack anyway.
>>
>> Attempts to report the major/minor number of the media device via the
>> public API (i.e. by extending VIDIOC_QUERYCAP or VIDIOC_SUBDEV_QUERYCAP)
>> failed, so this patch series now just adds a media_dev attribute when a
>> V4L or DVB device node is created. This attribute contains the major:minor
>> of the media device. It is only created if the device node is actually
>> associated with a media controller.
>>
>> The original idea for this v3 was to store the media device minor/major
>> at the time of the device node registration, however the media device
>> node is typically created last, so this information isn't known yet.
>>
>> Instead a new media_device_devt() function was added that returns the
>> dev_t of the media device node safely.
>>
>> In addition a patch was added for vim2m to ensure that the v4l2_dev.mdev
>> is set before video_register_device() to ensure that the media_dev
>> attribute is created.
>>
>> This issue was reported by Sebastian Frick:
>>
>> https://lore.kernel.org/linux-media/20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510/T/#t
>>
>> Regards,
>>
>>        Hans
>>
>> Changes since v2: add new media_device_devt function.
>>        Add vim2m patch: v4l2_dev.mdev was set too late.
>>
>> Changes since v1: use the is_visible callback to ensure the attribute
>>        is only shown if mdev is non-NULL.
>>
>> Hans Verkuil (4):
>>  vim2m: intialize the media device earlier
>>  media-device: add media_device_devt function
>>  v4l2-dev: add /sys media_dev attr for V4L2 devices
>>  dvbdev: add /sys media_dev attr for DVB devices
>>
>> drivers/media/dvb-core/dvbdev.c    | 45 +++++++++++++++++++++++++++
>> drivers/media/mc/mc-device.c       | 16 ++++++++++
>> drivers/media/test-drivers/vim2m.c | 14 +++++----
>> drivers/media/v4l2-core/v4l2-dev.c | 49 +++++++++++++++++++++++++++++-
>> include/media/media-device.h       | 10 ++++++
>> 5 files changed, 127 insertions(+), 7 deletions(-)
>>
>> -- 
>> 2.29.2
>>

