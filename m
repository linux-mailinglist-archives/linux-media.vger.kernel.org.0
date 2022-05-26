Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800F55350B7
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238004AbiEZOgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 10:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiEZOgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 10:36:12 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD29E097
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 07:36:11 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-f2cbceefb8so2366074fac.11
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6QDWN97rsrAh/wdG7fBWzjWBF/r950dRnAZsYGf1Vmw=;
        b=nK3uMf9mzhDGYYkXmGpc8WQVXhqUJfMA4q9dH672Nw5SPuxeYAPhNPgZ2xdHRX3xj3
         z8uLaKs5hHwEocqVs5GpfCPFfnHwBhjyWnYGKhj08gNGModcriIwWvbOOclkOIu0awb4
         5F5F8zOi65oFbpHjp3cxh7Zky33LZAc2Rs2G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6QDWN97rsrAh/wdG7fBWzjWBF/r950dRnAZsYGf1Vmw=;
        b=x6bwkrh7SKQWLVpk90mcrKPgcTsGjf3DZmp/uAZn7uoQnjyPg4KfTzDnpy7Bg051ym
         JtrufJ4VlpsZtnAzu/emgwq9lQcVdE/XF9WXDJuj0bLOjH1e8NLgqaQ7MYzbDE0NlbLl
         nEpANaYPacOkmGLJ4hrD/bSTQca0isPTJ2w7864i7pEuIF2fA3BWzHq2j9btcjwKZOs5
         5UC5ohPY/R3A3MXW/SEpyRAr2e73+TUn7FuCC2PyuaujP/Rhsi/SS2E9CinCGii+GCjE
         4v6KZvKBkclJVfyXQKHNOwUGufJFnAIyXB0ailc6uMaPrXeWG8tVvVtCC23H9cEEUqt0
         hlvQ==
X-Gm-Message-State: AOAM5339FP4bFCEBUW1KFscrkv5UDH8pDlfvv2fuold/an0AtgncJSlG
        nlYOKK3ha7XiH47vDHpHKMufy6xhaj/DbQ==
X-Google-Smtp-Source: ABdhPJzqXWQVQtPtTzxoRQo+gUH/FRVRmkD2g3Jgcb0svYP4IxyV8IsFmbKSVZ7k7OgQGRdrhNuVdg==
X-Received: by 2002:a05:6870:3042:b0:f2:cd17:ffd2 with SMTP id u2-20020a056870304200b000f2cd17ffd2mr1412586oau.221.1653575769892;
        Thu, 26 May 2022 07:36:09 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id o15-20020a9d764f000000b0060603221268sm644876otl.56.2022.05.26.07.36.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 07:36:09 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-edeb6c3642so2413511fac.3
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 07:36:08 -0700 (PDT)
X-Received: by 2002:a05:6870:5702:b0:f2:d904:fd95 with SMTP id
 k2-20020a056870570200b000f2d904fd95mr1421797oap.66.1653575768310; Thu, 26 May
 2022 07:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220526050744.2431518-1-yunkec@google.com> <20220526050744.2431518-4-yunkec@google.com>
In-Reply-To: <20220526050744.2431518-4-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 26 May 2022 16:35:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCsf72KK2dNKR4X+Jh4--7L695DvuRjg69PHghGVSC=iTQ@mail.gmail.com>
Message-ID: <CANiDSCsf72KK2dNKR4X+Jh4--7L695DvuRjg69PHghGVSC=iTQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: uvcvideo: implement UVC v1.5 ROI
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

Hi Yunke,

thanks for your patch

