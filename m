Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A344C9B052
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 15:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393445AbfHWNGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 09:06:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731379AbfHWNGO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 09:06:14 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93E9A22CEC;
        Fri, 23 Aug 2019 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566565573;
        bh=Nf/JHz2p9KJqWjrRjR6tfsaXgxZ88ZigCZLa5Q1S3bM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CHNv/XEs6tkYE1iNbZUMWfxQUU+XSGU7o/AtPXdNfc3m4vKot0wrNydubMFckNxRx
         +aj3HGZ32cAvIoOeJl8MMU2JCTbjN1H/gopEEQQhAaVcQAmzLYALQ4cZ9auh34+FEu
         VcQHe0R8mMhVMLoaSsPwrpSyD3j5V5W0Qxp94Zv0=
Received: by mail-lj1-f171.google.com with SMTP id l1so8771255lji.12;
        Fri, 23 Aug 2019 06:06:13 -0700 (PDT)
X-Gm-Message-State: APjAAAWIiLAVQBgv9DWa0Ou38SE+vzxnlGovKB0Eh2NrEhtPIC8+LGpq
        jSPPWAd8Kf1RyuvA42NiY/mjrxHP7NHCQLCksSo=
X-Google-Smtp-Source: APXvYqx494yOQTDUqmJi8lTHGRnu27kjJqD2UIMZu2KQSLjkcVtSK0kWsEnyN0xJ1mxBj8zZ985ITaXoQJmmX5Pwe6s=
X-Received: by 2002:a2e:8856:: with SMTP id z22mr2895409ljj.71.1566565571829;
 Fri, 23 Aug 2019 06:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123737.7774-1-ribalda@kernel.org> <20190823123737.7774-5-ribalda@kernel.org>
 <1566564998.3023.13.camel@pengutronix.de>
In-Reply-To: <1566564998.3023.13.camel@pengutronix.de>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Fri, 23 Aug 2019 15:05:55 +0200
X-Gmail-Original-Message-ID: <CAPybu_0iodVnn1Fa5BFi7zc7ugwpN926wCJaoKU548zqrNJ5iw@mail.gmail.com>
Message-ID: <CAPybu_0iodVnn1Fa5BFi7zc7ugwpN926wCJaoKU548zqrNJ5iw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] media: v4l2-core: Add new helper for area controls
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 23, 2019 at 2:56 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Fri, 2019-08-23 at 14:37 +0200, Ricardo Ribalda Delgado wrote:
> > Adding a V4L2_CID_UNIT_CELL_SIZE control requires a lot of boilerplate,
> > try to minimize it by adding a new helper.
> >
> > Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 25 ++++++++++++++++++++++++-
> >  include/media/v4l2-ctrls.h           | 16 ++++++++++++++++
> >  2 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index b3bf458df7f7..33e48f0aec1a 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -2660,7 +2660,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> >
> > -/* Helper function for standard integer menu controls */
>
> Why move this ...
>
> >  struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >                       const struct v4l2_ctrl_ops *ops,
> >                       u32 id, u8 _max, u8 _def, const s64 *qmenu_int)
> > @@ -2684,6 +2683,30 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> >
> > +static void area_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > +             union v4l2_ctrl_ptr ptr)
> > +{
> > +     memcpy(ptr.p_area, ctrl->priv, sizeof(*ptr.p_area));
> > +}
> > +
> > +static const struct v4l2_ctrl_type_ops area_ops = {
> > +     .init = area_init,
> > +};
> > +
> > +struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
> > +                                  const struct v4l2_ctrl_ops *ops,
> > +                                  u32 id, const struct v4l2_area *area)
> > +{
> > +     static struct v4l2_ctrl_config ctrl = {
> > +             .id = V4L2_CID_UNIT_CELL_SIZE,
> > +             .type_ops = &area_ops,
> > +     };
> > +
> > +     return v4l2_ctrl_new_custom(hdl, &ctrl, (void *)area);
> > +}
> > +EXPORT_SYMBOL(v4l2_ctrl_new_area);
> > +
> > +/* Helper function for standard integer menu controls */
>
> ... here?
Because I screwed up :). Let me fix that sorry.

I will push all your changes to:

https://github.com/ribalda/linux/tree/unit-size-v4

plus any other comment and then I will wait 2-3 days for resend


>
> Looks to me like this comment should stay attached to
> v4l2_ctrl_new_int_menu.
>
> regards
> Philipp
