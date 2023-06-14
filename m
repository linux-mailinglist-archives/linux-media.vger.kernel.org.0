Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD1F730905
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbjFNUQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236185AbjFNUP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:15:59 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF282101
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:15:57 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-3fd4d251de9so13424031cf.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686773756; x=1689365756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9danQUzzp2+MNy65UvMoVeOdy3vykzKShiw73ytkdo=;
        b=NhfE7VF5GJoRJvqqLowk9X/qMdsk43l01o+gnK33J0WNEPe2OkOPotS5OD+/Rkm0X9
         ouexMEMX19hUXSZGuS2lfDB8jA+VNvD1gQ6LMI/ydmuAXUumyGr/pyUU/8R0Zveu/vKf
         9xU3q7GYZ4KgDopk6lTHQXCVsp7a4dZ0isG10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773756; x=1689365756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9danQUzzp2+MNy65UvMoVeOdy3vykzKShiw73ytkdo=;
        b=kc/OYyun921aB8kYFZeHD4eemHR0rvOJ7EHwXF08lOSX36Le6KT1tXw78Y2RDsEriC
         CFUcdUq51zituOBgqPUQ1OMZ++DjNxMiD6rGCKime5X3KXVADAvsmIAN9ND+6TF+0Yor
         Wd1CyToPfJvDHsXqfMQF0Ifsevee7ecHazVs+UrVI1lTzXFTaBJPubYEMQa/JMQximN+
         gJTiVHA4Q8b6F85j5kF5bVjZwonM6msgiWJOgQAxoM/XH6ONUTXT2L8Ks/tHP80MrwJ2
         Ca5aqV4hWvCcVXciD202V1YEHCIezAIlXAQeuKhpNuUgGEnWnAqU3SED8Bt7tbK/mMtM
         pLgA==
X-Gm-Message-State: AC+VfDzvX305mAuVOrzh9dcEvr00r/kkBhIM+uOHzTAg578cwBlWUqQ+
        ucUzuKIfb1LPsmqa0mkhMtMuQM2OudAswIttNhE=
X-Google-Smtp-Source: ACHHUZ44vLkF2QI0dlnGZLhcpsBRrGmvSd1lRQdsxEdQV885B1cegx2lcUbFOIDKElXD/IHRnzEJSA==
X-Received: by 2002:a05:622a:1045:b0:3ef:370b:e7e with SMTP id f5-20020a05622a104500b003ef370b0e7emr4103315qte.40.1686773756268;
        Wed, 14 Jun 2023 13:15:56 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id fx6-20020a05622a4ac600b003f9efa2ddb4sm3120502qtb.66.2023.06.14.13.15.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 13:15:55 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-62df84f9f04so17833866d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:15:55 -0700 (PDT)
X-Received: by 2002:ad4:5c8a:0:b0:62b:67f1:eedf with SMTP id
 o10-20020ad45c8a000000b0062b67f1eedfmr17647490qvh.65.1686773754735; Wed, 14
 Jun 2023 13:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
 <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
 <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu> <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
 <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com>
 <944fc6422e73a7b1334fdc1856bdf0480c7fc4e9.camel@irl.hu> <CANiDSCupgF6m6T3R=w7BxqVe672cPHk05Yj0yqiW3hLp+GEkdw@mail.gmail.com>
 <3480de8b7cfd17dc93165d816fa624fdba75d0e6.camel@irl.hu> <CANiDSCs22ztCf8zXVRJS47ZwroTDy_1tOG3OO+tpdtXrxm-j_A@mail.gmail.com>
 <0d2c103938ce4d020553711e4b0b4ce1c38a0152.camel@irl.hu>
In-Reply-To: <0d2c103938ce4d020553711e4b0b4ce1c38a0152.camel@irl.hu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Jun 2023 22:15:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCt-xg1yVPH3UYHGz1vAa349HK-Hy-20n9xorasgdED2mg@mail.gmail.com>
Message-ID: <CANiDSCt-xg1yVPH3UYHGz1vAa349HK-Hy-20n9xorasgdED2mg@mail.gmail.com>
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

