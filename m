Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1810B8E8A
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 12:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404503AbfITKdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 06:33:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393578AbfITKdt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 06:33:49 -0400
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6AF832080F
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568975627;
        bh=ChbBLVy22oFaBkcQ79nS7TkBNaayMlzo9nuISeQc6OY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=px5lwyyuhIWU9AeSzwfU9wfCbO99dxs6cZMHTt88tZCAwgiL84HT2YJUX3vVWjnp3
         ZpNN/mQp3nKAGHpuGb1+LoXemPVcyNcjWYDh/PRM/keEW2iPWW0kJD065ak4ebBrIs
         /uAuvVB5YbJw6z9Kx6HVN8ZSXyTMmOAftVaKYmG0=
Received: by mail-lj1-f172.google.com with SMTP id y23so6557723lje.9
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 03:33:47 -0700 (PDT)
X-Gm-Message-State: APjAAAX33E1zdPjtdDM0ALsqFpZHiEl3bGhjY5XSt9kv8H6931yeP2e7
        pPHw6MEZQ/g5894geS9RrLH0cw6zsw6P9En5Xf0=
X-Google-Smtp-Source: APXvYqw1j+wF5G9fLQ9Dnd40hR9jW8JgepCyNqfPDOnq3JFfkINCr4f5pjr0Q8qhc+ZAYbjlRBei+RjFwhNkQ/uujC4=
X-Received: by 2002:a2e:b055:: with SMTP id d21mr1496668ljl.236.1568975625500;
 Fri, 20 Sep 2019 03:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <d07dc56c-1b70-3147-1ee8-abf486a291a2@xs4all.nl>
 <20190917161943.15619-1-ribalda@kernel.org> <CAPybu_2EUr0jbcFHy89-DWHFk_yaw=4ZTL7xkVZ3m+nMJBU=dQ@mail.gmail.com>
 <e3c9ade1-bfcf-1faa-b0ef-ee5950fd7e23@xs4all.nl>
In-Reply-To: <e3c9ade1-bfcf-1faa-b0ef-ee5950fd7e23@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Fri, 20 Sep 2019 12:33:28 +0200
X-Gmail-Original-Message-ID: <CAPybu_299E0ZG6B-kOj4vM15fhKLi-18Mm25b5c6w3_bSVy3Xg@mail.gmail.com>
Message-ID: <CAPybu_299E0ZG6B-kOj4vM15fhKLi-18Mm25b5c6w3_bSVy3Xg@mail.gmail.com>
Subject: Re: [PATCH] RFC: v4l2-ctrls: Inmplement v4l2_ctrl_new_std_compound()
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans

Thanks for your review!  I will implement the changes and resend, just
one comment.


