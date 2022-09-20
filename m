Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E28B5BE296
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 12:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiITKBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 06:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiITKBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 06:01:19 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9A859249
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 03:01:17 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id go6so2496983pjb.2
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XYvA7YX9Q6WuikhKbykvep5bDTrDM9eYCGXKFuWuMg8=;
        b=so5b4Mz6PViZZnkPN9WEZqIwp1vKRtupNGVgECMtvvBrYXYoQqm1T/UUtPFqqbXubT
         zBQAnWGy1pUpYj3Dvz4r6GnnnbpcbqA6ie9OwxqROJy5oUdXO3bGIv5r/qmMGTvhMCxN
         U+9/pim3s9OBaDs8KQQP4FYuCE5SvnYDRj6ncsRfoC3IOxyGUMv88UoMETVRpcDvTWxa
         XrF62/1wv0OgqGbTnJj3P6C9RRV96RDigDqTUcxIzQAiLoBmTm16iJc4Rd9Ya7mytvy8
         McmzVboKCdlr7eeRcE8yTI19EhkYEnehGmTMQBva5kdfxXc4taiOjFu6VTPBKT/UGub9
         CeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XYvA7YX9Q6WuikhKbykvep5bDTrDM9eYCGXKFuWuMg8=;
        b=xR25y9nn4/14Bswj3oDRCw89oI+GKmMikjtO44Bt+zym8JHsrCYnHwHoHAjZL3Z5yM
         QuYZGiheftwKfcz4y1UGLR0NrC+x6Rn5dWkUuhS76K+stGFVPR7H84FY+8FfBUEPD+JK
         sOVjZH+DF239B3HRjNO3TEz+fpPGQ2XVQZb7hsIVVTtgsHlbK09+kRPeEeJlNd3HJkTu
         oT5SlYqTib1oV6x2pBGvUH58EwfIcqJtjYutAsduqJwgJe5TG+7LRnJ+gVJHdqDyzPUe
         ifSZwaz0rxOT41jbLcF9XUtAYhvXZsfHp+hkntoKclVD+TeV8IBOZNS0ahxVmupCoSsi
         wUZg==
X-Gm-Message-State: ACrzQf0WnPTwPwEwsl8bLanozvxaFTxb2Y8ri6GDqm3mWatVtsyuU2GA
        akO0NDUZHmtvd1PZMiVeHp1kTFAHvO1/FsNhJc+5pA==
X-Google-Smtp-Source: AMsMyM4pRy6K4LjtijHJPS601IS0csyL/3XqZVOGOjwU6Gax+NOjG1kFhkVg5GARSCvkhrR16LNiiv88NSBAHp1KA94=
X-Received: by 2002:a17:903:2341:b0:178:1991:1759 with SMTP id
 c1-20020a170903234100b0017819911759mr3979373plh.47.1663668076635; Tue, 20 Sep
 2022 03:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-6-yunkec@google.com>
 <YwZPsDPAk7iLh+5T@pendragon.ideasonboard.com>
In-Reply-To: <YwZPsDPAk7iLh+5T@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 20 Sep 2022 19:01:05 +0900
Message-ID: <CANqU6FemhTWJGyCaguUzP0D2VeTkmEns8=6Ozww0OVU1XKD26A@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
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

Hi Laurent, Hans,

Thank you Laurent for the review.

On Thu, Aug 25, 2022 at 1:20 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke and Hans,
>
> Thank you for the patch.
>
> On Tue, Jun 28, 2022 at 04:57:03PM +0900, Yunke Cao wrote:
> > From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >
> > Add the capability of retrieving the min and max values of a
> > compound control.
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> > git am from https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/
> > -Fixed some merge conflits.
> > -Fixed the build error in drivers/media/platform/qcom/venus.
> >
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   7 +-
> >  .../media/videodev2.h.rst.exceptions          |   2 +
> >  drivers/media/i2c/imx214.c                    |   5 +-
> >  .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +++++--
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 135 ++++++++++++++++--
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
> >  include/media/v4l2-ctrls.h                    |  32 ++++-
> >  include/uapi/linux/videodev2.h                |   2 +
> >  9 files changed, 214 insertions(+), 28 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index 7473baa4e977..65a5f878cc28 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -284,14 +284,17 @@ still cause this situation.
> >        - Which value of the control to get/set/try.
> >      * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
> >       the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
> > +     value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
> > +     value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
>
> The concept of minimum and maximum values for compound controls can be
> quite ill-defined. Could we document here that the definition of the
> minimum and maximum values are provided by the control documentation for
> compound controls ?
>

