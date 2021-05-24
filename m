Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C4A38E572
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhEXL26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:28:58 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:52752 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbhEXL26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:28:58 -0400
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id F1BE61B00121;
        Mon, 24 May 2021 14:27:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1621855648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ULJcM5BH3DQpl8M76N1+yCvIoQycvJzxclFwVcM/mIg=;
        b=V1z76vL37xcFmLhVlDXsTw04yswLXxaAJhhiybIEoLH8gCsWOU/Tq1c6xU8ww8kyCDauGU
        IibyIbgt7neXZLsz48axdNHrfESr+3O987UgXHXn8CyFljhd7ILhxwCJha24mx4b+MBUFd
        rpv2y7+j0v+TOf+ZLrPQRvv2mvlfLolaOTEqzmzOj/2koNmbuTSKS7Ze9IOAnpTyEu6iJJ
        3Xgq/uWT2a4s+22zq0DQk+c7pZPzWiHJ8oHNsF9vHYJ5RCIFonz/MebIhWjF1WXhr/bGwW
        MDQZrOw4IuOlFWDRHiG+ibMUaGt0sgxJw35p4RYrTujiXu0oFTQpbrxyQPk9Dg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E76D8634C87;
        Mon, 24 May 2021 14:27:13 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1ll8k3-0000rI-Nj; Mon, 24 May 2021 14:27:27 +0300
Date:   Mon, 24 May 2021 14:27:27 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <20210524112727.GC3@valkosipuli.retiisi.eu>
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
 <20210517100240.3323-3-david.plowman@raspberrypi.com>
 <20210519190121.GJ3@valkosipuli.retiisi.eu>
 <20210519190148.GK3@valkosipuli.retiisi.eu>
 <YKr8Qc65KSFBZJ2s@pendragon.ideasonboard.com>
 <CAHW6GYJrhWDUEhexGMAVBJDs0GG=DzhE9OjCCOzMcw0doSp_6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHW6GYJrhWDUEhexGMAVBJDs0GG=DzhE9OjCCOzMcw0doSp_6g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1621855648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ULJcM5BH3DQpl8M76N1+yCvIoQycvJzxclFwVcM/mIg=;
        b=dCkWJpOorR/23zzjRSfJnj23WRQdZb+H2GbBgih0S9/6H3hMZDnOaMRE75CHdzamNlYoBx
        Qge/eln1o+cRv4DwdcPPRrAVctkg3HOgJ7ILt16vb5i6mZHPsrHcwsHOMEwWF8KyAnDXFq
        c/rAw5enp0Pxm8MCbl03ZVxWzJo56gibz6K9CgzFVNrmypktWxTS+1kYjTstUfupVLff4A
        41HTw2gGBGJnc0l3PhNZ9XeqVAtCFUvTCEKnWZTwGJJyR0QrcvJrhJnuHzfKMtHUDDZGTn
        A9ija/mdfw6fmG+dxu8VlNQ9eoaS8pWj+pxUQW0GZGqXczivnckjZZTmSZr5uA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1621855648; a=rsa-sha256;
        cv=none;
        b=rmF12QvtvfkS79gUndYnlinDjj7KsgUoSF+91JwPFUMF0fVeCf8CX0dbf9U5ZbGASU9iCm
        YypWtf19hDkKxVORYUty0We43nBF2NsloSj93zMJ4I+9z/wsJFw+K/U5uHBUgpHxiCefcb
        bv1HqtPfJSfYmNcM3/dKjPc20wzmLHVnXHpdjFXUdzd1w4sW5HsMPRTzTZkfq6GErOaKbu
        SZyhFMze4fRkYFIneIf+rQZzMywyHq+OtWFfqEyWPRfS4sGU+LMG3Ommd6iwt/YqYJtdz9
        qbybtACXEBXX87aMBz85L+3Q2yqhjvILVR6yq06Kv+7Ar5H+/jFferVT44a4Hw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Mon, May 24, 2021 at 11:31:22AM +0100, David Plowman wrote:
> Hi Sakari, Laurent, everyone
> 
> Thanks for the feedback.
> 
> On Mon, 24 May 2021 at 02:07, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello,
> >
> > On Wed, May 19, 2021 at 10:01:49PM +0300, Sakari Ailus wrote:
> > > Added Laurent to cc.
> > >
> > > On Wed, May 19, 2021 at 10:01:21PM +0300, Sakari Ailus wrote:
> > > > Hi David,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > Cc'ing Laurent, too.
> > > >
> > > > On Mon, May 17, 2021 at 11:02:40AM +0100, David Plowman wrote:
> > > > > Add documentation for each of the controls
> > > > >
> > > > > V4L2_CID_NOTIFY_GAIN_RED
> > > > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > > >
> > > > > These controls are required by sensors that need to know what colour
> > > > > gains will be applied to pixels by downstream processing (such as by
> > > > > an ISP), though the sensor does not apply these gains itself.
> > > > >
> > > > > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > > > > ---
> > > > >  .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
> > > > >  1 file changed, 28 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > index de43f5c8486d..f824d6c36ae8 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > @@ -72,3 +72,31 @@ Image Source Control IDs
> > > > >      * - __u32
> > > > >        - ``height``
> > > > >        - Height of the area.
> > > > > +
> > > > > +``V4L2_CID_NOTIFY_GAIN_RED (integer)``
> > > > > +    Notify the sensor what gain will be applied to red pixels by the
> > > > > +    subsequent processing (such as by an ISP). The sensor is merely
> > > > > +    informed of this value in case it performs processing that requires
> > > > > +    it, but it is not applied to the output pixels themselves. The
> > > > > +    units are determined by the sensor driver.
> > > >
> > > > I wonder if this should say the default value should reflect gain of 1. It
> > > > probably wouldn't hurt at least.
> >
> > Seems reasonable to me.
> 
> Yes, I think this is a good idea.
> 
> >
> > David, do you think we could also document that the values of these
> > controls are linear, or would that be too restrictive ?
> 
> That's an interesting point. I guess I was drawing on the precedent
> set by analogue gain, but in many respects mandating a linear
> response, and not letting device specific units escape the driver,
> might be more convenient for application code.
> 
> The typical use would, I expect, involve firmware reading colour gains
> from an ISP and passing them in here. As such, linear is quite likely
> to be desirable. In the event that there is a conversion to be done,
> the driver can always take care of it.

I don't see issues with the approach.

> 
> Further, if we want to go with linear values, I wonder whether we
> should go all the way and specify it fully. For example we could
> mandate u8.8 values, so that 256 means 1.0x - this already feels like
> more than enough range and precision.
>  
> There's a slight question in my mind as to whether we should specify
> the range of the control too, in particular whether gains can be less
> than unity or not. Again, this would be kind to applications, but
> drivers might have to re-interpret it internally for "fussy" sensors.
> Any other opinions on that?

The controls API already can provide this information, I wouldn't add it to
the documentation of a specific control.

> 
> One side effect of specifying the meaning precisely is that all four
> necessarily become identical. I hadn't mentioned this previously, but
> having them different would clearly be a right nuisance!

Agreed.

> 
> If that sounds good to everyone I'll make up a second version with
> updated documentation.

I wonder how it'd look like if all these controls had a single explanation
instead of one for each. I don't think we've done this earlier, but they're
all pretty much alike and used together in any case.

-- 
Regards,

Sakari Ailus
