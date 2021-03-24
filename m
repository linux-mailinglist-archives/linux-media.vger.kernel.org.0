Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272CC346F89
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 03:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhCXCbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 22:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbhCXCbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 22:31:12 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5761AC061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:31:12 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ha17so10961460pjb.2
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=smeNo2nLOzLoAqQ0eDu45bUTA0pWmhws44H491W9z+0=;
        b=EvmzBDZ30bavlVo5llPGM4DVAa7h37P89ePfMEf5oMkGD9epTsE5m75nO/7X6hw4cN
         SkizuxTwxzNwMrDOJoCrMnbrim2PTBN2Y5aXzWvRh/4d5q/RPYgoE/mwZU5zQNdlgYm9
         DdiJf5xPDxzLRVShek+nVRVOBfaWMIesglLag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=smeNo2nLOzLoAqQ0eDu45bUTA0pWmhws44H491W9z+0=;
        b=aflH6Cs876xOxxuM7eYvanvGbVq9JvjhRgaM4uJ6ZQEdX4JfrwpvrHD7cYLXuvEz+L
         FOUb8VuksSyVA3mdMtLxJrWjkIZRILdfYj5xKusefo81t85W2xBiamOhyQyPfhm7jIt0
         ccqxf17Ta55H+y8v0iEbEIgCP8weRHRvAaGBHvJ/dYk8FIczsPM6nBFfEMX+68K6Szd2
         MRbmt4E5rMk64iwlVnFpB0kSrparI2T0bcWiufCxvL+r9iIBcmRDOW/Uy6hEdzMwRz9v
         TjOt0SQ61Qq8amBEvnqvIw4nlvfAdeHVRIcFgHHqaa1cazZ2m8Q/3MVNgw9higJ4HzL0
         VcgA==
X-Gm-Message-State: AOAM533suicxahwN72+g81XpTH9y1zN8myFUnyNxZT520QEzuxpnn8Tc
        dm3ALP1P1Mf/K6dqjk+1hVQhdQ==
X-Google-Smtp-Source: ABdhPJyQemMa34PxA+NGQjFfeUL30hAreLQlm0fYvCVp2BCeLlDpkEH/+O+4ZOoe04EnjIFerPZr0Q==
X-Received: by 2002:a17:90a:4d07:: with SMTP id c7mr1058957pjg.104.1616553071745;
        Tue, 23 Mar 2021 19:31:11 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bcf2:e05a:a993:9494])
        by smtp.gmail.com with ESMTPSA id l19sm444720pjt.16.2021.03.23.19.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 19:31:11 -0700 (PDT)
Date:   Wed, 24 Mar 2021 11:31:06 +0900
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
Message-ID: <YFqkaumASvjrYP/n@google.com>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org>
 <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com>
 <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/24 11:14), Tomasz Figa wrote:
> > > > +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> > > > +                          struct v4l2_selection *sel)
> > > > +{
> > > > +       struct uvc_fh *handle = fh;
> > > > +       struct uvc_streaming *stream = handle->stream;
> > > > +       struct uvc_roi_rect *roi;
> > > > +       int ret;
> > > > +
> > > > +       if (!validate_roi_bounds(stream, sel))
> > > > +               return -E2BIG;
> > >
> > > Not sure if this is the correct approach or if we should convert the
> > > value to the closest valid...
> >
> > Well, at this point we know that ROI rectangle dimensions are out of
> > sane value range. I'd rather tell user-space about integer overflow.
> 
> Adjusting the rectangle to something supported by the hardware is
> mentioned explicitly in the V4L2 API documentation and is what drivers
> have to implement. Returning an error on invalid value is not a
> correct behavior here (and similarly for many other operations, e.g.
> S_FMT).

Well, in this particular case we are talking about user-space that wants
to set ROI rectangle that is knowingly violates device's GET_MAX and
overflows UVC ROI rectangle u16 value range. That's a clear bug in user-space.
Do we want to pretend that user-space does the correct thing and fixup
stuff behind the scenes?

> > Looking for the closest ROI rectangle that suffice can be rather
> > tricky. It may sounds like we can just use BOUNDARIES_MAX, but this
> > is what Firmware D returns for GET_MAX
> >
> > ioctl(V4L2_SEL_TGT_ROI_BOUNDS_MAX)
> >
> >         0, 0, 65535, 65535
> 
> Perhaps the frame size would be the correct bounds?

I can check that.