Sure, I can do that.

> >       value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
> >       these controls have to be retrieved from a request or tried/set for
> >       a request. In the latter case the ``request_fd`` field contains the
> >       file descriptor of the request that should be used. If the device
> >       does not support requests, then ``EACCES`` will be returned.
> >
> > -     When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
> > -     get the default value of the control, you cannot set or try it.
> > +     When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
> > +     or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
> > +     default/minimum/maximum value of the control, you cannot set or try it.
> >
> >       For backwards compatibility you can also use a control class here
> >       (see :ref:`ctrl-class`). In that case all controls have to
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 7b423475281d..e2dde31d76df 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -553,6 +553,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
> >  ignore define V4L2_CTRL_MAX_DIMS
> >  ignore define V4L2_CTRL_WHICH_CUR_VAL
> >  ignore define V4L2_CTRL_WHICH_DEF_VAL
> > +ignore define V4L2_CTRL_WHICH_MIN_VAL
> > +ignore define V4L2_CTRL_WHICH_MAX_VAL
> >  ignore define V4L2_CTRL_WHICH_REQUEST_VAL
> >  ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
> >  ignore define V4L2_CID_MAX_CTRLS
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 83c1737abeec..aa0bfd18f7b7 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -1037,7 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
> >       imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> >                               NULL,
> >                               V4L2_CID_UNIT_CELL_SIZE,
> > -                             v4l2_ctrl_ptr_create((void *)&unit_size));
> > +                             v4l2_ctrl_ptr_create((void *)&unit_size),
> > +                             v4l2_ctrl_ptr_create(NULL),
> > +                             v4l2_ctrl_ptr_create(NULL));
>
> Would it make sense to set min = max = default for read-only controls ?
> You should also update the documentation of V4L2_CID_UNIT_CELL_SIZE (and
> other controls below) to indicate how their minimum and maximum are
> defined.
>

I only modified imx214.c and venc_ctrls.c to fix the build errors
caused by the change
of v4l2_ctrl_ptr_create().

Can I leave the min/max for these controls undefined in this patch (by
returning error
as we discussed below)?

setting min = max = default for V4L2_CID_UNIT_CELL_SIZE makes sense to me.
I can implement and document V4L2_CID_UNIT_CELL_SIZE in a followup patch.
I'm not familiar with the other two controls though, so I prefer to
leave them undefined.

