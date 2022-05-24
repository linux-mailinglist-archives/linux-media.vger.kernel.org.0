Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21607532692
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 11:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbiEXJiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 05:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbiEXJiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 05:38:16 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C6B66230
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 02:38:12 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-f1d5464c48so21573151fac.6
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOV6dEtBXKuYvBD6FI5jQfewCujCsArUItaAa6AkYBU=;
        b=lYYO8e+6vK7EBnooWwAhUjFhNG/sAeR42WMUq/24xKFzbEXElVHFRWYlr8K8UAi/7F
         Soyuaz+KXxm1hlct5Q+NXu/zWNmeooA893Auinq5GLPuRdnGAII9Qy1fA1jdfiLEejOI
         Sm7LKAUXuh82NBJrhXOA3tGFv55C0qv6MkM3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOV6dEtBXKuYvBD6FI5jQfewCujCsArUItaAa6AkYBU=;
        b=elWaMOl8iJEMjkgJOamaSMXL4SMogkw/8j52TX6x0iVAbXFmMDbULiy+U2DeK7EAca
         JvNg9eSTQIDLiCzdsOnbVejxXGp6qgLvEAwjUT76Gy01smxp660Kz9O/pGHGO4Q/s7b+
         3b7cpxt667Zpp8XWnokS8OwqcNVDM/BbnSI+t6dGWGnyOE5o28l9czAj04KGqiD2A8Xr
         H9o8exHoxsxvvI+ujE5PD6Ra0Tqi/2cus+MowZRx6zBTShWRjDZlCNN1bL2ozgDpfYvD
         d4iik5U8RnoNf0Qs+F5837hWT0VQlJdkPuqgT52eJde5zmS880sY+D4ZYIHb/a9TttKF
         t/2g==
X-Gm-Message-State: AOAM532NY/QfIIJmX4+tsenu0fCMFl7IZXlzyrxNMtOrSU+4pNrp6H5i
        QvjA5lqXUfzqoAUS+H6rAairhrAArFBIhQ==
X-Google-Smtp-Source: ABdhPJwEjMwPyrec+U5kQCbn7ec+7CTUStNLkBV5L/hRkPMwYp4PLAX2mdupYxOt2rOr+1SckV6qjg==
X-Received: by 2002:a05:6870:a54b:b0:f1:ef2e:a585 with SMTP id p11-20020a056870a54b00b000f1ef2ea585mr1890671oal.222.1653385091050;
        Tue, 24 May 2022 02:38:11 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id w8-20020a056830410800b0060aecef5d37sm4878363ott.65.2022.05.24.02.38.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 02:38:10 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id w130so20830743oig.0
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 02:38:09 -0700 (PDT)
X-Received: by 2002:a05:6808:150f:b0:32b:888:f534 with SMTP id
 u15-20020a056808150f00b0032b0888f534mr1633197oiw.223.1653385088989; Tue, 24
 May 2022 02:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220524044507.1696012-1-yunkec@google.com> <20220524044507.1696012-3-yunkec@google.com>
In-Reply-To: <20220524044507.1696012-3-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 24 May 2022 11:37:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCv43GqkcyNVty823-E_D1JYJBE7LKiBD83YGLLbvkzwKw@mail.gmail.com>
Message-ID: <CANiDSCv43GqkcyNVty823-E_D1JYJBE7LKiBD83YGLLbvkzwKw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] media: v4l2_ctrl: Add V4L2_CTRL_WHICH_MIN/MAX_VAL
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke

On Tue, 24 May 2022 at 06:45, Yunke Cao <yunkec@google.com> wrote:
>
> Added V4L2_CTRL_WHICH_MIN/MAX_VAL and basic support in v4l2-core.
>
> Mostly reusing a previous attempt:
> https://lore.kernel.org/all/20191220134843.25977-1-m.tretter@pengutronix.de/T/#m5c83970af8b774a4b1ea5f2dca4c0a534da4ccbe
maybe: https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/