On Thu, 26 May 2022 at 07:08, Yunke Cao <yunkec@google.com> wrote:
>
> Implement support for ROI as described in UVC 1.5:
> 4.2.2.1.20 Digital Region of Interest (ROI) Control
>
> ROI control is implemented using V4L2 control API as
> two uvc-specific controls:
> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> References a rejected attempt that uses v4l2 selection API:
> https://lore.kernel.org/lkml/20210501082001.100533-2-senozhatsky@chromium.org
> Changelog since v4:
> -Check boundary condition: width or height == 0.
> -Populate xctrl->id and xctrl->size.
> -Split code for V4L2_CTRL_WHICH_MIN/MAX_VAL to patch 4/5.
>
>  drivers/media/usb/uvc/uvc_ctrl.c   | 207 ++++++++++++++++++++++++++---
>  drivers/media/usb/uvc/uvc_v4l2.c   |   8 +-
>  drivers/media/usb/uvc/uvcvideo.h   |  10 +-
>  include/uapi/linux/usb/video.h     |   1 +
>  include/uapi/linux/uvcvideo.h      |  13 ++
>  include/uapi/linux/v4l2-controls.h |   8 ++
>  6 files changed, 223 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b4f6edf968bc..c470861e408a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -355,6 +355,16 @@ static const struct uvc_control_info uvc_ctrls[] = {
>                 .flags          = UVC_CTRL_FLAG_GET_CUR
>                                 | UVC_CTRL_FLAG_AUTO_UPDATE,
>         },
> +       {
> +               .entity         = UVC_GUID_UVC_CAMERA,
> +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .index          = 21,
> +               .size           = 10,
> +               .flags          = UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
> +                               | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
> +                               | UVC_CTRL_FLAG_GET_DEF
> +                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> +       },
>  };
>
>  static const u32 uvc_control_classes[] = {
> @@ -728,6 +738,24 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
>                 .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
>         },
> +       {
> +               .id             = V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> +               .entity         = UVC_GUID_UVC_CAMERA,
> +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           = 64,
> +               .offset         = 0,
> +               .v4l2_type      = V4L2_CTRL_TYPE_RECT,
> +               .data_type      = UVC_CTRL_DATA_TYPE_RECT,
> +       },
> +       {
> +               .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +               .entity         = UVC_GUID_UVC_CAMERA,
> +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           = 16,
> +               .offset         = 64,
> +               .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> +               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> +       },
>  };
>
>  /* ------------------------------------------------------------------------
> @@ -749,6 +777,34 @@ static inline void uvc_clear_bit(u8 *data, int bit)
>         data[bit >> 3] &= ~(1 << (bit & 7));
>  }
>
> +static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> +       const struct uvc_rect *uvc_rect)
> +{
> +       v4l2_rect->top = uvc_rect->top;
> +       v4l2_rect->left = uvc_rect->left;
> +       v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
> +       v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
> +}
> +
> +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> +       const struct v4l2_rect *v4l2_rect)
> +{
> +       // Safely converts s32 and u32 to u16.
> +       if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> +           v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> +           v4l2_rect->height > U16_MAX || v4l2_rect->height == 0 ||
> +           v4l2_rect->width > U16_MAX || v4l2_rect->width == 0 ||
> +           v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> +           v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> +               return -ERANGE;
> +
> +       uvc_rect->top = v4l2_rect->top;
> +       uvc_rect->left = v4l2_rect->left;
> +       uvc_rect->bottom = v4l2_rect->height + v4l2_rect->top - 1;
> +       uvc_rect->right = v4l2_rect->width + v4l2_rect->left - 1;
> +       return 0;
> +}
> +
>  /* Extract the bit string specified by mapping->offset and mapping->size
>   * from the little-endian data stored at 'data' and return the result as
>   * a signed 32bit integer. Sign extension will be performed if the mapping
> @@ -963,11 +1019,23 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>         return value;
>  }
>
> +static void __uvc_ctrl_get_v4l2_rect(struct uvc_control *ctrl,
> +                                    struct uvc_control_mapping *mapping,
> +                                    u32 id,
> +                                    struct v4l2_rect *rect)
> +{
> +       struct uvc_rect *uvc_rect =
> +               (struct uvc_rect *)(uvc_ctrl_data(ctrl, id)
> +                                       + mapping->offset / 8);
> +       uvc_to_v4l2_rect(rect, uvc_rect);
> +}
> +
>  static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>         struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> -       s32 *value)
> +       struct v4l2_ext_control *xctrl)
>  {

We need to be a bit careful here. Now we need that xctrl->p_rect
points to a correct location and that is not true in other parts of
the code.

Maybe you want to want to make

__uvc_ctrl_get-> return -EINVAL for for V4L2_CTRL_TYPE_RECT

and a new

__uvc_ctrl_get_p_rect_to_user (and tha way me make explicit the namespace)

>         int ret;
> +       struct v4l2_rect v4l2_rect = {};
>
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
> @@ -993,8 +1061,19 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>                 ctrl->loaded = 1;
>         }
>
> -       *value = __uvc_ctrl_get_value(mapping,
> +       xctrl->id = mapping->id;
> +       switch (mapping->v4l2_type) {
> +       case V4L2_CTRL_TYPE_RECT:
> +               __uvc_ctrl_get_v4l2_rect(ctrl, mapping, UVC_CTRL_DATA_CURRENT,
> +                                        &v4l2_rect);
> +               xctrl->size = sizeof(v4l2_rect);
> +               return copy_to_user(xctrl->p_rect, &v4l2_rect,
> +                               sizeof(v4l2_rect));
> +
> +       default:
> +               xctrl->value = __uvc_ctrl_get_value(mapping,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +       }
>
>         return 0;
>  }
> @@ -1104,13 +1183,14 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                 __uvc_find_control(ctrl->entity, mapping->master_id,
>                                    &master_map, &master_ctrl, 0);
>         if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -               s32 val;
> -               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +               struct v4l2_ext_control xctrl;
> +               int ret =
> +                       __uvc_ctrl_get(chain, master_ctrl, master_map, &xctrl);
>                 if (ret < 0)
>                         return ret;
>
> -               if (val != mapping->master_manual)
> -                               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +               if (xctrl.value != mapping->master_manual)
> +                       v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>         }
>
>         if (!ctrl->cached) {
> @@ -1344,16 +1424,16 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>         struct uvc_control_mapping *mapping = NULL;
>         struct uvc_control *ctrl = NULL;
>         u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
> -       s32 val = 0;
> +       struct v4l2_ext_control xctrl;
>
>         __uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
>         if (ctrl == NULL)
>                 return;
>
> -       if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> +       if (__uvc_ctrl_get(chain, ctrl, mapping, &xctrl) == 0)
>                 changes |= V4L2_EVENT_CTRL_CH_VALUE;
>
> -       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> +       uvc_ctrl_send_event(chain, handle, ctrl, mapping, xctrl.value, changes);
>  }
>
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> @@ -1515,13 +1595,13 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>         if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
>                 struct v4l2_event ev;
>                 u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
> -               s32 val = 0;
> +               struct v4l2_ext_control xctrl;
>
> -               if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> +               if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &xctrl) == 0)
>                         changes |= V4L2_EVENT_CTRL_CH_VALUE;
>
> -               uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> -                                   changes);
> +               uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping,
> +                               xctrl.value, changes);
>                 /* Mark the queue as active, allowing this initial
>                    event to be accepted. */
>                 sev->elems = elems;
> @@ -1682,10 +1762,14 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  }
>