> > +
> >       ret = imx214->ctrls.error;
> >       if (ret) {
> >               dev_err(&client->dev, "%s control init failed (%d)\n",
> > diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> > index ed44e5800759..4af8f9ca12a6 100644
> > --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> > +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> > @@ -579,10 +579,14 @@ int venc_ctrl_init(struct venus_inst *inst)
> >
> >       v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
> >                                  V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
> > +                                v4l2_ctrl_ptr_create(NULL),
> > +                                v4l2_ctrl_ptr_create(NULL),
> >                                  v4l2_ctrl_ptr_create(NULL));
> >
> >       v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
> >                                  V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
> > +                                v4l2_ctrl_ptr_create(NULL),
> > +                                v4l2_ctrl_ptr_create(NULL),
> >                                  v4l2_ctrl_ptr_create(NULL));
> >
> >       v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > index db9baa0bd05f..8a9c816b0dab 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > @@ -97,6 +97,28 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >       return ptr_to_user(c, ctrl, ctrl->p_new);
> >  }
> >
> > +/* Helper function: copy the minimum control value back to the caller */
> > +static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> > +{
> > +     int idx;
> > +
> > +     for (idx = 0; idx < ctrl->elems; idx++)
> > +             ctrl->type_ops->minimum(ctrl, idx, ctrl->p_new);
> > +
> > +     return ptr_to_user(c, ctrl, ctrl->p_new);
> > +}
> > +
> > +/* Helper function: copy the maximum control value back to the caller */
> > +static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> > +{
> > +     int idx;
> > +
> > +     for (idx = 0; idx < ctrl->elems; idx++)
> > +             ctrl->type_ops->maximum(ctrl, idx, ctrl->p_new);
> > +
> > +     return ptr_to_user(c, ctrl, ctrl->p_new);
> > +}
> > +
> >  /* Helper function: copy the caller-provider value to the given control value */
> >  static int user_to_ptr(struct v4l2_ext_control *c,
> >                      struct v4l2_ctrl *ctrl,
> > @@ -220,8 +242,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> >               cs->error_idx = i;
> >
> >               if (cs->which &&
> > -                 cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
> > -                 cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
> > +                 (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
> > +                  cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
> >                   V4L2_CTRL_ID2WHICH(id) != cs->which) {
> >                       dprintk(vdev,
> >                               "invalid which 0x%x or control id 0x%x\n",
> > @@ -335,8 +357,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> >   */
> >  static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
> >  {
> > -     if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
> > -         which == V4L2_CTRL_WHICH_REQUEST_VAL)
> > +     if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
> > +                        which <= V4L2_CTRL_WHICH_MAX_VAL))
> >               return 0;
> >       return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
> >  }
> > @@ -356,10 +378,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >       struct v4l2_ctrl_helper *helpers = helper;
> >       int ret;
> >       int i, j;
> > -     bool is_default, is_request;
> > +     bool is_default, is_request, is_min, is_max;
> >
> >       is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
> >       is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
> > +     is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
> > +     is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
> >
> >       cs->error_idx = cs->count;
> >       cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> > @@ -399,13 +423,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >
> >               /*
> >                * g_volatile_ctrl will update the new control values.
> > -              * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
> > +              * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
> > +              * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
> >                * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
> >                * it is v4l2_ctrl_request_complete() that copies the
> >                * volatile controls at the time of request completion
> >                * to the request, so you don't want to do that again.
> >                */
> > -             if (!is_default && !is_request &&
> > +             if (!is_default && !is_request && !is_min && !is_max &&
> >                   ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
> >                   (master->has_volatiles && !is_cur_manual(master)))) {
> >                       for (j = 0; j < master->ncontrols; j++)
> > @@ -432,6 +457,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> >                               ret = def_to_user(cs->controls + idx, ref->ctrl);
> >                       else if (is_request && ref->valid_p_req)
> >                               ret = req_to_user(cs->controls + idx, ref);
> > +                     else if (is_min)
> > +                             ret = min_to_user(cs->controls + idx, ref->ctrl);
> > +                     else if (is_max)
> > +                             ret = max_to_user(cs->controls + idx, ref->ctrl);
> >                       else if (is_volatile)
> >                               ret = new_to_user(cs->controls + idx, ref->ctrl);
> >                       else
> > @@ -523,9 +552,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> >
> >       cs->error_idx = cs->count;
> >
> > -     /* Default value cannot be changed */
> > -     if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
> > -             dprintk(vdev, "%s: cannot change default value\n",
> > +     /* Default/minimum/maximum values cannot be changed */
> > +     if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
> > +         cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
> > +         cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
> > +             dprintk(vdev, "%s: cannot change default/min/max value\n",
> >                       video_device_node_name(vdev));
> >               return -EINVAL;
> >       }
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 35d43ba650db..8c5828c7c6d3 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -186,6 +186,28 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >       }
> >  }
> >
> > +static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                          union v4l2_ctrl_ptr ptr)
> > +{
> > +     void *p = ptr.p + idx * ctrl->elem_size;
> > +
> > +     if (ctrl->p_min.p_const)
> > +             memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
> > +     else
> > +             memset(p, 0, ctrl->elem_size);
> > +}
> > +
> > +static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                          union v4l2_ctrl_ptr ptr)
> > +{
> > +     void *p = ptr.p + idx * ctrl->elem_size;
> > +
> > +     if (ctrl->p_max.p_const)
> > +             memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
> > +     else
> > +             memset(p, 0, ctrl->elem_size);
> > +}
> > +
> >  static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> >                    union v4l2_ctrl_ptr ptr)
> >  {
> > @@ -224,6 +246,82 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> >       }
> >  }
> >
> > +static void std_minimum(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                     union v4l2_ctrl_ptr ptr)
> > +{
> > +     switch (ctrl->type) {
> > +     case V4L2_CTRL_TYPE_STRING:
> > +             idx *= ctrl->elem_size;
> > +             memset(ptr.p_char + idx, ' ', ctrl->minimum);
> > +             ptr.p_char[idx + ctrl->minimum] = '\0';
> > +             break;
> > +     case V4L2_CTRL_TYPE_INTEGER64:
> > +             ptr.p_s64[idx] = ctrl->minimum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_INTEGER:
> > +     case V4L2_CTRL_TYPE_INTEGER_MENU:
> > +     case V4L2_CTRL_TYPE_MENU:
> > +     case V4L2_CTRL_TYPE_BITMASK:
> > +     case V4L2_CTRL_TYPE_BOOLEAN:
> > +             ptr.p_s32[idx] = ctrl->minimum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_BUTTON:
> > +     case V4L2_CTRL_TYPE_CTRL_CLASS:
> > +             ptr.p_s32[idx] = 0;
> > +             break;
> > +     case V4L2_CTRL_TYPE_U8:
> > +             ptr.p_u8[idx] = ctrl->minimum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_U16:
> > +             ptr.p_u16[idx] = ctrl->minimum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_U32:
> > +             ptr.p_u32[idx] = ctrl->minimum;
> > +             break;
> > +     default:
> > +             std_min_compound(ctrl, idx, ptr);
> > +             break;
> > +     }
> > +}
> > +
> > +static void std_maximum(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                     union v4l2_ctrl_ptr ptr)
> > +{
> > +     switch (ctrl->type) {
> > +     case V4L2_CTRL_TYPE_STRING:
> > +             idx *= ctrl->elem_size;
> > +             memset(ptr.p_char + idx, ' ', ctrl->maximum);
> > +             ptr.p_char[idx + ctrl->maximum] = '\0';
> > +             break;
> > +     case V4L2_CTRL_TYPE_INTEGER64:
> > +             ptr.p_s64[idx] = ctrl->maximum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_INTEGER:
> > +     case V4L2_CTRL_TYPE_INTEGER_MENU:
> > +     case V4L2_CTRL_TYPE_MENU:
> > +     case V4L2_CTRL_TYPE_BITMASK:
> > +     case V4L2_CTRL_TYPE_BOOLEAN:
> > +             ptr.p_s32[idx] = ctrl->maximum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_BUTTON:
> > +     case V4L2_CTRL_TYPE_CTRL_CLASS:
> > +             ptr.p_s32[idx] = 0;
> > +             break;
> > +     case V4L2_CTRL_TYPE_U8:
> > +             ptr.p_u8[idx] = ctrl->maximum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_U16:
> > +             ptr.p_u16[idx] = ctrl->maximum;
> > +             break;
> > +     case V4L2_CTRL_TYPE_U32:
> > +             ptr.p_u32[idx] = ctrl->maximum;
> > +             break;
> > +     default:
> > +             std_max_compound(ctrl, idx, ptr);
> > +             break;
> > +     }
> > +}
> > +
> >  static void std_log(const struct v4l2_ctrl *ctrl)
> >  {
> >       union v4l2_ctrl_ptr ptr = ctrl->p_cur;
> > @@ -986,6 +1084,8 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
> >  static const struct v4l2_ctrl_type_ops std_type_ops = {
> >       .equal = std_equal,
> >       .init = std_init,
> > +     .minimum = std_minimum,
> > +     .maximum = std_maximum,
> >       .log = std_log,
> >       .validate = std_validate,
> >  };
> > @@ -1368,7 +1468,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >                       s64 min, s64 max, u64 step, s64 def,
> >                       const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
> >                       u32 flags, const char * const *qmenu,
> > -                     const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
> > +                     const s64 *qmenu_int,
> > +                     const union v4l2_ctrl_ptr p_def,
> > +                     const union v4l2_ctrl_ptr p_min,
> > +                     const union v4l2_ctrl_ptr p_max,
> >                       void *priv)
> >  {
> >       struct v4l2_ctrl *ctrl;
> > @@ -1515,7 +1618,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >               sz_extra += 2 * tot_ctrl_size;
> >
> >       if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
> > -             sz_extra += elem_size;
> > +             sz_extra += elem_size * 3;
> >
> >       ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
> >       if (ctrl == NULL) {
> > @@ -1565,6 +1668,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >               ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
> >               memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
> >       }
> > +     if (type >= V4L2_CTRL_COMPOUND_TYPES &&
> > +         p_min.p_const && p_max.p_const) {
> > +             ctrl->p_min.p = ctrl->p_cur.p + 2 * tot_ctrl_size;
> > +             memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
> > +             ctrl->p_max.p = ctrl->p_cur.p + 3 * tot_ctrl_size;
> > +             memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
> > +     }
> >
> >       for (idx = 0; idx < elems; idx++) {
> >               ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
> > @@ -1617,7 +1727,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
> >                       type, min, max,
> >                       is_menu ? cfg->menu_skip_mask : step, def,
> >                       cfg->dims, cfg->elem_size,
> > -                     flags, qmenu, qmenu_int, cfg->p_def, priv);
> > +                     flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
> > +                     cfg->p_max, priv);
> >       if (ctrl)
> >               ctrl->is_private = cfg->is_private;
> >       return ctrl;
> > @@ -1642,7 +1753,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            min, max, step, def, NULL, 0,
> > -                          flags, NULL, NULL, ptr_null, NULL);
> > +                          flags, NULL, NULL, ptr_null, ptr_null,
> > +                          ptr_null, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std);
> >
> > @@ -1675,7 +1787,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            0, max, mask, def, NULL, 0,
> > -                          flags, qmenu, qmenu_int, ptr_null, NULL);
> > +                          flags, qmenu, qmenu_int, ptr_null, ptr_null,
> > +                          ptr_null, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
> >
> > @@ -1707,7 +1820,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            0, max, mask, def, NULL, 0,
> > -                          flags, qmenu, NULL, ptr_null, NULL);
> > +                          flags, qmenu, NULL, ptr_null, ptr_null,
> > +                          ptr_null, NULL);
> >
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> > @@ -1715,7 +1829,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> >  /* Helper function for standard compound controls */
> >  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >                               const struct v4l2_ctrl_ops *ops, u32 id,
> > -                             const union v4l2_ctrl_ptr p_def)
> > +                             const union v4l2_ctrl_ptr p_def,
> > +                             const union v4l2_ctrl_ptr p_min,
> > +                             const union v4l2_ctrl_ptr p_max)
> >  {
> >       const char *name;
> >       enum v4l2_ctrl_type type;
> > @@ -1729,7 +1845,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            min, max, step, def, NULL, 0,
> > -                          flags, NULL, NULL, p_def, NULL);
> > +                          flags, NULL, NULL, p_def, p_min, p_max, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> >
> > @@ -1753,7 +1869,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> >       }
> >       return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> >                            0, max, 0, def, NULL, 0,
> > -                          flags, NULL, qmenu_int, ptr_null, NULL);
> > +                          flags, NULL, qmenu_int, ptr_null, ptr_null,
> > +                          ptr_null, NULL);
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 21470de62d72..0f713b9a95f9 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -893,7 +893,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
> >                       return false;
> >               break;
> >       case V4L2_CTRL_WHICH_DEF_VAL:
> > -             /* Default value cannot be changed */
> > +     case V4L2_CTRL_WHICH_MIN_VAL:
> > +     case V4L2_CTRL_WHICH_MAX_VAL:
> > +             /* Default, minimum or maximum value cannot be changed */
> >               if (ioctl == VIDIOC_S_EXT_CTRLS ||
> >                   ioctl == VIDIOC_TRY_EXT_CTRLS) {
> >                       c->error_idx = c->count;
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 919e104de50b..c8ab8c44d7c6 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -131,6 +131,8 @@ struct v4l2_ctrl_ops {
> >   *
> >   * @equal: return true if both values are equal.
> >   * @init: initialize the value.
> > + * @minimum: set the value to the minimum value of the control.
> > + * @maximum: set the value to the maximum value of the control.
> >   * @log: log the value.
> >   * @validate: validate the value. Return 0 on success and a negative value
> >   *   otherwise.
> > @@ -141,6 +143,10 @@ struct v4l2_ctrl_type_ops {
> >                     union v4l2_ctrl_ptr ptr2);
> >       void (*init)(const struct v4l2_ctrl *ctrl, u32 idx,
> >                    union v4l2_ctrl_ptr ptr);
> > +     void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                     union v4l2_ctrl_ptr ptr);
> > +     void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                     union v4l2_ctrl_ptr ptr);
> >       void (*log)(const struct v4l2_ctrl *ctrl);
> >       int (*validate)(const struct v4l2_ctrl *ctrl, u32 idx,
> >                       union v4l2_ctrl_ptr ptr);
> > @@ -237,6 +243,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
> >   * @p_def:   The control's default value represented via a union which
> >   *           provides a standard way of accessing control types
> >   *           through a pointer (for compound controls only).
> > + * @p_min:   The control's minimum value represented via a union which
> > + *           provides a standard way of accessing control types
> > + *           through a pointer (for compound controls only).
> > + * @p_max:   The control's maximum value represented via a union which
> > + *           provides a standard way of accessing control types
> > + *           through a pointer (for compound controls only).
> >   * @p_cur:   The control's current value represented via a union which
> >   *           provides a standard way of accessing control types
> >   *           through a pointer.
> > @@ -292,6 +304,8 @@ struct v4l2_ctrl {
> >       } cur;
> >
> >       union v4l2_ctrl_ptr p_def;
> > +     union v4l2_ctrl_ptr p_min;
> > +     union v4l2_ctrl_ptr p_max;
> >       union v4l2_ctrl_ptr p_new;
> >       union v4l2_ctrl_ptr p_cur;
> >  };
> > @@ -398,6 +412,8 @@ struct v4l2_ctrl_handler {
> >   * @step:    The control's step value for non-menu controls.
> >   * @def:     The control's default value.
> >   * @p_def:   The control's default value for compound controls.
> > + * @p_min:   The control's minimum value for compound controls.
> > + * @p_max:   The control's maximum value for compound controls.
> >   * @dims:    The size of each dimension.
> >   * @elem_size:       The size in bytes of the control.
> >   * @flags:   The control's flags.
> > @@ -427,6 +443,8 @@ struct v4l2_ctrl_config {
> >       u64 step;
> >       s64 def;
> >       union v4l2_ctrl_ptr p_def;
> > +     union v4l2_ctrl_ptr p_min;
> > +     union v4l2_ctrl_ptr p_max;
> >       u32 dims[V4L2_CTRL_MAX_DIMS];
> >       u32 elem_size;
> >       u32 flags;
> > @@ -696,17 +714,21 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> >   * @ops:       The control ops.
> >   * @id:        The control ID.
> >   * @p_def:     The control's default value.
> > + * @p_min:     The control's minimum value.
> > + * @p_max:     The control's maximum value.
> >   *
> > - * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> > - * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
> > - * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
> > - * compound control should be all zeroes.
> > + * Same as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> > + * to the @p_def/min/max field. Use v4l2_ctrl_ptr_create() to create
>
> s/field/fields/
>
> > + * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the
> > + * default/min/max value of the compound control should be all zeroes.
>
> Hmmm... I expect that, for some compound control types, the concept of
> minimum and maximum won't be defined. Wouldn't it better for a get
> control operation on V4L2_CTRL_WHICH_{MIN,MAX}_VAL to return an error in
> that case, instead of zeroed memory ?
>

Returning error for undefined cases sounds good to me.
What about changing std_min_compound to return error for null ptrs?

+static int std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
+                            union v4l2_ctrl_ptr ptr)
+{
+       void *p = ptr.p + idx * ctrl->elem_size;
+
+       if (ctrl->p_min.p_const)
+               memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
+       else
+               return -EINVAL;
+}

Best,
Yunke

>
> >   *
> >   */
> >  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> >                                            const struct v4l2_ctrl_ops *ops,
> >                                            u32 id,
> > -                                          const union v4l2_ctrl_ptr p_def);
> > +                                          const union v4l2_ctrl_ptr p_def,
> > +                                          const union v4l2_ctrl_ptr p_min,
> > +                                          const union v4l2_ctrl_ptr p_max);
> >
> >  /**
> >   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 2e36bb610ea6..134f6a65eacc 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1796,6 +1796,8 @@ struct v4l2_ext_controls {
> >  #define V4L2_CTRL_WHICH_CUR_VAL   0
> >  #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
> >  #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
> > +#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
> > +#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
> >
> >  enum v4l2_ctrl_type {
> >       V4L2_CTRL_TYPE_INTEGER       = 1,
>
> --
> Regards,
>
> Laurent Pinchart
