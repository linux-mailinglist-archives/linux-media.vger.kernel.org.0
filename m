Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBFE575808
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 01:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbiGNXZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 19:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiGNXZc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 19:25:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112BD13DC9
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 16:25:32 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 75so5864982ybf.4
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 16:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jsfy5lbS5mir5FM0znMsW2Hm4Sw52m7s1CxVQDDtySI=;
        b=moYdohtoFUk5pbkei9u2uHILmJglEY5lLaZIiMiyJhpHiy5uemLBxOL/pARcUtpFaH
         Y1P2x0P0WkM9KOyI7R7XbPCHEypkdAr7aQRHgYhxLLVt8XS5IJKVgItNMR6JHjjhU0Yi
         wu8HuegykQn0Yki6FxXimcb0BOmngdDqDS7+iWipG0HRDVL7yBSyTridvEivi0rW/keF
         rTcQBY7pNImmdmU7zWG4naY3NSm7ey9hcJqM7oR/SIX/mPMM7E+WfI7SpdicoMu5voVD
         24iJwWsNRl5x1iqG5vJpwqstF9kHS4ggB15AVNFe7C5ANZ0bidm7yDxdo+741C8+DhGS
         6pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsfy5lbS5mir5FM0znMsW2Hm4Sw52m7s1CxVQDDtySI=;
        b=6OZcPRk5t4cg2uOBAx3F8y+d+xOM4jl+CHjvtcph3ZDiA2Lr2slOzv1sKDle7gUli4
         G/LK9VVBeaqmo3mBfzLWRrqmMuNKuoH6dhUsyGLKElssjVKgOggRGS2lq+qCbhCcgdOj
         98NySC2Gqk8Y8yVtV/riYv5/HyIOGNpfvn4wSD/hHRBmA0+8j4ZwbmL5CaW+9cSr+lTZ
         JB4r5/hBWqdxwLnJWYImqc0A1XmN3bcex2da1qyQNQIOe6iycHzaPUcwnbKEKwhDVtw4
         IlgkV9eSMVeP2pGxm+pqhvE3He2nuAfNgepEb+DAOtYghrcQx5a1gJJnNBIwU9bfwTVi
         Oxlg==
X-Gm-Message-State: AJIora/153YyOAOnKwfaoCUZwTD6/UpNu1ykdkPqOyard3YS6GDp4RfS
        2itzUKnpkvE+gZLTTAKTRnD68uR6yHQ5G8/4IHQ/HQ==
X-Google-Smtp-Source: AGRyM1tZLI9FohXOwi06564wgs3mzPO1mrrEBbpMrSUSXe6+9nU8095j55OYee1R70XtBslJVn49+4tMe8JNo9/rLzM=
X-Received: by 2002:a25:bfc8:0:b0:66e:e26a:c911 with SMTP id
 q8-20020a25bfc8000000b0066ee26ac911mr11314054ybm.19.1657841131109; Thu, 14
 Jul 2022 16:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 15 Jul 2022 08:25:20 +0900
Message-ID: <CANqU6Ff_eRZ5ORfpi7NmcagcS18moOk9isBUMkpPLwGgXfLhgA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] media: Implement UVC v1.5 ROI
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Do you have time to review this version? Ricardo has already reviewed
it, I hope it is easier to review now.

Thanks in advance!
Yunke



On Tue, Jun 28, 2022 at 4:57 PM Yunke Cao <yunkec@google.com> wrote:
>
> This patch set implements UVC v1.5 region of interest using V4L2
> control API.
>
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
>
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
>
> Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> and calling ioctls.
>
> 1/7 add V4L2_CTRL_TYPE_RECT.
> 2/7 and 3/7 support compound types in UVC.
> 4/7 implement ROI in UVC.
> 5/7 is a cherry-pick for Hans' implementation of
> V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> 6/7 support MIN/MAX in UVC.
> 7/7 document the changes.
>
> Changelog since v6:
> -Add patch 2 and 3 to support compound types properly in UVC and
> implement ROI on top of them.
> -Reorder the patches.
>
> Changelog since v5:
> -Add a __uvc_ctrl_get_p_rect_to_user instead of modifying
>  __uvc_ctrl_get.
> -Support V4L2_CTRL_FLAG_NEXT_COMPOUND correctly.
> -Fix formats.
>
> Changelog since v4:
> -Cherry-pick the original patch
>  "v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL".
> -Split patch "media: uvcvideo: implement UVC v1.5 ROI" into two patches.
>  The codes for supporting min/max in uvc are in patch 4/5 now.
> -Minor fixes. Detailed changelog in patches
>
> Changelog since v3:
> - Reordered/sliced the patches.
>   1. Add rect type.
>   2. Add min/max.
>   3. Add the roi controls (including init to default).
>   4. Document the roi controls.
> - Define the roi controls as uvc-specific in uvcvideo.h.
> - Modified documentation.
> - Removed the vivid change. Given the controls are now uvc-specific.
>   I'm not sure how valuable it is to add it in vivid. Let me know
>   otherwise.
>
> Hans Verkuil (1):
>   v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
>
> Yunke Cao (6):
>   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>   media: uvcvideo: add uvc_ctrl_get_fixed for getting default value
>   media: uvcvideo: Add support for compound controls
>   media: uvcvideo: implement UVC v1.5 ROI
>   media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>   media: uvcvideo: document UVC v1.5 ROI
>
>  .../userspace-api/media/drivers/uvcvideo.rst  |  61 +++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/i2c/imx214.c                    |   5 +-
>  .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
>  drivers/media/usb/uvc/uvc_ctrl.c              | 479 ++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c              |  20 +-
>  drivers/media/usb/uvc/uvcvideo.h              |  14 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 +++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  34 +-
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/uvcvideo.h                 |  13 +
>  include/uapi/linux/v4l2-controls.h            |   8 +
>  include/uapi/linux/videodev2.h                |   4 +
>  16 files changed, 788 insertions(+), 79 deletions(-)
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
