Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5268033E62F
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 02:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhCQBbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 21:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhCQBbW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 21:31:22 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E4BC06174A;
        Tue, 16 Mar 2021 18:31:10 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id o16so6831508pgu.3;
        Tue, 16 Mar 2021 18:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N/NUzf9NzqO7N5d6gDcc9DMo+DFjiot6YxLcXVdBLSI=;
        b=Xx9uVEQEYQWb34sLqV3KtpUs69UwnCPpsNkmr/NLxHly35YUf+A0mN6oeeS3TMhoH+
         KH2XfvpBsjGbdBJFSm/Racmf1tsnz9c+aommsprJAEiWrNClVzZk71O4a1R2y06RF3tL
         jElLokCga0YFr1Q+7brLHX01lqupDOkQL0lq7nV9i1HMt9PhqJomtCha/2lGYMZo0eul
         WG4QstaqzwHVOHKOoamUnmpyrPvzT6mKAaUJY5FQk38NP6HBw117KMBJiaKscIa9Z4Qv
         H1pQqZb+h0iL1uumzDmD8MljDswSzYUMYGAnUH1O5OySTQUjrzVfH0RYLxtH+JeBOa/g
         dwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N/NUzf9NzqO7N5d6gDcc9DMo+DFjiot6YxLcXVdBLSI=;
        b=QRyE0IRX3ltEbLUUF8NWzgBy8MvzyMZiaBZIG23dmbO8f45AAYjuJpqYyd+IdcPw8p
         U6rKlxqRhbXDXATB4sD2eC46ijsAr8MH3JZF1utf9F5NZyZoxWozRdGO+vnd9YsK2HgN
         BM/19URDduXGqhvvLTWF/qOzfwb0tM6kD+Y7XyMnRTt8Aa2oCDOBngQKdH3snb3VgHw5
         Qd99glMEhzbeIQ+vw3pi0/3PxnN2o6FvZyFfsnPHXHzsM0JtFXDIXeRtcGYwuJ2ePH0Y
         H0NYs0w/GGguvQdlivYv74Pq9JWJE/rq9ZPhEAldEGh/9DA9OhSaq02AtnEpPDXudkhB
         pGVw==
X-Gm-Message-State: AOAM533tAV8m+3TDMMzms4oU2UlEjVVlv7XhQnkX98sXs7rNJgHZ2nyT
        CPNaK4ms/XQORxbM0ZET/f7xhq4dRxi2rA==
X-Google-Smtp-Source: ABdhPJz2JZkXes0eDAFCyDOmZ65kix+x2ueYlnF5hEycbpBDRLUZ5o2kbfd3FPy7v88Zd6D3ETNt2w==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr495234pgk.440.1615944670464;
        Tue, 16 Mar 2021 18:31:10 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id s76sm18092853pfc.110.2021.03.16.18.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 18:31:09 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:31:05 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2 1/3] media: v4l UAPI docs: document ROI selection
 targets
Message-ID: <YFFb2ePwiW+8ti4D@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-2-sergey.senozhatsky@gmail.com>
 <CAPybu_19hztQQEi0H40sWZQMb-X7g7dDuW4Mz8_gRv-nG2tghw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_19hztQQEi0H40sWZQMb-X7g7dDuW4Mz8_gRv-nG2tghw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/16 19:19), Ricardo Ribalda Delgado wrote:
> > +Configuration of Region of Interest (ROI)
> > +=========================================
> > +
> > +The range of coordinates of the top left corner, width and height of
> > +areas that can be ROI is given by the ``V4L2_SEL_TGT_ROI_BOUNDS`` target.
> > +It is recommended for the driver developers to put the top/left corner
> > +at position ``(0,0)``. The rectangle's coordinates are in global sensor
> > +coordinates. The units are in pixels and independent of the field of view.
> > +They are not impacted by any cropping or scaling that is currently being
> > +used.
> 
> Can we also mention binning here?

What's binning? Is it in the UVC spec?

> > +The top left corner, width and height of the Region of Interest area
> > +currently being employed by the device is given by the
> > +``V4L2_SEL_TGT_ROI_CURRENT`` target. It uses the same coordinate system
> > +as ``V4L2_SEL_TGT_ROI_BOUNDS``.
> 
> Why do we need current? Cant we just read back V4L2_SEL_TGT_ROI ?

We don't. Will remove it.

> > +    * - ``V4L2_SEL_TGT_ROI_CURRENT``
> > +      - 0x0200
> > +      - Current Region of Interest rectangle.
> > +      - Yes
> > +      - No
> > +    * - ``V4L2_SEL_TGT_ROI_DEFAULT``
> > +      - 0x0201
> > +      - Suggested Region of Interest rectangle.
> > +      - Yes
> > +      - No
> > +    * - ``V4L2_SEL_TGT_ROI_BOUNDS``
> > +      - 0x0202
> > +      - Bounds of the Region of Interest rectangle. All valid ROI rectangles fit
> > +       inside the ROI bounds rectangle.
> > +      - Yes
> > +      - No
> > +    * - ``V4L2_SEL_TGT_ROI``
> > +      - 0x0203
> > +      - Sets the new Region of Interest rectangle.
> > +      - Yes
> > +      - No
> As mentioned before I think we should not have TGT_ROI_CURRENT and TGT_ROI

Agreed.

> > diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
> > index 7d21c1634b4d..d0c108fba638 100644
> > --- a/include/uapi/linux/v4l2-common.h
> > +++ b/include/uapi/linux/v4l2-common.h
> > @@ -78,6 +78,14 @@
> >  #define V4L2_SEL_TGT_COMPOSE_BOUNDS    0x0102
> >  /* Current composing area plus all padding pixels */
> >  #define V4L2_SEL_TGT_COMPOSE_PADDED    0x0103
> > +/* Current Region of Interest area */
> > +#define V4L2_SEL_TGT_ROI_CURRENT       0x0200
> > +/* Default Region of Interest area */
> > +#define V4L2_SEL_TGT_ROI_DEFAULT       0x0201
> > +/* Region of Interest bounds */
> > +#define V4L2_SEL_TGT_ROI_BOUNDS        0x0202
> > +/* Set Region of Interest area */
> > +#define V4L2_SEL_TGT_ROI               0x0203
> 
> Nit: Maybe it could be a good idea to split doc and code. This way the
> backports/fixes are easier.

I'm quite sure this is the first time I'm being asked to split code
and documentation :) I'm usually asked to do the opposite - merge code
and documentation.
