Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA056519AC
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 04:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbiLTDhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 22:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiLTDhQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 22:37:16 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78B8D130
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 19:37:14 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id k2so4661583qkk.7
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 19:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JwU1gUkhPU9YyA3Yo4mJWuqncm6PMyenCYPkQMTQgBo=;
        b=RB8X6gGYnjUhlayMASv/on0AIOlKrO+sIX8FrQSih8ZwnHtTBgkbk6YmGfGUbN/D/N
         IujaGLEEI3dZBYU3LrtVWbtJ6zHO3q6P2jFibpxgtysTg1QGS9dHAd72F3+MRWq7RUFC
         qyn74CgRWN1Y1bFyzF9kHOJN4SCIXMU4l/NE86XpqV/eG26+2AePR/eCYLmmolsxigPQ
         xOqccwAwEDbfTS29jkYRK5o01m0Gm7Gr0MYh4rP7Oj9hb+UKyiEtYM1F+rWnseA43ajH
         keh5VUNR4bcmtgS+EPCSUD6R6Pn0syVretRSipHrnwougl6DJIOLlDXMQdyYbuwPgxw1
         BBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwU1gUkhPU9YyA3Yo4mJWuqncm6PMyenCYPkQMTQgBo=;
        b=m/CimSsKpR910vi33Rv3mWcKIaY/68PFWHF0tpocpolb10KtlMZbL6aXJ2EWVT8Hrp
         xv55gQfPIok3ojB/7j/zRuvZe0SaY3hU8Q9riBH9ifreVHs2wvZDSMIUXu3cXWMFIW14
         zTrn5NidcA4BlOp/Ujs1e5SuVkBzNRPmbHGwqTwWZqAGVrDiUpL5fi5BYYH84zW4abx0
         hBp2FtO2MF4VDUNKaWTPGyX7+7dMhRqcIpHB+KKWA/6c93pOlB9uC679nilO4EPD79c+
         YfWK7r5v6rHFrwCl9cYgG1bZLbkKxQow10hiO4+A84a+40PlLP7MjbX9gbK6//CchhrG
         ROhw==
X-Gm-Message-State: ANoB5pmBqdL9jlWYBsZFC7yxWKwmEC7qQMHU2iNA9PM5A6je0m292SC8
        nBiYMS/YZmn+t155S9wMb09jbOi2gN9qyNxInbEf0j56CsFWBg1c
X-Google-Smtp-Source: AA0mqf5pw4VqUeyeuVLeCak2XC4XNIdB8+YO1t7lTQan5pGzCeXQ0Z7dj0xXC4hqvYyHZHsPZ73ejm1/WjyV1f8IKHU=
X-Received: by 2002:a37:492:0:b0:6fe:c5f2:656a with SMTP id
 140-20020a370492000000b006fec5f2656amr13412903qke.603.1671507433426; Mon, 19
 Dec 2022 19:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com> <20221109060621.704531-3-yunkec@google.com>
 <d67b9d52-5a12-2e24-b3d9-809a45784c8d@ideasonboard.com>
In-Reply-To: <d67b9d52-5a12-2e24-b3d9-809a45784c8d@ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 20 Dec 2022 12:37:02 +0900
Message-ID: <CANqU6Ff+YQMrvhJMzRd=NLu6DMsc3EQ=j8APyYiLiNY05Oe-1g@mail.gmail.com>
Subject: Re: [PATCH v10 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Dan,

Thanks for the review.

On Fri, Dec 16, 2022 at 7:37 PM Dan Scally <dan.scally@ideasonboard.com> wrote:
>
> Hi Yunke
>
> On 09/11/2022 06:06, Yunke Cao wrote:
> > Introduce uvc_ctrl_get_boundary(), making it easier to extend to
> > support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
> > following patches.
> >
> > For now, it simply returns EINVAL for compound controls and calls
> > __query_v4l2_ctrl() for non-compound controls.
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> > Changelog since v9:
> > - Make __uvc_ctrl_get_boundary_std() static.
> > Changelog since v8:
> > - No Change.
> > Changelog since v7:
> > - Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
> > - Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
> >    instead of in the patch where we implement compound control.
> > - Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
> >    __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
> >    holding the mutex.
> > - Define a uvc_ctrl_mapping_is_compound() for readability.
> >
> >   drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++++++++
> >   drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
> >   drivers/media/usb/uvc/uvcvideo.h |  2 ++
> >   3 files changed, 52 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index c95a2229f4fa..dfb9d1daece6 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -837,6 +837,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
> >       }
> >   }
> >
> > +static bool
> > +uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
> > +{
> > +     return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
> > +}
> > +
> >   /* ------------------------------------------------------------------------
> >    * Terminal and unit management
> >    */
> > @@ -1743,6 +1749,49 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
> >       return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> >   }
> >
> > +static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> > +                                    struct uvc_control *ctrl,
> > +                                    struct uvc_control_mapping *mapping,
> > +                                    u32 v4l2_which,
> > +                                    struct v4l2_ext_control *xctrl)
>
>
> Here you define a parameter for v4l2_which, but further down...
>
> > +{
> > +     struct v4l2_queryctrl qc = { .id = xctrl->id };
> > +
> > +     int ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &qc);
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     xctrl->value = qc.default_value;
> > +     return 0;
> > +}
> > +
> > +int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> > +                       struct v4l2_ext_control *xctrl)
> > +{
> > +     struct uvc_control *ctrl;
> > +     struct uvc_control_mapping *mapping;
> > +     int ret;
> > +
> > +     if (mutex_lock_interruptible(&chain->ctrl_mutex))
> > +             return -ERESTARTSYS;
> > +
> > +     ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> > +     if (!ctrl) {
> > +             ret = -EINVAL;
> > +             goto done;
> > +     }
> > +
> > +     if (uvc_ctrl_mapping_is_compound(mapping))
> > +             ret = -EINVAL;
> > +     else
> > +             ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>
>
> ...here, you're not passing it, which causes a compilation error.
> Otherwise I think the patch looks ok.
>

Sorry, I messed this up during rebasing :P. The v4l2_which parameter
should be introduced as part of patch 09/10. Will fix it in the next
version.

Best,
Yunke

> > +
> > +done:
> > +     mutex_unlock(&chain->ctrl_mutex);
> > +     return ret;
> > +}
> > +
> >   int uvc_ctrl_set(struct uvc_fh *handle,
> >       struct v4l2_ext_control *xctrl)
> >   {
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f4d4c33b6dfb..e807e348aa41 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1046,15 +1046,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> >
> >       if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> >               for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> > -                     struct v4l2_queryctrl qc = { .id = ctrl->id };
> > -
> > -                     ret = uvc_query_v4l2_ctrl(chain, &qc);
> > +                     ret = uvc_ctrl_get_boundary(chain, ctrl);
> >                       if (ret < 0) {
> >                               ctrls->error_idx = i;
> >                               return ret;
> >                       }
> > -
> > -                     ctrl->value = qc.default_value;
> >               }
> >
> >               return 0;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index df93db259312..b2ee3d59a4c8 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -759,6 +759,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
> >   }
> >
> >   int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> > +int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> > +                       struct v4l2_ext_control *xctrl);
> >   int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
> >   int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >                          bool read);
