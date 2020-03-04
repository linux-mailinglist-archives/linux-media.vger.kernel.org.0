Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC572178C9F
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 09:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgCDIiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 03:38:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:54634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728319AbgCDIiL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 03:38:11 -0500
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3B1E206D5
        for <linux-media@vger.kernel.org>; Wed,  4 Mar 2020 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583311090;
        bh=7G3eZ9kkTiAWA4IXE53f3FcKN2uDX6ocw79idSjrX7E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Scd08ni8qQ0vVwlwSt8NWsG3IzolOTUOnYu1WYK/oDCj4IdNDnUxCIHcZuh3Dxnf9
         TT4VINmdeMYVAJnIMttuTmS9yH554LjMekbx5Yl1kdz/fIwTuQy/MzcYeGUoL3SL1u
         3jI0mj5GmQqbtq4EImEPs06naMD5ZiJfpY+qztqw=
Received: by mail-lj1-f177.google.com with SMTP id 195so1045897ljf.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 00:38:09 -0800 (PST)
X-Gm-Message-State: ANhLgQ3wvCxT7f7XxarygTtkVR1TGFadyfUJbXEwQjom/8RuMO02NNDE
        ci0PxQ0h/KM/qNwdU0MDiemkLiw5vSk9Kooyjww=
X-Google-Smtp-Source: ADFU+vvH5ZTDqGU2OTelm/b521tSo2U2UfiIIQ+9OQbN1u96mvVjHlBEysAxyXWckY1AbBj50rEjIlvw5bNVWHvkoW8=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr1243006ljk.13.1583311087887;
 Wed, 04 Mar 2020 00:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20200303110200.2571176-1-hverkuil-cisco@xs4all.nl> <20200303110200.2571176-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200303110200.2571176-3-hverkuil-cisco@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 4 Mar 2020 09:37:50 +0100
X-Gmail-Original-Message-ID: <CAPybu_2fGyAQCnY7ofkxDSjiQ_rau3ftCaAS4x3_nVBqV5K3ew@mail.gmail.com>
Message-ID: <CAPybu_2fGyAQCnY7ofkxDSjiQ_rau3ftCaAS4x3_nVBqV5K3ew@mail.gmail.com>
Subject: Re: [PATCH 2/2] v4l2-ctrls: add __v4l2_ctrl_s_ctrl_compound()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Hans

I have just come back from holidays. If you give me a week I can test
it in real hardware.

Thanks!


On Tue, Mar 3, 2020 at 12:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Rather than creating new compound control helpers for each new
> type, create one generic function and just create defines on
> top.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 10 +++---
>  include/media/v4l2-ctrls.h           | 49 ++++++++++++++++------------
>  2 files changed, 34 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index d3bacf6b59d6..68684fcbdc61 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -4248,18 +4248,18 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  }
>  EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
>
> -int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> -                           const struct v4l2_area *area)
> +int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
> +                               enum v4l2_ctrl_type type, const void *p)
>  {
>         lockdep_assert_held(ctrl->handler->lock);
>
>         /* It's a driver bug if this happens. */
> -       if (WARN_ON(ctrl->type != V4L2_CTRL_TYPE_AREA))
> +       if (WARN_ON(ctrl->type != type))
>                 return -EINVAL;
> -       *ctrl->p_new.p_area = *area;
> +       memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
>         return set_ctrl(NULL, ctrl, 0);
>  }
> -EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
> +EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_compound);
>
>  void v4l2_ctrl_request_complete(struct media_request *req,
>                                 struct v4l2_ctrl_handler *main_hdl)
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 7db9e719a583..75a8daacb4c4 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -1113,45 +1113,54 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  }
>
>  /**
> - * __v4l2_ctrl_s_ctrl_area() - Unlocked variant of v4l2_ctrl_s_ctrl_area().
> + * __v4l2_ctrl_s_ctrl_compound() - Unlocked variant to set a compound control
>   *
> - * @ctrl:      The control.
> - * @area:      The new area.
> + * @ctrl: The control.
> + * @type: The type of the data.
> + * @p:    The new compound payload.
>   *
> - * This sets the control's new area safely by going through the control
> - * framework. This function assumes the control's handler is already locked,
> - * allowing it to be used from within the &v4l2_ctrl_ops functions.
> + * This sets the control's new compound payload safely by going through the
> + * control framework. This function assumes the control's handler is already
> + * locked, allowing it to be used from within the &v4l2_ctrl_ops functions.
>   *
> - * This function is for area type controls only.
> + * This function is for compound type controls only.
>   */
> -int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> -                           const struct v4l2_area *area);
> +int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
> +                               enum v4l2_ctrl_type type, const void *p);
>
>  /**
> - * v4l2_ctrl_s_ctrl_area() - Helper function to set a control's area value
> - *      from within a driver.
> + * v4l2_ctrl_s_ctrl_compound() - Helper function to set a compound control
> + *     from within a driver.
>   *
> - * @ctrl:      The control.
> - * @area:      The new area.
> + * @ctrl: The control.
> + * @type: The type of the data.
> + * @p:    The new compound payload.
>   *
> - * This sets the control's new area safely by going through the control
> - * framework. This function will lock the control's handler, so it cannot be
> - * used from within the &v4l2_ctrl_ops functions.
> + * This sets the control's new compound payload safely by going through the
> + * control framework. This function will lock the control's handler, so it
> + * cannot be used from within the &v4l2_ctrl_ops functions.
>   *
> - * This function is for area type controls only.
> + * This function is for compound type controls only.
>   */
> -static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> -                                       const struct v4l2_area *area)
> +static inline int v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
> +                                           enum v4l2_ctrl_type type,
> +                                           const void *p)
>  {
>         int rval;
>
>         v4l2_ctrl_lock(ctrl);
> -       rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
> +       rval = __v4l2_ctrl_s_ctrl_compound(ctrl, type, p);
>         v4l2_ctrl_unlock(ctrl);
>
>         return rval;
>  }
>
> +/* Helper defines for area type controls */
> +#define __v4l2_ctrl_s_ctrl_area(ctrl, area) \
> +       __v4l2_ctrl_s_ctrl_compound((ctrl), V4L2_CTRL_TYPE_AREA, (area))
> +#define v4l2_ctrl_s_ctrl_area(ctrl, area) \
> +       v4l2_ctrl_s_ctrl_compound((ctrl), V4L2_CTRL_TYPE_AREA, (area))
> +
>  /* Internal helper functions that deal with control events. */
>  extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
>
> --
> 2.25.1
>
