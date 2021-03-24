Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9F4346F27
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 03:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhCXCBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 22:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhCXCBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 22:01:18 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FE2C061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:01:18 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y200so16205899pfb.5
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gko5DwdDrrjyuudztCK85u5fA9SOsiUHVh5WfDpFt8E=;
        b=QlJxkIRDjzXTY962t2mtJA7UVqpJYbvcjCSKEMSo/Q5mM60eQoKJHEXyROJMl7N+ES
         kEXL+d876OKQFmHIFECPqG2PQLhuC5OYGzBJvk5FNiIa6/eJBbCg1szxejz4xHCjoKaJ
         BI1VsVWLDZ/5tGIYFIMpjkewa0LZPtGwL3ZTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gko5DwdDrrjyuudztCK85u5fA9SOsiUHVh5WfDpFt8E=;
        b=DlH/luPv/xofXjm9bDw7QvLqGn84/9yn1ve4tJIccte2v/eMUJLdB9t+JjfFkNPTTb
         TWXPnHfjow633SV9mVlh5bw6ce7djzbLm6TrZk30OtSNR9C9VjvHVmUedOSOxRjBc4rc
         upcmNM/GNHz7+7D/kJiOkNCbTr/YD4KshH+tZLIXcJk+Yf/Ix7Sb6IPdv+AFzO8SVT3r
         6Va0BMAwhUBpVIpsjk/9/rMkI9+ezIMUhFdL1/510LFOAz95ETut37J5ZUj4my2u0I7g
         GxQFv6ZkZKsZgpHhxp8dr7A0Ebl/wmGDW4pSW2WHvuA1YXJ2oUMjd3WOPGSs/55YGLkn
         onOA==
X-Gm-Message-State: AOAM53100JfYgZydGouLhAiTe2NlNSzws47Clx7DYgrmNgrIfglVPwZN
        BN58mTFD1REd5QrLC8EoCT3H1pWCerKuTA==
X-Google-Smtp-Source: ABdhPJxjsLNxIWN+kP3AAa5XMz8NmKTnf5Z8dD1Tcao1d3voJoNIhlTReYr8pe8xY1AcqQYOBEuOZA==
X-Received: by 2002:a63:f546:: with SMTP id e6mr954277pgk.299.1616551277775;
        Tue, 23 Mar 2021 19:01:17 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bcf2:e05a:a993:9494])
        by smtp.gmail.com with ESMTPSA id d2sm389013pjx.42.2021.03.23.19.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 19:01:17 -0700 (PDT)
Date:   Wed, 24 Mar 2021 11:01:12 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3 5/6] media: uvcvideo: add UVC 1.5 ROI control
Message-ID: <YFqdaHCQak5ZM0Sf@google.com>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org>
 <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/23 17:16), Ricardo Ribalda wrote:
[..]
> > +static bool validate_roi_bounds(struct uvc_streaming *stream,
> > +                               struct v4l2_selection *sel)
> > +{
> > +       if (sel->r.left > USHRT_MAX ||
> > +           sel->r.top > USHRT_MAX ||
> > +           (sel->r.width + sel->r.left) > USHRT_MAX ||
> > +           (sel->r.height + sel->r.top) > USHRT_MAX ||
> > +           !sel->r.width || !sel->r.height)
> > +               return false;
> > +
> > +       if (sel->flags > V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY)
> > +               return false;
> 
> Is it not allowed V4L2_SEL_FLAG_ROI_AUTO_IRIS |
> V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY   ?

Good question.

I don't know. Depends on what HIGHER_QUALITY can stand for (UVC doesn't
specify). But overall it seems like features there are mutually
exclusive. E.g. AUTO_FACE_DETECT and AUTO_DETECT_AND_TRACK.


I think it'll be better to replace this with

	if (sel->flags > USHRT_MAX)
		return false;

so that we don't let overflow happen and accidentally enable/disable
some of the features.

> > +
> > +       return true;
> > +}
> > +
> > +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> > +                          struct v4l2_selection *sel)
> > +{
> > +       struct uvc_fh *handle = fh;
> > +       struct uvc_streaming *stream = handle->stream;
> > +       struct uvc_roi_rect *roi;
> > +       int ret;
> > +
> > +       if (!validate_roi_bounds(stream, sel))
> > +               return -E2BIG;
> 
> Not sure if this is the correct approach or if we should convert the
> value to the closest valid...

Well, at this point we know that ROI rectangle dimensions are out of
sane value range. I'd rather tell user-space about integer overflow.

Looking for the closest ROI rectangle that suffice can be rather
tricky. It may sounds like we can just use BOUNDARIES_MAX, but this
is what Firmware D returns for GET_MAX

ioctl(V4L2_SEL_TGT_ROI_BOUNDS_MAX)

	0, 0, 65535, 65535

	-ss
