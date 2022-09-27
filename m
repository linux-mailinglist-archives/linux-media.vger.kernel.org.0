Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671C05EB93E
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 06:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiI0EdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 00:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiI0EdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 00:33:05 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C724A901BB
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 21:33:04 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c24so8062876plo.3
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 21:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yLnLd2CfDCYTK7eemUT24JwVsncgQif9IIOqEg+OiB0=;
        b=YGlt7UIvJWtt0/h4cIenHA3xZ4qOcIBHdHjpKig09GxRlHCYuKj8yos2siECmjhGhw
         +B/v3ExXlx009raIVsbatiFUnglXLRbbBtJwm399xKDhPlycWGLi9fv4SwKjOvlj/ISc
         79wBN1MxQykt7MT0YPHkK79oecklNKeZGPFM7h6gyH3MX4KnL3VpZj6OWDuQ9kRvCwrA
         VVGov7EmKbb6UZDcENzYDvH0v3wMq0n0SyPFHgTZYcP9IM/SJ3jzKcB7M3/8NQs4HnuV
         pJkB8Cz6UYyUK1DCQmUREgOX9e8Almun4YDQQBzDEw0WkVoz+0jc2stb2XE3dgRHz6Qt
         e21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yLnLd2CfDCYTK7eemUT24JwVsncgQif9IIOqEg+OiB0=;
        b=uNRTpjdIx/OaLFgj8i7VyuTGgWbbIujMD9mghPmtPqmYWWjwp18IAB0pRCWrXQggKJ
         xZTiLsUSxDAebFbUXU23e0AoSFLC9XlldOpilQ/7I0b7cU9fEdHPgBV8mDKQx6spRx8s
         VlwI7ItdrJUdhqLqyrA1ZCPkOvhJ/uUI+hxRDvZUDtSO32UEnkW/ZNHlAQo0Bhl0wvzX
         Z0kJTsiGgX/xnQ2ZGhRtUW3KIaY8h+3jPSRlE+wZ5mNV+WUi3qmXJ7lk0cvR9GKs/KD9
         A7VqqK9OOmrMun2VzZobH7twiNI3JgmA/OpNVjpN2rfhncr6xCY8t4Xs2CcuS58+3DHg
         xZSw==
X-Gm-Message-State: ACrzQf10zkjOjNzwi7J3XjJoTsdjBpDvKfPGdJkncDKn03vMDws78WT3
        +F0s01nzDEn0UpnWsqmYtUu65yi81t4RbuR9b5X9Mw==
X-Google-Smtp-Source: AMsMyM4cPp93fExZTZhyWjx09OwVEsdcgZCtM7+qL61tg0YHNGtjNeEoU+O2Zom1WrBVpc5T9Vl/FZCl+ZLiQAZFZAI=
X-Received: by 2002:a17:902:c40e:b0:178:4931:cc4d with SMTP id
 k14-20020a170902c40e00b001784931cc4dmr25125763plk.97.1664253184090; Mon, 26
 Sep 2022 21:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <CANqU6Ff_eRZ5ORfpi7NmcagcS18moOk9isBUMkpPLwGgXfLhgA@mail.gmail.com>
 <YtC6MNWe59+JMh0B@pendragon.ideasonboard.com>
In-Reply-To: <YtC6MNWe59+JMh0B@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 27 Sep 2022 13:32:52 +0900
Message-ID: <CANqU6FcEqmGUjKragJPu+T=5z_i9E4Juw=v3DEj4coj1fWtk1Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] media: Implement UVC v1.5 ROI
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review! I've been working on v8 based on your feedback.

I have some questions about your comments and replied in some of the patches.
Would you mind taking another look?

Best,
Yunke

On Fri, Jul 15, 2022 at 9:52 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> On Fri, Jul 15, 2022 at 08:25:20AM +0900, Yunke Cao wrote:
> > Hi Laurent,
> >
> > Do you have time to review this version? Ricardo has already reviewed
> > it, I hope it is easier to review now.
>
> I'll try find time, but I doubt it will be before a couple of weeks.
>
> > On Tue, Jun 28, 2022 at 4:57 PM Yunke Cao <yunkec@google.com> wrote:
> > >
> > > This patch set implements UVC v1.5 region of interest using V4L2
> > > control API.
> > >
> > > ROI control is consisted two uvc specific controls.
> > > 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> > > 2. An auto control with type bitmask.
> > >
> > > V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> > >
> > > Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> > > and calling ioctls.
> > >
> > > 1/7 add V4L2_CTRL_TYPE_RECT.
> > > 2/7 and 3/7 support compound types in UVC.
> > > 4/7 implement ROI in UVC.
> > > 5/7 is a cherry-pick for Hans' implementation of
> > > V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> > > 6/7 support MIN/MAX in UVC.
> > > 7/7 document the changes.
> > >
> > > Changelog since v6:
> > > -Add patch 2 and 3 to support compound types properly in UVC and
> > > implement ROI on top of them.
> > > -Reorder the patches.
> > >
> > > Changelog since v5:
> > > -Add a __uvc_ctrl_get_p_rect_to_user instead of modifying
> > >  __uvc_ctrl_get.
> > > -Support V4L2_CTRL_FLAG_NEXT_COMPOUND correctly.
> > > -Fix formats.
> > >
> > > Changelog since v4:
> > > -Cherry-pick the original patch
> > >  "v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL".
> > > -Split patch "media: uvcvideo: implement UVC v1.5 ROI" into two patches.
> > >  The codes for supporting min/max in uvc are in patch 4/5 now.
> > > -Minor fixes. Detailed changelog in patches
> > >
> > > Changelog since v3:
> > > - Reordered/sliced the patches.
> > >   1. Add rect type.
> > >   2. Add min/max.
> > >   3. Add the roi controls (including init to default).
> > >   4. Document the roi controls.
> > > - Define the roi controls as uvc-specific in uvcvideo.h.
> > > - Modified documentation.
> > > - Removed the vivid change. Given the controls are now uvc-specific.
> > >   I'm not sure how valuable it is to add it in vivid. Let me know
> > >   otherwise.
> > >
> > > Hans Verkuil (1):
> > >   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> > >
> > > Yunke Cao (6):
> > >   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
> > >   media: uvcvideo: add uvc_ctrl_get_fixed for getting default value
> > >   media: uvcvideo: Add support for compound controls
> > >   media: uvcvideo: implement UVC v1.5 ROI
> > >   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
> > >   media: uvcvideo: document UVC v1.5 ROI
> > >
> > >  .../userspace-api/media/drivers/uvcvideo.rst  |  61 +++
> > >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
> > >  .../media/videodev2.h.rst.exceptions          |   3 +
> > >  drivers/media/i2c/imx214.c                    |   5 +-
> > >  .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
> > >  drivers/media/usb/uvc/uvc_ctrl.c              | 479 ++++++++++++++++--
> > >  drivers/media/usb/uvc/uvc_v4l2.c              |  20 +-
> > >  drivers/media/usb/uvc/uvcvideo.h              |  14 +
> > >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +-
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 +++++-
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> > >  include/media/v4l2-ctrls.h                    |  34 +-
> > >  include/uapi/linux/usb/video.h                |   1 +
> > >  include/uapi/linux/uvcvideo.h                 |  13 +
> > >  include/uapi/linux/v4l2-controls.h            |   8 +
> > >  include/uapi/linux/videodev2.h                |   4 +
> > >  16 files changed, 788 insertions(+), 79 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
