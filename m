Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445E533E634
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 02:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhCQBfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 21:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhCQBe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 21:34:58 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E35C06174A;
        Tue, 16 Mar 2021 18:34:58 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id l123so8256pfl.8;
        Tue, 16 Mar 2021 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PAbDF4rfZ6yaVQMdHmSiOS8V0FmTGEo0e57f4/ISkwk=;
        b=cLLskJ4lPENPRzewuD5FZIzw/RKJrbQbz4NgdP2Ggqej65ZmTzZ2WEcwc9nuYWmaAR
         rv0x2G021BGJSfsOJicxi5r0GyLJWMYywDAOeqFOeOzBdoOnlAgowbPDVyZGaE/CiTDj
         g3JyqxVj8hRGFCwed3u01gOneJr24IZMmmpz4AVXz+2L4TWC2dvJIYKmOYU2FfHFbuyZ
         TvUXKAr0LKFOHrwHGR0Kb1opaeuiA7FIAItEmsyIqjTJj/75N95kka3GyRgXZ7nmYyhq
         XyUL8OQV7LZAEH+gHd/yk9GhQKr1521+vcqc2NyyLCZsp2eYi72RkqpT9K60wF0vQmv1
         TZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PAbDF4rfZ6yaVQMdHmSiOS8V0FmTGEo0e57f4/ISkwk=;
        b=A0f3vWhZ4O1biI+VRFxyqnPDXzjx4AXtSXndeDUIsbhh4t+xKPh6jWdXrVuqrYDHxc
         K558ZU9prdy6j/PfAp2vsTW2lP4nNi2lSu7/srExqvhDbdndr7z5hNRHFUBL2/68W1Oh
         kg36Dged2WwT9aNlDK4v+0e8ED56OyFxdMA9ujLahBdQBxCulixnyFaFeEYjFwHjAmoK
         ACsR0vEihptyk3qKLC5Bz9kvPgrVa7tkuczJutK3CTmblkPPLKoGxz7nsHMEzfSOTSVq
         JJMZhKDEqg6UQRhh08hbuNa3KgIASG/7I2dsUsWYIe5+suN+SKa9m9wIGby8OWqRhR/r
         TBhQ==
X-Gm-Message-State: AOAM531xuGAlgqSw73tsGi2QQ992kIv5V9ztKYFFTUSOl4qLw5DIFSwO
        PamlzTB0H/9xQG1t3MDzfiE=
X-Google-Smtp-Source: ABdhPJytdLRofzV24nUUrQqoATeH9m5LoJDaCr38XZSXPI91k2rywd0xxzTG0KY5EOdeQs/L5Gepcg==
X-Received: by 2002:a63:e22:: with SMTP id d34mr507851pgl.264.1615944897988;
        Tue, 16 Mar 2021 18:34:57 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id 6sm18424345pfv.179.2021.03.16.18.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 18:34:57 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:34:53 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2 2/3] media: uvcvideo: add ROI auto controls
Message-ID: <YFFcvbXRlCCB+pv/@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-3-sergey.senozhatsky@gmail.com>
 <CAPybu_2ZRNUiZbFHfuW6i119xhs21-zTigoaO8sZc-Ye3D18xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_2ZRNUiZbFHfuW6i119xhs21-zTigoaO8sZc-Ye3D18xA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/16 19:29), Ricardo Ribalda Delgado wrote:
> > ROI control is a compound data type:
> >   Control Selector     CT_REGION_OF_INTEREST_CONTROL
> >   Mandatory Requests   SET_CUR, GET_CUR, GET_MIN, GET_MAX, GET_DEF
> >   wLength 10
> >   Offset   Field            Size
> >   0        wROI_Top         2
> >   2        wROI_Left        2
> >   4        wROI_Bottom      2
> >   6        wROI_Right       2
> >   8        bmAutoControls   2       (Bitmap)
> >
> > uvc_control_mapping, however, can handle only s32 data type at the
> > moment: ->get() returns s32 value, ->set() accepts s32 value; while
> > v4l2_ctrl maximum/minimum/default_value can hold only s64 values.
> >
> > Hence ROI control handling is split into two patches:
> > a) bmAutoControls is handled via uvc_control_mapping as V4L2_CTRL_TYPE_MENU
> > b) ROI rectangle (SET_CUR, GET_CUR, GET_DEF) handling is implemented
> >    separately, by the means of selection API.
> 
> Maybe a reference to the uvc doc would be a good thing to add here.

OK. What should be referenced there?

> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
> > +      - Auto Exposure.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
> > +      - Auto Iris.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > +      - Auto White Balance.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
> > +      - Auto Focus.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > +      - Auto Face Detect.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > +      - Auto Detect and Track.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION``
> > +      - Image Stabilization.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > +      - Higher Quality.
> > +
> >
> Nit: Same as before splitting doc and code.

OK, I guess I can split.

> >  static const struct uvc_menu_info power_line_frequency_controls[] = {
> > @@ -753,6 +762,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >                 .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
> >                 .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
> >         },
> > +       {
> > +               .id             = V4L2_CID_REGION_OF_INTEREST_AUTO,
> > +               .name           = "Region of Interest (auto)",
> > +               .entity         = UVC_GUID_UVC_CAMERA,
> > +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +               .size           = 16,
> > +               .offset         = 64,
> > +               .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> Are

Are?

> >  #define V4L2_CID_PAN_SPEED                     (V4L2_CID_CAMERA_CLASS_BASE+32)
> >  #define V4L2_CID_TILT_SPEED                    (V4L2_CID_CAMERA_CLASS_BASE+33)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO       (V4L2_CID_CAMERA_CLASS_BASE+34)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION   (1 << 6)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY        (1 << 7)
> >
> >  #define V4L2_CID_CAMERA_ORIENTATION            (V4L2_CID_CAMERA_CLASS_BASE+34)
> >  #define V4L2_CAMERA_ORIENTATION_FRONT          0
> > --
> > 2.30.0
> >
> 
> I think we have to add the CID to v4l2_ctrl_get_name()

Sounds good. Only this one - V4L2_CID_REGION_OF_INTEREST_AUTO, right?
