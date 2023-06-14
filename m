Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46B8730975
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbjFNUxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjFNUx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:53:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694F119B5
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:53:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47623838;
        Wed, 14 Jun 2023 22:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686775974;
        bh=nH/cLAm124VCl0qV3E8JoMW3/x2sy4wut7LgEVM5IQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JJH3LSklcIDePyJzXQXl28YPSLuUbxBZzWLWgYF/kAJr/bqHUGsmO5SljZ0thcyj5
         Vh9n4nMswk7qLJfLYqu1XbzjWAwy0g7NLKFND8U/1MfCM7QCeuzjbSQNB3HyVx8uIo
         svtzoFuMPCqMyFnEC+TmkVdf3OOevsYTygbkisUE=
Date:   Wed, 14 Jun 2023 23:53:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Gergo Koteles <soyer@irl.hu>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0 as default
Message-ID: <20230614205325.GA19754@pendragon.ideasonboard.com>
References: <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
 <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu>
 <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
 <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com>
 <944fc6422e73a7b1334fdc1856bdf0480c7fc4e9.camel@irl.hu>
 <CANiDSCupgF6m6T3R=w7BxqVe672cPHk05Yj0yqiW3hLp+GEkdw@mail.gmail.com>
 <3480de8b7cfd17dc93165d816fa624fdba75d0e6.camel@irl.hu>
 <CANiDSCs22ztCf8zXVRJS47ZwroTDy_1tOG3OO+tpdtXrxm-j_A@mail.gmail.com>
 <0d2c103938ce4d020553711e4b0b4ce1c38a0152.camel@irl.hu>
 <CANiDSCt-xg1yVPH3UYHGz1vAa349HK-Hy-20n9xorasgdED2mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCt-xg1yVPH3UYHGz1vAa349HK-Hy-20n9xorasgdED2mg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Jun 14, 2023 at 10:15:43PM +0200, Ricardo Ribalda wrote:
> On Wed, 14 Jun 2023 at 18:56, Gergo Koteles <soyer@irl.hu> wrote:
> > On Wed, 2023-06-14 at 18:29 +0200, Ricardo Ribalda wrote:
> > > On Wed, 14 Jun 2023 at 17:46, Gergo Koteles <soyer@irl.hu> wrote:
> > > > On Wed, 2023-06-14 at 17:25 +0200, Ricardo Ribalda wrote:
> > > > > On Wed, 14 Jun 2023 at 17:22, Gergo Koteles <soyer@irl.hu> wrote:
> > > > > > On Wed, 2023-06-14 at 17:08 +0200, Ricardo Ribalda wrote:
> > > > > > > On Wed, 14 Jun 2023 at 17:07, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > > > > > > On Wed, 14 Jun 2023 at 16:59, soyer <soyer@irl.hu> wrote:
> > > > > > > > > On Wed, 2023-06-14 at 16:19 +0200, Ricardo Ribalda wrote:
> > > > > > > > > > [Now in plain text mode]
> > > > > > > > > >
> > > > > > > > > > Hi Gergo
> > > > > > > > > >
> > > > > > > > > > Doesn't your patch affect pan and tilt for all the
> > > > > > > > > > cameras,
> > > > > > > > > > not
> > > > > > > > > > only
> > > > > > > > > > the BCC950?

/me wonders which e-mail client is to be blamed for this

