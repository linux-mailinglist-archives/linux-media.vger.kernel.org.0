Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08217346FB5
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 03:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhCXCxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 22:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhCXCwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 22:52:39 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B40C061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:52:39 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so405740pjg.5
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q38Iz9nD2bCIrCpcl0zHhO9fOMzo7G/bLx3hekBFuE0=;
        b=ZGhjdMBw/RUDU67zkYUaHgPaNMXQntRmqXEhlFGhJIlwLHt+daBea026teMvWJ/mXn
         re/voxwWR3VAdXvCzIG+8Fyi0lPnJWr1mBrCCHfq4J8kNxfO0/FKuX86UMYnXJe8N30h
         usRlzMQP0CWWKZmeuJBbORhYWblGnHXq0ye3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q38Iz9nD2bCIrCpcl0zHhO9fOMzo7G/bLx3hekBFuE0=;
        b=F26/17CitDqIzslU2l/09H3RZtsW9GJoybwNHX7uwjPiVLEuwaTcA/ptzHhkiCx8/2
         5HhuSdhwcI3PpPioK1/2WqYntpCNVH422xJesve2h08CVUgt4dVd8R9idNkK/R0y/tMG
         eXYeVU0w+3JskEw+qtug8shtAjsv0jM/j1sqt/wX4EkegwzXI/VarW5XrMwX6m9E7aUN
         djNsxkMZLhKVhd8bybc/tL9glX7PW/+gZsfnc5G6scxPkVCtENz5Y2DziubRSTWIrs8p
         KPaLeiuyLW6Czfeh4N0z5eRHL0nut91Gta03G7XBpkXI3Fi/OkyYTkmpd2FI+uEbRljU
         x4Aw==
X-Gm-Message-State: AOAM533DhE8lT08udapVABcpDOGACSKGTtlQVBJNH5X8ILSN9OTTecuA
        fGCsbFl0sJAf/9CtlzflaljIeg==
X-Google-Smtp-Source: ABdhPJxKDDdoMpkHFlTzbxNlc1Ozkms+p9ib//028rRi3n/BeSKexy+DyamRfPmSGpXgXRo6pxo6iQ==
X-Received: by 2002:a17:90a:ec15:: with SMTP id l21mr1092181pjy.164.1616554359115;
        Tue, 23 Mar 2021 19:52:39 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bcf2:e05a:a993:9494])
        by smtp.gmail.com with ESMTPSA id c24sm478696pjv.18.2021.03.23.19.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 19:52:38 -0700 (PDT)
Date:   Wed, 24 Mar 2021 11:52:33 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3 5/6] media: uvcvideo: add UVC 1.5 ROI control
Message-ID: <YFqpcR60384JWbNP@google.com>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org>
 <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com>
 <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
 <YFqkaumASvjrYP/n@google.com>
 <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/24 11:34), Tomasz Figa wrote:
> On Wed, Mar 24, 2021 at 11:31 AM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
[..]
> > > Adjusting the rectangle to something supported by the hardware is
> > > mentioned explicitly in the V4L2 API documentation and is what drivers
> > > have to implement. Returning an error on invalid value is not a
> > > correct behavior here (and similarly for many other operations, e.g.
> > > S_FMT).
> >
> > Well, in this particular case we are talking about user-space that wants
> > to set ROI rectangle that is knowingly violates device's GET_MAX and
> > overflows UVC ROI rectangle u16 value range. That's a clear bug in user-space.
> > Do we want to pretend that user-space does the correct thing and fixup
> > stuff behind the scenes?
> >
> 
> That's how the API is defined. There is a valid use case for this -
> you don't need to run QUERY_CTRL if all you need is setting the
> biggest possible rectangle, just set it to (0, 0), (INT_MAX, INT_MAX).

I guess in our case we need to talk about rectangle,auto-controls tuple
that we send to firmware

	rect {
		(0, 0), (INT_MAX, INT_MAX)
	}
	auto-controls {
		INT_MAX
	}

For ROI user-space also must provide valid auto-controls value, which
normally requires GET_MIN/GET_MAX discovery.

v4l2 selection API mentions only rectangle adjustments and errnos like
-ERANGE also mention "It is not possible to adjust struct v4l2_rect r
rectangle to satisfy all constraints given in the flags argument".

So in case when auto-controls is out of supported range (out of
GET_MIN, GET_MAX range) there is no way for us to tell user-space that
auto-controls is wrong. We probably need silently pick up the first
supported value, but not sure how well this will work out in the end.