On Fri, Sep 20, 2019 at 12:07 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 9/17/19 6:21 PM, Ricardo Ribalda Delgado wrote:
> > Hi Hans
> >
> > Is this something close to what you were having in mind? Right now it
> > sits on https://github.com/ribalda/linux/commit/de21dbc2f57b58b22f5d73bc314dd8e59dff5c7d
> > but I will make it as the beginning of my patchset if you think that I
> > am on the right track.
> >
> > Thanks!
> >
> > On Tue, Sep 17, 2019 at 6:19 PM Ricardo Ribalda Delgado
> > <ribalda@kernel.org> wrote:
> >>
> >> Implement v4l2_ctrl_new_std_compound. This is just a discussion patch,
> >> do not merge as is, and be gentle with the author ;P.
> >>
> >> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> >> ---
> >>  drivers/media/i2c/imx214.c           | 13 +++--
> >>  drivers/media/v4l2-core/v4l2-ctrls.c | 79 +++++++++++++++++-----------
> >>  include/media/v4l2-ctrls.h           | 25 +++++++++
> >>  3 files changed, 81 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> >> index 625617d4c81a..e18fed9f31f1 100644
> >> --- a/drivers/media/i2c/imx214.c
> >> +++ b/drivers/media/i2c/imx214.c
> >> @@ -953,6 +953,9 @@ static int imx214_probe(struct i2c_client *client)
> >>                 .width = 1120,
> >>                 .height = 1120,
> >>         };
> >> +       union v4l2_ctrl_ptr p_def = {
> >> +               .p_area = &unit_size,
> >> +       };
> >>         int ret;
> >>
> >>         ret = imx214_parse_fwnode(dev);
> >> @@ -1034,11 +1037,11 @@ static int imx214_probe(struct i2c_client *client)
> >>                                              V4L2_CID_EXPOSURE,
> >>                                              0, 3184, 1, 0x0c70);
> >>
> >> -       imx214->unit_size = v4l2_ctrl_new_area(&imx214->ctrls,
> >> -                                              &imx214_ctrl_ops,
> >> -                                              V4L2_CID_UNIT_CELL_SIZE,
> >> -                                              &unit_size);
> >> -
> >> +       imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> >> +                                                      NULL,
> >> +                                                      V4L2_CID_UNIT_CELL_SIZE,
> >> +                                                      0, 0x7ffffff, 1, 0,
> >> +                                                      p_def);
> >>         ret = imx214->ctrls.error;
> >>         if (ret) {
> >>                 dev_err(&client->dev, "%s control init failed (%d)\n",
> >> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> >> index 3d2fa1868982..04813ba2262b 100644
> >> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> >> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> >> @@ -1555,6 +1555,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >>                 p_mpeg2_slice_params->picture.picture_coding_type =
> >>                                         V4L2_MPEG2_PICTURE_CODING_TYPE_I;
> >>                 break;
> >> +       default:
> >> +               if (ctrl->has_p_def)
> >> +                       memcpy(p, ctrl->p_def.p, ctrl->elem_size);
> >> +               break;
>
> It makes more sense to do this at the beginning of this function:
>
>         if (ctrl->p_def.p)
>                 memcpy(p, ctrl->p_def.p, ctrl->elem_size);
>         else
>                 memset(p, 0, ctrl->elem_size);
>
> and then enter the switch.
>
> This avoids calling memset followed by a memcpy.
>
> >>         }
> >>  }
> >>
> >> @@ -2369,7 +2373,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>                         s64 min, s64 max, u64 step, s64 def,
> >>                         const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
> >>                         u32 flags, const char * const *qmenu,
> >> -                       const s64 *qmenu_int, void *priv)
> >> +                       const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
> >> +                       void *priv)
> >>  {
> >>         struct v4l2_ctrl *ctrl;
> >>         unsigned sz_extra;
> >> @@ -2478,6 +2483,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>                  is_array)
> >>                 sz_extra += 2 * tot_ctrl_size;
> >>
> >> +       if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p)
> >> +               sz_extra += elem_size;
> >> +
> >>         ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
> >>         if (ctrl == NULL) {
> >>                 handler_set_err(hdl, -ENOMEM);
> >> @@ -2521,6 +2529,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>                 ctrl->p_new.p = &ctrl->val;
> >>                 ctrl->p_cur.p = &ctrl->cur.val;
> >>         }
> >> +
> >> +       if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p) {
> >> +               ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
> >> +               memcpy(ctrl->p_def.p, p_def.p, elem_size);
> >> +               ctrl->has_p_def = true;
>
> Is this needed? ctrl->p_def.p would be NULL if there is no p_def.
>
> >> +       }
> >> +
> >>         for (idx = 0; idx < elems; idx++) {
> >>                 ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
> >>                 ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
> >> @@ -2550,6 +2565,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
> >>         s64 max = cfg->max;
> >>         u64 step = cfg->step;
> >>         s64 def = cfg->def;
> >> +       const union v4l2_ctrl_ptr p_def = {};
>
> I think it is cleaner to have a 'static const union v4l2_ctrl_ptr ptr_null;'
> at the start of the source and just use that.
>
> >>
> >>         if (name == NULL)
> >>                 v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
> >> @@ -2572,7 +2588,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
> >>                         type, min, max,
> >>                         is_menu ? cfg->menu_skip_mask : step, def,
> >>                         cfg->dims, cfg->elem_size,
> >> -                       flags, qmenu, qmenu_int, priv);
> >> +                       flags, qmenu, qmenu_int, p_def, priv);
> >>         if (ctrl)
> >>                 ctrl->is_private = cfg->is_private;
> >>         return ctrl;
> >> @@ -2587,6 +2603,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
> >>         const char *name;
> >>         enum v4l2_ctrl_type type;
> >>         u32 flags;
> >> +       const union v4l2_ctrl_ptr p_def = {};
> >>
> >>         v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
> >>         if (type == V4L2_CTRL_TYPE_MENU ||
> >> @@ -2597,7 +2614,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
> >>         }
> >>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>                              min, max, step, def, NULL, 0,
> >> -                            flags, NULL, NULL, NULL);
> >> +                            flags, NULL, NULL, p_def, NULL);
> >>  }
> >>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
> >>
> >> @@ -2616,6 +2633,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
> >>         s64 def = _def;
> >>         u64 step;
> >>         u32 flags;
> >> +       const union v4l2_ctrl_ptr p_def = {};
> >>
> >>         v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
> >>
> >> @@ -2630,7 +2648,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
> >>         }
> >>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>                              0, max, mask, def, NULL, 0,
> >> -                            flags, qmenu, qmenu_int, NULL);
> >> +                            flags, qmenu, qmenu_int, p_def, NULL);
> >>  }
> >>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
> >>
> >> @@ -2646,6 +2664,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >>         s64 min;
> >>         s64 max = _max;
> >>         s64 def = _def;
> >> +       const union v4l2_ctrl_ptr p_def = {};
> >>
> >>         /* v4l2_ctrl_new_std_menu_items() should only be called for
> >>          * standard controls without a standard menu.
> >> @@ -2662,11 +2681,33 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >>         }
> >>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>                              0, max, mask, def, NULL, 0,
> >> -                            flags, qmenu, NULL, NULL);
> >> +                            flags, qmenu, NULL, p_def, NULL);
> >>
> >>  }
> >>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> >>
> >> +/* Helper function for standard compound controls */
> >> +struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >> +                       const struct v4l2_ctrl_ops *ops,
> >> +                       u32 id, s64 min, s64 max, u64 step, s64 def,
>
> The def arg makes no sense, since that's superseded by p_def.
>

