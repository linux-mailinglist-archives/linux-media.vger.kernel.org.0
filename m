Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A51D5612AA
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 08:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbiF3Glz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 02:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbiF3Glx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 02:41:53 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B342F39C
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:41:52 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 93-20020a9d02e6000000b0060c252ee7a4so13938480otl.13
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsuAfOTvw7cFDgAGOkimx97RRhM7Mah73l5EqCYXMpU=;
        b=Vmwy7qHzC8jW4aaNptPlDw1cSXDmF5xSH8TzD4M6N7tBLMyr5IdZVLuJ6DvK/zu77m
         VWsKFDOTFZrYpWRfmiYXx46P34zuS4o4SxcuQR8hmm71PaTqQ5NdG9kZGeq2OCnR35uP
         OeIlIsrqIi8ruAIGXievldmAt9xoKCrqbU9ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsuAfOTvw7cFDgAGOkimx97RRhM7Mah73l5EqCYXMpU=;
        b=R/u9asqICzf2CwByHhUGfpOrTqMmrjXR+JB0CfNxQqtud/rtlyTUyDKqpS0BUaw1nK
         2FhSdNGVeiaxei9wewl1EEA6qSC5H5S1GVSLg5GjpIIhvyGoUhinlUcMM4pZ4IFvY7yp
         vjo8JGItvkycma/ftRjBmM/U5E7DoCCo+9QdSWoblSJSkLAJG0XbZtqLl/wCnarLM3V/
         lwA3VLUFmIZmjc8nWEo9FSuyrlnCnnqRkfOj742vyfejk11XxH0ZRvSOQ4r8mNmPJiU1
         VLWnUm1jo247nClfM8F4y/VFpLkR6XJu994CIXftrYwxtqDzM8XrglOSjdxm+uirwe7r
         7yrQ==
X-Gm-Message-State: AJIora9QDAuUqagGMGlDR/S9ozRKe2wkW11HqIa2LyPRMF7fnxKNzSyc
        XieZ51BJrHrrx8bVAU9Yv/bK4uYsnZd3Bw==
X-Google-Smtp-Source: AGRyM1tihe2ZPNgeV1dndailaOmBYjW8BuIm4OqMHs1An3TvrrayerhvA8i5ons0soKKaL6QhWP3/Q==
X-Received: by 2002:a9d:12c:0:b0:616:bb45:79c4 with SMTP id 41-20020a9d012c000000b00616bb4579c4mr3216028otu.289.1656571311252;
        Wed, 29 Jun 2022 23:41:51 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id b11-20020a9d60cb000000b00616dfd2c859sm4418545otk.59.2022.06.29.23.41.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 23:41:50 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id s13-20020a0568301e0d00b00616ad12fee7so13070521otr.10
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:41:50 -0700 (PDT)
X-Received: by 2002:a9d:178:0:b0:616:a150:dbae with SMTP id
 111-20020a9d0178000000b00616a150dbaemr3343198otu.321.1656571309640; Wed, 29
 Jun 2022 23:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-8-yunkec@google.com>
In-Reply-To: <20220628075705.2278044-8-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 30 Jun 2022 08:41:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCvUWXXK=Kn0JAkgZ_Ry7urTpdN0nitOh3B8gD5BbJn2xA@mail.gmail.com>
Message-ID: <CANiDSCvUWXXK=Kn0JAkgZ_Ry7urTpdN0nitOh3B8gD5BbJn2xA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] media: uvcvideo: document UVC v1.5 ROI
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

On Tue, 28 Jun 2022 at 09:58, Yunke Cao <yunkec@google.com> wrote:
>
> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../userspace-api/media/drivers/uvcvideo.rst  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index a290f9fadae9..ee4c182aa274 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
>         UVC_CTRL_DATA_TYPE_BOOLEAN      Boolean
>         UVC_CTRL_DATA_TYPE_ENUM         Enumeration
>         UVC_CTRL_DATA_TYPE_BITMASK      Bitmask
> +       UVC_CTRL_DATA_TYPE_RECT         Rectangular area
>
>
>  UVCIOC_CTRL_QUERY - Query a UVC XU control
> @@ -255,3 +256,63 @@ Argument: struct uvc_xu_control_query
>         __u8    query           Request code to send to the device
>         __u16   size            Control data size (in bytes)
>         __u8    *data           Control value
> +
> +Private V4L2 controls
> +---------------------
> +
> +A few UVC specific V4L2 control IDs are listed below.
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
> +       This control determines the region of interest (ROI). ROI is an
> +       rectangular area represented by a struct :c:type:`v4l2_rect`. The
> +       rectangle is in global sensor coordinates and pixel units. It is
> +       independent of the field of view, not impacted by any cropping or
> +       scaling.
> +
> +       Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
> +       the range of rectangle sizes. For example, a device can have a minimum
> +       ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.
> +
> +       Setting a ROI allows the camera to optimize the capture for the region.
> +       The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
> +       the detailed behavior.
> +
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
> +       This determines which, if any, on board features should track to the
> +       Region of Interest specified by the current value of
> +       ``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
> +
> +       Max value is a mask indicating all supported Auto
> +       Controls.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``
> +      - Setting this to true enables automatic exposure time for the specified
> +       region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IRIS``
> +      - Setting this to true enables automatic iris aperture for the specified
> +       region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> +      - Setting this to true enables automatic white balance adjustment for the
> +       specified region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_FOCUS``
> +      - Setting this to true enables automatic focus adjustment for the
> +       specified region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> +      - Setting this to true enables automatic face detection for the
> +       specified region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> +      - Setting this to true enables automatic face detection and tracking. The
> +       current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +       the driver.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> +      - Setting this to true enables automatic image stabilization. The
> +       current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +       the driver.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Setting this to true enables automatically capture the specified region
> +       with higher quality if possible.
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Ricardo Ribalda
