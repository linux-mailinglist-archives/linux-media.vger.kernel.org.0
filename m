Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDD87303C9
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 17:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245041AbjFNP0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 11:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244772AbjFNP0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 11:26:16 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51903211C
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:26:02 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f9b2b7109dso19118681cf.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686756361; x=1689348361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CgMcL9GvKwi9jDRGd6aF8J8dBD3MbVzcYyFcXVe2ec0=;
        b=DnxUFSZ9CcG/XhWdRCg1XH8jIXPUnGfVNVO12ZKdpDzk5QmQkBs9ll9wbGvOXz7NJw
         gFJvRznltUx1Zalt53C3endrl3D1TxaQOX8jvVoSCTIi/EYHzaCr5zxNMf1KLsX6tvdW
         cStAQFCGkRiLvO01qGusJezZmleYNAvGy4Jbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686756361; x=1689348361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgMcL9GvKwi9jDRGd6aF8J8dBD3MbVzcYyFcXVe2ec0=;
        b=bYzylMmRHRMxlRHN3P+AHZkQG+dAe1InHQ6ttq1uRt/owt3J2gdOHlxKDsIlZLN2iy
         SLpjK9vLMYE8Z3YbHDjdcX5CtWN9kqRprtKHKzfXsbOCI1f8pWJUTlZhYyHW9bJSK/uy
         sNOBs+q6RO6Y/jHfLsG5Vkl+Z+sclPYWvevwDLKIgJQNIrL+5zLgDuM4ha2YTZSXbq5W
         +uC/rXkrb/gf1bwRR5fu/SMUpWU/ag6qz7aD6nc96dOPXvCfv7u1PG1cHxy++ljGWjDb
         PgpcSiTvUR10gPounZGMu9CAbRCDU/M0LY0uStfRTT6nkbXV0nhwv+LPjUMHbEl2GUaw
         Y49w==
X-Gm-Message-State: AC+VfDzijeDX2gKHTd40QXGLMzENhfY6HhQPy/8MU+G0oa13R3l/Ptt8
        odAuMFUa6QSVQeEmpmwWbHUmqHLRoKdZbnD3Rx8=
X-Google-Smtp-Source: ACHHUZ75d+IT+yzteV/SJeaHd7Sq3bbTsqWcxpehc018aT27nIyYsARWtJM3z/1eOJyKqvahcJUh9w==
X-Received: by 2002:ac8:7f4c:0:b0:3f6:bffe:3bf5 with SMTP id g12-20020ac87f4c000000b003f6bffe3bf5mr3280185qtk.1.1686756361002;
        Wed, 14 Jun 2023 08:26:01 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id h1-20020ac87141000000b003ef5dc13bbbsm5091568qtp.85.2023.06.14.08.26.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 08:26:00 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-62de5392c7bso17658566d6.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:26:00 -0700 (PDT)
X-Received: by 2002:a05:6214:20eb:b0:626:2f1b:b427 with SMTP id
 11-20020a05621420eb00b006262f1bb427mr16263872qvk.10.1686756360084; Wed, 14
 Jun 2023 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
 <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
 <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu> <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
 <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com> <944fc6422e73a7b1334fdc1856bdf0480c7fc4e9.camel@irl.hu>
