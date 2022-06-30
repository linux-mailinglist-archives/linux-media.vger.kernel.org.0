Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367415612AE
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 08:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbiF3Gms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 02:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiF3Gmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 02:42:42 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF652F647
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:40 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i126so4323722oih.4
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KLIYBmZaaxvO5iLJdzuZi2MEp9BnnUUIDsB5F0SK+AM=;
        b=jikUQIf+JayJSz5NuRFucsjIdoPAusPgZDStoVaQ2/SGZybu4UqdCAquD0dWnzXu45
         HFSO1dscu0QaV11WRcRV4NMx+wrI1G+yh2BEFFrN+LDX17q/RLs+Owld2HAL3zvqLbQF
         fG52ECQEaFsbPPTcOgRNakoMz7sCIc22+NoOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KLIYBmZaaxvO5iLJdzuZi2MEp9BnnUUIDsB5F0SK+AM=;
        b=QrQDqRzqMVL1DfIVMRkfbvuljqu8iws2ziCa+Wvi8l1UZwND3rjTnTsU+h+CXIaTHH
         538xOY5caDkMG1iPmesEChSn+dJRYP2qguY6bXW8SQgdknZFZJ7DkwG9VNz+Iy61offa
         vcHJfOhmqU2eEfCHBOO1Hebr4CIF9Nqotvpvp1YE9sD6oyzOrh+38Ks4tmULEo57Ytka
         34N6X7O/LK4DAVfJ73h8+Zkg45T5ux8rRp6U/LjdJrHaItaYjhYtmSerJqujBwC9eFK3
         c5m2TuK0b1z+2/ZuMc60ewfM++3WjIf9ChaazYsHszNrV2O2k3hw0ToOScCTPnkEAhbS
         n6Uw==
X-Gm-Message-State: AJIora9S/z0qBZvTIZqHXICTfWPY0b7d49/MhLJa3yScXk3PZmTXeqr8
        GNC14zS9pj4VjlVTG58EA0F79l4aEHCPFg==
X-Google-Smtp-Source: AGRyM1uhOgMtKuNwShw0wT45VmZ2t8+uIX6v3jtGsOMb3jPh29ZJ3AYMOjKNJwLhBgCDXFhl5nucLA==
X-Received: by 2002:a54:4690:0:b0:335:8919:197c with SMTP id k16-20020a544690000000b003358919197cmr4186493oic.31.1656571359647;
        Wed, 29 Jun 2022 23:42:39 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id r19-20020a0568301ad300b0060bfb08741esm10689789otc.12.2022.06.29.23.42.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 23:42:39 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 7-20020a9d0107000000b00616935dd045so13973988otu.6
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:38 -0700 (PDT)
X-Received: by 2002:a9d:178:0:b0:616:a150:dbae with SMTP id
 111-20020a9d0178000000b00616a150dbaemr3344102otu.321.1656571358122; Wed, 29
 Jun 2022 23:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-4-yunkec@google.com>
