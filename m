Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8105DBE6D9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 23:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393458AbfIYVE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 17:04:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35416 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393442AbfIYVEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 17:04:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id m7so7187400lji.2;
        Wed, 25 Sep 2019 14:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tPIJe+nuH7nZU/RRcFIuElCRuMYRs87sXSRLU5FwkSw=;
        b=AEC6nKldX/JUF5ZKPJ3peStZ7WW6gD9TLZ6/2iCGCoUkAxiNWrJLFoejX42Nv+gnen
         urV9pbPAO/nhZgjNXnYQU+FIs5U60JTeJdgyWf0MCZTHdH7nufkO6ihokaWihAv3WIfF
         WWYR6fRyG5DIzB5F40gGMH/eQO9K4hX6squ7IofooVcFwvrr+e0aKYxSOD7OB3FbmGIk
         Srf2c5iRy4dUx2apRCT9/2C08Eqm8utw8eUDmtB2pPiQMEqYbRJVOOfsdSQt6MyUaYNU
         J/KEb5l0/KVswHsMF0hCIFrUUIn4VUSRQuiSjfstSvcgNUJSo917uqyBWttYOj5sQvjb
         mgpA==
X-Gm-Message-State: APjAAAWy4+/tKEKmoCf/iPqD62VRJhb2755U1d6X205LhXQ8/Lhv3wQ3
        pkL3FGSnIdVy9ddv4E3mJAr85DDYUbvzhStIQIQ=
X-Google-Smtp-Source: APXvYqyvsFqhUxTietRWpwN+juOayGM8i36gwALJTEobmFnAxVdCjFOepZ+GQdfbcdcXAOzP9AOzS3x7KcSU0gXRcho=
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr175818lji.131.1569444974857;
 Wed, 25 Sep 2019 13:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190920135137.10052-1-ricardo@ribalda.com> <20190920135137.10052-2-ricardo@ribalda.com>
 <20190925081927.55j2rs22ed2evc72@uno.localdomain>
In-Reply-To: <20190925081927.55j2rs22ed2evc72@uno.localdomain>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Wed, 25 Sep 2019 22:55:57 +0200
Message-ID: <CAPybu_0TFBmmWFqSDgskz3iu2mYOdT3VtgUwG=csvSg=SqvqQw@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] media: v4l2-core: Implement v4l2_ctrl_new_std_compound
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Thanks for your review!

