Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4DD7303A5
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 17:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343736AbjFNPWC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 14 Jun 2023 11:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343695AbjFNPV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 11:21:59 -0400
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31329C3
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:21:57 -0700 (PDT)
Received: from [192.168.2.4] (softdnserr [::ffff:81.182.137.62])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071446.000000006489DB14.003B4E84; Wed, 14 Jun 2023 17:21:56 +0200
Message-ID: <944fc6422e73a7b1334fdc1856bdf0480c7fc4e9.camel@irl.hu>
Subject: Re: [PATCH] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0 as
 default
From:   Gergo Koteles <soyer@irl.hu>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Wed, 14 Jun 2023 17:21:45 +0200
In-Reply-To: <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com>
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
         <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
         <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu>
         <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
         <CANiDSCt193avx+fKgujT7u-4hguEyq=kmfULG75F1LK=fjMLhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,
On Wed, 2023-06-14 at 17:08 +0200, Ricardo Ribalda wrote:
> On Wed, 14 Jun 2023 at 17:07, Ricardo Ribalda <ribalda@chromium.org>
> wrote:
> > 
> > Hi Soyer
> > 
> > 
> > On Wed, 14 Jun 2023 at 16:59, soyer <soyer@irl.hu> wrote:
> > > 
> > > Hi Ricardo
> > > 
> > > On Wed, 2023-06-14 at 16:19 +0200, Ricardo Ribalda wrote:
> > > > [Now in plain text mode]
> > > > 
> > > > Hi Gergo
> > > > 
> > > > Doesn't your patch affect pan and tilt for all the cameras, not
> > > > only
> > > > the BCC950?
> > > > 
> > > Yes, it affects all cameras that support
> > > CT_PANTILT_RELATIVE_CONTROL.
> > > 
> > > > Also it seems that 1 means that device does not support
> > > > programmable
> > > > speed. Is that correct?
> > > > 
> > > > ```
> > > > The bPanSpeed field is used to specify the speed of the
> > > > movement for
> > > > the Pan direction. A low
> > > > number indicates a slow speed and a high number indicates a
> > > > higher
> > > > speed. The GET_MIN,
> > > > GET_MAX and GET_RES requests are used to retrieve the range and
> > > > resolution for this field.
> > > > The GET_DEF request is used to retrieve the default value for
> > > > this
> > > > field. If the control does not
> > > > support speed control for the Pan control, it will return the
> > > > value 1
> > > > in this field for all these
> > > > requests.
> > > > ```
> > 
> > It seems to me that the module is compliant to the standard. It
> > returns 1 as GET_DEF because it does not support speed control.
> > 
> > Maybe you should ignore the speed control instead of changing its
> > default value?
> 
> ( this is the standard I am refering to: 4.2.2.1.15 PanTilt
> (Relative) Control
> 
>  https://www.usb.org/document-library/video-class-v15-document-set )
> > 
> > 

It's a different API. V4L2 control values are not the same as the UVC
standard control values.

Eg the V4L2_CID_PAN_SPEED control value calculated from 
CT_PANTILT_RELATIVE_CONTROL's bPanRelative and bPanSpeed value.

It only bothers me that I have to handle these two controls
differently.

> > > > 
> > > I started from the V4L2 control description.
> > > 
> > > V4L2_CID_PAN_SPEED (integer)
> > > This control turns the camera horizontally at the specific speed.
> > > The
> > > unit is undefined. A positive value moves the camera to the right
> > > (clockwise when viewed from above), a negative value to the left.
> > > A
> > > value of zero stops the motion if one is in progress and has no
> > > effect
> > > otherwise.
> > > 
> > > And this is why I thought that 1 is not a good default value,
> > > because
> > > it moves the camera.
> > > The other V4L2 controls have a default value that I can safely
> > > set the
> > > controls to.
> > > 
> > > Are you using it to determine if the camera supports speed
> > > control?
> > > 
> > > > When you program that value do you see any difference on the
> > > > device?
> > > > What is max, min and res?
> > > > 
> > > 
> > > No, it works the same way.
> > > Only the default value changes (from 1 to 0)
> > > 
> > >  pan_speed 0x009a0920 (int)    : min=-1 max=1 step=1 default=0
> > > value=0
> > > tilt_speed 0x009a0921 (int)    : min=-1 max=1 step=1 default=0
> > > value=0
> > > 
> > > 
> > > 
> > > > 
> > > > Thanks!
> > > > 
> > > > Regards!
> > > > 
> > > > 
> > > 
> > > Thanks,
> > > Gergo
> > > 
> > > > On Wed, 14 Jun 2023 at 15:13, Gergo Koteles <soyer@irl.hu>
> > > > wrote:
> > > > > 
> > > > > The Logitech BCC950 incorrectly reports 1 (the max value)
> > > > > for the default values of V4L2_CID_PAN_SPEED,
> > > > > V4L2_CID_TILT_SPEED.
> > > > > 
> > > > > This patch sets them to 0, which is the stop value.
> > > > > 
> > > > > Previous discussion
> > > > > Link:
> > > > > https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
> > > > > 
> > > > > Signed-off-by: Gergo Koteles <soyer@irl.hu>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > index 5e9d3da862dd..e131958c0930 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > @@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > > > > uvc_control_mapping *mapping,
> > > > >                 return -data[first+1];
> > > > >         case UVC_GET_MAX:
> > > > >         case UVC_GET_RES:
> > > > > +               return data[first+1];
> > > > >         case UVC_GET_DEF:
> > > > >         default:
> > > > > -               return data[first+1];
> > > > > +               return 0;
> > > > >         }
> > > > >  }
> > > > > 
> > > > > 
> > > > > base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> > > > > --
> > > > > 2.40.1
> > > > > 
> > > > 
> > > > 
> > > 
> > 
> > 
> > --
> > Ricardo Ribalda
> 
> 
> 

