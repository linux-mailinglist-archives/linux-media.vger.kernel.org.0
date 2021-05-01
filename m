Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3563704D0
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 03:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhEAB7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 21:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbhEAB7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 21:59:05 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99674C06138B
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 18:58:15 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 10so376978pfl.1
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 18:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yVa38kJPC+cK1H2CrwZPR6KXx0sym2UwEQNGXo2MV9k=;
        b=LouRuo1KhG5HfKIE18SSLzzyAiL6qq08DRIzJ2RKnYPIofDPinrzzMlcc4/KlT2b8s
         KHy0OJ0QHBKlaxhq72uCdxEHcSm4TjjMIprzqGyb1d3j3gf4fVsVXFif2kDsUzrPqkeF
         RACajck1q5OcLlEnKBweAMw/2jDAw1NONEBH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yVa38kJPC+cK1H2CrwZPR6KXx0sym2UwEQNGXo2MV9k=;
        b=IQu3SISAOcedUvSgsJgNnU8pvQPMkaHPEPMkJ/KGODWgN9s1hUdlqqmRcSWKZL7rK4
         xtvBwvIiPB5wH1IDzHTg4i1NXUV143o10Dz2DRF3zU8I0QleQq9nyd43MWRhTkTfh1q3
         8CKbQlMEH0shSQY0Vg0X47itkm7o5hJOqDEfkCA7TZLdsXLdt2iiOFwdcNs6KXMEkGlr
         hvJxv2DOh2D9Hzmulo5I0eRq7zZRLScM3L4+MXuRtpMEcaO79f/NEXkWMpZI9gVKwlj3
         xDFewVB/mfbbUbvhwRm2YbvIxKZGCZdZa5Bb8qgmnoBfy2pq6f4fKH78neP/7q2MulVq
         /t9w==
X-Gm-Message-State: AOAM530mcL3amxhZjK/mTFKmG8eoIvxLRWXiXWzuzzZhIc+cJw7hbwq8
        xo6ADAIS92Fk5NqKPP3ojEefSg==
X-Google-Smtp-Source: ABdhPJwsJWJrJdg0SGvIuKRDkm1rsOTTCGC7m82O1elQFz0E4yHPLMvoc2lCerKHsvpWvgxopmZcCg==
X-Received: by 2002:a63:5503:: with SMTP id j3mr7371724pgb.256.1619834295062;
        Fri, 30 Apr 2021 18:58:15 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8be7:e987:d00a:1442])
        by smtp.gmail.com with ESMTPSA id x38sm3241502pfu.22.2021.04.30.18.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 18:58:14 -0700 (PDT)
Date:   Sat, 1 May 2021 10:58:10 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 0/5] media: uvcvideo: implement UVC 1.5 ROI
Message-ID: <YIy1suAHDrArv8fz@google.com>
References: <20210430112611.475039-1-senozhatsky@chromium.org>
 <8a175117-d142-9265-65ee-43302bb82444@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a175117-d142-9265-65ee-43302bb82444@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On (21/04/30 14:49), Hans Verkuil wrote:
> Hi Sergey,
> 
> On 30/04/2021 13:26, Sergey Senozhatsky wrote:
> > Hello,
> > 
> > 	This patch set implements UVC 1.5 ROI using v4l2_selection API.
> 
> Is the selection API the right approach for this? Wouldn't it make
> sense to use controls instead?

[..]

> If this was discussed before, then can you give a me pointer to that discussion?
> I couldn't find anything for that, but I didn't look very long for it :-)

I believe Tomasz raised this question over IRC back in the days and there
was no clear conclusion at the end: selection API vs control - 50/50 split.
After internal discussions we decided to go with the selection API.

> In any case, it doesn't really feel like it is the right API for this job.

Well, we pass a rectangle to the driver. The driver already knows what
to do with some of those rectangles, we teach it to handle one more. So
we don't introduce anything new, but use the existing API instead.