On Wed, 14 Jun 2023 at 18:56, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Wed, 2023-06-14 at 18:29 +0200, Ricardo Ribalda wrote:
> > Hi Gergo
> >
> >
> >
> > On Wed, 14 Jun 2023 at 17:46, Gergo Koteles <soyer@irl.hu> wrote:
> > >
> > > Hi Ricardo,
> > > On Wed, 2023-06-14 at 17:25 +0200, Ricardo Ribalda wrote:
> > > > On Wed, 14 Jun 2023 at 17:22, Gergo Koteles <soyer@irl.hu> wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > > On Wed, 2023-06-14 at 17:08 +0200, Ricardo Ribalda wrote:
> > > > > > On Wed, 14 Jun 2023 at 17:07, Ricardo Ribalda
> > > > > > <ribalda@chromium.org>
> > > > > > wrote:
> > > > > > >
> > > > > > > Hi Soyer
> > > > > > >
> > > > > > >
> > > > > > > On Wed, 14 Jun 2023 at 16:59, soyer <soyer@irl.hu> wrote:
> > > > > > > >
> > > > > > > > Hi Ricardo
> > > > > > > >
> > > > > > > > On Wed, 2023-06-14 at 16:19 +0200, Ricardo Ribalda wrote:
> > > > > > > > > [Now in plain text mode]
> > > > > > > > >
> > > > > > > > > Hi Gergo
> > > > > > > > >
> > > > > > > > > Doesn't your patch affect pan and tilt for all the
> > > > > > > > > cameras,
> > > > > > > > > not
> > > > > > > > > only
> > > > > > > > > the BCC950?
> > > > > > > > >
> > > > > > > > Yes, it affects all cameras that support
> > > > > > > > CT_PANTILT_RELATIVE_CONTROL.
> > > > > > > >
> > > > > > > > > Also it seems that 1 means that device does not support
> > > > > > > > > programmable
> > > > > > > > > speed. Is that correct?
> > > > > > > > >
> > > > > > > > > ```
> > > > > > > > > The bPanSpeed field is used to specify the speed of the
> > > > > > > > > movement for
> > > > > > > > > the Pan direction. A low
> > > > > > > > > number indicates a slow speed and a high number
> > > > > > > > > indicates a
> > > > > > > > > higher
> > > > > > > > > speed. The GET_MIN,
> > > > > > > > > GET_MAX and GET_RES requests are used to retrieve the
> > > > > > > > > range
> > > > > > > > > and
> > > > > > > > > resolution for this field.
> > > > > > > > > The GET_DEF request is used to retrieve the default
> > > > > > > > > value
> > > > > > > > > for
> > > > > > > > > this
> > > > > > > > > field. If the control does not
> > > > > > > > > support speed control for the Pan control, it will
> > > > > > > > > return
> > > > > > > > > the
> > > > > > > > > value 1
> > > > > > > > > in this field for all these
> > > > > > > > > requests.
> > > > > > > > > ```
> > > > > > >
> > > > > > > It seems to me that the module is compliant to the
> > > > > > > standard. It
> > > > > > > returns 1 as GET_DEF because it does not support speed
> > > > > > > control.
> > > > > > >
> > > > > > > Maybe you should ignore the speed control instead of
> > > > > > > changing
> > > > > > > its
> > > > > > > default value?
> > > > > >
> > > > > > ( this is the standard I am refering to: 4.2.2.1.15 PanTilt
> > > > > > (Relative) Control
> > > > > >
> > > > > >
> > > > > > https://www.usb.org/document-library/video-class-v15-document-set
> > > > > > )
> > > > > > >
> > > > > > >
> > > > >
> > > > > It's a different API. V4L2 control values are not the same as
> > > > > the
> > > > > UVC
> > > > > standard control values.
> > > >
> > > > What I am saying, is that if
> > > > CT_PANTILT_RELATIVE_CONTROL.bPanSpeed.GET_DEF is 1 you should not
> > > > create the mapping to
> > > > V4L2_CID_PAN_SPEED
> > > >
> > > If I set V4L2_CID_PAN_SPEED to 1 (max), the BCC950 starts to move
> > > at
> > > maximum speed. This is what it should do according to description
> > > of
> > > the V4L2_CID_PAN_SPEED.
> > >
> > > My understanding is that, if the camera supports
> > > CT_PANTILT_RELATIVE_CONTROL there should be a V4L2_CID_PAN_SPEED.
> > > CT_PANTILT_RELATIVE_CONTROL.bPanSpeed.GET_DEF == 1 only says that
> > > only
> > > one speed is available not a range.
> >
> > I think I got confused by the names.
> >
> > Can you check if this works?
> >
> > ribalda@alco:~/work/linux$ git diff
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 5e9d3da862dd..abab2f4efc94 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -437,6 +437,7 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > uvc_control_mapping *mapping,
> >         s8 rel = (s8)data[first];
> >
> >         switch (query) {
> > +       case UVC_GET_DEF:
> >         case UVC_GET_CUR:
> >                 return (rel == 0) ? 0 : (rel > 0 ? data[first+1]
> >                                                  : -data[first+1]);
> > @@ -444,7 +445,6 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > uvc_control_mapping *mapping,
> >                 return -data[first+1];
> >         case UVC_GET_MAX:
> >         case UVC_GET_RES:
> > -       case UVC_GET_DEF:
> >         default:
> >                 return data[first+1];
> >         }
> > ribalda@alco:~/work/linux$
> >
> >
>
> It works this way also.
> Should I send a new version?