If def does not make sense, then for the same reason min, max and step
should not make any sense (because they are not a pointer but a
integer).
What about removing them completely from the function prototype and
add them later if we change our mind, it is a internal API.

> >> +                       const union v4l2_ctrl_ptr p_def)
> >> +{
> >> +       const char *name;
> >> +       enum v4l2_ctrl_type type;
> >> +       u32 flags;
>
> Add:
>
>         s64 def = min;
>
> It will be discarded anyway.
>
> >> +
> >> +       v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
> >> +       if (type == V4L2_CTRL_TYPE_MENU ||
> >> +           type == V4L2_CTRL_TYPE_INTEGER_MENU) {
> >> +               handler_set_err(hdl, -EINVAL);
> >> +               return NULL;
> >> +       }
>
> This makes no sense. It should just check that the type is a compound type and
> return an error if it isn't.
>
> >> +       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >> +                            min, max, step, def, NULL, 0,
> >> +                            flags, NULL, NULL, p_def, NULL);
> >> +}
> >> +EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> >> +
> >>  /* Helper function for standard integer menu controls */
> >>  struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >>                         const struct v4l2_ctrl_ops *ops,
> >> @@ -2679,6 +2720,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >>         s64 max = _max;
> >>         s64 def = _def;
> >>         u32 flags;
> >> +       const union v4l2_ctrl_ptr p_def = {};
> >>
> >>         v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
> >>         if (type != V4L2_CTRL_TYPE_INTEGER_MENU) {
> >> @@ -2687,7 +2729,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >>         }
> >>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>                              0, max, 0, def, NULL, 0,
> >> -                            flags, NULL, qmenu_int, NULL);
> >> +                            flags, NULL, qmenu_int, p_def, NULL);
> >>  }
> >>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> >>
> >> @@ -4030,31 +4072,6 @@ static int set_ctrl(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags)
> >>         return try_or_set_cluster(fh, master, true, ch_flags);
> >>  }
> >>
> >> -/* Helper function for area controls */
> >> -struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
> >> -                                    const struct v4l2_ctrl_ops *ops,
> >> -                                    u32 id, const struct v4l2_area *area)
> >> -{
> >> -       static struct v4l2_ctrl_config ctrl = {};
> >> -       struct v4l2_ctrl *c;
> >> -       int ret;
> >> -
> >> -       ctrl.id = id;
> >> -       c = v4l2_ctrl_new_custom(hdl, &ctrl, (void *)area);
> >> -       if (!c)
> >> -               return NULL;
> >> -
> >> -       memcpy(c->p_new.p_area, area, sizeof(*area));
> >> -       ret = set_ctrl(NULL, c, 0);
> >> -       if (ret){
> >> -               hdl->error = ret;
> >> -               return NULL;
> >> -       }
> >> -
> >> -       return c;
> >> -}
> >> -EXPORT_SYMBOL(v4l2_ctrl_new_area);
> >> -
> >>  /* Helper function for VIDIOC_S_CTRL compatibility */
> >>  static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
> >>                          struct v4l2_ext_control *c)
> >> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> >> index b5b42777a756..8dc7e9827056 100644
> >> --- a/include/media/v4l2-ctrls.h
> >> +++ b/include/media/v4l2-ctrls.h
> >> @@ -164,6 +164,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
> >>   *             manual mode. So if the value of the auto control equals this
> >>   *             value, then the whole cluster is in manual mode. Drivers should
> >>   *             never set this flag directly.
> >> + * @has_p_def:  If set, the p_def field points to the default value of the control.
> >>   * @ops:       The control ops.
> >>   * @type_ops:  The control type ops.
> >>   * @id:        The control ID.
> >> @@ -230,6 +231,7 @@ struct v4l2_ctrl {
> >>         unsigned int has_volatiles:1;
> >>         unsigned int call_notify:1;
> >>         unsigned int manual_mode_value:8;
> >> +       unsigned int has_p_def:1;
> >>
> >>         const struct v4l2_ctrl_ops *ops;
> >>         const struct v4l2_ctrl_type_ops *type_ops;
> >> @@ -256,6 +258,7 @@ struct v4l2_ctrl {
> >>                 s32 val;
> >>         } cur;
> >>
> >> +       union v4l2_ctrl_ptr p_def;
> >>         union v4l2_ctrl_ptr p_new;
> >>         union v4l2_ctrl_ptr p_cur;
> >>  };
> >> @@ -647,6 +650,28 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >>                                                u32 id, u8 max,
> >>                                                u64 mask, u8 def,
> >>                                                const char * const *qmenu);
> >> +/**
> >> + * v4l2_ctrl_new_std_compound() - Allocate and initialize a new standard V4L2
> >> + *      compound control.
> >> + *
> >> + * @hdl:       The control handler.
> >> + * @ops:       The control ops.
> >> + * @id:                The control ID.
> >> + * @min:       The control's minimum value.
> >> + * @max:       The control's maximum value.
> >> + * @step:      The control's step value
> >> + * @def:       The control's default value.
> >> + * @p_def:     The control's p_def value.
> >> + *
> >> + * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks to
> >> + * the @p_def field.
> >> + *
> >> + */
> >> +struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >> +                                   const struct v4l2_ctrl_ops *ops,
> >> +                                   u32 id, s64 min, s64 max, u64 step,
> >> +                                   s64 def, const union v4l2_ctrl_ptr p_def);
> >> +
> >>
> >>  /**
> >>   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
> >> --
> >> 2.23.0
> >>
>
> So other than these fairly minor points, this is indeed what I was looking for.
>
> Regards,
>
>         Hans
