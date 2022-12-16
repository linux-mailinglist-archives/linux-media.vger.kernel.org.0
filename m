Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523B164E59E
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 02:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLPB2k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 20:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLPB2j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 20:28:39 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8C35D6AD
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 17:28:38 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id pp21so739601qvb.5
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 17:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3eR7MtvU37X/QVXEBIFLIe/LnTkVlLR/GUD8EE5KW/o=;
        b=Or6YpJiCGsPKeVpXpOcjK4WNk0Zv+mvhi7HTB+Y634rqKj+0yRxpujd8pkEx2A548S
         KjC3+nGpKQ1P1ChSn/AB2wrYZQEFZoayzBQCmXisrArmh5Lz+nfOXkP0xOl61vSjo+IL
         eec1pnUSXy3Y4VXfiaUVUMhhR+lB8xUoS8kM1sIEhzgbPRYoBJ62OX2OWvRTNlkF1dku
         GvfsMbko125A8Gmtb9m2YkQMvQZVXQj5z8UYsSgM6kTvsfRcZpPHbM6nGt8gMqpKiTRo
         WVxMwW0o0BAm3SRb2DFE/NAFFZZy49xA93wZ87fqNP2nKXM20VcX1t/qb4/ImkBCrBfO
         nPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eR7MtvU37X/QVXEBIFLIe/LnTkVlLR/GUD8EE5KW/o=;
        b=vo59G5xKPkDDVP0XLBfX2wQyK+dDRJRIaJMgxrw4lBXKjNe1u1wI/NibdSC9KVsai4
         pfwFV0QbsUTeNXaPH/wVEFEdTp5b1b4make5ZvK6oN+p8ovXyR69MCmxb05LI65KaGf4
         rC+NDuTCQtfwr3jWzhP4mdF2OlukOhfPym7vok7dQJNV5oszRYvgFcNancnq5BIBvbF9
         jqvYYQLtFpnEoUjpm2hwc4RSK90tbMF8vgo+rV5FjKtOcr+SIRd5+Ua2MqfO/Fwg4PMH
         cPusJuKnQ+OCioKrty2h1EE1KtBk2nW4kR9/5C019z7ity4n729BIpNyOuYs+kewaPU1
         un6A==
X-Gm-Message-State: ANoB5pmNx0uwmBTrudoZCVoE9s/FQ0z/FGpN9NQ2A9Ss4P51XeouoZI2
        iGcdYc53j+8rs21KP2WaYCWPx9KQKYGzvzI9DGT01g==
X-Google-Smtp-Source: AA0mqf4TNyygl3RB0EiIYZ+DJhdrt0U0l4+emMkpnoBhWKpow5pBKr4QP6OGc962slYcvpz17yuHg2hzhasku1vGnYE=
X-Received: by 2002:a05:6214:5584:b0:4c6:f62c:acd0 with SMTP id
 mi4-20020a056214558400b004c6f62cacd0mr48006081qvb.90.1671154117314; Thu, 15
 Dec 2022 17:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com> <20221109060621.704531-4-yunkec@google.com>
 <7a3e8519-a45d-7d01-4108-b99e3ab3e640@ideasonboard.com>
In-Reply-To: <7a3e8519-a45d-7d01-4108-b99e3ab3e640@ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 16 Dec 2022 10:28:26 +0900
Message-ID: <CANqU6Ffr1VNe0Sb+83KEJqeht8_WKNwBL9NhCqn8W2La_yCR1w@mail.gmail.com>
Subject: Re: [PATCH v10 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
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

On Thu, Dec 15, 2022 at 6:59 PM Dan Scally <dan.scally@ideasonboard.com> wrote:
>
> Hi Yunke - thanks for the patches
>
> On 09/11/2022 06:06, Yunke Cao wrote:
> > Refactor uvc_ctrl to make adding compound control easier.
> >
> > Currently uvc_ctrl_get() only work for non-compound controls.
> > Move the logic into uvc_ctrl_std(), return error for compound
> > controls.
>
>
> s/uvc_ctrl_std/__uvc_ctrl_std/. This patch does a bit more than the
> commit message outlines, so I think it could do with some fleshing out.
>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> > Changelog since v9:
> > - No change.
> > Changelog since v8:
> > - No change.
> > Changelog since v7:
> > - Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.
> >
> >   drivers/media/usb/uvc/uvc_ctrl.c | 40 +++++++++++++++++++++-----------
> >   1 file changed, 27 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index dfb9d1daece6..93ae7ba5d0cc 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1028,15 +1028,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> >       return ret;
> >   }
> >
> > -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > -                       struct uvc_control *ctrl,
> > -                       struct uvc_control_mapping *mapping,
> > -                       s32 *value)
> > +static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
> > +                           struct uvc_control *ctrl,
> > +                           struct uvc_control_mapping *mapping,
> > +                           s32 *value)
> >   {
> >       int ret;
> >
> > -     if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > -             return -EACCES;
>
>
> Why is this check being dropped here? Won't it still be needed when the
> function's called for non-compound controls?
>

I'm dropping it here because __uvc_ctrl_load_cur() checks the same thing.
I think this is duplicated.

> > +     if (uvc_ctrl_mapping_is_compound(mapping))
> > +             return -EINVAL;
> >
> >       ret = __uvc_ctrl_load_cur(chain, ctrl);
> >       if (ret < 0)
> > @@ -1153,8 +1153,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               __uvc_find_control(ctrl->entity, mapping->master_id,
> >                                  &master_map, &master_ctrl, 0);
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > -             s32 val;
> > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > +             s32 val = 0;
> > +             int ret;
> > +
> > +             if (uvc_ctrl_mapping_is_compound(master_map))
> > +                     return -EINVAL;
> > +
> > +             ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
> >               if (ret < 0)
> >                       return ret;
> >
> > @@ -1399,7 +1404,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >       if (ctrl == NULL)
> >               return;
> >
> > -     if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> > +     if (uvc_ctrl_mapping_is_compound(mapping) ||
> > +         __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
> >               changes |= V4L2_EVENT_CTRL_CH_VALUE;
> >
> >       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> > @@ -1566,7 +1572,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
> >               u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
> >               s32 val = 0;
> >
> > -             if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> > +             if (uvc_ctrl_mapping_is_compound(mapping) ||
> > +                 __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
> >                       changes |= V4L2_EVENT_CTRL_CH_VALUE;
> >
> >               uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> > @@ -1746,7 +1753,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
> >       if (ctrl == NULL)
> >               return -EINVAL;
> >
> > -     return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> > +     if (uvc_ctrl_mapping_is_compound(mapping))
> > +             return -EINVAL;
> > +     else
> > +             return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
> >   }
> >
> >   static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> > @@ -1893,8 +1903,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >                      ctrl->info.size);
> >       }
> >
> > -     mapping->set(mapping, value,
> > -             uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > +     if (!uvc_ctrl_mapping_is_compound(mapping))
> > +             mapping->set(mapping, value,
> > +                          uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > +     else
> > +             return -EINVAL;
> > +
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> >               ctrl->handle = handle;

Best,
Yunke