Please move this change to the other patch
>  int uvc_ctrl_get(struct uvc_video_chain *chain,
> -       struct v4l2_ext_control *xctrl)
> +       struct v4l2_ext_control *xctrl, u32 v4l2_which)
>  {
>         struct uvc_control *ctrl;
>         struct uvc_control_mapping *mapping;
> +       int ret;
> +       u32 flag;
> +       u32 id;
> +       u8 query;
>
>         if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
>                 return -EACCES;
> @@ -1694,7 +1778,36 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>         if (ctrl == NULL)
>                 return -EINVAL;
>
> -       return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +       switch (v4l2_which) {
> +       case V4L2_CTRL_WHICH_DEF_VAL:
> +               flag = UVC_CTRL_FLAG_GET_DEF;
> +               id = UVC_CTRL_DATA_DEF;
> +               query = UVC_GET_DEF;
> +               break;
> +       case V4L2_CTRL_WHICH_CUR_VAL:
> +       default:
> +               return __uvc_ctrl_get(chain, ctrl, mapping, xctrl);
> +       }
> +
> +       if (!ctrl->cached) {
> +               ret = uvc_ctrl_populate_cache(chain, ctrl);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       if (!(ctrl->info.flags & flag))
> +               return -EACCES;
> +
> +       if (mapping->v4l2_type == V4L2_CTRL_TYPE_RECT) {
> +               struct v4l2_rect rect;
> +
> +               __uvc_ctrl_get_v4l2_rect(ctrl, mapping, id, &rect);
> +               return copy_to_user(xctrl->p_rect, &rect, sizeof(rect));
> +       }
> +
> +       xctrl->value = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id));
> +
> +       return 0;
>  }
>
>  int uvc_ctrl_set(struct uvc_fh *handle,
> @@ -1703,6 +1816,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>         struct uvc_video_chain *chain = handle->chain;
>         struct uvc_control *ctrl;
>         struct uvc_control_mapping *mapping;
> +       struct v4l2_rect v4l2_rect;
> +       struct uvc_rect uvc_rect;
>         s32 value;
>         u32 step;
>         s32 min;
> @@ -1774,6 +1889,16 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>
>                 break;
>
> +       case V4L2_CTRL_TYPE_RECT:
> +               ret = copy_from_user(&v4l2_rect, xctrl->p_rect,
> +                               sizeof(v4l2_rect));
> +               if (ret < 0)
> +                       return ret;
> +               ret = v4l2_to_uvc_rect(&uvc_rect, &v4l2_rect);
> +               if (ret < 0)
> +                       return ret;
> +               break;
> +
>         default:
>                 value = xctrl->value;
>                 break;
> @@ -1807,8 +1932,16 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                        ctrl->info.size);
>         }
>
> -       mapping->set(mapping, value,
> -               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +       switch (mapping->data_type) {
> +       case UVC_CTRL_DATA_TYPE_RECT:
> +               memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT)
> +                       + mapping->offset / 8,
> +                       &uvc_rect, sizeof(uvc_rect));
> +               break;
> +       default:
> +               mapping->set(mapping, value,
> +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +       }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>                 ctrl->handle = handle;
> @@ -2366,6 +2499,40 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>         }
>  }
>
> +static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control *ctrl)
> +{
> +       int ret;
> +
> +       ret = uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->intfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL,
> +                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +                            ctrl->info.size);
> +       if (ret)
> +               goto out;
> +
> +       /*
> +        * Most firmwares have wrong GET_CURRENT configuration. E.g. it's
> +        * below GET_MIN, or have rectangle coordinates mixed up. This
> +        * causes problems sometimes, because we are unable to set
> +        * auto-controls value without first setting ROI rectangle to
> +        * valid configuration.
> +        *
> +        * We expect that default configuration is always correct and
> +        * is within the GET_MIN / GET_MAX boundaries.
> +        *
> +        * Set current ROI configuration to GET_DEF, so that we will
> +        * always have properly configured ROI.
> +        */
> +       ret = uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL,
> +                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +                            ctrl->info.size);
> +out:
> +       if (ret)
> +               dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", ret);
> +       return ret;
> +}
> +
>  /*
>   * Add control information and hardcoded stock control mappings to the given
>   * device.
> @@ -2378,6 +2545,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>         const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
>         const struct uvc_control_mapping *mend =
>                 mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +       const u8 camera_entity[16] = UVC_GUID_UVC_CAMERA;
>
>         /* XU controls initialization requires querying the device for control
>          * information. As some buggy UVC devices will crash when queried
> @@ -2398,6 +2566,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>                          * GET_INFO on standard controls.
>                          */
>                         uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
> +
> +                       if (ctrl->info.selector ==
> +                               UVC_CT_REGION_OF_INTEREST_CONTROL &&
> +                           uvc_entity_match_guid(ctrl->entity, camera_entity))
> +                               uvc_ctrl_init_roi(chain->dev, ctrl);
>                         break;
>                  }
>         }
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..040511da1005 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1040,15 +1040,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>
>         if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
>                 for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -                       struct v4l2_queryctrl qc = { .id = ctrl->id };
> -
> -                       ret = uvc_query_v4l2_ctrl(chain, &qc);
> +                       ret = uvc_ctrl_get(chain, ctrl, ctrls->which);
>                         if (ret < 0) {
>                                 ctrls->error_idx = i;
>                                 return ret;
>                         }
> -
> -                       ctrl->value = qc.default_value;
>                 }
>
>                 return 0;
> @@ -1059,7 +1055,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>                 return ret;
>
>         for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -               ret = uvc_ctrl_get(chain, ctrl);
> +               ret = uvc_ctrl_get(chain, ctrl, ctrls->which);
>                 if (ret < 0) {
>                         uvc_ctrl_rollback(handle);
>                         ctrls->error_idx = i;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 143230b3275b..f414ad7d57b2 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -424,6 +424,13 @@ struct uvc_streaming_header {
>         u8 bTriggerUsage;
>  };
>
> +struct uvc_rect {
> +       u16 top;
> +       u16 left;
> +       u16 bottom;
> +       u16 right;
> +} __packed;
> +
>  enum uvc_buffer_state {
>         UVC_BUF_STATE_IDLE      = 0,
>         UVC_BUF_STATE_QUEUED    = 1,
> @@ -897,7 +904,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>         return __uvc_ctrl_commit(handle, 1, NULL);
>  }
>
> -int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl,
> +                u32 v4l2_which);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>                            bool read);
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index bfdae12cdacf..9076a444758a 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -104,6 +104,7 @@
>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                   0x0f
>  #define UVC_CT_ROLL_RELATIVE_CONTROL                   0x10
>  #define UVC_CT_PRIVACY_CONTROL                         0x11
> +#define UVC_CT_REGION_OF_INTEREST_CONTROL              0x14
>
>  /* A.9.5. Processing Unit Control Selectors */
>  #define UVC_PU_CONTROL_UNDEFINED                       0x00
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> index 8288137387c0..b16e5d373f3f 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -16,6 +16,7 @@
>  #define UVC_CTRL_DATA_TYPE_BOOLEAN     3
>  #define UVC_CTRL_DATA_TYPE_ENUM                4
>  #define UVC_CTRL_DATA_TYPE_BITMASK     5
> +#define UVC_CTRL_DATA_TYPE_RECT                6
>
>  /* Control flags */
>  #define UVC_CTRL_FLAG_SET_CUR          (1 << 0)
> @@ -36,6 +37,18 @@
>          UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
>          UVC_CTRL_FLAG_GET_DEF)
>
> +/* V4L2 private controls */
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT   (V4L2_CID_CAMERA_UVC_BASE+1)
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO   (V4L2_CID_CAMERA_UVC_BASE+2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION   (1 << 6)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY                (1 << 7)
> +
>  struct uvc_menu_info {
>         __u32 value;
>         __u8 name[32];
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index bb40129446d4..48d12782e7e4 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1008,6 +1008,14 @@ enum v4l2_auto_focus_range {
>
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION                (V4L2_CID_CAMERA_CLASS_BASE+35)
>
> +/* CAMERA-class private control IDs */
> +
> +/*
> + * The base for the uvc driver controls. See linux/uvcvideo.h for the list
> + * of controls. We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_CAMERA_UVC_BASE               (V4L2_CID_CAMERA_CLASS_BASE + 0x1000)
> +
>  /* FM Modulator class control IDs */
>
>  #define V4L2_CID_FM_TX_CLASS_BASE              (V4L2_CTRL_CLASS_FM_TX | 0x900)
> --
> 2.36.1.124.g0e6072fb45-goog
>


-- 
Ricardo Ribalda
