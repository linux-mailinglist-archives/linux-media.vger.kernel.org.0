Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3095758B5
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 02:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbiGOAwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 20:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbiGOAwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 20:52:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F354D481FC
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 17:52:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C90FC9DA;
        Fri, 15 Jul 2022 02:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657846352;
        bh=4T1Wl5apbCf+a9+ZUdAI0km1TZg8bxlJloS5k5hCipY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EAE5SYrqJVe9+hOH4GyVx03RVPJT8QeknrvBaN2hYahRp3dDrJmciubv4Dkq8qWUw
         yXSEhPlvY9rIUtr+iF6uJfEPq5hhBcxN3NUBY7WYqptmeZTMZm8JGhev08eLOSeCob
         tjIzGfGbl7oZz5uUoiFSQv5SqEFlP9JDgmJ5Cm5Q=
Date:   Fri, 15 Jul 2022 03:52:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/7] media: Implement UVC v1.5 ROI
Message-ID: <YtC6MNWe59+JMh0B@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <CANqU6Ff_eRZ5ORfpi7NmcagcS18moOk9isBUMkpPLwGgXfLhgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANqU6Ff_eRZ5ORfpi7NmcagcS18moOk9isBUMkpPLwGgXfLhgA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

On Fri, Jul 15, 2022 at 08:25:20AM +0900, Yunke Cao wrote:
> Hi Laurent,
> 
> Do you have time to review this version? Ricardo has already reviewed
> it, I hope it is easier to review now.

I'll try find time, but I doubt it will be before a couple of weeks.

> On Tue, Jun 28, 2022 at 4:57 PM Yunke Cao <yunkec@google.com> wrote:
> >
> > This patch set implements UVC v1.5 region of interest using V4L2
> > control API.
> >
> > ROI control is consisted two uvc specific controls.
> > 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> > 2. An auto control with type bitmask.
> >
> > V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> >
> > Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> > and calling ioctls.
> >
> > 1/7 add V4L2_CTRL_TYPE_RECT.
> > 2/7 and 3/7 support compound types in UVC.
> > 4/7 implement ROI in UVC.
> > 5/7 is a cherry-pick for Hans' implementation of
> > V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> > 6/7 support MIN/MAX in UVC.
> > 7/7 document the changes.
> >
> > Changelog since v6:
> > -Add patch 2 and 3 to support compound types properly in UVC and
> > implement ROI on top of them.
> > -Reorder the patches.
> >
> > Changelog since v5:
> > -Add a __uvc_ctrl_get_p_rect_to_user instead of modifying
> >  __uvc_ctrl_get.
> > -Support V4L2_CTRL_FLAG_NEXT_COMPOUND correctly.
> > -Fix formats.
> >
> > Changelog since v4:
> > -Cherry-pick the original patch
> >  "v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL".
> > -Split patch "media: uvcvideo: implement UVC v1.5 ROI" into two patches.
> >  The codes for supporting min/max in uvc are in patch 4/5 now.
> > -Minor fixes. Detailed changelog in patches
> >
> > Changelog since v3:
> > - Reordered/sliced the patches.
> >   1. Add rect type.
> >   2. Add min/max.
> >   3. Add the roi controls (including init to default).
> >   4. Document the roi controls.
> > - Define the roi controls as uvc-specific in uvcvideo.h.
> > - Modified documentation.
> > - Removed the vivid change. Given the controls are now uvc-specific.
> >   I'm not sure how valuable it is to add it in vivid. Let me know
> >   otherwise.
> >
> > Hans Verkuil (1):
> >   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> >
> > Yunke Cao (6):
> >   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
> >   media: uvcvideo: add uvc_ctrl_get_fixed for getting default value
> >   media: uvcvideo: Add support for compound controls
> >   media: uvcvideo: implement UVC v1.5 ROI
> >   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
> >   media: uvcvideo: document UVC v1.5 ROI
> >
> >  .../userspace-api/media/drivers/uvcvideo.rst  |  61 +++
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
> >  .../media/videodev2.h.rst.exceptions          |   3 +
> >  drivers/media/i2c/imx214.c                    |   5 +-
> >  .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
> >  drivers/media/usb/uvc/uvc_ctrl.c              | 479 ++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c              |  20 +-
> >  drivers/media/usb/uvc/uvcvideo.h              |  14 +
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +-
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 +++++-
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> >  include/media/v4l2-ctrls.h                    |  34 +-
> >  include/uapi/linux/usb/video.h                |   1 +
> >  include/uapi/linux/uvcvideo.h                 |  13 +
> >  include/uapi/linux/v4l2-controls.h            |   8 +
> >  include/uapi/linux/videodev2.h                |   4 +
> >  16 files changed, 788 insertions(+), 79 deletions(-)

-- 
Regards,

Laurent Pinchart