In-Reply-To: <944fc6422e73a7b1334fdc1856bdf0480c7fc4e9.camel@irl.hu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Jun 2023 17:25:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCupgF6m6T3R=w7BxqVe672cPHk05Yj0yqiW3hLp+GEkdw@mail.gmail.com>
Message-ID: <CANiDSCupgF6m6T3R=w7BxqVe672cPHk05Yj0yqiW3hLp+GEkdw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0 as default
To:     Gergo Koteles <soyer@irl.hu>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Jun 2023 at 17:22, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
> On Wed, 2023-06-14 at 17:08 +0200, Ricardo Ribalda wrote:
> > On Wed, 14 Jun 2023 at 17:07, Ricardo Ribalda <ribalda@chromium.org>
> > wrote:
> > >
> > > Hi Soyer
> > >
> > >
> > > On Wed, 14 Jun 2023 at 16:59, soyer <soyer@irl.hu> wrote:
> > > >
> > > > Hi Ricardo
> > > >
> > > > On Wed, 2023-06-14 at 16:19 +0200, Ricardo Ribalda wrote:
> > > > > [Now in plain text mode]
> > > > >
> > > > > Hi Gergo
> > > > >
> > > > > Doesn't your patch affect pan and tilt for all the cameras, not
> > > > > only
> > > > > the BCC950?
> > > > >
> > > > Yes, it affects all cameras that support
> > > > CT_PANTILT_RELATIVE_CONTROL.
> > > >
> > > > > Also it seems that 1 means that device does not support
> > > > > programmable
> > > > > speed. Is that correct?
> > > > >
> > > > > ```
> > > > > The bPanSpeed field is used to specify the speed of the
> > > > > movement for
> > > > > the Pan direction. A low
> > > > > number indicates a slow speed and a high number indicates a
> > > > > higher
> > > > > speed. The GET_MIN,
> > > > > GET_MAX and GET_RES requests are used to retrieve the range and
> > > > > resolution for this field.
> > > > > The GET_DEF request is used to retrieve the default value for
> > > > > this
> > > > > field. If the control does not
> > > > > support speed control for the Pan control, it will return the
> > > > > value 1
> > > > > in this field for all these
> > > > > requests.
> > > > > ```
> > >
> > > It seems to me that the module is compliant to the standard. It
> > > returns 1 as GET_DEF because it does not support speed control.
> > >
> > > Maybe you should ignore the speed control instead of changing its
> > > default value?
> >
> > ( this is the standard I am refering to: 4.2.2.1.15 PanTilt
> > (Relative) Control
> >
> >  https://www.usb.org/document-library/video-class-v15-document-set )
> > >
> > >
>
> It's a different API. V4L2 control values are not the same as the UVC
> standard control values.

What I am saying, is that if
CT_PANTILT_RELATIVE_CONTROL.bPanSpeed.GET_DEF is 1 you should not
create the mapping to
V4L2_CID_PAN_SPEED

>
> Eg the V4L2_CID_PAN_SPEED control value calculated from
> CT_PANTILT_RELATIVE_CONTROL's bPanRelative and bPanSpeed value.
>
> It only bothers me that I have to handle these two controls
> differently.
>
> > > > >
> > > > I started from the V4L2 control description.
> > > >
> > > > V4L2_CID_PAN_SPEED (integer)
> > > > This control turns the camera horizontally at the specific speed.
> > > > The
> > > > unit is undefined. A positive value moves the camera to the right
> > > > (clockwise when viewed from above), a negative value to the left.
> > > > A
> > > > value of zero stops the motion if one is in progress and has no
> > > > effect
> > > > otherwise.
> > > >
> > > > And this is why I thought that 1 is not a good default value,
> > > > because
> > > > it moves the camera.
> > > > The other V4L2 controls have a default value that I can safely
> > > > set the
> > > > controls to.
> > > >
> > > > Are you using it to determine if the camera supports speed
> > > > control?
> > > >
> > > > > When you program that value do you see any difference on the
> > > > > device?
> > > > > What is max, min and res?
> > > > >
> > > >
> > > > No, it works the same way.
> > > > Only the default value changes (from 1 to 0)
> > > >
> > > >  pan_speed 0x009a0920 (int)    : min=-1 max=1 step=1 default=0
> > > > value=0
> > > > tilt_speed 0x009a0921 (int)    : min=-1 max=1 step=1 default=0
> > > > value=0
> > > >
> > > >
> > > >
> > > > >
> > > > > Thanks!
> > > > >
> > > > > Regards!
> > > > >
> > > > >
> > > >
> > > > Thanks,
> > > > Gergo
> > > >
> > > > > On Wed, 14 Jun 2023 at 15:13, Gergo Koteles <soyer@irl.hu>
> > > > > wrote:
> > > > > >
> > > > > > The Logitech BCC950 incorrectly reports 1 (the max value)
> > > > > > for the default values of V4L2_CID_PAN_SPEED,
> > > > > > V4L2_CID_TILT_SPEED.
> > > > > >
> > > > > > This patch sets them to 0, which is the stop value.
> > > > > >
> > > > > > Previous discussion
> > > > > > Link:
> > > > > > https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
> > > > > >
> > > > > > Signed-off-by: Gergo Koteles <soyer@irl.hu>
> > > > > > ---
> > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > index 5e9d3da862dd..e131958c0930 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > @@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > > > > > uvc_control_mapping *mapping,
> > > > > >                 return -data[first+1];
> > > > > >         case UVC_GET_MAX:
> > > > > >         case UVC_GET_RES:
> > > > > > +               return data[first+1];
> > > > > >         case UVC_GET_DEF:
> > > > > >         default:
> > > > > > -               return data[first+1];
> > > > > > +               return 0;
> > > > > >         }
> > > > > >  }
> > > > > >
> > > > > >
> > > > > > base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> > > > > > --
> > > > > > 2.40.1
> > > > > >
> > > > >
> > > > >
> > > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
> >
> >
> >
>


-- 
Ricardo Ribalda
