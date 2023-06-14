Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0B57302DA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 17:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343511AbjFNPH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 11:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343494AbjFNPHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 11:07:25 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37BB19B
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:07:24 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f6a494810fso18963691cf.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686755243; x=1689347243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwIpsmcme6K1FqhzFLRhe5T/UnBUqH6CDz+6r2yPnJQ=;
        b=mgHJT1wWE+GvsPs/sH/+i0+DQ2mF7Z1Zjp1oK33TP6FN7VpPwZPFEz/4le8a989u5e
         UA/ocUn3v45tt1bJqU/DVkELULdvb9Pqa/NMS0flAh3w+yQt73Cfv4VklN+0KYUBVZgs
         auu525PBXTAXJe3JwghGXwTGztsQiCdbangDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755243; x=1689347243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwIpsmcme6K1FqhzFLRhe5T/UnBUqH6CDz+6r2yPnJQ=;
        b=Em7HpXH/wn9+7GgM53y49AUgah4kUH7Qb4k198Rhnc1d2F1BlPF8BAFeCM0USVPkq5
         nNYdeCadKIC2nU1Y6x7wM3maMP5tBiL93AfdbIBK3u6jVq+yjSvDmLKa4r1qKdETq5CK
         DWwJn93m73Bt7E2kdaNyNuFF43BUVbLdXt5oO7bwfu7DQattjCa/hl3XMyeJWR5GgLF1
         vBLtNKIIJgNTFNVobpx6Urt35cHvIdZ4G1pDOvHQGfh6R4TFjkhNdn98rZAu0CyMdmbt
         bDBipTZ3x3f6zvElafMjxJPbgtTSBu3p8NiO1OSV77oysZUJT9daMJkajdCBTSuRDcSM
         sxbg==
X-Gm-Message-State: AC+VfDzmCdBUtWH62qV7qb5YS3GDP+u2XG670sBLe2GZZPwnIGog2vbG
        6SU24QqluUYJACUmN3tmea9z5pCrfosXNgsLQEo=
X-Google-Smtp-Source: ACHHUZ4J9Q2i7fGGEjNBPj3e/2yZ0kSZUIB6FoiIoR+TYuKstBI3iDIPU5qTxMRissYRPZ8Qx2JLeg==
X-Received: by 2002:ac8:5c4e:0:b0:3f9:d70f:ff6d with SMTP id j14-20020ac85c4e000000b003f9d70fff6dmr2987966qtj.25.1686755243417;
        Wed, 14 Jun 2023 08:07:23 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id c4-20020ac84e04000000b003f6a607cf22sm5085663qtw.84.2023.06.14.08.07.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 08:07:23 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-62de1a3e354so19487986d6.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:07:22 -0700 (PDT)
X-Received: by 2002:ad4:5fce:0:b0:625:a982:857 with SMTP id
 jq14-20020ad45fce000000b00625a9820857mr17701973qvb.50.1686755242360; Wed, 14
 Jun 2023 08:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
 <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com> <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu>
In-Reply-To: <d50992e1f4709eb8f0a34120b70f2b02d3e655e5.camel@irl.hu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Jun 2023 17:07:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
Message-ID: <CANiDSCshBFwE+HDqgQ7tc33gNtUuowP5s+bprqxaAF6D6HBO_w@mail.gmail.com>
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

Hi Soyer


On Wed, 14 Jun 2023 at 16:59, soyer <soyer@irl.hu> wrote:
>
> Hi Ricardo
>
> On Wed, 2023-06-14 at 16:19 +0200, Ricardo Ribalda wrote:
> > [Now in plain text mode]
> >
> > Hi Gergo
> >
> > Doesn't your patch affect pan and tilt for all the cameras, not only
> > the BCC950?
> >
> Yes, it affects all cameras that support CT_PANTILT_RELATIVE_CONTROL.
>
> > Also it seems that 1 means that device does not support programmable
> > speed. Is that correct?
> >
> > ```
> > The bPanSpeed field is used to specify the speed of the movement for
> > the Pan direction. A low
> > number indicates a slow speed and a high number indicates a higher
> > speed. The GET_MIN,
> > GET_MAX and GET_RES requests are used to retrieve the range and
> > resolution for this field.
> > The GET_DEF request is used to retrieve the default value for this
> > field. If the control does not
> > support speed control for the Pan control, it will return the value 1
> > in this field for all these
> > requests.
> > ```

It seems to me that the module is compliant to the standard. It
returns 1 as GET_DEF because it does not support speed control.

Maybe you should ignore the speed control instead of changing its default value?


> >
> I started from the V4L2 control description.
>
> V4L2_CID_PAN_SPEED (integer)
> This control turns the camera horizontally at the specific speed. The
> unit is undefined. A positive value moves the camera to the right
> (clockwise when viewed from above), a negative value to the left. A
> value of zero stops the motion if one is in progress and has no effect
> otherwise.
>
> And this is why I thought that 1 is not a good default value, because
> it moves the camera.
> The other V4L2 controls have a default value that I can safely set the
> controls to.
>
> Are you using it to determine if the camera supports speed control?
>
> > When you program that value do you see any difference on the device?
> > What is max, min and res?
> >
>
> No, it works the same way.
> Only the default value changes (from 1 to 0)
>
>  pan_speed 0x009a0920 (int)    : min=-1 max=1 step=1 default=0 value=0
> tilt_speed 0x009a0921 (int)    : min=-1 max=1 step=1 default=0 value=0
>
>
>
> >
> > Thanks!
> >
> > Regards!
> >
> >
>
> Thanks,
> Gergo
>
> > On Wed, 14 Jun 2023 at 15:13, Gergo Koteles <soyer@irl.hu> wrote:
> > >
> > > The Logitech BCC950 incorrectly reports 1 (the max value)
> > > for the default values of V4L2_CID_PAN_SPEED,
> > > V4L2_CID_TILT_SPEED.
> > >
> > > This patch sets them to 0, which is the stop value.
> > >
> > > Previous discussion
> > > Link:
> > > https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
> > >
> > > Signed-off-by: Gergo Koteles <soyer@irl.hu>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> > > b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 5e9d3da862dd..e131958c0930 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct
> > > uvc_control_mapping *mapping,
> > >                 return -data[first+1];
> > >         case UVC_GET_MAX:
> > >         case UVC_GET_RES:
> > > +               return data[first+1];
> > >         case UVC_GET_DEF:
> > >         default:
> > > -               return data[first+1];
> > > +               return 0;
> > >         }
> > >  }
> > >
> > >
> > > base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> > > --
> > > 2.40.1
> > >
> >
> >
>


-- 
Ricardo Ribalda
