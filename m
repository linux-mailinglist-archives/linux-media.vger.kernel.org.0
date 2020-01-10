Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A1F136F89
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 15:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgAJOdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 09:33:05 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:43041 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726863AbgAJOdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 09:33:05 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pvLPinap5pLtbpvLTiR3uO; Fri, 10 Jan 2020 15:33:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578666783; bh=lhoeoS4k370JC9grZME+fmbzoHUSbY0il16oHnOYbHE=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Topk6oF2GNv4Ozx0GtAYZTZy9rDBQgpJ504lDs3zEGJxd+UDMqpaRvVRvUAp51aga
         bxhpqTa4Gj8hcSCNQS3jwndKZ2ba1RcSIQnADfOsM+19Hf2pDfYf6oSi3j+F08CvF1
         fgN65ufzCDGpylRLLzRggZMHRKdWXzI38DYNEJgVgim5ragbVwS4gWAGpEXNjWe4I0
         nQGtRWSiiXQhkRiUgk2leqgYw5FOYc22eNFSyxMAIH3Ls3FHVYx/CZXcpUMraWULyo
         MAaCzR72K2mqoB7AbNhAnts4FArnnPS6tNw0Jt4kSrcvPypTp/jd9co1luQl/8tUce
         fKIeim7i387Cw==
Subject: Re: [GIT PULL FOR v5.6] y2038 safety in v4l2
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
References: <362c4787-e114-1b90-66e2-f9a1cbafe567@xs4all.nl>
Message-ID: <1909dffd-bb11-6185-98ca-8b9ad95ea109@xs4all.nl>
Date:   Fri, 10 Jan 2020 15:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <362c4787-e114-1b90-66e2-f9a1cbafe567@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfATiIuwKJPjPu+q+f2hwRj9QbjuWExfpXJ6LLATQqnrzi7pTNTG3ebs//Izt5ZIjiOIUu9wvKjLGtmNaUEoK2JrTgwz2+gySCWDKhJGOGpmPt8nJsUSb
 0NuITQvpyBZN3BSofX+BE4A392OCFXsVx74pL9FFBfPPgTXOjd/Uyp9JERyHQPlCEFaqUND7RHHNHwIfQDWgCp8DFQ8eF/6UQdd1sKQ36wO0u5ifCnhEgce6
 0/3o9drBc6w4uATXD1LYTvqlgfEmViB9K6HRkfRGvpHEDALNPXY1rVh3wlF799/7BErh6ZDxLktB3bOTcMa/4Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 12/16/19 4:37 PM, Hans Verkuil wrote:
> Hi Mauro,
> 
> This series makes the V4L2 API y2038 safe. Many thanks to Arnd for working on
> this!
> 
> I have tested this using the test-media script and v4l2-ctl/v4l2-compliance
> binaries compiled for x86_64, i686, i686 with 64-bit time_t under both a
> 64 bit kernel (so the compat-ioctl32 code is called) and a native 32 bit
> kernel (to make sure both the 32 and 64-bit time_t versions are handled
> correctly).

For completeness: I have now also tested this on arm and arm64 architectures.
Everything looks fine!

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a:
> 
>   media: vivid: support multiplanar touch devices (2019-12-16 13:24:16 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-y2038
> 
> for you to fetch changes up to 416f076ff267d2208d4e09767080558cc619dd9c:
> 
>   media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI (2019-12-16 15:27:20 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Arnd Bergmann (8):
>       media: documentation: fix video_event description
>       media: v4l2: abstract timeval handling in v4l2_buffer
>       media: v4l2-core: compat: ignore native command codes
>       media: v4l2-core: split out data copy from video_usercopy
>       media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
>       media: v4l2-core: fix v4l2_buffer handling for time64 ABI
>       media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
>       media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI
> 
>  Documentation/media/uapi/dvb/video-get-event.rst |   2 +-
>  Documentation/media/uapi/dvb/video_types.rst     |   2 +-
>  drivers/media/common/videobuf2/videobuf2-v4l2.c  |   4 +-
>  drivers/media/pci/meye/meye.c                    |   4 +-
>  drivers/media/usb/cpia2/cpia2_v4l.c              |   4 +-
>  drivers/media/usb/stkwebcam/stk-webcam.c         |   2 +-
>  drivers/media/usb/usbvision/usbvision-video.c    |   4 +-
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c    | 476 +++++++++++++++++++++++++++++++++++++++++++++---------
>  drivers/media/v4l2-core/v4l2-event.c             |   5 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c             | 211 +++++++++++++++++++-----
>  drivers/media/v4l2-core/v4l2-subdev.c            |  26 ++-
>  drivers/media/v4l2-core/videobuf-core.c          |   5 +-
>  include/media/v4l2-common.h                      |  21 +++
>  include/media/v4l2-ioctl.h                       |  55 +++++++
>  include/trace/events/v4l2.h                      |   2 +-
>  include/uapi/linux/videodev2.h                   |  29 ++++
>  16 files changed, 717 insertions(+), 135 deletions(-)
> 

