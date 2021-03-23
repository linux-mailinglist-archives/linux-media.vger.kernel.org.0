Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABA3346460
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 17:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbhCWQFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 12:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbhCWQF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 12:05:28 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA38C061763
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:05:28 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id t6so18631683ilp.11
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6VOuxdr8+wbIMXO16OHPMoQ9DHNhjuVRpBItfVqOck=;
        b=Y6VEZ8TqdQQSZUqF4HaKfYmHVgqGNwe9DQKsVq6JXNLfA2b4WHXHZ3Bm3DESgRM/oj
         mg+l+KgKtuZEctX17wkd5awRTQkruAG+wVeNi7E9Ykv5b1HFp++DMvSNUqOuVwR8Hves
         HxBI1DlkktITIjEwmuq84xMAAedQHTeuxVBEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6VOuxdr8+wbIMXO16OHPMoQ9DHNhjuVRpBItfVqOck=;
        b=R3dnqqbD5q/Ybe7XNHrUOyHL+qciMAnJwzpXxiaZd6+792r5QwxbBz3bEFF4lOakmN
         myktrz6seStdxNQhUoHMvvz24u7+GBy9fErKthKz/MLCRJEWrF32LCEr1GnbZM4ghooJ
         iS9igm8SBSWDJUV5wRLZz13rKhUZ9ec38JJNwcsUrQd0sqOOD3SdonfryRIZbhJvI9ux
         yTUyYyCfqwBEWfxgMiYofBJpt2aBHZ/Hm82DXUwSQJUATtftXgVOn7v7gJNXYS3Y4G2i
         To6nBpWjfEvJBU+9mW0/eBkLrZNe3UFErr26686XTm9gwAPR7R1EDmelYoPnLdb4R9yD
         e+xg==
X-Gm-Message-State: AOAM530aoiuxEOnwHwGRf/uFh1QA1IfltpghHp1/ypZFR0grUoS9cS9p
        fEKL8NLzYjpfe54ITWHgtZ0LgMODoCGYjQ==
X-Google-Smtp-Source: ABdhPJykFOuezPPgVQMtQWx1gybhk47GzjK74f3ekp69aHCNdBBsV4b/LMi0zbQj22qxLUvx9qWzKg==
X-Received: by 2002:a05:6e02:52c:: with SMTP id h12mr5468697ils.150.1616515527405;
        Tue, 23 Mar 2021 09:05:27 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id v7sm9743485ilu.72.2021.03.23.09.05.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 09:05:27 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id r8so18598229ilo.8
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:05:26 -0700 (PDT)
X-Received: by 2002:a05:6e02:dc5:: with SMTP id l5mr5360532ilj.218.1616515526531;
 Tue, 23 Mar 2021 09:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210319055342.127308-1-senozhatsky@chromium.org> <20210319055342.127308-3-senozhatsky@chromium.org>
In-Reply-To: <20210319055342.127308-3-senozhatsky@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 23 Mar 2021 17:05:15 +0100
X-Gmail-Original-Message-ID: <CANiDSCua-9=SoVxNOo3rmXR7ihj=Rro-=wqAmJpAU4JwyTvQXg@mail.gmail.com>
Message-ID: <CANiDSCua-9=SoVxNOo3rmXR7ihj=Rro-=wqAmJpAU4JwyTvQXg@mail.gmail.com>
Subject: Re: [PATCHv3 2/6] media: v4l UAPI: document ROI selection targets
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

