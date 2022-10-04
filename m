Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B75F3D65
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 09:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiJDHkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 03:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJDHkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 03:40:10 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898D61CFC9
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 00:40:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id x1so11981585plv.5
        for <linux-media@vger.kernel.org>; Tue, 04 Oct 2022 00:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5RfY9oMOdQNi4pJMmRZJS99DffKled92KOMkrpS6/ns=;
        b=qj3IbkzaUPF+hRNgXFjx4y94AkvEkpHpAR9bk0HLZ7jgeHDsFTbudidIAcNEYQmsSq
         uHE4ezussprNRE60KjRtsgwO/7Y6oZ9SjEYgLfNsspodMEbvWAQ6PPcoPclvqxyvXMZG
         AQocrsKBGtxBS7av9ki09O4UtWTBSXeRhttHPkwNA8T5dWO7ohnL3SSd5RFzAudIAYjx
         mVoQr2ain67SlW4nGlWerKrp4aI1aFU9tEz1lAdjsADAnoSQp3zwglzUuIBY0e9oa+Ot
         waBCD5cuRBhgEVUcSgp6WYBnHOnFSwBb4hLNo906LqWDo2H/sBPfuXhZGqWr76ph0ko7
         4DGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5RfY9oMOdQNi4pJMmRZJS99DffKled92KOMkrpS6/ns=;
        b=XOPnbl2djP1J2Vx1jTmC0AkQZc8tRpGmDVZnnUAnjQ4ybNwZ9+B5tGWXOKnIdI2GsU
         v62b14E7k5T+Hk7gicRV44WL6FTM/NhMpjyBGbNKtwL2YLCGCDcjSFHvMml4vc/tPGmo
         9CHzeklv8k1b/RE3Tlz+paqN1YZML7PmsCCLuG17nXFkzpqKIl2Q4H4227K1PvwPSViF
         bl39kSFdnXvWvxSyEUD5t1Pj6VeASyjvibfZGqHuVE0liuwufyV4dU0bDkwwpiugI41g
         UtpRvGoZ8AJiIgGrVP4/cNEquiHZH6F6QDyTCUXVZJ9uJiLYM0630Xoqkca+k4e2ZnGI
         nzbg==
X-Gm-Message-State: ACrzQf3Q8YmgmJgin87jrXvqhOTCuGCo7gzoKtVP9jLM1sqEjvpBxo1R
        8PD45IV5Lzb6kqE7EQH1TKbc1QMAZux1J/NX/MsGgA==
X-Google-Smtp-Source: AMsMyM5xNBxCMUydMsH+pbPRQIjNpYDz7HYtWsFw3TwxdHQayxNbulLY8IJ01JDNXcr/WU8Wk0hMfvO3IZfDiHdO7xc=
X-Received: by 2002:a17:902:864a:b0:179:f56e:ee7b with SMTP id
 y10-20020a170902864a00b00179f56eee7bmr25120052plt.45.1664869207102; Tue, 04
 Oct 2022 00:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com> <20220930064059.3633710-9-yunkec@google.com>
 <81a3105e-c14b-f1f9-02d2-60e509067a0f@xs4all.nl> <CANqU6Ff-u6s-ezNQLWSvV3qzdCTtXdkzS416EfNb_BMoajfASQ@mail.gmail.com>
 <fa2b1bdd-bea4-c723-f849-9762222ea6eb@xs4all.nl>
In-Reply-To: <fa2b1bdd-bea4-c723-f849-9762222ea6eb@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 4 Oct 2022 16:39:55 +0900
Message-ID: <CANqU6FcY8ATDz-ybZkchZjrKQ5+_EPFWtU+Re5Xnu+vBWxkU2w@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Hans,