> > > > > > > > > >
> > > > > > > > > Yes, it affects all cameras that support
> > > > > > > > > CT_PANTILT_RELATIVE_CONTROL.
> > > > > > > > >
> > > > > > > > > > Also it seems that 1 means that device does not support
> > > > > > > > > > programmable
> > > > > > > > > > speed. Is that correct?
> > > > > > > > > >
> > > > > > > > > > ```
> > > > > > > > > > The bPanSpeed field is used to specify the speed of the
> > > > > > > > > > movement for
> > > > > > > > > > the Pan direction. A low
> > > > > > > > > > number indicates a slow speed and a high number
> > > > > > > > > > indicates a
> > > > > > > > > > higher
> > > > > > > > > > speed. The GET_MIN,
> > > > > > > > > > GET_MAX and GET_RES requests are used to retrieve the
> > > > > > > > > > range
> > > > > > > > > > and
> > > > > > > > > > resolution for this field.
> > > > > > > > > > The GET_DEF request is used to retrieve the default
> > > > > > > > > > value
> > > > > > > > > > for
> > > > > > > > > > this
> > > > > > > > > > field. If the control does not
> > > > > > > > > > support speed control for the Pan control, it will
> > > > > > > > > > return
> > > > > > > > > > the
> > > > > > > > > > value 1
> > > > > > > > > > in this field for all these
> > > > > > > > > > requests.
> > > > > > > > > > ```
> > > > > > > >
> > > > > > > > It seems to me that the module is compliant to the
> > > > > > > > standard. It
> > > > > > > > returns 1 as GET_DEF because it does not support speed
> > > > > > > > control.
> > > > > > > >
> > > > > > > > Maybe you should ignore the speed control instead of
> > > > > > > > changing
> > > > > > > > its
> > > > > > > > default value?
> > > > > > >
> > > > > > > ( this is the standard I am refering to: 4.2.2.1.15 PanTilt
> > > > > > > (Relative) Control
> > > > > > >
> > > > > > >
> > > > > > > https://www.usb.org/document-library/video-class-v15-document-set
> > > > > > > )
> > > > > > > >
> > > > > > > >
> > > > > >
> > > > > > It's a different API. V4L2 control values are not the same as
> > > > > > the
> > > > > > UVC
> > > > > > standard control values.
> > > > >
> > > > > What I am saying, is that if
> > > > > CT_PANTILT_RELATIVE_CONTROL.bPanSpeed.GET_DEF is 1 you should not
> > > > > create the mapping to
> > > > > V4L2_CID_PAN_SPEED
> > > > >
> > > > If I set V4L2_CID_PAN_SPEED to 1 (max), the BCC950 starts to move
> > > > at
> > > > maximum speed. This is what it should do according to description
> > > > of
> > > > the V4L2_CID_PAN_SPEED.
> > > >
> > > > My understanding is that, if the camera supports
> > > > CT_PANTILT_RELATIVE_CONTROL there should be a V4L2_CID_PAN_SPEED.
> > > > CT_PANTILT_RELATIVE_CONTROL.bPanSpeed.GET_DEF == 1 only says that
> > > > only
> > > > one speed is available not a range.
> > >
> > > I think I got confused by the names.
> > >
> > > Can you check if this works?
> > >
> > > ribalda@alco:~/work/linux$ git diff
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 5e9d3da862dd..abab2f4efc94 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -437,6 +437,7 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > > uvc_control_mapping *mapping,
> > >         s8 rel = (s8)data[first];
> > >
> > >         switch (query) {
> > > +       case UVC_GET_DEF:
> > >         case UVC_GET_CUR:
> > >                 return (rel == 0) ? 0 : (rel > 0 ? data[first+1]
> > >                                                  : -data[first+1]);
> > > @@ -444,7 +445,6 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > > uvc_control_mapping *mapping,
> > >                 return -data[first+1];
> > >         case UVC_GET_MAX:
> > >         case UVC_GET_RES:
> > > -       case UVC_GET_DEF:
> > >         default:
> > >                 return data[first+1];
> > >         }
> > > ribalda@alco:~/work/linux$
> > >
> > >
> >
> > It works this way also.
> > Should I send a new version?
> 
> I believe this is slightly better... but it is up to Laurent ;)

I'm not sure to see how it's better. UVC_GET_DEF is required by the UVC
specification to return 0 for the bPanRelative and bTiltRelative fields.
The above will thus return 0 if the device complies with the spec, or a
different value if it doesn't. Isn't it better to hardcode 0 ? Unless
I'm missing something, I think Gergo's original patch is better. The
commit message, however, needs improvements to explain the issue. The
Logitech BCC950 mention should be dropped as the problem isn't specific
to a particular camera.

