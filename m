Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE822105F56
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 05:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKVEx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 23:53:58 -0500
Received: from mail-ed1-f43.google.com ([209.85.208.43]:37157 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKVEx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 23:53:58 -0500
Received: by mail-ed1-f43.google.com with SMTP id k14so4828894eds.4
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 20:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUQljJ0g2XH2L09exl/wuVjWyY90drvZH+wz0MEdxts=;
        b=cxQ57hAVi7WpP8mht5BPDva9F760O0q6XLLMwqDpnrpVfuBSm6x4Tf8WGu35VfTNDg
         yigpFvl35GJaYYjgtoa9mfOf/aWGezI3WxphDia7Ze0qSJmNxAFnWSxf2yCf3uKV4EWy
         MjC23zEVFybrGo+D1nrY+rzp9gN2OqsD1Bj+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUQljJ0g2XH2L09exl/wuVjWyY90drvZH+wz0MEdxts=;
        b=uY54m9S1dTzZ6bWZ88Er/MqhKTl9MRx5UMtpithmmC5pkIK+TUCj+ANBrimoSVg9jf
         r4mpPPJWVtHhBh4Bo2Z/S/OC5/kKPN+H1aTbIiuyXnP97LVyIEeTSt47uNObe5HCVCys
         1qR02lsyPkDGXMMO2JS+v/nrPDekahgHswkZNPhoSaT+VpDwQvu0t039UvenJ8+lnfeC
         VoE9uh5Md3v08aovTPtggH+lCsLu6J7+OGk2K6Y9sgVXDVYUXeYP8W7i5Y/kbNzivUqb
         7T8hy+ZHLSJVMZiz3JBENeqk3FnfYDQuQDwcowd7iNZ/DJwB67YcfaE1+JF3WtoQpboo
         yG+w==
X-Gm-Message-State: APjAAAUyxFRogbGdDPFY5s3UZ5wQ0gqr43gFxKdoDnI0O+SdF0+3TanR
        9Yc7diSrEnqjJo03/flFQwGaTiMnJgM=
X-Google-Smtp-Source: APXvYqwUdsARBaNESttbbxsbWWywb5I82spuz8YcNn3LSc2ZGWTQYCt4Q0p0A4M5NhKQVAZVRmGnmQ==
X-Received: by 2002:a17:906:1fcf:: with SMTP id e15mr18623212ejt.317.1574398435659;
        Thu, 21 Nov 2019 20:53:55 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id p5sm241795edi.9.2019.11.21.20.53.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 20:53:54 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id y11so3933941wrt.6
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 20:53:54 -0800 (PST)
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr15383314wrx.113.1574398433615;
 Thu, 21 Nov 2019 20:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20191007162913.250743-2-jacopo@jmondi.org> <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain> <20191008080634.GC633@amd>
 <20191008082041.476a2soclry6qn3v@uno.localdomain> <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
 <20191023142717.GA22854@duo.ucw.cz> <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com>
 <20191026204815.GA28970@pendragon.ideasonboard.com> <CAAFQd5BgRrtjb_WfTi+C-F+SoWhV_=JLH4TQ5_HDWogM4APiVg@mail.gmail.com>
 <20191121160244.s6nfgux27covvx7r@uno.localdomain>
In-Reply-To: <20191121160244.s6nfgux27covvx7r@uno.localdomain>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 22 Nov 2019 13:53:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DZHnJrE4yrrxME9_1YO-GUEZJGbTH_UkV0XmuPdt+uSw@mail.gmail.com>
Message-ID: <CAAFQd5DZHnJrE4yrrxME9_1YO-GUEZJGbTH_UkV0XmuPdt+uSw@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 22, 2019 at 1:00 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Tomasz,
>
> On Mon, Nov 18, 2019 at 08:32:35PM +0900, Tomasz Figa wrote:
> > On Sun, Oct 27, 2019 at 5:48 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Fri, Oct 25, 2019 at 03:29:49PM +0900, Tomasz Figa wrote:
> > > > On Wed, Oct 23, 2019 at 11:27 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > > >
> > > > > Hi!
> > > > >
> > > > > > > I'm skeptical about adding now a property for a device that we don't
> > > > > > > support, because we -now- think it's a good idea. I might be wrong,
> > > > > > > but my assumption is that when someone will want to support an
> > > > > > > 'advanced' device, it's easy to add "movable" or whatever else to the
> > > > > > > list of accepted properties values. Am I wrong in assuming this? As
> > > > > > > long as "front" "back" and "external" will stay supported for backward
> > > > > > > DTB compatibility it should be fine, right ?
> > > > > >
> > > > > > The basic rule is that you should not define things unless you KNOW that
> > > > > > they will be needed. So when we actually see new devices for which
> > > > > > "front", "back" or "external" does not fit, then new names can be
> > > > > > created.
> > > > >
> > > > > > It's impossible to cover all situations since we can't predict the future.
> > > > > > The best we can do is to allow for future extensions.
> > > > >
> > > > > Those devices are already being sold, and yes, they are running linux
> > > > > (with some patches probably).
> > > > >
> > > > > I believe it would be better to specify "this camera is selfie --
> > > > > takes pictures of the user" vs. "this is main camera -- takes pictures
> > > > > of what user is looking at".
> > > >
> > > > FWIW, Android and Chrome OS call those "user-facing" and
> > > > "world-facing" respectively.
> > >
> > > Isn't that equivalent to what Jacopo is proposing though ? If we define
> > > the orientation of the device relatively to its user (e.g. for all
> > > cellphone devices the front is defined as the side facing the user), and
> > > the location of the camera relative to the device, we get the same
> > > information.
> >
> > Yes, it is the same. Although having some consistency in the naming
> > isn't necessarily a bad idea, is it? :)
> >
> > That said, looks like the naming in the Android world isn't consistent
> > either. The high level Java/Kotlin API uses "front" and "back":
> > https://developer.android.com/reference/android/hardware/Camera.CameraInfo.html#summary
> >
> > How about making this property a string instead? It would make it more
> > readable in the dts and more expressive for some weird cases in the
> > future, e.g. "front+30deg", "vector" (and a vector could be given in
> > another property), etc.
>
> Why do you think this would be better ? We could provide macros if we
> want to have users expressing location in a more 'expressive' form
> than using a numerical id. I would avoid parsing strings to be honest.
>
> Would you be ok with this ?
>
> I don't see any core v4l2 header in include/dt-bindings/media/ but
> that could be a good occasion to add one ?

As an afterthought, there is no flexibility issue even with an enum.
We could still have the "location" property set to the enum
corresponding to front and then if we need to rotate it relative to
that position we could define another property called "rotation".

Feel free to add my Acked-by.

Best regards,
Tomasz