On Tue, Oct 4, 2022 at 4:23 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Yunke,
>
> On 10/4/22 07:39, Yunke Cao wrote:
> > Hi Hans,
> >
> > Thanks for the review!
> >
> > On Fri, Sep 30, 2022 at 5:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >>
> >>
> >> On 9/30/22 08:40, Yunke Cao wrote:
> >>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>
> >>> Add the capability of retrieving the min and max values of a
> >>> compound control.
> >>>
> >>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>> ---
> >>> Hi Hans,
> >>>
> >>> I resubmitted because of the discussion in the previous version:
> >>> [PATCH v7 5/7] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL.
> >>> It would be great if you can take a look, thanks!
> >>>
> >>> Changelog since v7:
> >>> - Document that the definition of the min/max are provided by compound controls
> >>>   are defined in control documentation.
> >>> - Return error, instead of zeroed memory for v4l2_ctrl_ptr_create(NULL).
> >>>
> >>> git am from https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/
> >>> - Fixed some merge conflits.
> >>> - Fixed the build error in drivers/media/platform/qcom/venus.
> >>>
> >>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   9 +-
> >>>  .../media/videodev2.h.rst.exceptions          |   2 +
> >>>  drivers/media/i2c/imx214.c                    |   5 +-
> >>>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
> >>>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +++++--
> >>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 151 ++++++++++++++++--
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> >>>  include/media/v4l2-ctrls.h                    |  34 +++-
> >>>  include/uapi/linux/videodev2.h                |   2 +
> >>>  9 files changed, 243 insertions(+), 30 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> index 927ef397f1ce..928328b604c2 100644
> >>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> @@ -304,14 +304,19 @@ still cause this situation.
> >>>        - Which value of the control to get/set/try.
> >>>      * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
> >>>       the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
> >>> +     value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
> >>> +     value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
> >>>       value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
> >>>       these controls have to be retrieved from a request or tried/set for
> >>>       a request. In the latter case the ``request_fd`` field contains the
> >>>       file descriptor of the request that should be used. If the device
> >>>       does not support requests, then ``EACCES`` will be returned.
> >>>
> >>> -     When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
> >>> -     get the default value of the control, you cannot set or try it.
> >>> +     When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
> >>> +     or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
> >>> +     default/minimum/maximum value of the control, you cannot set or try it.
> >>> +     The definition of minimum/maximum values for compound types are provided by
> >>> +     the control documentation.
> >>
> >> It is probably a good idea to mention that if the compound type does not
> >> document the meaning of minimum/maximum, then it is not supported and querying
> >> MIN/MAX will result in -ENODATA (as I suggested in my v2 review).
> >>
> >> Which compound controls DO support this? I do not see any documentation of min/max
> >> in this series.
> >>
> >
> > V4L2_CID_UVC_REGION_OF_INTEREST_RECT supports this. The documentation is
> > in patch 10/10:
> >
> > +       Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
> > +       the range of rectangle sizes. The left/top coordinates of a minimum or
> > +       maximum rectangle are always 0. For example, a device can have a minimum
> > +       ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.
>
> Hmm. The default min/max implementation in v4l2-ctrls*.c is for control types,
> i.e. V4L2_CTRL_TYPE_RECT in this case.
>
> So should this be documented with V4L2_CTRL_TYPE_RECT rather than controls of that
> type?
>
> I believe this belongs to the V4L2_CTRL_TYPE_RECT documentation, with perhaps some
> additional comments with the specific controls.
>
> So for this type I would say that MIN_VAL and MAX_VAL can both return non-0 left
> and top values, as long as they are the same. That would make sense in case there
> are margins that can't be used for whatever the control uses the rectangle for.
>
> The V4L2_CID_UVC_REGION_OF_INTEREST_RECT documentation can be more specific and
> require that left/top are 0.
>

Okay, that makes sense. Will add documentation for V4L2_CTRL_TYPE_RECT as well.