I believe this is slightly better... but it is up to Laurent ;)

Thanks!

>
>
> > >
> > >
> > >
> > > > >
> > > > > Eg the V4L2_CID_PAN_SPEED control value calculated from
> > > > > CT_PANTILT_RELATIVE_CONTROL's bPanRelative and bPanSpeed value.
> > > > >
> > > > > It only bothers me that I have to handle these two controls
> > > > > differently.
> > > > >
> > > > > > > > >
> > > > > > > > I started from the V4L2 control description.
> > > > > > > >
> > > > > > > > V4L2_CID_PAN_SPEED (integer)
> > > > > > > > This control turns the camera horizontally at the
> > > > > > > > specific
> > > > > > > > speed.
> > > > > > > > The
> > > > > > > > unit is undefined. A positive value moves the camera to
> > > > > > > > the
> > > > > > > > right
> > > > > > > > (clockwise when viewed from above), a negative value to
> > > > > > > > the
> > > > > > > > left.
> > > > > > > > A
> > > > > > > > value of zero stops the motion if one is in progress and
> > > > > > > > has
> > > > > > > > no
> > > > > > > > effect
> > > > > > > > otherwise.
> > > > > > > >
> > > > > > > > And this is why I thought that 1 is not a good default
> > > > > > > > value,
> > > > > > > > because
> > > > > > > > it moves the camera.
> > > > > > > > The other V4L2 controls have a default value that I can
> > > > > > > > safely
> > > > > > > > set the
> > > > > > > > controls to.
> > > > > > > >
> > > > > > > > Are you using it to determine if the camera supports
> > > > > > > > speed
> > > > > > > > control?
> > > > > > > >
> > > > > > > > > When you program that value do you see any difference
> > > > > > > > > on
> > > > > > > > > the
> > > > > > > > > device?
> > > > > > > > > What is max, min and res?
> > > > > > > > >
> > > > > > > >
> > > > > > > > No, it works the same way.
> > > > > > > > Only the default value changes (from 1 to 0)
> > > > > > > >
> > > > > > > >  pan_speed 0x009a0920 (int)    : min=-1 max=1 step=1
> > > > > > > > default=0
> > > > > > > > value=0
> > > > > > > > tilt_speed 0x009a0921 (int)    : min=-1 max=1 step=1
> > > > > > > > default=0
> > > > > > > > value=0
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks!
> > > > > > > > >
> > > > > > > > > Regards!
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Gergo
> > > > > > > >
> > > > > > > > > On Wed, 14 Jun 2023 at 15:13, Gergo Koteles
> > > > > > > > > <soyer@irl.hu>
> > > > > > > > > wrote:
> > > > > > > > > >
> > > > > > > > > > The Logitech BCC950 incorrectly reports 1 (the max
> > > > > > > > > > value)
> > > > > > > > > > for the default values of V4L2_CID_PAN_SPEED,
> > > > > > > > > > V4L2_CID_TILT_SPEED.
> > > > > > > > > >
> > > > > > > > > > This patch sets them to 0, which is the stop value.
> > > > > > > > > >
> > > > > > > > > > Previous discussion
> > > > > > > > > > Link:
> > > > > > > > > > https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Gergo Koteles <soyer@irl.hu>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
> > > > > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > index 5e9d3da862dd..e131958c0930 100644
> > > > > > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > @@ -444,9 +444,10 @@ static s32
> > > > > > > > > > uvc_ctrl_get_rel_speed(struct
> > > > > > > > > > uvc_control_mapping *mapping,
> > > > > > > > > >                 return -data[first+1];
> > > > > > > > > >         case UVC_GET_MAX:
> > > > > > > > > >         case UVC_GET_RES:
> > > > > > > > > > +               return data[first+1];
> > > > > > > > > >         case UVC_GET_DEF:
> > > > > > > > > >         default:
> > > > > > > > > > -               return data[first+1];
> > > > > > > > > > +               return 0;
> > > > > > > > > >         }
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> > > > > > > > > > --
> > > > > > > > > > 2.40.1
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Ricardo Ribalda
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > >
> > > >
> > >
> >
> >
> > --
> > Ricardo Ribalda
>


-- 
Ricardo Ribalda