>
> Signed-off-by: Yunke Cao <yunkec@google.com>
I think it is not official, but I like the tag:
Credit-to:

Instead of sending your version. Could you cherry-pick Hans patch?

You could add after the
====
how did you solve the conflicts

(if it is too different from Hans, please disregard this message)

> ---
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   8 +-
>  .../media/videodev2.h.rst.exceptions          |   2 +
>  drivers/media/i2c/imx214.c                    |   4 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +++++--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 135 ++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  30 +++-
>  include/uapi/linux/videodev2.h                |   2 +
>  8 files changed, 209 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index f4e205ead0a2..a89577726efa 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -284,14 +284,18 @@ still cause this situation.
>        - Which value of the control to get/set/try.
>      * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
>         the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
> +       value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
> +       value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
>         value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
>         these controls have to be retrieved from a request or tried/set for
>         a request. In the latter case the ``request_fd`` field contains the
>         file descriptor of the request that should be used. If the device
>         does not support requests, then ``EACCES`` will be returned.
>
> -       When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
> -       get the default value of the control, you cannot set or try it.
> +       When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
> +       or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only
> +       get the default/minimum/maximum value of the control, you cannot set
> +       or try it.
>
>         For backwards compatibility you can also use a control class here
>         (see :ref:`ctrl-class`). In that case all controls have to
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 7b423475281d..e2dde31d76df 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -553,6 +553,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
>  ignore define V4L2_CTRL_MAX_DIMS
>  ignore define V4L2_CTRL_WHICH_CUR_VAL
>  ignore define V4L2_CTRL_WHICH_DEF_VAL
> +ignore define V4L2_CTRL_WHICH_MIN_VAL
> +ignore define V4L2_CTRL_WHICH_MAX_VAL
>  ignore define V4L2_CTRL_WHICH_REQUEST_VAL
>  ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
>  ignore define V4L2_CID_MAX_CTRLS
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 83c1737abeec..1541a81dcd46 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1037,7 +1037,9 @@ static int imx214_probe(struct i2c_client *client)
>         imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
>                                 NULL,
>                                 V4L2_CID_UNIT_CELL_SIZE,
> -                               v4l2_ctrl_ptr_create((void *)&unit_size));
> +                               v4l2_ctrl_ptr_create((void *)&unit_size),
> +                               v4l2_ctrl_ptr_create(NULL),
> +                               v4l2_ctrl_ptr_create(NULL));
>         ret = imx214->ctrls.error;
>         if (ret) {
>                 dev_err(&client->dev, "%s control init failed (%d)\n",
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index db9baa0bd05f..8a9c816b0dab 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -97,6 +97,28 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>         return ptr_to_user(c, ctrl, ctrl->p_new);
>  }
>
> +/* Helper function: copy the minimum control value back to the caller */
> +static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> +{
> +       int idx;
> +
> +       for (idx = 0; idx < ctrl->elems; idx++)
> +               ctrl->type_ops->minimum(ctrl, idx, ctrl->p_new);
> +
> +       return ptr_to_user(c, ctrl, ctrl->p_new);
> +}
> +
> +/* Helper function: copy the maximum control value back to the caller */
> +static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> +{
> +       int idx;
> +
> +       for (idx = 0; idx < ctrl->elems; idx++)
> +               ctrl->type_ops->maximum(ctrl, idx, ctrl->p_new);
> +
> +       return ptr_to_user(c, ctrl, ctrl->p_new);
> +}
> +
>  /* Helper function: copy the caller-provider value to the given control value */
>  static int user_to_ptr(struct v4l2_ext_control *c,
>                        struct v4l2_ctrl *ctrl,
> @@ -220,8 +242,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
>                 cs->error_idx = i;
>
>                 if (cs->which &&
> -                   cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
> -                   cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
> +                   (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
> +                    cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
>                     V4L2_CTRL_ID2WHICH(id) != cs->which) {
>                         dprintk(vdev,
>                                 "invalid which 0x%x or control id 0x%x\n",
> @@ -335,8 +357,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
>   */
>  static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
>  {
> -       if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
> -           which == V4L2_CTRL_WHICH_REQUEST_VAL)
> +       if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
> +                          which <= V4L2_CTRL_WHICH_MAX_VAL))
>                 return 0;
>         return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
>  }
> @@ -356,10 +378,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>         struct v4l2_ctrl_helper *helpers = helper;
>         int ret;
>         int i, j;
> -       bool is_default, is_request;
> +       bool is_default, is_request, is_min, is_max;
>
>         is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
>         is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
> +       is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
> +       is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
>
>         cs->error_idx = cs->count;
>         cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> @@ -399,13 +423,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>
>                 /*
>                  * g_volatile_ctrl will update the new control values.
> -                * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
> +                * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
> +                * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
>                  * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
>                  * it is v4l2_ctrl_request_complete() that copies the
>                  * volatile controls at the time of request completion
>                  * to the request, so you don't want to do that again.
>                  */
> -               if (!is_default && !is_request &&
> +               if (!is_default && !is_request && !is_min && !is_max &&
>                     ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
>                     (master->has_volatiles && !is_cur_manual(master)))) {
>                         for (j = 0; j < master->ncontrols; j++)
> @@ -432,6 +457,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>                                 ret = def_to_user(cs->controls + idx, ref->ctrl);
>                         else if (is_request && ref->valid_p_req)
>                                 ret = req_to_user(cs->controls + idx, ref);
> +                       else if (is_min)
> +                               ret = min_to_user(cs->controls + idx, ref->ctrl);
> +                       else if (is_max)
> +                               ret = max_to_user(cs->controls + idx, ref->ctrl);
>                         else if (is_volatile)
>                                 ret = new_to_user(cs->controls + idx, ref->ctrl);
>                         else
> @@ -523,9 +552,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
>
>         cs->error_idx = cs->count;
>
> -       /* Default value cannot be changed */
> -       if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
> -               dprintk(vdev, "%s: cannot change default value\n",
> +       /* Default/minimum/maximum values cannot be changed */
> +       if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
> +           cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
> +           cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
> +               dprintk(vdev, "%s: cannot change default/min/max value\n",
>                         video_device_node_name(vdev));
>                 return -EINVAL;
>         }
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 384d12a9638b..7b6bf85814fe 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -186,6 +186,28 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>         }
>  }
>
> +static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> +                            union v4l2_ctrl_ptr ptr)
> +{
> +       void *p = ptr.p + idx * ctrl->elem_size;
> +
> +       if (ctrl->p_min.p_const)
> +               memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
> +       else
> +               memset(p, 0, ctrl->elem_size);
> +}
> +
> +static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> +                            union v4l2_ctrl_ptr ptr)
> +{
> +       void *p = ptr.p + idx * ctrl->elem_size;
> +
> +       if (ctrl->p_max.p_const)
> +               memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
> +       else
> +               memset(p, 0, ctrl->elem_size);
> +}
> +
>  static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>                      union v4l2_ctrl_ptr ptr)
>  {
> @@ -224,6 +246,82 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>         }
>  }
>
> +static void std_minimum(const struct v4l2_ctrl *ctrl, u32 idx,
> +                       union v4l2_ctrl_ptr ptr)
> +{
> +       switch (ctrl->type) {
> +       case V4L2_CTRL_TYPE_STRING:
> +               idx *= ctrl->elem_size;
> +               memset(ptr.p_char + idx, ' ', ctrl->minimum);
> +               ptr.p_char[idx + ctrl->minimum] = '\0';
> +               break;
> +       case V4L2_CTRL_TYPE_INTEGER64:
> +               ptr.p_s64[idx] = ctrl->minimum;
> +               break;
> +       case V4L2_CTRL_TYPE_INTEGER:
> +       case V4L2_CTRL_TYPE_INTEGER_MENU:
> +       case V4L2_CTRL_TYPE_MENU:
> +       case V4L2_CTRL_TYPE_BITMASK:
> +       case V4L2_CTRL_TYPE_BOOLEAN:
> +               ptr.p_s32[idx] = ctrl->minimum;
> +               break;
> +       case V4L2_CTRL_TYPE_BUTTON:
> +       case V4L2_CTRL_TYPE_CTRL_CLASS:
> +               ptr.p_s32[idx] = 0;
> +               break;
> +       case V4L2_CTRL_TYPE_U8:
> +               ptr.p_u8[idx] = ctrl->minimum;
> +               break;
> +       case V4L2_CTRL_TYPE_U16:
> +               ptr.p_u16[idx] = ctrl->minimum;
> +               break;
> +       case V4L2_CTRL_TYPE_U32:
> +               ptr.p_u32[idx] = ctrl->minimum;
> +               break;
> +       default:
> +               std_min_compound(ctrl, idx, ptr);
> +               break;
> +       }
> +}
> +
> +static void std_maximum(const struct v4l2_ctrl *ctrl, u32 idx,
> +                       union v4l2_ctrl_ptr ptr)
> +{
> +       switch (ctrl->type) {
> +       case V4L2_CTRL_TYPE_STRING:
> +               idx *= ctrl->elem_size;
> +               memset(ptr.p_char + idx, ' ', ctrl->maximum);
> +               ptr.p_char[idx + ctrl->maximum] = '\0';
> +               break;
> +       case V4L2_CTRL_TYPE_INTEGER64:
> +               ptr.p_s64[idx] = ctrl->maximum;
> +               break;
> +       case V4L2_CTRL_TYPE_INTEGER:
> +       case V4L2_CTRL_TYPE_INTEGER_MENU:
> +       case V4L2_CTRL_TYPE_MENU:
> +       case V4L2_CTRL_TYPE_BITMASK:
> +       case V4L2_CTRL_TYPE_BOOLEAN:
> +               ptr.p_s32[idx] = ctrl->maximum;
> +               break;
> +       case V4L2_CTRL_TYPE_BUTTON:
> +       case V4L2_CTRL_TYPE_CTRL_CLASS:
> +               ptr.p_s32[idx] = 0;
> +               break;
> +       case V4L2_CTRL_TYPE_U8:
> +               ptr.p_u8[idx] = ctrl->maximum;
> +               break;
> +       case V4L2_CTRL_TYPE_U16:
> +               ptr.p_u16[idx] = ctrl->maximum;
> +               break;
> +       case V4L2_CTRL_TYPE_U32:
> +               ptr.p_u32[idx] = ctrl->maximum;
> +               break;
> +       default:
> +               std_max_compound(ctrl, idx, ptr);
> +               break;
> +       }
> +}
> +
>  static void std_log(const struct v4l2_ctrl *ctrl)
>  {
>         union v4l2_ctrl_ptr ptr = ctrl->p_cur;
> @@ -986,6 +1084,8 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
>  static const struct v4l2_ctrl_type_ops std_type_ops = {
>         .equal = std_equal,
>         .init = std_init,
> +       .minimum = std_minimum,
> +       .maximum = std_maximum,
>         .log = std_log,
>         .validate = std_validate,
>  };
> @@ -1369,7 +1469,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>                         s64 min, s64 max, u64 step, s64 def,
>                         const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
>                         u32 flags, const char * const *qmenu,
> -                       const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
> +                       const s64 *qmenu_int,
> +                       const union v4l2_ctrl_ptr p_def,
> +                       const union v4l2_ctrl_ptr p_min,
> +                       const union v4l2_ctrl_ptr p_max,
>                         void *priv)
>  {
>         struct v4l2_ctrl *ctrl;
> @@ -1516,7 +1619,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>                 sz_extra += 2 * tot_ctrl_size;
>
>         if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
> -               sz_extra += elem_size;
> +               sz_extra += elem_size * 3;
>
>         ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
>         if (ctrl == NULL) {
> @@ -1566,6 +1669,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>                 ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
>                 memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
>         }
> +       if (type >= V4L2_CTRL_COMPOUND_TYPES &&
> +           p_min.p_const && p_max.p_const) {
> +               ctrl->p_min.p = ctrl->p_cur.p + 2 * tot_ctrl_size;
> +               memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
> +               ctrl->p_max.p = ctrl->p_cur.p + 3 * tot_ctrl_size;
> +               memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
> +       }
>
>         for (idx = 0; idx < elems; idx++) {
>                 ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
> @@ -1618,7 +1728,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>                         type, min, max,
>                         is_menu ? cfg->menu_skip_mask : step, def,
>                         cfg->dims, cfg->elem_size,
> -                       flags, qmenu, qmenu_int, cfg->p_def, priv);
> +                       flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
> +                       cfg->p_max, priv);
>         if (ctrl)
>                 ctrl->is_private = cfg->is_private;
>         return ctrl;
> @@ -1643,7 +1754,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>                              min, max, step, def, NULL, 0,
> -                            flags, NULL, NULL, ptr_null, NULL);
> +                            flags, NULL, NULL, ptr_null, ptr_null,
> +                            ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
>
> @@ -1676,7 +1788,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>                              0, max, mask, def, NULL, 0,
> -                            flags, qmenu, qmenu_int, ptr_null, NULL);
> +                            flags, qmenu, qmenu_int, ptr_null, ptr_null,
> +                            ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
>
> @@ -1708,7 +1821,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>                              0, max, mask, def, NULL, 0,
> -                            flags, qmenu, NULL, ptr_null, NULL);
> +                            flags, qmenu, NULL, ptr_null, ptr_null,
> +                            ptr_null, NULL);
>
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> @@ -1716,7 +1830,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
>  /* Helper function for standard compound controls */
>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>                                 const struct v4l2_ctrl_ops *ops, u32 id,
> -                               const union v4l2_ctrl_ptr p_def)
> +                               const union v4l2_ctrl_ptr p_def,
> +                               const union v4l2_ctrl_ptr p_min,
> +                               const union v4l2_ctrl_ptr p_max)
>  {
>         const char *name;
>         enum v4l2_ctrl_type type;
> @@ -1730,7 +1846,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>                              min, max, step, def, NULL, 0,
> -                            flags, NULL, NULL, p_def, NULL);
> +                            flags, NULL, NULL, p_def, p_min, p_max, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
>
> @@ -1754,7 +1870,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>                              0, max, 0, def, NULL, 0,
> -                            flags, NULL, qmenu_int, ptr_null, NULL);
> +                            flags, NULL, qmenu_int, ptr_null, ptr_null,
> +                            ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 96e307fe3aab..6ed6ef87c7ff 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -892,7 +892,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
>                         return false;
>                 break;
>         case V4L2_CTRL_WHICH_DEF_VAL:
> -               /* Default value cannot be changed */
> +       case V4L2_CTRL_WHICH_MIN_VAL:
> +       case V4L2_CTRL_WHICH_MAX_VAL:
> +               /* Default, minimum or maximum value cannot be changed */
>                 if (ioctl == VIDIOC_S_EXT_CTRLS ||
>                     ioctl == VIDIOC_TRY_EXT_CTRLS) {
>                         c->error_idx = c->count;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 919e104de50b..25378304b2fb 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -131,6 +131,8 @@ struct v4l2_ctrl_ops {
>   *
>   * @equal: return true if both values are equal.
>   * @init: initialize the value.
> + * @minimum: set the value to the minimum value of the control.
> + * @maximum: set the value to the maximum value of the control.
>   * @log: log the value.
>   * @validate: validate the value. Return 0 on success and a negative value
>   *     otherwise.
> @@ -141,6 +143,10 @@ struct v4l2_ctrl_type_ops {
>                       union v4l2_ctrl_ptr ptr2);
>         void (*init)(const struct v4l2_ctrl *ctrl, u32 idx,
>                      union v4l2_ctrl_ptr ptr);
> +       void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
> +                       union v4l2_ctrl_ptr ptr);
> +       void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
> +                       union v4l2_ctrl_ptr ptr);
>         void (*log)(const struct v4l2_ctrl *ctrl);
>         int (*validate)(const struct v4l2_ctrl *ctrl, u32 idx,
>                         union v4l2_ctrl_ptr ptr);
> @@ -237,6 +243,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
>   * @p_def:     The control's default value represented via a union which
>   *             provides a standard way of accessing control types
>   *             through a pointer (for compound controls only).
> + * @p_min:     The control's minimum value represented via a union which
> + *             provides a standard way of accessing control types
> + *             through a pointer (for compound controls only).
> + * @p_max:     The control's maximum value represented via a union which
> + *             provides a standard way of accessing control types
> + *             through a pointer (for compound controls only).
>   * @p_cur:     The control's current value represented via a union which
>   *             provides a standard way of accessing control types
>   *             through a pointer.
> @@ -292,6 +304,8 @@ struct v4l2_ctrl {
>         } cur;
>
>         union v4l2_ctrl_ptr p_def;
> +       union v4l2_ctrl_ptr p_min;
> +       union v4l2_ctrl_ptr p_max;
>         union v4l2_ctrl_ptr p_new;
>         union v4l2_ctrl_ptr p_cur;
>  };
> @@ -398,6 +412,8 @@ struct v4l2_ctrl_handler {
>   * @step:      The control's step value for non-menu controls.
>   * @def:       The control's default value.
>   * @p_def:     The control's default value for compound controls.
> + * @p_min:     The control's minimum value for compound controls.
> + * @p_max:     The control's maximum value for compound controls.
>   * @dims:      The size of each dimension.
>   * @elem_size: The size in bytes of the control.
>   * @flags:     The control's flags.
> @@ -427,6 +443,8 @@ struct v4l2_ctrl_config {
>         u64 step;
>         s64 def;
>         union v4l2_ctrl_ptr p_def;
> +       union v4l2_ctrl_ptr p_min;
> +       union v4l2_ctrl_ptr p_max;
>         u32 dims[V4L2_CTRL_MAX_DIMS];
>         u32 elem_size;
>         u32 flags;
> @@ -696,17 +714,21 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>   * @ops:       The control ops.
>   * @id:        The control ID.
>   * @p_def:     The control's default value.
> + * @p_min:     The control's default value.
> + * @p_max:     The control's default value.
>   *
>   * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> - * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
> - * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
> - * compound control should be all zeroes.
> + * to the @p_def/min/max field. Use v4l2_ctrl_ptr_create() to create
> + * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the default
> + * value of the compound control should be all zeroes.
>   *
>   */
>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>                                              const struct v4l2_ctrl_ops *ops,
>                                              u32 id,
> -                                            const union v4l2_ctrl_ptr p_def);
> +                                            const union v4l2_ctrl_ptr p_def,
> +                                            const union v4l2_ctrl_ptr p_min,
> +                                            const union v4l2_ctrl_ptr p_max);
>
>  /**
>   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index b712412cf763..d22ebb0102d4 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1793,6 +1793,8 @@ struct v4l2_ext_controls {
>  #define V4L2_CTRL_WHICH_CUR_VAL   0
>  #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
>  #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
> +#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
> +#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
>
>  enum v4l2_ctrl_type {
>         V4L2_CTRL_TYPE_INTEGER       = 1,
> --
> 2.36.1.124.g0e6072fb45-goog
>


-- 
Ricardo Ribalda