> >
> >>>
> >>>       For backwards compatibility you can also use a control class here
> >>>       (see :ref:`ctrl-class`). In that case all controls have to
> >>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> index 828cca8e2daa..6295b0fa5716 100644
> >>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> @@ -563,6 +563,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
> >>>  ignore define V4L2_CTRL_MAX_DIMS
> >>>  ignore define V4L2_CTRL_WHICH_CUR_VAL
> >>>  ignore define V4L2_CTRL_WHICH_DEF_VAL
> >>> +ignore define V4L2_CTRL_WHICH_MIN_VAL
> >>> +ignore define V4L2_CTRL_WHICH_MAX_VAL
> >>>  ignore define V4L2_CTRL_WHICH_REQUEST_VAL
> >>>  ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
> >>>  ignore define V4L2_CID_MAX_CTRLS
> >>> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> >>> index 83c1737abeec..aa0bfd18f7b7 100644
> >>> --- a/drivers/media/i2c/imx214.c
> >>> +++ b/drivers/media/i2c/imx214.c
> >>> @@ -1037,7 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
> >>>       imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> >>>                               NULL,
> >>>                               V4L2_CID_UNIT_CELL_SIZE,
> >>> -                             v4l2_ctrl_ptr_create((void *)&unit_size));
> >>> +                             v4l2_ctrl_ptr_create((void *)&unit_size),
> >>> +                             v4l2_ctrl_ptr_create(NULL),
> >>> +                             v4l2_ctrl_ptr_create(NULL));
> >>> +
> >>>       ret = imx214->ctrls.error;
> >>>       if (ret) {
> >>>               dev_err(&client->dev, "%s control init failed (%d)\n",
> >>> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> >>> index 7468e43800a9..28eca8f9d148 100644
> >>> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> >>> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> >>> @@ -607,11 +607,16 @@ int venc_ctrl_init(struct venus_inst *inst)
> >>>
> >>>       v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
> >>>                                  V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
> >>> -                                v4l2_ctrl_ptr_create(&p_hdr10_cll));
> >>> +                                v4l2_ctrl_ptr_create(&p_hdr10_cll),
> >>> +                                v4l2_ctrl_ptr_create(NULL),
> >>> +                                v4l2_ctrl_ptr_create(NULL));
> >>>
> >>>       v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
> >>>                                  V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
> >>> -                                v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
> >>> +                                v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering),
> >>> +                                v4l2_ctrl_ptr_create(NULL),
> >>> +                                v4l2_ctrl_ptr_create(NULL));
> >>> +
> >>>
> >>>       v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
> >>>                              V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> >>> index d0a3aa3806fb..3bfab11fe148 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> >>> @@ -94,6 +94,34 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >>>       return ptr_to_user(c, ctrl, ctrl->p_new);
> >>>  }
> >>>
> >>> +/* Helper function: copy the minimum control value back to the caller */
> >>> +static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +     int idx, ret;
> >>> +
> >>> +     for (idx = 0; idx < ctrl->elems; idx++) {
> >>> +             ret = ctrl->type_ops->minimum(ctrl, idx, ctrl->p_new);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +     }
> >>> +
> >>> +     return ptr_to_user(c, ctrl, ctrl->p_new);
> >>> +}
> >>> +
> >>> +/* Helper function: copy the maximum control value back to the caller */
> >>> +static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +     int idx, ret;
> >>> +
> >>> +     for (idx = 0; idx < ctrl->elems; idx++) {
> >>> +             ret = ctrl->type_ops->maximum(ctrl, idx, ctrl->p_new);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +     }
> >>> +
> >>> +     return ptr_to_user(c, ctrl, ctrl->p_new);
> >>> +}
> >>
> >> This needs to change: the minimum/maximum ops should work just like the init op:
> >> they fill the whole array, not just one element.
> >>
> >>> +
> >>>  /* Helper function: copy the caller-provider value as the new control value */
> >>>  static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >>>  {
> >>> @@ -228,8 +256,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> >>>               cs->error_idx = i;
> >>>
> >>>               if (cs->which &&
> >>> -                 cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
> >>> -                 cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
> >>> +                 (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
> >>> +                  cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
> >>>                   V4L2_CTRL_ID2WHICH(id) != cs->which) {
> >>>                       dprintk(vdev,
> >>>                               "invalid which 0x%x or control id 0x%x\n",
> >>> @@ -367,8 +395,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> >>>   */
> >>>  static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
> >>>  {
> >>> -     if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
> >>> -         which == V4L2_CTRL_WHICH_REQUEST_VAL)
> >>> +     if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
> >>> +                        which <= V4L2_CTRL_WHICH_MAX_VAL))
> >>>               return 0;
> >>>       return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
> >>>  }
> >>> @@ -388,10 +416,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >>>       struct v4l2_ctrl_helper *helpers = helper;
> >>>       int ret;
> >>>       int i, j;
> >>> -     bool is_default, is_request;
> >>> +     bool is_default, is_request, is_min, is_max;
> >>>
> >>>       is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
> >>>       is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
> >>> +     is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
> >>> +     is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
> >>>
> >>>       cs->error_idx = cs->count;
> >>>       cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> >>> @@ -431,13 +461,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >>>
> >>>               /*
> >>>                * g_volatile_ctrl will update the new control values.
> >>> -              * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
> >>> +              * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
> >>> +              * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
> >>>                * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
> >>>                * it is v4l2_ctrl_request_complete() that copies the
> >>>                * volatile controls at the time of request completion
> >>>                * to the request, so you don't want to do that again.
> >>>                */
> >>> -             if (!is_default && !is_request &&
> >>> +             if (!is_default && !is_request && !is_min && !is_max &&
> >>>                   ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
> >>>                   (master->has_volatiles && !is_cur_manual(master)))) {
> >>>                       for (j = 0; j < master->ncontrols; j++)
> >>> @@ -466,6 +497,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >>>                               ret = -ENOMEM;
> >>>                       else if (is_request && ref->p_req_valid)
> >>>                               ret = req_to_user(cs->controls + idx, ref);
> >>> +                     else if (is_min)
> >>> +                             ret = min_to_user(cs->controls + idx, ref->ctrl);
> >>> +                     else if (is_max)
> >>> +                             ret = max_to_user(cs->controls + idx, ref->ctrl);
> >>>                       else if (is_volatile)
> >>>                               ret = new_to_user(cs->controls + idx, ref->ctrl);
> >>>                       else
> >>> @@ -563,9 +598,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> >>>
> >>>       cs->error_idx = cs->count;
> >>>
> >>> -     /* Default value cannot be changed */
> >>> -     if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
> >>> -             dprintk(vdev, "%s: cannot change default value\n",
> >>> +     /* Default/minimum/maximum values cannot be changed */
> >>> +     if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
> >>> +         cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
> >>> +         cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
> >>> +             dprintk(vdev, "%s: cannot change default/min/max value\n",
> >>>                       video_device_node_name(vdev));
> >>>               return -EINVAL;
> >>>       }
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> index 0ac36ebc45dd..e43d5369f6af 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> @@ -177,6 +177,30 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >>>       }
> >>>  }
> >>>
> >>> +static int std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >>> +                         union v4l2_ctrl_ptr ptr)
> >>> +{
> >>> +     void *p = ptr.p + idx * ctrl->elem_size;
> >>> +
> >>> +     if (!ctrl->p_min.p_const)
> >>> +             return -EINVAL;
> >>> +
> >>> +     memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >>> +                         union v4l2_ctrl_ptr ptr)
> >>> +{
> >>> +     void *p = ptr.p + idx * ctrl->elem_size;
> >>> +
> >>> +     if (!ctrl->p_max.p_const)
> >>> +             return -EINVAL;
> >>> +
> >>> +     memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
> >>>                           union v4l2_ctrl_ptr ptr)
> >>>  {
> >>> @@ -247,6 +271,96 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
> >>>  }
> >>>  EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
> >>>
> >>> +static int v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 idx,
> >>> +                                  union v4l2_ctrl_ptr ptr)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     switch (ctrl->type) {
> >>> +     case V4L2_CTRL_TYPE_STRING:
> >>> +             idx *= ctrl->elem_size;
> >>> +             memset(ptr.p_char + idx, ' ', ctrl->minimum);
> >>> +             ptr.p_char[idx + ctrl->minimum] = '\0';
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_INTEGER64:
> >>> +             ptr.p_s64[idx] = ctrl->minimum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_INTEGER:
> >>> +     case V4L2_CTRL_TYPE_INTEGER_MENU:
> >>> +     case V4L2_CTRL_TYPE_MENU:
> >>> +     case V4L2_CTRL_TYPE_BITMASK:
> >>> +     case V4L2_CTRL_TYPE_BOOLEAN:
> >>> +             ptr.p_s32[idx] = ctrl->minimum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_BUTTON:
> >>> +     case V4L2_CTRL_TYPE_CTRL_CLASS:
> >>> +             ptr.p_s32[idx] = 0;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_U8:
> >>> +             ptr.p_u8[idx] = ctrl->minimum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_U16:
> >>> +             ptr.p_u16[idx] = ctrl->minimum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_U32:
> >>> +             ptr.p_u32[idx] = ctrl->minimum;
> >>> +             break;
> >>> +     default:
> >>> +             ret = std_min_compound(ctrl, idx, ptr);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +
> >>> +             break;
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 idx,
> >>> +                                  union v4l2_ctrl_ptr ptr)
> >>
> >> The v4l2_ctrl_type_op_init, v4l2_ctrl_type_op_minimum and v4l2_ctrl_type_op_maximum
> >> functions are all awfully similar. The only difference is ctrl->default_value/minimum/maximum.
> >>
> >> So perhaps this can be changed to a common function that has this as an argument.
> >>
> >> Note that these minimum/maximum ops should look like the init op: they need to
> >> fill all elements of the control array, not just one element.
> >>
> >
> > Thanks. What about adding a
> > static int __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
> >                                    u32 which, union v4l2_ctrl_ptr ptr)
> > and call it from v4l2_ctrl_type_op_init, v4l2_ctrl_type_op_minimum and
> > v4l2_ctrl_type_op_maximum?
>
> Let's see how that looks.
>

