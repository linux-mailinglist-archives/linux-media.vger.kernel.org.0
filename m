Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95D8530CCF
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 12:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbiEWJdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 05:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233199AbiEWJdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 05:33:15 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6062649915
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 02:33:01 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2ff90e0937aso66407997b3.4
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 02:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=StnlvMI97RXLZxeZaIKv68XYHgE+JxVOhBboCprQ3Nc=;
        b=gNxczDDhr3jeppVt8ITXq1lokcBDnK/GD46Ado9Ku5j+41Ort3n8DiDp9TaSixyrwm
         bqezo1421sZWgBT8GI+yuGO3p1GubEfeOm1vJapoedZzEv5/WqKoa02vW916jMakIbHQ
         ESI9PcouEib7zj6W6G3QKlMk4dsFpRnH9knJxApUXZOTQbOlA9op8tTpoOH8pKib36R3
         kcsCo+jvfwLS5k49hvjSZGzg4vA2u7OuMmVjV4b1LVYrGb1WYumANbyXaWEvYN8Bod0s
         /3RMGvK3TcvodV280botFGhw783pyESZXY+sBtlDTLEFSkPLpFu+ikI6LK4aY6QRvprs
         onhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=StnlvMI97RXLZxeZaIKv68XYHgE+JxVOhBboCprQ3Nc=;
        b=gEVoskSP+q5oudNHoNHhvFjz36++KRVYaLdiDciBBnjyVD0Un91pnGWFsqLZAAbxHw
         LG2em5ifhrtW3i9zWunCTnnVGhLMYUk0Zev9khKhgA5tc+xsRZerl7suo/4AnRS1cf9b
         URFRe3PhRqiWjkwwQPcjZopovKS3sQbGoJmz8B73/5rBzMftlgp6BlFTidlew3myW5k8
         HhyjVKqN3kx1cFGbqSsuAP/fxI5Y5yajHf3fHpKuoJY024e9Kvq6w0q8LvGQuj/AkQXt
         7BLsFqnzJgSLqX3zKZLzNt4sAbbTB9AwQlKZ40L2Tgi03UEhbHe/dQtqPFppc5rVuEeH
         Hvhg==
X-Gm-Message-State: AOAM530ElTRngS49FsCERUt8A/x4S1ykKgS0tGLaH6zRfe2AIAaq+HUP
        eeI5O351OGi4tgR8rQxlF+StWK4cIlMO01BdTrw3wn4XAwSikQ==
X-Google-Smtp-Source: ABdhPJyQ6c2Vq/eIATHfZdVMnBjzLXM5OduO+05hhm7/iMp4d/u1Q3x/qYLDu+xv2lZ4UL31DpHl+KYnK4GURGC2DUQ=
X-Received: by 2002:a05:690c:94:b0:2f1:98b3:fe7c with SMTP id
 be20-20020a05690c009400b002f198b3fe7cmr23018911ywb.284.1653298379994; Mon, 23
 May 2022 02:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220518062412.2375586-1-yunkec@google.com> <20220518062412.2375586-2-yunkec@google.com>
 <9d9b32bd-16bc-76cd-6cd7-6d693714e5c9@xs4all.nl> <YoYeelewIe0tnrxh@pendragon.ideasonboard.com>
 <a0fe2b49-12b7-8eaf-c3ef-7af1a247e595@xs4all.nl>
In-Reply-To: <a0fe2b49-12b7-8eaf-c3ef-7af1a247e595@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Mon, 23 May 2022 18:32:49 +0900
Message-ID: <CANqU6Fe4FwkReokArx-6FiwYQ6TGte1C05o8pM5e8xaUoO4Fhg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] media: v4l2_ctrl: Add region of interest rectangle control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the feedback!
Making this uvc-specific sounds good to me. I'm working on v4 :).

