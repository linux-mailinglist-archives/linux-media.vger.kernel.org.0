Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8FC33EB16
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 09:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhCQIJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 04:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCQII5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 04:08:57 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61CEC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 01:08:57 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id x29so24318365pgk.6
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aCfSB5C9ykLdXLAp7ZVnblWxeq2vcWW6t+WdAO0dmzU=;
        b=FNiJ1e89JqQ5a4mLi2mnsooQBUWrvZr/BYgfZQ59qpA+tLIAGK22H69NLhGv9Y31ix
         KydT1oM6mZjUr7IRn32FnrufWu0pn52WwXCSdFRUEj+pLuAn2Xa9a0vohTaL9VrUyT/I
         +FTJceCml/q0dUZIUmN+LYuWrhCG52BECYX+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aCfSB5C9ykLdXLAp7ZVnblWxeq2vcWW6t+WdAO0dmzU=;
        b=RSp8f+pmCTp83cYiUdSn5cLyu5Ublt+xPq5Ipv85rP++EJdhG8xycsYTOQsXSP856b
         a/fLK2/+x8Zb1uncYB4XPAW4mbz/l5xZhSTjLFclyg3ZKO9gMZuFyFn0drCEGmYDXewo
         AybEP7HLckRr6tANi2ul4HMigDgblzzcU1lGVlt5Vo/WeSyjIF1tj2sZc/FSxOSTOKD2
         jzcg3x5HDA4zwn4WIMeumay/LjSxVapK7ItHemIDlJ41MK2ONsds4e34CNRScE0LFheW
         JkLxaJU/Mpc0qaIyknzZLRziOi56v4O65/iuO3gOcmgLI9GGhUz07rsc85JiSX3rpgvN
         9Dzg==
X-Gm-Message-State: AOAM530CHd4l68SwJT2HxtwsJ4GQKk7rB99OmgmX6+tz1jFYv4qIrRHZ
        yMDqBzqTVm0Va8qtfMOmqZjoFw==
X-Google-Smtp-Source: ABdhPJwrvdFOCq7VKRASJ+InsNz6citM6tF95Wjs7Ed8zR2seTeb2ooJ2Zx7SJY3iHRhtEh6nlRyqg==
X-Received: by 2002:a63:cd08:: with SMTP id i8mr1637851pgg.49.1615968537259;
        Wed, 17 Mar 2021 01:08:57 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id p7sm7591308pgj.2.2021.03.17.01.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 01:08:56 -0700 (PDT)
Date:   Wed, 17 Mar 2021 17:08:52 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv2 1/3] media: v4l UAPI docs: document ROI selection
 targets
Message-ID: <YFG5FA/9QEGKq+V9@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-2-sergey.senozhatsky@gmail.com>
 <CAPybu_19hztQQEi0H40sWZQMb-X7g7dDuW4Mz8_gRv-nG2tghw@mail.gmail.com>
 <YFFb2ePwiW+8ti4D@google.com>
 <CAPybu_1ng4GBVx64FQRR+rm2FcqLHkpW9c78AXg_P_6aR=2BKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_1ng4GBVx64FQRR+rm2FcqLHkpW9c78AXg_P_6aR=2BKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/17 09:04), Ricardo Ribalda Delgado wrote:
> On Wed, Mar 17, 2021 at 2:31 AM Sergey Senozhatsky
> <sergey.senozhatsky.work@gmail.com> wrote:
> >
> > On (21/03/16 19:19), Ricardo Ribalda Delgado wrote:
> > > > +Configuration of Region of Interest (ROI)
> > > > +=========================================
> > > > +
> > > > +The range of coordinates of the top left corner, width and height of
> > > > +areas that can be ROI is given by the ``V4L2_SEL_TGT_ROI_BOUNDS`` target.
> > > > +It is recommended for the driver developers to put the top/left corner
> > > > +at position ``(0,0)``. The rectangle's coordinates are in global sensor
> > > > +coordinates. The units are in pixels and independent of the field of view.
> > > > +They are not impacted by any cropping or scaling that is currently being
> > > > +used.
> > >
> > > Can we also mention binning here?
> >
> > What's binning? Is it in the UVC spec?
> 
> Binning is when you reduce an image by adding up surrounding pixels.
> 
> So you have a 100x100 image that you convert to a 50x50 but showing
> the same area of interest.

I see. Hmm, not sure if I can comment on this. It's not in the spec,
so it might be up to the firmware, maybe. What do you think?

> > > > diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
> > > > index 7d21c1634b4d..d0c108fba638 100644
> > > > --- a/include/uapi/linux/v4l2-common.h
> > > > +++ b/include/uapi/linux/v4l2-common.h
> > > > @@ -78,6 +78,14 @@
> > > >  #define V4L2_SEL_TGT_COMPOSE_BOUNDS    0x0102
> > > >  /* Current composing area plus all padding pixels */
> > > >  #define V4L2_SEL_TGT_COMPOSE_PADDED    0x0103
> > > > +/* Current Region of Interest area */
> > > > +#define V4L2_SEL_TGT_ROI_CURRENT       0x0200
> > > > +/* Default Region of Interest area */
> > > > +#define V4L2_SEL_TGT_ROI_DEFAULT       0x0201
> > > > +/* Region of Interest bounds */
> > > > +#define V4L2_SEL_TGT_ROI_BOUNDS        0x0202
> > > > +/* Set Region of Interest area */
> > > > +#define V4L2_SEL_TGT_ROI               0x0203
> > >
> > > Nit: Maybe it could be a good idea to split doc and code. This way the
> > > backports/fixes are easier.
> >
> > I'm quite sure this is the first time I'm being asked to split code
> > and documentation :) I'm usually asked to do the opposite - merge code
> > and documentation.
> 
> I got answered in both directions.  I prefer to split it because the
> doc can go to different audience than the code, and then it makes my
> life easier when backporting.
> 
> But if you or Laurent prefer  otherwise I am of course happy with any option ;)

Either way works for me. Laurent, any preferences?

	-ss
