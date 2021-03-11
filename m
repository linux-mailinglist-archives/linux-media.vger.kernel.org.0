Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B24F337FEC
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 22:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhCKVwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 16:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhCKVvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 16:51:36 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165CFC061574;
        Thu, 11 Mar 2021 13:51:36 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 184so4122863ljf.9;
        Thu, 11 Mar 2021 13:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VWL2hdvWE8yxFugzonJANm0MQE5wMI2Tm0xlPLUiebg=;
        b=kVcu+9FYbu/EPpCCYjGckkjYE9Hmq1VggOFh3Hq+5c0ox3mKPJw4bVmD4uvDNw7+a5
         7COTtE9g+1c8RvKnMqaPhyq1fFwZKgMUTI8lk1H3z4QaVHbu+n7bNErahyrFOExZNe27
         izSNG9daGPEhMjeVQIf5KIUSM0Z7g3CSmcLHHTCOQwCXJO+rbq5ps860QO60gOQMiLbo
         qgkZZMTwTG3rXBPQXx2PDTVixTU3/twt5m4XGdcdsgND0TlqWFYr6k9ETePg0VY9H5Vq
         dd/CCYZcr/N1Is29jgsVxxaZFVsdaFbUzK4JbXerwWWQQpf9rTDq8PssQG1b/x7iDqFL
         YtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VWL2hdvWE8yxFugzonJANm0MQE5wMI2Tm0xlPLUiebg=;
        b=LQrl+IrmCueWZZb+NH3cCOCfQUOaHL7PwdaZRQPS9FXxdLGX6UG8pGfXC45iaNeeU4
         Nay6Cx7R3KOFw/ScOkR2rPQfraulnJXInpfr0bz/Dycx7tfHRh2cN0Jr+8C+sw9htD9b
         Rrmn0um7vJzo+uOvoIBtV3ly7EVUOMSQYP6X75zfuHbwHspMiWRQLaiI8x3V1Y2ip3WM
         aVAVy2OEbVS++NrMZv7yC1WGODbkMsN9qjpaRVqnTGiFjlH6j0e+5DSUu2CjrXf61IXf
         jz0ihQX5rZ8DkTySYZzShIGr4qtjWIQcIgagiNLQBJjSZHaPF4R/Xcy73beolAaDDZiU
         Lewg==
X-Gm-Message-State: AOAM533KlVV1LW8Rfl9+smDnBVmFPXXf2Bih2t3Ig+kgPRnQz1xKrXcN
        1nJDR3mpM8gQ89FDSY+ng759ePQpwX6nW2YSmc5ZqUI52Zi+xg==
X-Google-Smtp-Source: ABdhPJxMLb8RWEI/keYCNxwHCJ2lmrzl+gJ737rNjqic7IHQmrx5b78nJt43K2G0SMjZsCxkcyq4uCMWFHgrrml+eXo=
X-Received: by 2002:a2e:878c:: with SMTP id n12mr572284lji.58.1615499494414;
 Thu, 11 Mar 2021 13:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-9-ribalda@chromium.org> <YEpCvQYGj/4bAncp@pendragon.ideasonboard.com>
In-Reply-To: <YEpCvQYGj/4bAncp@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 11 Mar 2021 22:51:18 +0100
Message-ID: <CAPybu_2UhCzOp56LWgnuoXPCWDhQ2GfC3jsKejqDFTW4k4jiEg@mail.gmail.com>
Subject: Re: [PATCH 07/10] media: uvcvideo: set error_idx to count on EACCESS
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Mar 11, 2021 at 5:20 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.

Thank you for the review :)

>
> On Thu, Mar 11, 2021 at 01:20:37PM +0100, Ricardo Ribalda wrote:
> > According to the doc:
>
> The previous paragraph states:
>
> This check is done to avoid leaving the hardware in an inconsistent
> state due to easy-to-avoid problems. But it leads to another problem:
> the application needs to know whether an error came from the validation
> step (meaning that the hardware was not touched) or from an error during
> the actual reading from/writing to hardware.

I think we wrote his standard when we were young and naive ;)

>
> > The, in hindsight quite poor, solution for that is to set error_idx to
> > count if the validation failed.
> >
> > Fixes v4l2-compliance:
> > Control ioctls (Input 0):
> >                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 625c216c46b5..9b6454bb2f28 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1076,7 +1076,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> >               ret = uvc_ctrl_get(chain, ctrl);
> >               if (ret < 0) {
> >                       uvc_ctrl_rollback(handle);
> > -                     ctrls->error_idx = i;
> > +                     ctrls->error_idx = (ret == -EACCES) ?
> > +                                             ctrls->count : i;
>
> No need for parentheses.

I really like my parenthesis before the ? :. Can I leave it? :)

If it bothers you a lot I remove it, but I like to delimit where the
ternary operators end.
>
> I'm not sure this is correct though. -EACCES is returned by
> __uvc_ctrl_get() when the control is found and is a write-only control.
> The uvc_ctrl_get() calls for the previous controls will have potentially
> touched the device to read the current control value if it wasn't cached
> already, to this contradicts the rationale from the specification.
>
> I understand the need for this when setting controls, but when reading
> them, it's more puzzling, as the interactions with the hardware to read
> the controls are not supposed to affect the hardware state in a way that
> applications should care about. It may be an issue in the V4L2
> specification.

I have no strong opinions in both directions. If v4l2-compliance is
the de-facto standard I believe we should keep this patch or change
the compliance test.

Hans, what do think?

>
> >                       return ret;
> >               }
> >       }
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
