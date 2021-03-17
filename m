Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429F133EB17
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 09:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCQIJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 04:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhCQIJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 04:09:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E8AC06174A;
        Wed, 17 Mar 2021 01:09:01 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m22so1616686lfg.5;
        Wed, 17 Mar 2021 01:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0OgsnasKFeVJz4RtHdD7BjCvhFgbi153zkWH0OkZMEc=;
        b=dVG3ad/iEMRh6PObaH7kQyFAxj/DlwT99/sV7ai8iRWTHyVsX8spSgJu/Q/FwuKFiU
         JE1un5MPUrOfBaQqKn0CSHN+vQ249zDkMnoWV3s2QW3GM1WP9HxMeVKzZZNLaXWa12/N
         6sbMO2tSKOOzsNwWcnbF2C+3RlWTPEY5mJgC7xwJgSsnp2I7xEnFX+5f5ttnnw1oUgJ4
         DXOfuoSXr97EDuztgzAzuDDwMwrjSvhYW7/ThBGCD8wFW3DkCgr59J6f2IsmTetWkJLg
         mrt3Fh1tqxwNsfjhNgK0FmwXTs5Dxsko3VVFxZCGFsRoTfbvPHudjVgzGJLarpPrWby9
         Kz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0OgsnasKFeVJz4RtHdD7BjCvhFgbi153zkWH0OkZMEc=;
        b=bWv68ZlldJq3ulLZq2kAM6IAPQnjbKEkxT0ywgM8xSNBQYqxp4x+hpZ1Ym9muRgHCT
         f9n9SjNadQGQ75XRn+zsq07sso92qT5pV7NVSn42d2KIin6zNJ2RzZo1bqCplTLcrR/V
         x9tkX9KOe8mr9WWroHHnTtvBQ/7Dq61amVE9To5IGTHBH4Q58fhPDV/wS2KtG7vYUlp7
         NNyLCr0TDlJmpBr0vs67/4md6dAw704RJM7fzxDQireR/42yQPgcvrDYZM1RInAgXCsB
         tvExyamujqiOWqo+06Hu/rWKoFvlxxTKWhbCKXSzb8nTxOu/+Sg1jXd8PYB1bcll+1Qk
         bg+g==
X-Gm-Message-State: AOAM5307gc4qjV8Mxi8msJAd+QWkaM3MH8oTlmkFfQ2EL+EGEfbJCIqt
        CR1fk6dm4+9YfZ9c4ZQZ8SPBROZlLckCdm3EOM4=
X-Google-Smtp-Source: ABdhPJzZ6JrfFoL5c2CJAJHGDzBo9K+/TOs4Q/34aHKU3iw5Y+EA2Hw2SbWlzB0J1EsYMRCsTM+QH7MskQAUbMbBwOk=
X-Received: by 2002:a19:9109:: with SMTP id t9mr1732347lfd.49.1615968539878;
 Wed, 17 Mar 2021 01:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-3-sergey.senozhatsky@gmail.com> <CAPybu_2ZRNUiZbFHfuW6i119xhs21-zTigoaO8sZc-Ye3D18xA@mail.gmail.com>
 <YFFcvbXRlCCB+pv/@google.com>
In-Reply-To: <YFFcvbXRlCCB+pv/@google.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Wed, 17 Mar 2021 09:08:43 +0100
Message-ID: <CAPybu_3cu7_vca0gi_A2QRA0TYozqE2Ef_q5QQgQW9LzGFbUKQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/3] media: uvcvideo: add ROI auto controls
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 17, 2021 at 2:34 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (21/03/16 19:29), Ricardo Ribalda Delgado wrote:
> > > ROI control is a compound data type:
> > >   Control Selector     CT_REGION_OF_INTEREST_CONTROL
> > >   Mandatory Requests   SET_CUR, GET_CUR, GET_MIN, GET_MAX, GET_DEF
> > >   wLength 10
> > >   Offset   Field            Size
> > >   0        wROI_Top         2
> > >   2        wROI_Left        2
> > >   4        wROI_Bottom      2
> > >   6        wROI_Right       2
> > >   8        bmAutoControls   2       (Bitmap)
> > >
> > > uvc_control_mapping, however, can handle only s32 data type at the
> > > moment: ->get() returns s32 value, ->set() accepts s32 value; while
> > > v4l2_ctrl maximum/minimum/default_value can hold only s64 values.
> > >
> > > Hence ROI control handling is split into two patches:
> > > a) bmAutoControls is handled via uvc_control_mapping as V4L2_CTRL_TYPE_MENU
> > > b) ROI rectangle (SET_CUR, GET_CUR, GET_DEF) handling is implemented
> > >    separately, by the means of selection API.
> >
> > Maybe a reference to the uvc doc would be a good thing to add here.
>
> OK. What should be referenced there?

Nevermind, I thought there was a non-pdf version of the standard :(
https://www.usb.org/document-library/video-class-v15-document-set

>
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
> > > +      - Auto Exposure.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
> > > +      - Auto Iris.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > > +      - Auto White Balance.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
> > > +      - Auto Focus.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > > +      - Auto Face Detect.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > > +      - Auto Detect and Track.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION``
> > > +      - Image Stabilization.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > > +      - Higher Quality.
> > > +
> > >
> > Nit: Same as before splitting doc and code.
>
> OK, I guess I can split.
>
> > >  static const struct uvc_menu_info power_line_frequency_controls[] = {
> > > @@ -753,6 +762,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > >                 .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
> > >                 .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
> > >         },
> > > +       {
> > > +               .id             = V4L2_CID_REGION_OF_INTEREST_AUTO,
> > > +               .name           = "Region of Interest (auto)",
> > > +               .entity         = UVC_GUID_UVC_CAMERA,
> > > +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +               .size           = 16,
> > > +               .offset         = 64,
> > > +               .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> > Are
>
> Are?

Aye!
You are not a good kernel reviewer if you do not talk pirate :P.

I wanted to make sure that V4L2_CTRL_TYPE_BITMASK was handled by the
uvc driver, and I think that it will work fine.
Sorry for the noise.

>
> > >  #define V4L2_CID_PAN_SPEED                     (V4L2_CID_CAMERA_CLASS_BASE+32)
> > >  #define V4L2_CID_TILT_SPEED                    (V4L2_CID_CAMERA_CLASS_BASE+33)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO       (V4L2_CID_CAMERA_CLASS_BASE+34)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION   (1 << 6)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY        (1 << 7)
> > >
> > >  #define V4L2_CID_CAMERA_ORIENTATION            (V4L2_CID_CAMERA_CLASS_BASE+34)
> > >  #define V4L2_CAMERA_ORIENTATION_FRONT          0
> > > --
> > > 2.30.0
> > >
> >
> > I think we have to add the CID to v4l2_ctrl_get_name()
>
> Sounds good. Only this one - V4L2_CID_REGION_OF_INTEREST_AUTO, right?

I think so :)

Thanks!



-- 
Ricardo Ribalda