> > > > > > Eg the V4L2_CID_PAN_SPEED control value calculated from
> > > > > > CT_PANTILT_RELATIVE_CONTROL's bPanRelative and bPanSpeed value.
> > > > > >
> > > > > > It only bothers me that I have to handle these two controls
> > > > > > differently.
> > > > > >
> > > > > > > > > >
> > > > > > > > > I started from the V4L2 control description.
> > > > > > > > >
> > > > > > > > > V4L2_CID_PAN_SPEED (integer)
> > > > > > > > > This control turns the camera horizontally at the
> > > > > > > > > specific
> > > > > > > > > speed.
> > > > > > > > > The
> > > > > > > > > unit is undefined. A positive value moves the camera to
> > > > > > > > > the
> > > > > > > > > right
> > > > > > > > > (clockwise when viewed from above), a negative value to
> > > > > > > > > the
> > > > > > > > > left.
> > > > > > > > > A
> > > > > > > > > value of zero stops the motion if one is in progress and
> > > > > > > > > has
> > > > > > > > > no
> > > > > > > > > effect
> > > > > > > > > otherwise.
> > > > > > > > >
> > > > > > > > > And this is why I thought that 1 is not a good default
> > > > > > > > > value,
> > > > > > > > > because
> > > > > > > > > it moves the camera.
> > > > > > > > > The other V4L2 controls have a default value that I can
> > > > > > > > > safely
> > > > > > > > > set the
> > > > > > > > > controls to.
> > > > > > > > >
> > > > > > > > > Are you using it to determine if the camera supports
> > > > > > > > > speed
> > > > > > > > > control?
> > > > > > > > >
> > > > > > > > > > When you program that value do you see any difference
> > > > > > > > > > on
> > > > > > > > > > the
> > > > > > > > > > device?
> > > > > > > > > > What is max, min and res?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > No, it works the same way.
> > > > > > > > > Only the default value changes (from 1 to 0)
> > > > > > > > >
> > > > > > > > >  pan_speed 0x009a0920 (int)    : min=-1 max=1 step=1
> > > > > > > > > default=0
> > > > > > > > > value=0
> > > > > > > > > tilt_speed 0x009a0921 (int)    : min=-1 max=1 step=1
> > > > > > > > > default=0
> > > > > > > > > value=0
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Thanks!
> > > > > > > > > >
> > > > > > > > > > Regards!
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > > Gergo
> > > > > > > > >
> > > > > > > > > > On Wed, 14 Jun 2023 at 15:13, Gergo Koteles
> > > > > > > > > > <soyer@irl.hu>
> > > > > > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > > The Logitech BCC950 incorrectly reports 1 (the max
> > > > > > > > > > > value)
> > > > > > > > > > > for the default values of V4L2_CID_PAN_SPEED,
> > > > > > > > > > > V4L2_CID_TILT_SPEED.
> > > > > > > > > > >
> > > > > > > > > > > This patch sets them to 0, which is the stop value.
> > > > > > > > > > >
> > > > > > > > > > > Previous discussion
> > > > > > > > > > > Link:
> > > > > > > > > > > https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Gergo Koteles <soyer@irl.hu>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
> > > > > > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > > index 5e9d3da862dd..e131958c0930 100644
> > > > > > > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > > > > > @@ -444,9 +444,10 @@ static s32
> > > > > > > > > > > uvc_ctrl_get_rel_speed(struct
> > > > > > > > > > > uvc_control_mapping *mapping,
> > > > > > > > > > >                 return -data[first+1];
> > > > > > > > > > >         case UVC_GET_MAX:
> > > > > > > > > > >         case UVC_GET_RES:
> > > > > > > > > > > +               return data[first+1];
> > > > > > > > > > >         case UVC_GET_DEF:
> > > > > > > > > > >         default:
> > > > > > > > > > > -               return data[first+1];
> > > > > > > > > > > +               return 0;
> > > > > > > > > > >         }
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360

-- 
Regards,

Laurent Pinchart
