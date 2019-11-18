Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB3D100439
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 12:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKRLcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 06:32:51 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:33439 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbfKRLcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 06:32:51 -0500
Received: by mail-ed1-f51.google.com with SMTP id a24so13233498edt.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 03:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B++y5FIKNLacy6yRej4wVKd6Lm+XqX9oOEI5Tn6jnwc=;
        b=Gpkyl1TdRPJPwKzJ8i2w0QpdWNp8B3/PF+kRRa1C477J6+vqNFZqwN7j1cHWHBru1d
         XdpqckJ1ox6zuIbUFSZoPuj5gTZDe3aUJ+IeLRNwTMejySgChw+gano+kM1XAj6jpX++
         3JKGsoqazH8SrbEfqJ8N1Az/k/f0okMr8uEOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B++y5FIKNLacy6yRej4wVKd6Lm+XqX9oOEI5Tn6jnwc=;
        b=pf8dWFQuN6h5MVaz0JNIZOALTzycs89336eoQULDYvbO2mEyYmvC6B/3VmeKHNd3LS
         ppAMWawk86OCxc0TUip9zrx0vmxs4amzi54HAhj81mpiRHU7L0D0bkOKo96edbpvrraA
         HpUFZw2exJc00M2WKQvRuZqUHF1oz+Xc3X0RoSl6yA2OFyYIsBgHoR7VdNFw6Pk8xXjc
         VQjyFvGOdJWO1MMPbdQr4c7h6TBDwOZsMKhqYu/o5OBFqMiyRpGrmsrA8bueWw76zrRh
         rI0qqKJFZ3A+bBP9dQGhbiYLOq+uAhJosoKD5Er4iIMaIwvRqKJLLQCsakUqMhlHpGyq
         ThXQ==
X-Gm-Message-State: APjAAAWARHNgHZijRcwKAZ2H7i7WYTSxFZ34xvsmF0ag0KKL02SwxlAk
        p0DwgOw1eywOv+vi8bP7IRt+5Plke+A=
X-Google-Smtp-Source: APXvYqzE9y359OAvenOia68bG2I+lyZZygYS/SGR7dSkdmCnMVjIblSv1Namm4VRS2bfrrIT7+Je+Q==
X-Received: by 2002:a17:906:32d3:: with SMTP id k19mr25952303ejk.75.1574076769247;
        Mon, 18 Nov 2019 03:32:49 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id d15sm520475edj.83.2019.11.18.03.32.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2019 03:32:48 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id u18so17017495wmc.3
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 03:32:48 -0800 (PST)
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr30699485wmc.113.1574076767780;
 Mon, 18 Nov 2019 03:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20191007162913.250743-1-jacopo@jmondi.org> <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd> <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd> <20191008082041.476a2soclry6qn3v@uno.localdomain>
 <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl> <20191023142717.GA22854@duo.ucw.cz>
 <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com> <20191026204815.GA28970@pendragon.ideasonboard.com>
In-Reply-To: <20191026204815.GA28970@pendragon.ideasonboard.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 18 Nov 2019 20:32:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BgRrtjb_WfTi+C-F+SoWhV_=JLH4TQ5_HDWogM4APiVg@mail.gmail.com>
Message-ID: <CAAFQd5BgRrtjb_WfTi+C-F+SoWhV_=JLH4TQ5_HDWogM4APiVg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 27, 2019 at 5:48 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Oct 25, 2019 at 03:29:49PM +0900, Tomasz Figa wrote:
> > On Wed, Oct 23, 2019 at 11:27 PM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > Hi!
> > >
> > > > > I'm skeptical about adding now a property for a device that we don't
> > > > > support, because we -now- think it's a good idea. I might be wrong,
> > > > > but my assumption is that when someone will want to support an
> > > > > 'advanced' device, it's easy to add "movable" or whatever else to the
> > > > > list of accepted properties values. Am I wrong in assuming this? As
> > > > > long as "front" "back" and "external" will stay supported for backward
> > > > > DTB compatibility it should be fine, right ?
> > > >
> > > > The basic rule is that you should not define things unless you KNOW that
> > > > they will be needed. So when we actually see new devices for which
> > > > "front", "back" or "external" does not fit, then new names can be
> > > > created.
> > >
> > > > It's impossible to cover all situations since we can't predict the future.
> > > > The best we can do is to allow for future extensions.
> > >
> > > Those devices are already being sold, and yes, they are running linux
> > > (with some patches probably).
> > >
> > > I believe it would be better to specify "this camera is selfie --
> > > takes pictures of the user" vs. "this is main camera -- takes pictures
> > > of what user is looking at".
> >
> > FWIW, Android and Chrome OS call those "user-facing" and
> > "world-facing" respectively.
>
> Isn't that equivalent to what Jacopo is proposing though ? If we define
> the orientation of the device relatively to its user (e.g. for all
> cellphone devices the front is defined as the side facing the user), and
> the location of the camera relative to the device, we get the same
> information.

Yes, it is the same. Although having some consistency in the naming
isn't necessarily a bad idea, is it? :)

That said, looks like the naming in the Android world isn't consistent
either. The high level Java/Kotlin API uses "front" and "back":
https://developer.android.com/reference/android/hardware/Camera.CameraInfo.html#summary

How about making this property a string instead? It would make it more
readable in the dts and more expressive for some weird cases in the
future, e.g. "front+30deg", "vector" (and a vector could be given in
another property), etc.

Best regards,
Tomasz
