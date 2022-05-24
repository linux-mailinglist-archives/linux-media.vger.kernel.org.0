Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBB3532888
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 13:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235707AbiEXLKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 07:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbiEXLKL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 07:10:11 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0EC719D9
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 04:10:10 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g13-20020a9d6b0d000000b0060b13026e0dso3914481otp.8
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 04:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+JttkR+Tz8Ky7qxQ4RTayiMaZoT1dV+ji3DhV9+AuNg=;
        b=nShv/a4uRncM6Hxd26jTeIIy38FbPMfpydCbPtQLUspYHCQF0q/Ua7FgYd9iG727O3
         BKdAfGKRGp/vhJxxv48OUQihkH47jK29l2V9YYgnnlgIJmZFEb98RwYtGkEgy58WpWqj
         27ogKpWmSoHq3c6KUpN5SANRk5okELbs6CQn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+JttkR+Tz8Ky7qxQ4RTayiMaZoT1dV+ji3DhV9+AuNg=;
        b=z7MhJDZYlaav0Ay2RmWpML+FW3y6aCixJ+NBcQw9kGHv9zY9UbLaiyUduQeS+0joml
         OcfF0/X/oQazgDPCjhN490lHZhweXxInL5hpy7vh8wd+VAfAG+onHGLN6RY3i00dzXXi
         lYVgf/ESwuYm4n138V6+gQLHGcsypDev51tZbXOLj44IKV8UXVeqtiukyJntBq9f/Db4
         g30hNiMzhPj5z+5eY2i1KndI9fBX5MbakeA7WArc6kqUgo2aVdARSQCD9zW8yDRW6UKm
         vuL1C8WhHaIh3nHrhNYoMmbQMuz9Z8wbAX2ihzdl+Laj75of6gvsocYDVz1gH1Pav5r/
         CRQg==
X-Gm-Message-State: AOAM532B8V5eO8/992ZRR0v0br7mhYKk8tR2TagrKNbJdNuSlhKHML1W
        DUIdIFPCIz22TSg0JKtuxk1LEzSJ5OwIkQ==
X-Google-Smtp-Source: ABdhPJwQhHuNxH1qWK+XzwXfHQotN7EQdyTdwspOkHlgwuxusD9vgltOEBNfbbBeVcgOV7CBx7U0mA==
X-Received: by 2002:a9d:74c9:0:b0:60b:c45:453f with SMTP id a9-20020a9d74c9000000b0060b0c45453fmr4328620otl.372.1653390609429;
        Tue, 24 May 2022 04:10:09 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id u22-20020a056871059600b000e686d13876sm4765234oan.16.2022.05.24.04.10.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 04:10:08 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id q8so20936164oif.13
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 04:10:08 -0700 (PDT)
X-Received: by 2002:a05:6808:150f:b0:32b:888:f534 with SMTP id
 u15-20020a056808150f00b0032b0888f534mr1822828oiw.223.1653390607644; Tue, 24
 May 2022 04:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220524044507.1696012-1-yunkec@google.com> <20220524044507.1696012-5-yunkec@google.com>
In-Reply-To: <20220524044507.1696012-5-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 24 May 2022 13:09:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCvqmChzUB=6agB-sYeiu7OfgELMQpBqKY1+_adUNj9PeA@mail.gmail.com>
Message-ID: <CANiDSCvqmChzUB=6agB-sYeiu7OfgELMQpBqKY1+_adUNj9PeA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: uvcvideo: document UVC v1.5 ROI
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
> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  .../userspace-api/media/drivers/uvcvideo.rst  | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index e5fd8fad333c..9b96c8b90b7a 100644
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
> @@ -255,3 +256,62 @@ Argument: struct uvc_xu_control_query
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
> +       This control determines the region of interest. Region of interest is an
This control determines the Region Of Interest (ROI). ROI is a
> +       rectangular area represented by a struct v4l2_rect. The rectangle is in
 struct :c:type:`v4l2_rect`.
> +       pixel units and global coordinates. It is independent of the field of view,
> +       not impacted by any cropping or scaling.
> +
> +       Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query the
> +       range of rectangle sizes. For example, a device can have a minimum ROI
> +       rectangle of 1x1@0x0, a maximum of 640x480@0x0.
 rectangle of 1x1@0x0 and a maximum of 640x480@0x0.
> +
> +       Setting a region of interest allows the camera to optimize the capture for
ROI
> +       the region. The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control
> +       determines the detailed behavior.
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
> 2.36.1.124.g0e6072fb45-goog
>


-- 
Ricardo Ribalda
