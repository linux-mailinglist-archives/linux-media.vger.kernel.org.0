Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0E67302F6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 17:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343515AbjFNPJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 11:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343539AbjFNPJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 11:09:05 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C152A1FC4
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:08:33 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-75da00a1eddso218325285a.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686755312; x=1689347312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J4GMykv7hCOaUrRftmti7t1VE4vRvip4iblB0eyfITg=;
        b=SnMAhsK9IO+CFMRPAD2CQaFMx7nxKwEu2h6oCx7B0BK62Ng3Bdk4Tg/p5HIP0x38zC
         fZj+p6CGTP8n7Xr3l34H5Oi2rvGwSXHNdJ1eRIrIXfdNT22R7glPvPUuxAAStkkvG4aG
         e5IQkt/PIDcQ/y4/77jkjIuhyMeSs+7fxAjPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755312; x=1689347312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4GMykv7hCOaUrRftmti7t1VE4vRvip4iblB0eyfITg=;
        b=QI1fxrmGJ/9sxD8Uk90fpgwyS3EF2WRvWUzlGhhSSLm54hCFY9BSD9E6qz6/4YFU9Z
         z/xDJ/QakJKvY7K/+LfGwsWAIlxeuoSAN/sdr0tXK4g22daIoqUsl2rLwGrnjxRLAdHQ
         8CJatFjRmk7hTNmNHerVysz/0WLgb+XjKOYkCKBWtdntdF9g7GQj0wYPmSNgfTI43jZo
         eKAugWi187oIDu2udfx5NIvZt88xr/kD+ikVdaeh6VOdFc1E1ThEj73kqBXH0nN7F4JD
         zQGx0F9qRE3hD4GCmod/UM0fM6Oj54+ByKhMxLPtkSjnBlW437xxVtQ+V2CbKY9jTMlt
         UPzQ==
X-Gm-Message-State: AC+VfDyJ6q1BV4FYdWmESnWlsKXfp22c9yATKltnNP6BA2cpGCN5yxX7
        jVmIVtnf0qVNOTN93tlra8Faj7dryjeAOIsKfpg=
X-Google-Smtp-Source: ACHHUZ5iHP2ld3oZ6xht2HHOuNJ4Hh3ojwHyR/VWCaFwLWP551KcTaSTRw0a6cn9Pg7QAU84bK577Q==
X-Received: by 2002:a05:620a:d83:b0:75e:c3dc:f23 with SMTP id q3-20020a05620a0d8300b0075ec3dc0f23mr20306094qkl.37.1686755311943;
        Wed, 14 Jun 2023 08:08:31 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id g10-20020a05620a13ca00b007606a26988dsm2687742qkl.73.2023.06.14.08.08.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 08:08:31 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-762092e1fb7so61773885a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:08:31 -0700 (PDT)
X-Received: by 2002:a05:6214:240d:b0:62b:4ce5:fa86 with SMTP id
 fv13-20020a056214240d00b0062b4ce5fa86mr19973072qvb.31.1686755310696; Wed, 14
 Jun 2023 08:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
 <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
 <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu> <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
In-Reply-To: <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Jun 2023 17:08:19 +0200
X-Gmail-Original-Message-ID: <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com>
Message-ID: <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0 as default
To:     soyer <soyer@irl.hu>
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

On Wed, 14 Jun 2023 at 17:07, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Soyer
>
>
> On Wed, 14 Jun 2023 at 16:59, soyer <soyer@irl.hu> wrote:
> >
> > Hi Ricardo
> >
> > On Wed, 2023-06-14 at 16:19 +0200, Ricardo Ribalda wrote:
> > > [Now in plain text mode]
> > >
> > > Hi Gergo
> > >
> > > Doesn't your patch affect pan and tilt for all the cameras, not only
> > > the BCC950?
> > >
> > Yes, it affects all cameras that support CT_PANTILT_RELATIVE_CONTROL.
> >
> > > Also it seems that 1 means that device does not support programmable
> > > speed. Is that correct?
> > >
> > > ```
> > > The bPanSpeed field is used to specify the speed of the movement for
> > > the Pan direction. A low
> > > number indicates a slow speed and a high number indicates a higher
> > > speed. The GET_MIN,
> > > GET_MAX and GET_RES requests are used to retrieve the range and
> > > resolution for this field.
> > > The GET_DEF request is used to retrieve the default value for this
> > > field. If the control does not
> > > support speed control for the Pan control, it will return the value 1
> > > in this field for all these
> > > requests.
> > > ```
>
> It seems to me that the module is compliant to the standard. It
> returns 1 as GET_DEF because it does not support speed control.
>
> Maybe you should ignore the speed control instead of changing its default value?

( this is the standard I am refering to: 4.2.2.1.15 PanTilt (Relative) Control

 https://www.usb.org/document-library/video-class-v15-document-set )
>
>
> > >
> > I started from the V4L2 control description.
> >
> > V4L2_CID_PAN_SPEED (integer)
> > This control turns the camera horizontally at the specific speed. The
> > unit is undefined. A positive value moves the camera to the right
> > (clockwise when viewed from above), a negative value to the left. A
> > value of zero stops the motion if one is in progress and has no effect
> > otherwise.
> >
> > And this is why I thought that 1 is not a good default value, because
> > it moves the camera.
> > The other V4L2 controls have a default value that I can safely set the
> > controls to.
> >
> > Are you using it to determine if the camera supports speed control?
> >
> > > When you program that value do you see any difference on the device?
> > > What is max, min and res?
> > >
> >
> > No, it works the same way.
> > Only the default value changes (from 1 to 0)
> >
> >  pan_speed 0x009a0920 (int)    : min=-1 max=1 step=1 default=0 value=0
> > tilt_speed 0x009a0921 (int)    : min=-1 max=1 step=1 default=0 value=0
> >
> >
> >
> > >
> > > Thanks!
> > >
> > > Regards!
> > >
> > >
> >
> > Thanks,
> > Gergo
> >
> > > On Wed, 14 Jun 2023 at 15:13, Gergo Koteles <soyer@irl.hu> wrote:
> > > >
> > > > The Logitech BCC950 incorrectly reports 1 (the max value)
> > > > for the default values of V4L2_CID_PAN_SPEED,
> > > > V4L2_CID_TILT_SPEED.
> > > >
> > > > This patch sets them to 0, which is the stop value.
> > > >
> > > > Previous discussion
> > > > Link:
> > > > https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
> > > >
> > > > Signed-off-by: Gergo Koteles <soyer@irl.hu>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 5e9d3da862dd..e131958c0930 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > > > uvc_control_mapping *mapping,
> > > >                 return -data[first+1];
> > > >         case UVC_GET_MAX:
> > > >         case UVC_GET_RES:
> > > > +               return data[first+1];
> > > >         case UVC_GET_DEF:
> > > >         default:
> > > > -               return data[first+1];
> > > > +               return 0;
> > > >         }
> > > >  }
> > > >
> > > >
> > > > base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> > > > --
> > > > 2.40.1
> > > >
> > >
> > >
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