Sounds good. Will try this and apply your other comments in the next version.

Best,
Yunke

> Regards,
>
>         Hans
>
> >
> > Best,
> > Yunke
> >
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     switch (ctrl->type) {
> >>> +     case V4L2_CTRL_TYPE_STRING:
> >>> +             idx *= ctrl->elem_size;
> >>> +             memset(ptr.p_char + idx, ' ', ctrl->maximum);
> >>> +             ptr.p_char[idx + ctrl->maximum] = '\0';
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_INTEGER64:
> >>> +             ptr.p_s64[idx] = ctrl->maximum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_INTEGER:
> >>> +     case V4L2_CTRL_TYPE_INTEGER_MENU:
> >>> +     case V4L2_CTRL_TYPE_MENU:
> >>> +     case V4L2_CTRL_TYPE_BITMASK:
> >>> +     case V4L2_CTRL_TYPE_BOOLEAN:
> >>> +             ptr.p_s32[idx] = ctrl->maximum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_BUTTON:
> >>> +     case V4L2_CTRL_TYPE_CTRL_CLASS:
> >>> +             ptr.p_s32[idx] = 0;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_U8:
> >>> +             ptr.p_u8[idx] = ctrl->maximum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_U16:
> >>> +             ptr.p_u16[idx] = ctrl->maximum;
> >>> +             break;
> >>> +     case V4L2_CTRL_TYPE_U32:
> >>> +             ptr.p_u32[idx] = ctrl->maximum;
> >>> +             break;
> >>> +     default:
> >>> +             ret = std_max_compound(ctrl, idx, ptr);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +
> >>> +             break;
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
> >>>  {
> >>>       union v4l2_ctrl_ptr ptr = ctrl->p_cur;
> >>> @@ -1043,6 +1157,8 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
> >>>  static const struct v4l2_ctrl_type_ops std_type_ops = {
> >>>       .equal = v4l2_ctrl_type_op_equal,
> >>>       .init = v4l2_ctrl_type_op_init,
> >>> +     .minimum = v4l2_ctrl_type_op_minimum,
> >>> +     .maximum = v4l2_ctrl_type_op_maximum,
> >>>       .log = v4l2_ctrl_type_op_log,
> >>>       .validate = v4l2_ctrl_type_op_validate,
> >>>  };
> >>> @@ -1514,7 +1630,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>>                       s64 min, s64 max, u64 step, s64 def,
> >>>                       const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
> >>>                       u32 flags, const char * const *qmenu,
> >>> -                     const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
> >>> +                     const s64 *qmenu_int,
> >>> +                     const union v4l2_ctrl_ptr p_def,
> >>> +                     const union v4l2_ctrl_ptr p_min,
> >>> +                     const union v4l2_ctrl_ptr p_max,
> >>>                       void *priv)
> >>>  {
> >>>       struct v4l2_ctrl *ctrl;
> >>> @@ -1674,7 +1793,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>>               sz_extra += 2 * tot_ctrl_size;
> >>>
> >>
> >> I would like to have a sanity check: if p_def.p_const == NULL, then
> >> p_min and p_max are NULL as well.
> >>
> >> Also, check that either both p_min and p_max are NULL, or both are not NULL.
> >>
> >> If either condition is false, then return -EINVAL.
> >>
> >>>       if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
> >>> -             sz_extra += elem_size;
> >>> +             sz_extra += elem_size * 3;
> >>
> >> I think this can be done a bit smarter:
> >>
> >>         if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
> >>                 sz_extra += elem_size;
> >>         if (type >= V4L2_CTRL_COMPOUND_TYPES && p_min.p_const)
> >>                 sz_extra += elem_size * 2;
> >>
> >> This assumes that the sanity checks mentioned above are done first.
> >>
> >>>
> >>>       ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
> >>>       if (ctrl == NULL) {
> >>> @@ -1739,6 +1858,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>>                       ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
> >>>               memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
> >>>       }
> >>> +     if (type >= V4L2_CTRL_COMPOUND_TYPES &&
> >>> +         p_min.p_const && p_max.p_const) {
> >>> +             ctrl->p_min.p = ctrl->p_cur.p + 2 * tot_ctrl_size;
> >>
> >> This is wrong, p_min has size elem_size, not tot_ctrl_size.
> >>
> >> I'd write this as:
> >>
> >>                 ctrl->p_min.p = ctrl->p_def.p + elem_size;
> >>                 memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
> >>                 ctrl->p_max.p = ctrl->p_min.p + elem_size;
> >>                 memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
> >>
> >>> +             memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
> >>> +             ctrl->p_max.p = ctrl->p_cur.p + 3 * tot_ctrl_size;
> >>> +             memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
> >>> +     }
> >>>
> >>>       ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
> >>>       cur_to_new(ctrl);
> >>> @@ -1790,7 +1916,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
> >>>                       type, min, max,
> >>>                       is_menu ? cfg->menu_skip_mask : step, def,
> >>>                       cfg->dims, cfg->elem_size,
> >>> -                     flags, qmenu, qmenu_int, cfg->p_def, priv);
> >>> +                     flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
> >>> +                     cfg->p_max, priv);
> >>>       if (ctrl)
> >>>               ctrl->is_private = cfg->is_private;
> >>>       return ctrl;
> >>> @@ -1815,7 +1942,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
> >>>       }
> >>>       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>>                            min, max, step, def, NULL, 0,
> >>> -                          flags, NULL, NULL, ptr_null, NULL);
> >>> +                          flags, NULL, NULL, ptr_null, ptr_null,
> >>> +                          ptr_null, NULL);
> >>>  }
> >>>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
> >>>
> >>> @@ -1848,7 +1976,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
> >>>       }
> >>>       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>>                            0, max, mask, def, NULL, 0,
> >>> -                          flags, qmenu, qmenu_int, ptr_null, NULL);
> >>> +                          flags, qmenu, qmenu_int, ptr_null, ptr_null,
> >>> +                          ptr_null, NULL);
> >>>  }
> >>>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
> >>>
> >>> @@ -1880,7 +2009,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >>>       }
> >>>       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>>                            0, max, mask, def, NULL, 0,
> >>> -                          flags, qmenu, NULL, ptr_null, NULL);
> >>> +                          flags, qmenu, NULL, ptr_null, ptr_null,
> >>> +                          ptr_null, NULL);
> >>>
> >>>  }
> >>>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> >>> @@ -1888,7 +2018,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> >>>  /* Helper function for standard compound controls */
> >>>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >>>                               const struct v4l2_ctrl_ops *ops, u32 id,
> >>> -                             const union v4l2_ctrl_ptr p_def)
> >>> +                             const union v4l2_ctrl_ptr p_def,
> >>> +                             const union v4l2_ctrl_ptr p_min,
> >>> +                             const union v4l2_ctrl_ptr p_max)
> >>>  {
> >>>       const char *name;
> >>>       enum v4l2_ctrl_type type;
> >>> @@ -1902,7 +2034,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >>>       }
> >>>       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>>                            min, max, step, def, NULL, 0,
> >>> -                          flags, NULL, NULL, p_def, NULL);
> >>> +                          flags, NULL, NULL, p_def, p_min, p_max, NULL);
> >>>  }
> >>>  EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> >>>
> >>> @@ -1926,7 +2058,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >>>       }
> >>>       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >>>                            0, max, 0, def, NULL, 0,
> >>> -                          flags, NULL, qmenu_int, ptr_null, NULL);
> >>> +                          flags, NULL, qmenu_int, ptr_null, ptr_null,
> >>> +                          ptr_null, NULL);
> >>>  }
> >>>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> index fddba75d9074..5d49e6d71b64 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -893,7 +893,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
> >>>                       return false;
> >>>               break;
> >>>       case V4L2_CTRL_WHICH_DEF_VAL:
> >>> -             /* Default value cannot be changed */
> >>> +     case V4L2_CTRL_WHICH_MIN_VAL:
> >>> +     case V4L2_CTRL_WHICH_MAX_VAL:
> >>> +             /* Default, minimum or maximum value cannot be changed */
> >>>               if (ioctl == VIDIOC_S_EXT_CTRLS ||
> >>>                   ioctl == VIDIOC_TRY_EXT_CTRLS) {
> >>>                       c->error_idx = c->count;
> >>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> >>> index 1846caf9dd53..555b561231ef 100644
> >>> --- a/include/media/v4l2-ctrls.h
> >>> +++ b/include/media/v4l2-ctrls.h
> >>> @@ -125,6 +125,8 @@ struct v4l2_ctrl_ops {
> >>>   *
> >>>   * @equal: return true if all ctrl->elems array elements are equal.
> >>>   * @init: initialize the value for array elements from from_idx to ctrl->elems.
> >>> + * @minimum: set the value to the minimum value of the control.
> >>> + * @maximum: set the value to the maximum value of the control.
> >>>   * @log: log the value.
> >>>   * @validate: validate the value for ctrl->new_elems array elements.
> >>>   *   Return 0 on success and a negative value otherwise.
> >>> @@ -134,6 +136,10 @@ struct v4l2_ctrl_type_ops {
> >>>                     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
> >>>       void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
> >>>                    union v4l2_ctrl_ptr ptr);
> >>> +     int (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
> >>> +                    union v4l2_ctrl_ptr ptr);
> >>> +     int (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
> >>> +                    union v4l2_ctrl_ptr ptr);
> >>>       void (*log)(const struct v4l2_ctrl *ctrl);
> >>>       int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
> >>>  };
> >>> @@ -239,6 +245,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
> >>>   * @p_def:   The control's default value represented via a union which
> >>>   *           provides a standard way of accessing control types
> >>>   *           through a pointer (for compound controls only).
> >>> + * @p_min:   The control's minimum value represented via a union which
> >>> + *           provides a standard way of accessing control types
> >>> + *           through a pointer (for compound controls only).
> >>> + * @p_max:   The control's maximum value represented via a union which
> >>> + *           provides a standard way of accessing control types
> >>> + *           through a pointer (for compound controls only).
> >>>   * @p_cur:   The control's current value represented via a union which
> >>>   *           provides a standard way of accessing control types
> >>>   *           through a pointer.
> >>> @@ -298,6 +310,8 @@ struct v4l2_ctrl {
> >>>       } cur;
> >>>
> >>>       union v4l2_ctrl_ptr p_def;
> >>> +     union v4l2_ctrl_ptr p_min;
> >>> +     union v4l2_ctrl_ptr p_max;
> >>>       union v4l2_ctrl_ptr p_new;
> >>>       union v4l2_ctrl_ptr p_cur;
> >>>  };
> >>> @@ -417,6 +431,8 @@ struct v4l2_ctrl_handler {
> >>>   * @step:    The control's step value for non-menu controls.
> >>>   * @def:     The control's default value.
> >>>   * @p_def:   The control's default value for compound controls.
> >>> + * @p_min:   The control's minimum value for compound controls.
> >>> + * @p_max:   The control's maximum value for compound controls.
> >>>   * @dims:    The size of each dimension.
> >>>   * @elem_size:       The size in bytes of the control.
> >>>   * @flags:   The control's flags.
> >>> @@ -446,6 +462,8 @@ struct v4l2_ctrl_config {
> >>>       u64 step;
> >>>       s64 def;
> >>>       union v4l2_ctrl_ptr p_def;
> >>> +     union v4l2_ctrl_ptr p_min;
> >>> +     union v4l2_ctrl_ptr p_max;
> >>>       u32 dims[V4L2_CTRL_MAX_DIMS];
> >>>       u32 elem_size;
> >>>       u32 flags;
> >>> @@ -715,17 +733,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >>>   * @ops:       The control ops.
> >>>   * @id:        The control ID.
> >>>   * @p_def:     The control's default value.
> >>> + * @p_min:     The control's minimum value.
> >>> + * @p_max:     The control's maximum value.
> >>>   *
> >>> - * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> >>> - * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
> >>> - * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
> >>> - * compound control should be all zeroes.
> >>> + * Same as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> >>> + * to the @p_def/min/max field. Use v4l2_ctrl_ptr_create() to create
> >>> + * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the
> >>> + * default value of the compound control should be all zeroes. Use
> >>> + * v4l2_ctrl_ptr_create(NULL) if the min/max value of the compound control
> >>> + * is not defined, an error will be returned in this case.
> >>>   *
> >>>   */
> >>>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >>>                                            const struct v4l2_ctrl_ops *ops,
> >>>                                            u32 id,
> >>> -                                          const union v4l2_ctrl_ptr p_def);
> >>> +                                          const union v4l2_ctrl_ptr p_def,
> >>> +                                          const union v4l2_ctrl_ptr p_min,
> >>> +                                          const union v4l2_ctrl_ptr p_max);
> >>>
> >>>  /**
> >>>   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >>> index a81951c51325..5f698b49c02e 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -1827,6 +1827,8 @@ struct v4l2_ext_controls {
> >>>  #define V4L2_CTRL_WHICH_CUR_VAL   0
> >>>  #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
> >>>  #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
> >>> +#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
> >>> +#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
> >>>
> >>>  enum v4l2_ctrl_type {
> >>>       V4L2_CTRL_TYPE_INTEGER       = 1,
> >>
> >> Regards,
> >>
> >>         Hans
