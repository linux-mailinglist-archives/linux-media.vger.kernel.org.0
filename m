Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C37A57CA
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 15:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbfIBNio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 09:38:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43594 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbfIBNio (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 09:38:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id y8so14042028wrn.10;
        Mon, 02 Sep 2019 06:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=JDle5PY3laF9vYSbvj6oJClAlHR78NQAuuinV8yTwuo=;
        b=gFISBklsVKPLUdanPxWszdVBz4OazmQki82HYaO1rFt4/QOxgZnbJShqcy9V6GXxjy
         EHSWtalTshjzVLj/BOhqIYTpEQBhWTzO3Fvuw7XoWbDqKIOkbaiBD3ievslyWs15Uz8g
         oiAQghTjvvGVaKkFbj2H/Qhm/JQMbGGK3sf3srKPi3oPnZjAQwgTO2M2CxQGLsImU9K5
         mOi6R80dgtE+2hWRHc0vIYSEXGpyZ7/g4ftKc3j82ZSlsROD+IT06rnECI/9DwdZ73yi
         WpecZ0pXctkaw8y/Br+YhzKhIS4uL/3m+Qtt1R9GO/zLtax2MIl7TnW3lENchsES1orS
         LH7g==
X-Gm-Message-State: APjAAAXzMx5n1jVFUqf/MnGbcAy2+R5fq07D/Twd+iL7WOrYCqQBw16x
        yDhdYF6iRal96upMO1AcVA==
X-Google-Smtp-Source: APXvYqwzzd/9a7l2fQnbN6UMYI9OnrfvJxH2tbMTtrt6ri6dYuw73QeDF6NeVdAgloPB1keKHJShzw==
X-Received: by 2002:a5d:458b:: with SMTP id p11mr6498423wrq.160.1567431521375;
        Mon, 02 Sep 2019 06:38:41 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id v186sm34392036wmb.5.2019.09.02.06.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:38:40 -0700 (PDT)
Message-ID: <5d6d1b60.1c69fb81.f3a3a.1619@mx.google.com>
Date:   Mon, 02 Sep 2019 14:38:40 +0100
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
 <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
X-Mutt-References: <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 29, 2019 at 02:46:40PM +0200, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Tue, Aug 27, 2019 at 03:21:26PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> > > Add the 'location' device property, used to specify the camera device
> > > mounting position. The property is particularly meaningful for mobile
> > > devices with a well defined usage orientation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > index f884ada0bffc..865f4142f432 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -89,6 +89,16 @@ Optional properties
> > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > >    (upside down).
> > >
> > > +- location: The camera sensor mounting location, expressed as a position
> > > +  relative to the usage orientation of the device the sensor is installed on.
> >
> > DT bindings being ABIs, we need to be precise and thorough there. One
> > particular point that bothers me is that the property is named location,
> > and its description refers to camera sensor mounting location.
> >
> > I see two options to fix this. One of them is to rename the property to
> > camera-location, but that would limit its future usage for other types
> > of devices. The other one is to document the property as applying to a
> > "device" instead of a "camera sensor", and add one sentence stating that
> > this property is valid for camera sensors only.
> >
> > This will require finding another name for the device that the device is
> > mounted on though, as using device twice would be very confusing.
> 
> I had the same concern, but I cannot find another term to convey
> this... suggestions?

For accelerometers and/or gyroscopes, we already have 'mount-matrix'. 
That would replace 'rotation'. Maybe we can do something similar here?

Rob

