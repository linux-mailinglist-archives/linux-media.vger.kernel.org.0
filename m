Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA6238E410
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhEXKdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbhEXKdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:33:03 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FFBC061574
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 03:31:35 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso11148343wmm.3
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vMWVKs1JTtne6DONBYbw+8L6Hg2mrUi7VKxUmAqK9nc=;
        b=Xh6Es5DRo26hM3Plt6dQ33HvYP+A0JQCSaRwAmwdB+ZoBB5ynYz43JpTu5Ocy6oJFP
         I5RmTUdmvzZT6tApWUmqXsu4NduYZvvPXkAQ69ilEwyWHY11514/5g4F9OPZiei8OonC
         JnVJeW01cbT5OrWs2UKrS74pLOIY2NLa+G9r180iZVXg21Lu1VEsTmh7+dBUsNcRe90W
         6Y75KdEZPn0tBccL7AkErf1O4PnhBfg7oKmNCt/HvysFdXjX4xlD+Ytfr0il/l7bB6Rh
         tSshOdR8uwminTwQZ55q7+tfAXaKn6X9AJOAoT6mEtH+8Y9dotEMKZk+vnurzEvaee5o
         5N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vMWVKs1JTtne6DONBYbw+8L6Hg2mrUi7VKxUmAqK9nc=;
        b=t6yoGVB36dbJDPgugCHjUww/mHMsr1mny/diK7FazOQqkbWsb5F859yXh9RcOwB3mC
         RpCCa911l9y88/kmFqQrq0XAHbUDX7spFbrhR6gERI8Y0BevosOwxbD4LPcBjjFxJmyf
         7WiEjzEgpWmBNvpn+GfqqN4nI6CSnyLq2jWgStfhwXbNLhjcXRIdmYe1wTk+BPPu/cZt
         r6BU9ijI+H8qNICSjpNbCpBGXfTJhju52qcvv7TZCe7f0HB/6UfrCFKmJN/NRRjCyOGH
         DHkpVAYfMQ0hPjwlEzlkJHq187JwXmUNO6I5DNbbNNrGe6dcoXVFdCjIbaxo2Lhm33xG
         yxqA==
X-Gm-Message-State: AOAM532xE5eKL/oAMZX2U2hCXdO6NRLXeeMakhjMHKerPh8MrFi7UwsR
        8nqb0BEjnmlgbUKWtBFRApk3kcP/qnCQiBRAdzjYeA==
X-Google-Smtp-Source: ABdhPJwU4GKReY1df/x0G0FdCA5LtZLoLE9V8bjanLspYY9hJu3SPY2IKfIUHbyAoZpS472M6E+XrrsbjYMf2XDC3J0=
X-Received: by 2002:a05:600c:4a23:: with SMTP id c35mr19414959wmp.130.1621852293802;
 Mon, 24 May 2021 03:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
 <20210517100240.3323-3-david.plowman@raspberrypi.com> <20210519190121.GJ3@valkosipuli.retiisi.eu>
 <20210519190148.GK3@valkosipuli.retiisi.eu> <YKr8Qc65KSFBZJ2s@pendragon.ideasonboard.com>
In-Reply-To: <YKr8Qc65KSFBZJ2s@pendragon.ideasonboard.com>
From:   David Plowman <david.plowman@raspberrypi.com>
Date:   Mon, 24 May 2021 11:31:22 +0100
Message-ID: <CAHW6GYJrhWDUEhexGMAVBJDs0GG=DzhE9OjCCOzMcw0doSp_6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Laurent, everyone

Thanks for the feedback.

On Mon, 24 May 2021 at 02:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Wed, May 19, 2021 at 10:01:49PM +0300, Sakari Ailus wrote:
> > Added Laurent to cc.
> >
> > On Wed, May 19, 2021 at 10:01:21PM +0300, Sakari Ailus wrote:
> > > Hi David,
> > >
> > > Thanks for the patch.
> > >
> > > Cc'ing Laurent, too.
> > >
> > > On Mon, May 17, 2021 at 11:02:40AM +0100, David Plowman wrote:
> > > > Add documentation for each of the controls
> > > >
> > > > V4L2_CID_NOTIFY_GAIN_RED
> > > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > >
> > > > These controls are required by sensors that need to know what colour
> > > > gains will be applied to pixels by downstream processing (such as by
> > > > an ISP), though the sensor does not apply these gains itself.
> > > >
> > > > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > > > ---
> > > >  .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index de43f5c8486d..f824d6c36ae8 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -72,3 +72,31 @@ Image Source Control IDs
> > > >      * - __u32
> > > >        - ``height``
> > > >        - Height of the area.
> > > > +
> > > > +``V4L2_CID_NOTIFY_GAIN_RED (integer)``
> > > > +    Notify the sensor what gain will be applied to red pixels by the
> > > > +    subsequent processing (such as by an ISP). The sensor is merely
> > > > +    informed of this value in case it performs processing that requires
> > > > +    it, but it is not applied to the output pixels themselves. The
> > > > +    units are determined by the sensor driver.
> > >
> > > I wonder if this should say the default value should reflect gain of 1. It
> > > probably wouldn't hurt at least.
>
> Seems reasonable to me.

Yes, I think this is a good idea.

>
> David, do you think we could also document that the values of these
> controls are linear, or would that be too restrictive ?

That's an interesting point. I guess I was drawing on the precedent
set by analogue gain, but in many respects mandating a linear
response, and not letting device specific units escape the driver,
might be more convenient for application code.

The typical use would, I expect, involve firmware reading colour gains
from an ISP and passing them in here. As such, linear is quite likely
to be desirable. In the event that there is a conversion to be done,
the driver can always take care of it.

Further, if we want to go with linear values, I wonder whether we
should go all the way and specify it fully. For example we could
mandate u8.8 values, so that 256 means 1.0x - this already feels like
more than enough range and precision.

There's a slight question in my mind as to whether we should specify
the range of the control too, in particular whether gains can be less
than unity or not. Again, this would be kind to applications, but
drivers might have to re-interpret it internally for "fussy" sensors.
Any other opinions on that?

One side effect of specifying the meaning precisely is that all four
necessarily become identical. I hadn't mentioned this previously, but
having them different would clearly be a right nuisance!

If that sounds good to everyone I'll make up a second version with
updated documentation.

Thanks and best regards
David

>
> > > > +
> > > > +``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
> > > > +    Notify the sensor what gain will be applied to green pixels (on
> > > > +    red rows) by subsequent processing (such as by an ISP). The sensor
> > > > +    is merely informed of this value in case it performs processing
> > > > +    that requires it, but it is not applied to the output pixels
> > > > +    themselves. The units are determined by the sensor driver.
> > > > +
> > > > +``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
> > > > +    Notify the sensor what gain will be applied to blue pixels by the
> > > > +    subsequent processing (such as by an ISP). The sensor is merely
> > > > +    informed of this value in case it performs processing that requires
> > > > +    it, but it is not applied to the output pixels themselves. The
> > > > +    units are determined by the sensor driver.
> > > > +
> > > > +``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
> > > > +    Notify the sensor what gain will be applied to green pixels (on
> > > > +    blue rows) by subsequent processing (such as by an ISP). The sensor
> > > > +    is merely informed of this value in case it performs processing
> > > > +    that requires it, but it is not applied to the output pixels
> > > > +    themselves. The units are determined by the sensor driver.
>
> --
> Regards,
>
> Laurent Pinchart
