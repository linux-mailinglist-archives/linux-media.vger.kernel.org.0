Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584505BDEDA
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 09:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiITHxx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 03:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiITHxA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 03:53:00 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FC2319
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 00:52:41 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so1696382pjl.0
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o8qNA/PLYAFkFUBWJc2QbzG2lZ+HBV3Al4ErJV1aai4=;
        b=Gk6fG01exrcNyPltZ7Lm3Yk+69ZjrPQrSvxpZwpLzKY3cuVZnbQqJzXqQf8T40m1/Y
         dHYHZKWabNlJplapLbtppglTAZhwD/dogEKplQynVmpUPcUkybU2K486i3AZRgONxDtW
         N7YxZtT7ll3uD5hlFw1hauIOBkL3P7S5xtM44eszu+LEXn9D0kd79ZA7xKdVCuUSC229
         NXIlkJBnHePxI4RS9rO8qJDYuKkSlEihLa9e5EhW2PF/31pVLQCJqok/5+ES1Sw+V4ez
         FSZPl+Gq4Il7mdT+Zxe+CFP46cga9pUey8H2zS+L5ZqNllA19jYm2l13f91z3/vzma24
         5Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o8qNA/PLYAFkFUBWJc2QbzG2lZ+HBV3Al4ErJV1aai4=;
        b=2Fzv+Azt0RCcj+GZdcvFLcp1Q8fo8C4i3xIHdr72hori0FLusIRpzu3JI+KC8NHPoS
         yPJwc/ayENGwt8qLc228CPLNFCaRG/BM0w+qnO3xU4HXpgWmPPVm1zET0QF3YRBPFRuo
         w1HUlgG9galhaMm7dXYvDEddKRoV91gxHUWNEFEFGhyt9yGGfMt7zD1SwhMfu2VXvowm
         Saqj+b/+xD3KP1Wj/IxFzn0jskcsiqqyhgxbLcG9hdl2B9FSfgsOH+Ip++7XpP5QJgV/
         kPits7cZn4XuC8DVgGl7UwZPqfQghLqOIKfSI63n5d+BLCEA7ZaqOmX85IuJ5cACIDFV
         M73w==
X-Gm-Message-State: ACrzQf2dfglljbS1RuZ/g5qdqvGLEPHyHBscHE0r1crpoaUGZUxhRiyf
        n+iDptBpR1TNZc3mCjT9hqLIJlaKkEqGaLf3xt3MCpmJEZQ=
X-Google-Smtp-Source: AMsMyM7wGVbKSMqFx4zbwJuZ8GzuYuw6AiR4NLzX7tb4YZzes1JKezDVEO/U9Lgtom21Uj5/hYea9P8S56Gl83D0aRQ=
X-Received: by 2002:a17:90b:b06:b0:200:aff0:2e68 with SMTP id
 bf6-20020a17090b0b0600b00200aff02e68mr2559349pjb.159.1663660360823; Tue, 20
 Sep 2022 00:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-7-yunkec@google.com>
 <YwaEKeJCjzio11MG@pendragon.ideasonboard.com>
In-Reply-To: <YwaEKeJCjzio11MG@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 20 Sep 2022 16:52:29 +0900
Message-ID: <CANqU6FcYLYeYP0QpDP3LN+SAoacTOwP6kMJKeYRtPEGb6dvKUw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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

Thanks for the review.

