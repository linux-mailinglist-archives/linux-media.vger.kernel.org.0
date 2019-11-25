Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9752109181
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 17:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbfKYQCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 11:02:50 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37355 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728454AbfKYQCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 11:02:47 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZGoziMmHfLwWdZGp2iWEUQ; Mon, 25 Nov 2019 17:02:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574697765; bh=AHbEf+/uYAJZausDz9WJwqDqubKqMjahXc2wm+teEoE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e7nznEJ8ibhxT2WAQRjTuMLhmq0cH9NN3yF18vKM5n14d8/x5jf1pmduzI0KyoQE9
         JsArKCwxrVvZ8ByLbVXwAW2CFnE8P2dXE4IoS0q2mKilF7pffIKXF6G8sWFlt01ARp
         L59OzlI62cpdtBEof9bKVGvH88LaX6f94BYHoYG221j4lyLr3m9D+nhho1Zic6M7S4
         OEuUeEVlRGdKn2BF5JDiwZCISP9yPRUQuNZCadkoVx2M92mxjSV8XNHfIVzHo7IHYs
         +vidT+Fo+MQcKSEEHls4JAWW2+9Rdrhot9WR9Tu/+qann4xvN8eDpcQjB89tAO+5tf
         3f/fEDZPKDlAA==
Subject: Re: [PATCH v4 0/8] y2038 safety in v4l2
To:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, y2038@lists.linaro.org
References: <20191111203835.2260382-1-arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5c7bed6e-12d9-15e0-236e-d4f99710fbbd@xs4all.nl>
Date:   Mon, 25 Nov 2019 17:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN4Wd3LR6zAOvg78glb7of3z1K8Q858nkje+p+Sv5jB2zsxa4z+pSSMN9YXOEsRiW8ZKh/QX46WFA9qObtho5Yacc6ueCmTKat4J9KrC7zRoqS8YQXq/
 99O+IQhaBaOcB1G27c9Z05xKgMmzXIO6e72MIpU4Qwar5dn98SmVB47z0HmgDtHklHRi4UKF9vVzDOR2xdrb3gp54+Z8fP7QHUhcWVU8t50EfTpPbtYExnwb
 jg5s8dLku38hiKqAXH9SRx3cKmaPnqEFRFmC5lvAnR6i/gPdRjTUC7SyMwc+3E8QK00g3Nd7qLcnfwEU4/yt/w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> I'm in the process of finishing up the last bits on y2038-unsafe
> code in the kernel, this series is for v4l2, which has no problem
> with overflow, but has multiple ioctls that break with user space
> built against a new 32-bit libc.

Thank you for working on this. Much appreciated!

I've reviewed this v4 series and found a few issues (mostly things
that ended up in videodev2.h that shouldn't be there).

Once a v5 is posted I'll try to test this more.

Is there an easy(-ish) way to test this with a time64 ABI? Do you
have such an environment set up for testing?

> 
> I posted similar patches as part of a series back in 2015, the
> new version was rewritten from scratch and I double-checked with
> the old version to make sure I did not miss anything I had already
> taken care of before.
> 
> Hans Verkuil worked on a different patch set in 2017, but this
> also did not get to the point of being merged.
> 
> My new version contains compat-ioctl support, which the old one
> did not and should be complete, but given its size likely contains
> bugs. I did randconfig build tests, but no runtime test, so
> careful review as well as testing would be much appreciated.
> 
> With this version, the newly added code takes care of the existing
> ABI, while the existing code got moved to the 64-bit time_t
> interface and is used internally. This means that testing with
> existing binaries should exercise most of the modifications
> and if that works and doesn't get shot down in review, we can
> probably live without testing the new ABI explicitly.
> 
> I'm not entirely happy with the compat-ioctl implementation that
> adds quite a bit of code duplication, but I hope this is
> acceptable anyway, as a better implementation would likely
> require a larger refactoring of the compat-ioctl file, while
> my approach simply adds support for the additional data structure
> variants.

A cleanup is indeed much more work. This y2038 code is awful, but that's
really because the original structs are aligned in the worst possible
way.

Regards,

	Hans

> 
> This is a minor update compared to version 3 of this series,
> with bugfixes for small mistakes that I found or that were
> reported by automated build bots. I updated the tree at [2]
> to this version now.
> 
>       Arnd
> 
> [1] https://lwn.net/Articles/657754/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-v4l2
> 
> Arnd Bergmann (8):
>   media: documentation: fix video_event description
>   media: v4l2: abstract timeval handling in v4l2_buffer
>   media: v4l2-core: compat: ignore native command codes
>   media: v4l2-core: split out data copy from video_usercopy
>   media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
>   media: v4l2-core: fix v4l2_buffer handling for time64 ABI
>   media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
>   media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI
> 
>  .../media/uapi/dvb/video-get-event.rst        |   2 +-
>  Documentation/media/uapi/dvb/video_types.rst  |   2 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +-
>  drivers/media/pci/meye/meye.c                 |   4 +-
>  drivers/media/usb/cpia2/cpia2_v4l.c           |   4 +-
>  drivers/media/usb/stkwebcam/stk-webcam.c      |   2 +-
>  drivers/media/usb/usbvision/usbvision-video.c |   4 +-
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 470 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-event.c          |   5 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 188 +++++--
>  drivers/media/v4l2-core/v4l2-subdev.c         |  20 +-
>  drivers/media/v4l2-core/videobuf-core.c       |   4 +-
>  include/linux/videodev2.h                     |  17 +-
>  include/trace/events/v4l2.h                   |   2 +-
>  include/uapi/linux/videodev2.h                |  77 +++
>  15 files changed, 669 insertions(+), 136 deletions(-)
> 