On Thu, May 19, 2022 at 7:55 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 5/19/22 12:39, Laurent Pinchart wrote:
> > On Thu, May 19, 2022 at 10:14:05AM +0200, Hans Verkuil wrote:
> >> On 5/18/22 08:24, Yunke Cao wrote:
> >>> Including:
> >>> 1. Add a control ID.
> >>> 2. Add p_rect to struct v4l2_ext_control with basic support in
> >>>    v4l2-ctrls.
> >>>
> >>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>> ---
> >>> Changelog since v2:
> >>> - Better documentation.
> >>>
> >>>  .../media/v4l/ext-ctrls-camera.rst            | 10 ++++++++++
> >>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
> >>>  .../media/videodev2.h.rst.exceptions          |  1 +
> >>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
> >>>  include/media/v4l2-ctrls.h                    |  2 ++
> >>>  include/uapi/linux/v4l2-controls.h            |  2 ++
> >>>  include/uapi/linux/videodev2.h                |  2 ++
> >>>  8 files changed, 45 insertions(+)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >>> index 4c5061aa9cd4..c988a72b97b2 100644
> >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >>> @@ -661,3 +661,13 @@ enum v4l2_scene_mode -
> >>>  .. [#f1]
> >>>     This control may be changed to a menu control in the future, if more
> >>>     options are required.
> >>> +
> >>> +``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> >>> +   This control determines the region of interest. Region of interest is an
> >>> +   rectangular area represented by a struct v4l2_rect. The rectangle is in
> >>> +   pixel units and global coordinates. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
> >>> +   ``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of coordinates.
> >>
> >> Hmm, what does MIN and MAX mean in terms of a rectangle? It makes sense for
> >> the width and height, but how is that interpreted for top and left?
> >>
> >> Are these the minimum and maximum values each field of the struct can have?
> >> So if the image is, say, 640x480, then the minimum value for a rectangle might
> >> be 1x1@0x0, and the maximum 640x480@639x479. So in that case these are not real
> >> rectangles, but they give the range for each field of the struct.
> >>
> >> An alternative would be to see this as the min and max rectangle size and keep
> >> the top/left values at 0.
> >>
> >> To be honest, I'm not sure which one I would prefer.
It looks like the UVC GET_MAX returns a valid rectangle (640x480@0x0).
UVC 1.5 defines CT_DIGITAL_WINDOW_CONTROL controls (we haven't
implemented it yet).
"The ROI must be within the current Digital Window as specified by the
CT_WINDOW control.
GET_MAX shall return the current Window as specified by
CT_DIGITAL_WINDOW_CONTROL."
The devices I tested with followed this: returning 1x1@0x0 and 640x480@0x0.

The current implementation simply takes the rectangle returned by
UVC_GET_MAX/MIN
and converts it to a v4l2_rect. As we are making them uvc-specific, I
guess keeping the current
behavior is fine?

Best,
Yunke




> >
> > I'm also really worried fo the interactions between this control and
> > selection rectangles. The uvcvideo driver won't need to care, but this
> > is a generic control, so we need to define it clearly.
> >
> > To be honest, given how specific to UVC this is, I'd create
> > device-specific controls. I don't foresee any other driver being able to
> > make use of V4L2_CID_REGION_OF_INTEREST_RECT and
> > V4L2_CID_REGION_OF_INTEREST_AUTO.
>
> Yeah, I'm leaning in the same direction. It might be wise to reduce the
> scope of these controls to just the UVC driver.
>
> Regards,
>
>         Hans
>
> >
> >>> +
> >>> +   Setting a region of interest allows the camera to optimize the capture for
> >>> +   the region. The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control
> >>> +   determines the detailed behavior.
> >>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> index 29971a45a2d4..f4e205ead0a2 100644
> >>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> @@ -189,6 +189,10 @@ still cause this situation.
> >>>        - ``p_area``
> >>>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> >>>          of type ``V4L2_CTRL_TYPE_AREA``.
> >>> +    * - struct :c:type:`v4l2_rect` *
> >>> +      - ``p_area``
> >>> +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
> >>> +        of type ``V4L2_CTRL_TYPE_RECT``.
> >>>      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> >>>        - ``p_h264_sps``
> >>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
> >>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> index 9cbb7a0c354a..7b423475281d 100644
> >>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> >>> +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> index 8968cec8454e..dcde405c2713 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
> >>>             return ptr1.p_u16[idx] == ptr2.p_u16[idx];
> >>>     case V4L2_CTRL_TYPE_U32:
> >>>             return ptr1.p_u32[idx] == ptr2.p_u32[idx];
> >>> +   case V4L2_CTRL_TYPE_RECT:
> >>> +           return ptr1.p_rect->top == ptr2.p_rect->top &&
> >>> +                  ptr1.p_rect->left == ptr2.p_rect->left &&
> >>> +                  ptr1.p_rect->height == ptr2.p_rect->height &&
> >>> +                  ptr1.p_rect->width == ptr2.p_rect->width;
> >>>     default:
> >>>             if (ctrl->is_int)
> >>>                     return ptr1.p_s32[idx] == ptr2.p_s32[idx];
> >>> @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
> >>>     case V4L2_CTRL_TYPE_VP9_FRAME:
> >>>             pr_cont("VP9_FRAME");
> >>>             break;
> >>> +   case V4L2_CTRL_TYPE_RECT:
> >>> +           pr_cont("l: %d, t: %d, w: %u, h: %u",
> >>> +                   ptr.p_rect->left, ptr.p_rect->top,
> >>> +                   ptr.p_rect->width, ptr.p_rect->height);
> >>> +           break;
> >>>     default:
> >>>             pr_cont("unknown type %d", ctrl->type);
> >>>             break;
> >>> @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >>>     struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >>>     struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> >>>     struct v4l2_area *area;
> >>> +   struct v4l2_rect *rect;
> >>>     void *p = ptr.p + idx * ctrl->elem_size;
> >>>     unsigned int i;
> >>>
> >>> @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >>>                     return -EINVAL;
> >>>             break;
> >>>
> >>> +   case V4L2_CTRL_TYPE_RECT:
> >>> +           rect = p;
> >>> +           if (!rect->width || !rect->height)
> >>> +                   return -EINVAL;
> >>> +           break;
> >>> +
> >>>     default:
> >>>             return -EINVAL;
> >>>     }
> >>> @@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>>     case V4L2_CTRL_TYPE_AREA:
> >>>             elem_size = sizeof(struct v4l2_area);
> >>>             break;
> >>> +   case V4L2_CTRL_TYPE_RECT:
> >>> +           elem_size = sizeof(struct v4l2_rect);
> >>> +           break;
> >>>     default:
> >>>             if (type < V4L2_CTRL_COMPOUND_TYPES)
> >>>                     elem_size = sizeof(s32);
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> index 54ca4e6b820b..95f39a2d2ad2 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>     case V4L2_CID_UNIT_CELL_SIZE:           return "Unit Cell Size";
> >>>     case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientation";
> >>>     case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor Rotation";
> >>> +   case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rectangle";
> >>>
> >>>     /* FM Radio Modulator controls */
> >>>     /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> >>> @@ -1524,6 +1525,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >>>     case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >>>             *type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >>>             break;
> >>> +   case V4L2_CID_REGION_OF_INTEREST_RECT:
> >>> +           *type = V4L2_CTRL_TYPE_RECT;
> >>> +           break;
> >>>     default:
> >>>             *type = V4L2_CTRL_TYPE_INTEGER;
> >>>             break;
> >>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> >>> index b3ce438f1329..919e104de50b 100644
> >>> --- a/include/media/v4l2-ctrls.h
> >>> +++ b/include/media/v4l2-ctrls.h
> >>> @@ -58,6 +58,7 @@ struct video_device;
> >>>   * @p_hdr10_cll:           Pointer to an HDR10 Content Light Level structure.
> >>>   * @p_hdr10_mastering:             Pointer to an HDR10 Mastering Display structure.
> >>>   * @p_area:                        Pointer to an area.
> >>> + * @p_rect:                        Pointer to a rectangle.
> >>>   * @p:                             Pointer to a compound value.
> >>>   * @p_const:                       Pointer to a constant compound value.
> >>>   */
> >>> @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
> >>>     struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> >>>     struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >>>     struct v4l2_area *p_area;
> >>> +   struct v4l2_rect *p_rect;
> >>>     void *p;
> >>>     const void *p_const;
> >>>  };
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> >>> index bb40129446d4..499fcddb6254 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
> >>>
> >>>  #define V4L2_CID_CAMERA_SENSOR_ROTATION            (V4L2_CID_CAMERA_CLASS_BASE+35)
> >>>
> >>> +#define V4L2_CID_REGION_OF_INTEREST_RECT   (V4L2_CID_CAMERA_CLASS_BASE+36)
> >>> +
> >>>  /* FM Modulator class control IDs */
> >>>
> >>>  #define V4L2_CID_FM_TX_CLASS_BASE          (V4L2_CTRL_CLASS_FM_TX | 0x900)
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >>> index 3768a0a80830..b712412cf763 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
> >>>             __u16 __user *p_u16;
> >>>             __u32 __user *p_u32;
> >>>             struct v4l2_area __user *p_area;
> >>> +           struct v4l2_rect __user *p_rect;
> >>>             struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> >>>             struct v4l2_ctrl_h264_pps *p_h264_pps;
> >>>             struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> >>> @@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
> >>>     V4L2_CTRL_TYPE_U16           = 0x0101,
> >>>     V4L2_CTRL_TYPE_U32           = 0x0102,
> >>>     V4L2_CTRL_TYPE_AREA          = 0x0106,
> >>> +   V4L2_CTRL_TYPE_RECT          = 0x0107,
> >>>
> >>>     V4L2_CTRL_TYPE_HDR10_CLL_INFO           = 0x0110,
> >>>     V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  = 0x0111,
> >
>