On Thu, Aug 25, 2022 at 5:04 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Tue, Jun 28, 2022 at 04:57:04PM +0900, Yunke Cao wrote:
> > Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
> > It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 73 ++++++++++++++++++++++++++------
> >  drivers/media/usb/uvc/uvc_v4l2.c | 11 +++--
> >  drivers/media/usb/uvc/uvcvideo.h |  3 +-
> >  3 files changed, 70 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 00482269233a..b569d6824ac1 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1923,7 +1923,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
> >  }
> >
> >  int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
> > -                          struct v4l2_ext_control *xctrl)
> > +                          struct v4l2_ext_control *xctrl, u32 v4l2_which)
> >  {
> >       struct v4l2_queryctrl qc = { .id = xctrl->id };
> >       int ret = uvc_query_v4l2_ctrl(chain, &qc);
> > @@ -1931,16 +1931,69 @@ int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
> >       if (ret < 0)
> >               return ret;
> >
> > -     xctrl->value = qc.default_value;
> > +     switch (v4l2_which) {
> > +     case V4L2_CTRL_WHICH_DEF_VAL:
> > +             xctrl->value = qc.default_value;
> > +             break;
> > +     case V4L2_CTRL_WHICH_MIN_VAL:
> > +             xctrl->value = qc.minimum;
> > +             break;
> > +     case V4L2_CTRL_WHICH_MAX_VAL:
> > +             xctrl->value = qc.maximum;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> >       return 0;
> >  }
> >
> > +static int __uvc_ctrl_get_fixed_compound(struct uvc_video_chain *chain,
> > +                                      struct uvc_control_mapping *mapping,
> > +                                      struct uvc_control *ctrl,
> > +                                      u32 v4l2_which,
> > +                                      struct v4l2_ext_control *xctrl)
> > +{
> > +     int ret;
> > +     u32 flag, id;
> > +
> > +     if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> > +             return -EINVAL;
> > +
>
> This can't happen.
>
> > +     switch (v4l2_which) {
> > +     case V4L2_CTRL_WHICH_DEF_VAL:
> > +             flag = UVC_CTRL_FLAG_GET_DEF;
> > +             id = UVC_CTRL_DATA_DEF;
> > +             break;
> > +     case V4L2_CTRL_WHICH_MIN_VAL:
> > +             flag = UVC_CTRL_FLAG_GET_MIN;
> > +             id = UVC_CTRL_DATA_MIN;
> > +             break;
> > +     case V4L2_CTRL_WHICH_MAX_VAL:
> > +             flag = UVC_CTRL_FLAG_GET_MAX;
> > +             id = UVC_CTRL_DATA_MAX;
> > +             break;
> > +     default:
> > +             return -EINVAL;
>
> Can this happen ?
>

Will remove.

> > +     }
> > +
> > +     if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
> > +             return -EACCES;
> > +
> > +     if (!ctrl->cached) {
> > +             ret = uvc_ctrl_populate_cache(chain, ctrl);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return __uvc_ctrl_get_compound_to_user(mapping, ctrl, id, xctrl);
> > +}
> > +
> >  int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> > -                    struct v4l2_ext_control *xctrl)
> > +                    struct v4l2_ext_control *xctrl, u32 v4l2_which)
> >  {
> >       struct uvc_control *ctrl;
> >       struct uvc_control_mapping *mapping;
> > -     int ret;
> >
> >       if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> >               return -EACCES;
> > @@ -1950,16 +2003,10 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >
> >       if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> > -             return __uvc_ctrl_get_fixed_std(chain, xctrl);
> > +             return __uvc_ctrl_get_fixed_std(chain, xctrl, v4l2_which);
> >
> > -     if (!ctrl->cached) {
> > -             ret = uvc_ctrl_populate_cache(chain, ctrl);
> > -             if (ret < 0)
> > -                     return ret;
> > -     }
> > -
> > -     return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
> > -                                            xctrl);
> > +     return __uvc_ctrl_get_fixed_compound(chain, mapping, ctrl, v4l2_which,
> > +                                          xctrl);
> >  }
> >
> >  int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index aad61af36271..004e3b764737 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1043,16 +1043,21 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> >       if (ret < 0)
> >               return ret;
> >
> > -     if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> > +     switch (ctrls->which) {
> > +     case V4L2_CTRL_WHICH_DEF_VAL:
> > +     case V4L2_CTRL_WHICH_MIN_VAL:
> > +     case V4L2_CTRL_WHICH_MAX_VAL:
> >               for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> > -                     ret = uvc_ctrl_get_fixed(chain, ctrl);
> > +                     ret = uvc_ctrl_get_fixed(chain, ctrl, ctrls->which);
> >                       if (ret < 0) {
> >                               ctrls->error_idx = i;
> >                               return ret;
> >                       }
> >               }
> > -
> >               return 0;
> > +
> > +     default:
>
>         case V4L2_CTRL_WHICH_CUR_VAL:
>
> > +             break;
>
> and
>
>         default:
>                 return -EINVAL;
>
> (please double-check that the error value is the right one). This should
> be mentioned in the commit message.
>

Thanks for catching this!
What specifictly should be in the commit message? Sorry, I didn't get it.

Best,
Yunke

> >       }
> >
> >       ret = uvc_ctrl_begin(chain);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9ff95bbad251..54cc47bc2d33 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -913,7 +913,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
> >
> >  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> >  int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> > -                    struct v4l2_ext_control *xctrl);
> > +                    struct v4l2_ext_control *xctrl,
> > +                    u32 v4l2_which);
> >  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
> >  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >                          bool read);
>
> --
> Regards,
>
> Laurent Pinchart
