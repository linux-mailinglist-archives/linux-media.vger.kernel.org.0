Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C51B33DC96
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240012AbhCPS3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbhCPS3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:29:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D0FC06174A;
        Tue, 16 Mar 2021 11:29:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 18so63906544lff.6;
        Tue, 16 Mar 2021 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IQO0R5irRwlis6m+jQ5ERmWDPx2jCI8vnKc7Jh+sXy0=;
        b=fDiWZsBqMFoMhoOPkNL3TcXGnLc0sUt3SGqGSnAQZcQIEj8KmcTudpMwaqXeg5LVdj
         ouUWNihtiDbliRZwPO+z+tnGkvdMtgy8lcwZTRnEPUzGK6NdKvJTxBKQOByWppF3uGsf
         kIDQm81JMbEWkTqaRwiBhO9L5gd2dN78mUudaoPD/yCPtu/IAOwrHIh3VqzBCQKE/H4p
         tcU/oAaxq1hB1lNpoy+psy2F2lfcaz2AYfOlbAIGxBNxi21TQ8WzNo6b6669br5QMsGw
         9t6BTObzPo/NJM7U1EM1ubAtMoizjBSPObwnZ4od1JShRcrDtqP34/flWgXMhRcd6ohm
         1YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IQO0R5irRwlis6m+jQ5ERmWDPx2jCI8vnKc7Jh+sXy0=;
        b=ASLq66HJJRF9XqOzdtAvt+5ksqtY26K4nB5ZaUDVJmmxi7EU5gW9ZMq5QfMBliMlKS
         Qv4eBN5Za7NANCfE0HIR8nlHTqqjEeD0EgeyGOA6cJd4nxKnTA4BVDIGN0l6bi0XCVnq
         RUcs1/0OVTzT4I6AFfNkIUBlFhRN8pxtXFRjSdDG5tljiEXowb3S0INMWqbqoBj4MVV4
         Gop31/5FoSDw3gWdBMmg1tYXQByldHB9OngAhi1irt2kd1YdN//nlqL7DSedNcI5mWCw
         UHiXDYfjUR+RwZPXBT8bBEJ49VyLPlj47PGD/Qlb+9r4mRwvPmwjAOYi42R0EeNX6EBU
         fU3g==
X-Gm-Message-State: AOAM531ylgGQtDCFxhcsSgVZNfLoX3/tE6Y/PKKnDYS+ylZm+VSkYisY
        WmWwxDcq0RFFXPXo3ytxIS0kxuuVVzDkbCSItqE=
X-Google-Smtp-Source: ABdhPJxxPSnbVY2ZZYWFULeDKkRSEjyY+CZrwg8p4pBpYDh6GyTwhH73UzD4nv/f6QX+NeOdHXVCBaVoPljUgVog5lc=
X-Received: by 2002:a19:81d0:: with SMTP id c199mr75777lfd.62.1615919368754;
 Tue, 16 Mar 2021 11:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com> <20210208051749.1785246-3-sergey.senozhatsky@gmail.com>
In-Reply-To: <20210208051749.1785246-3-sergey.senozhatsky@gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Tue, 16 Mar 2021 19:29:12 +0100
Message-ID: <CAPybu_2ZRNUiZbFHfuW6i119xhs21-zTigoaO8sZc-Ye3D18xA@mail.gmail.com>
Subject: Re: [PATCHv2 2/3] media: uvcvideo: add ROI auto controls
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

Thanks for the patch

On Mon, Feb 8, 2021 at 6:24 AM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> From: Sergey Senozhatsky <senozhatsky@chromium.org>
>
> This patch adds support for Region of Interest bmAutoControls.
>
> ROI control is a compound data type:
>   Control Selector     CT_REGION_OF_INTEREST_CONTROL
>   Mandatory Requests   SET_CUR, GET_CUR, GET_MIN, GET_MAX, GET_DEF
>   wLength 10
>   Offset   Field            Size
>   0        wROI_Top         2
>   2        wROI_Left        2
>   4        wROI_Bottom      2
>   6        wROI_Right       2
>   8        bmAutoControls   2       (Bitmap)
>
> uvc_control_mapping, however, can handle only s32 data type at the
> moment: ->get() returns s32 value, ->set() accepts s32 value; while
> v4l2_ctrl maximum/minimum/default_value can hold only s64 values.
>
> Hence ROI control handling is split into two patches:
> a) bmAutoControls is handled via uvc_control_mapping as V4L2_CTRL_TYPE_MENU
> b) ROI rectangle (SET_CUR, GET_CUR, GET_DEF) handling is implemented
>    separately, by the means of selection API.

Maybe a reference to the uvc doc would be a good thing to add here.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/v4l/ext-ctrls-camera.rst            | 25 +++++++++++++++++++
>  drivers/media/usb/uvc/uvc_ctrl.c              | 19 ++++++++++++++
>  include/uapi/linux/usb/video.h                |  1 +
>  include/uapi/linux/v4l2-controls.h            |  9 +++++++
>  4 files changed, 54 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index c05a2d2c675d..1593c999c8e2 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -653,6 +653,31 @@ enum v4l2_scene_mode -
>                            |                    |
>                            +--------------------+
>
> +``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
> +    This determines which, if any, on board features should track to the
> +    Region of Interest.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
> +      - Auto Exposure.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
> +      - Auto Iris.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> +      - Auto White Balance.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
> +      - Auto Focus.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> +      - Auto Face Detect.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> +      - Auto Detect and Track.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION``
> +      - Image Stabilization.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Higher Quality.
> +
>
Nit: Same as before splitting doc and code.

>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b3dde98499f4..5502fe540519 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -355,6 +355,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
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
> +       },
>  };
>
>  static const struct uvc_menu_info power_line_frequency_controls[] = {
> @@ -753,6 +762,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
>                 .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
>         },
> +       {
> +               .id             = V4L2_CID_REGION_OF_INTEREST_AUTO,
> +               .name           = "Region of Interest (auto)",
> +               .entity         = UVC_GUID_UVC_CAMERA,
> +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           = 16,
> +               .offset         = 64,
> +               .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
Are

> +               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> +       },
>  };
>
>  /* ------------------------------------------------------------------------
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index d854cb19c42c..c87624962896 100644
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
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..6a3dac481cb4 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -976,6 +976,15 @@ enum v4l2_auto_focus_range {
>
>  #define V4L2_CID_PAN_SPEED                     (V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED                    (V4L2_CID_CAMERA_CLASS_BASE+33)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO       (V4L2_CID_CAMERA_CLASS_BASE+34)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION   (1 << 6)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY        (1 << 7)
>
>  #define V4L2_CID_CAMERA_ORIENTATION            (V4L2_CID_CAMERA_CLASS_BASE+34)
>  #define V4L2_CAMERA_ORIENTATION_FRONT          0
> --
> 2.30.0
>

I think we have to add the CID to v4l2_ctrl_get_name()

-- 
Ricardo Ribalda