In-Reply-To: <20220628075705.2278044-4-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 30 Jun 2022 08:42:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCuG0fGK+S=1rou3bnr3b4sPC0F4GRA__mL0tyTakHctVQ@mail.gmail.com>
Message-ID: <CANiDSCuG0fGK+S=1rou3bnr3b4sPC0F4GRA__mL0tyTakHctVQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] media: uvcvideo: Add support for compound controls
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 28 Jun 2022 at 09:57, Yunke Cao <yunkec@google.com> wrote:
>
> Supports getting/setting current value.
> Supports getting default value.
> Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 279 ++++++++++++++++++++++++++-----
>  drivers/media/usb/uvc/uvcvideo.h |   4 +
>  2 files changed, 238 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 772d9d28a520..508ee04afbcd 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -815,6 +815,34 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>         }
>  }
>
> +/* Extract the byte array specified by mapping->offset and mapping->size
> + * stored at 'data' to the output array 'data_out'.
> + */
> +static int uvc_get_array(struct uvc_control_mapping *mapping, const u8 *data,
> +                        u8 *data_out)
> +{
> +       // Only supports byte-aligned data.
> +       if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +               return -EINVAL;
> +
> +       memcpy(data_out, data + mapping->offset / 8, mapping->size / 8);
> +       return 0;
> +}
> +
> +/* Copy the byte array 'data_in' to the destination specified by mapping->offset
> + * and mapping->size stored at 'data'.
> + */
> +static int uvc_set_array(struct uvc_control_mapping *mapping, const u8 *data_in,
> +                        u8 *data)
> +{
> +       // Only supports byte-aligned data.
> +       if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +               return -EINVAL;
> +
> +       memcpy(data + mapping->offset / 8, data_in, mapping->size / 8);
> +       return 0;
> +}
> +
>  /* ------------------------------------------------------------------------
>   * Terminal and unit management
>   */
> @@ -831,7 +859,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
>
>  static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>         struct uvc_control_mapping **mapping, struct uvc_control **control,
> -       int next)
> +       int next, int next_compound)
>  {
>         struct uvc_control *ctrl;
>         struct uvc_control_mapping *map;
> @@ -846,14 +874,18 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>                         continue;
>
>                 list_for_each_entry(map, &ctrl->info.mappings, list) {
> -                       if ((map->id == v4l2_id) && !next) {
> +                       if (map->id == v4l2_id && !next && !next_compound) {
>                                 *control = ctrl;
>                                 *mapping = map;
>                                 return;
>                         }
>
>                         if ((*mapping == NULL || (*mapping)->id > map->id) &&
> -                           (map->id > v4l2_id) && next) {
> +                           (map->id > v4l2_id) &&
> +                           ((map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES &&
> +                             next) ||
> +                            (map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES &&
> +                             next_compound))) {
>                                 *control = ctrl;
>                                 *mapping = map;
>                         }
> @@ -867,6 +899,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>         struct uvc_control *ctrl = NULL;
>         struct uvc_entity *entity;
>         int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +       int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
>
>         *mapping = NULL;
>
> @@ -875,12 +908,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>
>         /* Find the control. */
>         list_for_each_entry(entity, &chain->entities, chain) {
> -               __uvc_find_control(entity, v4l2_id, mapping, &ctrl, next);
> -               if (ctrl && !next)
> +               __uvc_find_control(entity, v4l2_id, mapping, &ctrl, next,
> +                                  next_compound);
> +               if (ctrl && !next && !next_compound)
>                         return ctrl;
>         }
>
> -       if (ctrl == NULL && !next)
> +       if (!ctrl && !next && !next_compound)
>                 uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not found\n",
>                         v4l2_id);
>
> @@ -943,6 +977,39 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
>         return 0;
>  }
>
> +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +                              struct uvc_control *ctrl)
> +{
> +       int ret = 0;
> +
> +       if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> +               return -EACCES;
> +
> +       if (ctrl->loaded)
> +               return 0;
> +
> +       if (ctrl->entity->get_cur) {
> +               ret = ctrl->entity->get_cur(chain->dev,
> +                       ctrl->entity,
> +                       ctrl->info.selector,
> +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                       ctrl->info.size);
> +       } else {
> +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> +                                    ctrl->entity->id, chain->dev->intfnum,
> +                                    ctrl->info.selector,
> +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                                    ctrl->info.size);
> +       }
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       ctrl->loaded = 1;
> +
> +       return ret;
> +}
> +
>  static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>                                 const u8 *data)
>  {
> @@ -963,35 +1030,19 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>         return value;
>  }
>
> -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> -       s32 *value)
> +static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
> +                             struct uvc_control *ctrl,
> +                             struct uvc_control_mapping *mapping,
> +                             s32 *value)
>  {
>         int ret;
>
> -       if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> -               return -EACCES;
> -
> -       if (!ctrl->loaded) {
> -               if (ctrl->entity->get_cur) {
> -                       ret = ctrl->entity->get_cur(chain->dev,
> -                               ctrl->entity,
> -                               ctrl->info.selector,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               ctrl->info.size);
> -               } else {
> -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -                               ctrl->entity->id,
> -                               chain->dev->intfnum,
> -                               ctrl->info.selector,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               ctrl->info.size);
> -               }
> -               if (ret < 0)
> -                       return ret;
> +       if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +               return -EINVAL;
>
> -               ctrl->loaded = 1;
> -       }
> +       ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       if (ret < 0)
> +               return ret;
>
>         *value = __uvc_ctrl_get_value(mapping,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> @@ -999,6 +1050,57 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>         return 0;
>  }
>
> +static int __uvc_ctrl_get_compound_to_user(struct uvc_control_mapping *mapping,
> +                                          struct uvc_control *ctrl,
> +                                          int id,
> +                                          struct v4l2_ext_control *xctrl)
> +{
> +       int ret, size;
> +       u8 *data;
> +
> +       if (WARN_ON(!mapping->size % 8))
> +               return -EINVAL;
> +
> +       size = mapping->size / 8;
> +       if (xctrl->size < size) {
> +               xctrl->size = size;
> +               return -ENOSPC;
> +       }
> +
> +       data = kmalloc(size, GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       ret = mapping->get_array(mapping, uvc_ctrl_data(ctrl, id), data);
> +       if (ret < 0)
> +               goto out;
> +
> +       ret = copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
> +
> +out:
> +       kfree(data);
> +       return ret;
> +}
> +
> +static int __uvc_ctrl_get_compound(struct uvc_video_chain *chain,
> +                                  struct uvc_control *ctrl,
> +                                  struct uvc_control_mapping *mapping,
> +                                  struct v4l2_ext_control *xctrl)
> +{
> +       int ret;
> +
> +       if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +               return -EINVAL;
> +
> +       ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       if (ret < 0)
> +               return ret;
> +
> +       return __uvc_ctrl_get_compound_to_user(mapping, ctrl,
> +                                              UVC_CTRL_DATA_CURRENT,
> +                                              xctrl);
> +}
> +
>  static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>                                   u32 found_id)
>  {
> @@ -1102,10 +1204,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>
>         if (mapping->master_id)
>                 __uvc_find_control(ctrl->entity, mapping->master_id,
> -                                  &master_map, &master_ctrl, 0);
> +                                  &master_map, &master_ctrl, 0, 0);
>         if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -               s32 val;
> -               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +               int ret;
> +               s32 val = 0;
> +
> +               if (master_map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +                       return -EINVAL;
> +
> +               ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
>                 if (ret < 0)
>                         return ret;
>
> @@ -1113,6 +1220,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                                 v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>         }
>
> +       if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
> +               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
> +               v4l2_ctrl->default_value = 0;
> +               v4l2_ctrl->minimum = 0;
> +               v4l2_ctrl->maximum = 0;
> +               v4l2_ctrl->step = 0;
> +               return 0;
> +       }
> +
>         if (!ctrl->cached) {
>                 int ret = uvc_ctrl_populate_cache(chain, ctrl);
>                 if (ret < 0)
> @@ -1346,11 +1462,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>         u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>         s32 val = 0;
>
> -       __uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
> +       __uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
>         if (ctrl == NULL)
>                 return;
>
> -       if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> +       if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES ||
> +           __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
>                 changes |= V4L2_EVENT_CTRL_CH_VALUE;
>
>         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> @@ -1517,7 +1634,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>                 u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>                 s32 val = 0;
>
> -               if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> +               if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES ||
> +                   __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
>                         changes |= V4L2_EVENT_CTRL_CH_VALUE;
>
>                 uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> @@ -1647,7 +1765,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
>
>         for (i = 0; i < ctrls->count; i++) {
>                 __uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> -                                  &ctrl_found, 0);
> +                                  &ctrl_found, 0, 0);
>                 if (uvc_control == ctrl_found)
>                         return i;
>         }
> @@ -1694,11 +1812,14 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>         if (ctrl == NULL)
>                 return -EINVAL;
>
> -       return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +       if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +               return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
> +       else
> +               return __uvc_ctrl_get_compound(chain, ctrl, mapping, xctrl);
>  }
>
> -int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> -                      struct v4l2_ext_control *xctrl)
> +int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
> +                            struct v4l2_ext_control *xctrl)
>  {
>         struct v4l2_queryctrl qc = { .id = xctrl->id };
>         int ret = uvc_query_v4l2_ctrl(chain, &qc);
> @@ -1710,6 +1831,56 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
>         return 0;
>  }
>
> +int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> +                      struct v4l2_ext_control *xctrl)
> +{
> +       struct uvc_control *ctrl;
> +       struct uvc_control_mapping *mapping;
> +       int ret;
> +
> +       if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> +               return -EACCES;
> +
> +       ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> +       if (!ctrl)
> +               return -EINVAL;
> +
> +       if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +               return __uvc_ctrl_get_fixed_std(chain, xctrl);
> +
> +       if (!ctrl->cached) {
> +               ret = uvc_ctrl_populate_cache(chain, ctrl);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
> +                                              xctrl);
> +}
> +
> +int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> +                           struct v4l2_ext_control *xctrl,
> +                           struct uvc_control *ctrl)
> +{
> +       int ret;
> +       u8 *data;
> +
> +       data = kmalloc(xctrl->size, GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       ret = copy_from_user(data, xctrl->ptr, xctrl->size);
> +       if (ret < 0)
> +               goto out;
> +
> +       ret = mapping->set_array(mapping, data,
> +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +
> +out:
> +       kfree(data);
> +       return ret;
> +}
> +
>  int uvc_ctrl_set(struct uvc_fh *handle,
>         struct v4l2_ext_control *xctrl)
>  {
> @@ -1820,8 +1991,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                        ctrl->info.size);
>         }
>
> -       mapping->set(mapping, value,
> -               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +       if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES) {
> +               mapping->set(mapping, value,
> +                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +       } else {
> +               ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
> +               if (ret < 0)
> +                       return ret;
> +       }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>                 ctrl->handle = handle;
> @@ -2220,10 +2397,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>                 return -ENOMEM;
>         }
>
> -       if (map->get == NULL)
> +       if (!map->get && map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
>                 map->get = uvc_get_le_value;
> -       if (map->set == NULL)
> +       if (!map->set && map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
>                 map->set = uvc_set_le_value;
> +       if (!map->get_array && map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +               map->get_array = uvc_get_array;
> +       if (!map->set_array && map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +               map->set_array = uvc_set_array;
>
>         for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
>                 if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) ==
> @@ -2233,6 +2414,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>                 }
>         }
>
> +       if (map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES &&
> +           WARN_ON(!map->get || !map->set))
> +               return -EINVAL;
> +
> +       if (map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES &&
> +           WARN_ON(!map->get_array || !map->set_array))
> +               return -EINVAL;
> +
>         list_add_tail(&map->list, &ctrl->info.mappings);
>         uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>                 uvc_map_get_name(map), ctrl->info.entity,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ba028ba7c34e..2f9b75faae83 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -262,8 +262,12 @@ struct uvc_control_mapping {
>
>         s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
>                    const u8 *data);
> +       int (*get_array)(struct uvc_control_mapping *mapping, const u8 *data,
> +                        u8 *data_out);
>         void (*set)(struct uvc_control_mapping *mapping, s32 value,
>                     u8 *data);
> +       int (*set_array)(struct uvc_control_mapping *mapping, const u8 *data_in,
> +                        u8 *data);
>  };
>
>  struct uvc_control {
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Ricardo Ribalda