On Fri, Mar 19, 2021 at 6:53 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Document V4L2 selection targets that will be used to ROI
> implementation.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/v4l/selection-api-configuration.rst | 22 +++++++++++++++
>  .../media/v4l/selection-api-examples.rst      | 28 +++++++++++++++++++
>  .../media/v4l/v4l2-selection-targets.rst      | 24 ++++++++++++++++
>  3 files changed, 74 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
> index fee49bf1a1c0..b5fdd765e2db 100644
> --- a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
> +++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
> @@ -135,3 +135,25 @@ and the height of rectangles obtained using ``V4L2_SEL_TGT_CROP`` and
>  ``V4L2_SEL_TGT_COMPOSE`` targets. If these are not equal then the
>  scaling is applied. The application can compute the scaling ratios using
>  these values.
> +
> +Configuration of Region of Interest (ROI)
> +=========================================
> +
> +The range of auto-controls values and of coordinates of the top left
> +corner, width and height of areas that can be ROI is given by the
> +``V4L2_SEL_TGT_ROI_BOUNDS_MIN`` and ``V4L2_SEL_TGT_ROI_BOUNDS_MAX``
> +targets. It is recommended for the driver developers to put the top/left
> +corner at position ``(0,0)``.
> +
> +The top left corner, width and height of the Region of Interest area
> +and auto-controls currently being employed by the device are given by
> +the ``V4L2_SEL_TGT_ROI`` target. It uses the same coordinate system
> +as ``V4L2_SEL_TGT_ROI_BOUNDS_MIN`` and ``V4L2_SEL_TGT_ROI_BOUNDS_MAX``.
> +
> +In order to change active ROI top left, width and height coordinates
> +and ROI auto-controls use ``V4L2_SEL_TGT_ROI`` target.
> +
> +Each capture device has a default ROI rectangle and auto-controls
> +value given by the ``V4L2_SEL_TGT_ROI_DEFAULT`` target. Drivers shall

nit:  Drivers may, instead of shall?



> +set the ROI rectangle to the default when the driver is first loaded,
> +but not later.
> diff --git a/Documentation/userspace-api/media/v4l/selection-api-examples.rst b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
> index 5f8e8a1f59d7..ad2664888700 100644
> --- a/Documentation/userspace-api/media/v4l/selection-api-examples.rst
> +++ b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
> @@ -82,3 +82,31 @@ Example: Querying for scaling factors
>         /* computing scaling factors */
>         hscale = (double)compose.r.width / crop.r.width;
>         vscale = (double)compose.r.height / crop.r.height;
> +
> +Setting Region Of Interest area to half of the default value
> +
> +Example: Simple ROI
> +===========================
> +
> +.. code-block:: c
> +
> +       struct v4l2_selection roi = {
> +           .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> +           .target = V4L2_SEL_TGT_ROI_DEFAULT,
> +       };
> +       struct v4l2_rect r;
> +
> +       ret = ioctl(fd, VIDIOC_G_SELECTION, &roi);
> +       if (ret)
> +           exit(-1);
> +       /* setting smaller ROI rectangle */
> +       r.width = roi.r.width / 2;
> +       r.height = roi.r.height / 2;
> +       r.left = roi.r.width / 4;
> +       r.top = roi.r.height / 4;
> +       roi.r = r;
> +       roi.target = V4L2_SEL_TGT_ROI;
> +       roi.flags = V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE;
> +       ret = ioctl(fd, VIDIOC_S_SELECTION, &roi);
> +       if (ret)
> +           exit(-1);
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> index b46bae984f35..d1dc9c50eb05 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> @@ -75,6 +75,30 @@ of the two interfaces they are used.
>         modified by hardware.
>        - Yes
>        - No
> +    * - ``V4L2_SEL_TGT_ROI``
> +      - 0x0200
> +      - Current Region of Interest rectangle and auto-controls value.
> +      - Yes
> +      - No
> +    * - ``V4L2_SEL_TGT_ROI_DEFAULT``
> +      - 0x0201
> +      - Suggested Region of Interest rectangle and auto-controls value.
> +      - Yes
> +      - No
> +    * - ``V4L2_SEL_TGT_ROI_BOUNDS_MIN``
> +      - 0x0202
> +      - Minimum bounds of the Region of Interest rectangle and minimum
> +       auto-controls value. All valid ROI rectangles and auto-controls
> +       should be within minimum-maximum range.
> +      - Yes
> +      - No
> +    * - ``V4L2_SEL_TGT_ROI_BOUNDS_MAX``
> +      - 0x0203
> +      - Maximum bounds of the Region of Interest rectangle and maximum
> +       auto-controls value. All valid ROI rectangles and auto-controls
> +       should be within minimum-maximum range.
> +      - Yes
> +      - No
>
>  .. raw:: latex
>
> --
> 2.31.0.rc2.261.g7f71774620-goog
>


--
Ricardo Ribalda