On Wed, Sep 25, 2019 at 10:18 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Fri, Sep 20, 2019 at 03:51:31PM +0200, Ricardo Ribalda Delgado wrote:
> > Currently compound controls do not have a simple way of initializing its
> > values. This results in ofuscated code with type_ops init.
> >
> > This patch introduces a new field on the control with the default value
> > for the compound control that can be set with the brand new
> > v4l2_ctrl_new_std_compound function
> >
> > Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 50 ++++++++++++++++++++++++----
> >  include/media/v4l2-ctrls.h           | 22 +++++++++++-
> >  2 files changed, 64 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 1d8f38824631..219d8aeefa20 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -29,6 +29,8 @@
> >  #define call_op(master, op) \
> >       (has_op(master, op) ? master->ops->op(master) : 0)
> >
> > +static const union v4l2_ctrl_ptr ptr_null;
> > +
> >  /* Internal temporary helper struct, one for each v4l2_ext_control */
> >  struct v4l2_ctrl_helper {
> >       /* Pointer to the control reference of the master control */
> > @@ -1530,7 +1532,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >       struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> >       void *p = ptr.p + idx * ctrl->elem_size;
> >
> > -     memset(p, 0, ctrl->elem_size);
> > +     if (ctrl->p_def.p)
> > +             memcpy(p, ctrl->p_def.p, ctrl->elem_size);
> > +     else
> > +             memset(p, 0, ctrl->elem_size);
> >
> >       /*
> >        * The cast is needed to get rid of a gcc warning complaining that
> > @@ -2354,7 +2359,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >                       s64 min, s64 max, u64 step, s64 def,
> >                       const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
> >                       u32 flags, const char * const *qmenu,
> > -                     const s64 *qmenu_int, void *priv)
> > +                     const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
> > +                     void *priv)
> >  {
> >       struct v4l2_ctrl *ctrl;
> >       unsigned sz_extra;
> > @@ -2460,6 +2466,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >                is_array)
> >               sz_extra += 2 * tot_ctrl_size;
> >
> > +     if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p)
> > +             sz_extra += elem_size;
> > +
>
> I'm not sure I get how sz_extra is used in this function and what's
> its purpose, just be aware that the previous if() condition already
>
>         sz_extra += 2 * tot_ctrl_size
>
> for compound controls.
>
> Are you just making space for the new p_def elements ? Should't you
> then use tot_cltr_size ? In patch 3 you add support for AREA which has
> a single element, but could p_def in future transport multiple values?
>

I am making space for p_def. I only want to make space for one
element, because that value will be used for all of them if there is
an array.
In case the user wants to provide a different value per element of the
array he has to provide a function initializer, just like with the not
compo\

> >       ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
> >       if (ctrl == NULL) {
> >               handler_set_err(hdl, -ENOMEM);
> > @@ -2503,6 +2512,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >               ctrl->p_new.p = &ctrl->val;
> >               ctrl->p_cur.p = &ctrl->cur.val;
> >       }
> > +
> > +     if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p) {
> > +             ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
> > +             memcpy(ctrl->p_def.p, p_def.p, elem_size);
> > +     }
> > +
> >       for (idx = 0; idx < elems; idx++) {
> >               ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
> >               ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
> > @@ -2554,7 +2569,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
> >                       type, min, max,
> >                       is_menu ? cfg->menu_skip_mask : step, def,
> >                       cfg->dims, cfg->elem_size,
> > -                     flags, qmenu, qmenu_int, priv);
> > +                     flags, qmenu, qmenu_int, ptr_null, priv);
> >       if (ctrl)
> >               ctrl->is_private = cfg->is_private;
> >       return ctrl;
> > @@ -2579,7 +2594,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            min, max, step, def, NULL, 0,
> > -                          flags, NULL, NULL, NULL);
> > +                          flags, NULL, NULL, ptr_null, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std);
> >
> > @@ -2612,7 +2627,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            0, max, mask, def, NULL, 0,
> > -                          flags, qmenu, qmenu_int, NULL);
> > +                          flags, qmenu, qmenu_int, ptr_null, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
> >
> > @@ -2644,11 +2659,32 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            0, max, mask, def, NULL, 0,
> > -                          flags, qmenu, NULL, NULL);
> > +                          flags, qmenu, NULL, ptr_null, NULL);
> >
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> >
> > +/* Helper function for standard compound controls */
> > +struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> > +                             const struct v4l2_ctrl_ops *ops, u32 id,
> > +                             const union v4l2_ctrl_ptr p_def)
> > +{
> > +     const char *name;
> > +     enum v4l2_ctrl_type type;
> > +     u32 flags;
> > +     s64 min, max, step, def;
> > +
> > +     v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
> > +     if (type < V4L2_CTRL_COMPOUND_TYPES) {
> > +             handler_set_err(hdl, -EINVAL);
> > +             return NULL;
> > +     }
> > +     return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> > +                          min, max, step, def, NULL, 0,
> > +                          flags, NULL, NULL, p_def, NULL);
> > +}
> > +EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> > +
> >  /* Helper function for standard integer menu controls */
> >  struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >                       const struct v4l2_ctrl_ops *ops,
> > @@ -2669,7 +2705,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            0, max, 0, def, NULL, 0,
> > -                          flags, NULL, qmenu_int, NULL);
> > +                          flags, NULL, qmenu_int, ptr_null, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> >
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 570ff4b0205a..4b356df850a1 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -200,6 +200,9 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
> >   *           not freed when the control is deleted. Should this be needed
> >   *           then a new internal bitfield can be added to tell the framework
> >   *           to free this pointer.
> > + * @p_def:   The control's default value represented via a union which
> > + *           provides a standard way of accessing control types
> > + *           through a pointer (for compound controls only).
> >   * @p_cur:   The control's current value represented via a union which
> >   *           provides a standard way of accessing control types
> >   *           through a pointer.
> > @@ -254,6 +257,7 @@ struct v4l2_ctrl {
> >               s32 val;
> >       } cur;
> >
> > +     union v4l2_ctrl_ptr p_def;
> >       union v4l2_ctrl_ptr p_new;
> >       union v4l2_ctrl_ptr p_cur;
> >  };
> > @@ -618,7 +622,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
> >  struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
> >                                        const struct v4l2_ctrl_ops *ops,
> >                                        u32 id, u8 max, u64 mask, u8 def);
> > -
>
> This seems unrelated

Good catch!
>
> >  /**
> >   * v4l2_ctrl_new_std_menu_items() - Create a new standard V4L2 menu control
> >   *   with driver specific menu.
> > @@ -646,6 +649,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >                                              u64 mask, u8 def,
> >                                              const char * const *qmenu);
> >
> > +/**
> > + * v4l2_ctrl_new_std_compound() - Allocate and initialize a new standard V4L2
> > + *      compound control.
> > + *
> > + * @hdl:       The control handler.
> > + * @ops:       The control ops.
> > + * @id:                The control ID.
> > + * @p_def:     The control's p_def value.
>
> Nit:
> s/p_def value/default value/ ?
>
>
> Thanks
>    j

Fixing all and uploading to my github waiting for more reviews :)
>
> > + *
> > + * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> > + * to the @p_def field.
> > + *
> > + */
> > +struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> > +                             const struct v4l2_ctrl_ops *ops, u32 id,
> > +                             const union v4l2_ctrl_ptr p_def);
> > +
> >  /**
> >   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
> >   *
> > --
> > 2.23.0
> >



-- 
Ricardo Ribalda
