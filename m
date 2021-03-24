Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335D2346FE6
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 04:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhCXDIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 23:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhCXDIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 23:08:35 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F92C061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:08:34 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g15so16318707pfq.3
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XjFHAUzPomVRVT0dS7pmZgIlLkEy7sjyft1TIrApGAY=;
        b=GFIP4zRJL3jF5iJqQHC9YibDfZVI+vmMTU3Diyk2jrUzrvXHMg8UPs7vmxtMdInl2T
         ZLsauiSNhOBncbdAarCM3AtivkonMEc8hDpu7JyqGA3SoWRcRUSvjrVDSebzLbkupkOW
         /+sV7EmknP58RCpOexLYcOXMwqdfHTZfFfXHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XjFHAUzPomVRVT0dS7pmZgIlLkEy7sjyft1TIrApGAY=;
        b=Ma4yYGD9vbxR5Af7/vzQlLaHgbLDtPEYv6/53OxwoCiBebiEqodoNJnYnnUmfAKMpq
         7xxhNWTlXH+ZVB7jw840VVWkGh8LlQBBNa08sYQYwExPgByRgxsItqkueXhaL2mNvcPA
         IJ1rqoJu7Ful39+Ge9c36fBihrHPctZ97X+WuaQyd2nP4TPSGLldGOw4u+URKZkRzMKG
         wcYq/job854qd0iXEbuA+Y1pDJohfNtc5Rjf7PubWn1bEROpb1DzkyRFYmC6ALeGXwJk
         tFOUq77j3EFiAiSf/YtrdrGO5dh+cK9DYAvwYRaVIl85Y5fLipmXIAlQvSeuDoNc+ytw
         wzJA==
X-Gm-Message-State: AOAM532JmPlLMZosmrN+HX/TzLvKR+f3e6s23TfVcPtSmPDIfyKvuIS8
        j8k+FkjmIwjtZRd/yGPPi2JgrQ==
X-Google-Smtp-Source: ABdhPJxh3tF8FyEIq8bPsTRE6bFZY8xlmlbyMFPeWQD1bY37sESBlAw8C5d9fIzrxVdHgHVKOnBrQw==
X-Received: by 2002:aa7:9984:0:b029:1f8:b0ed:e423 with SMTP id k4-20020aa799840000b02901f8b0ede423mr1098358pfh.81.1616555313655;
        Tue, 23 Mar 2021 20:08:33 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bcf2:e05a:a993:9494])
        by smtp.gmail.com with ESMTPSA id g12sm520787pfh.153.2021.03.23.20.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 20:08:33 -0700 (PDT)
Date:   Wed, 24 Mar 2021 12:08:28 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3 5/6] media: uvcvideo: add UVC 1.5 ROI control
Message-ID: <YFqtLO2GhQrTpxsh@google.com>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org>
 <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com>
 <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
 <YFqkaumASvjrYP/n@google.com>
 <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
 <YFqpcR60384JWbNP@google.com>
 <CAAFQd5CJBPtLo22u2dM-vOGmqaD2e=TU5Qv1eoKcHsxuumgXGw@mail.gmail.com>
 <YFqsZXUuQP9H+Cud@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFqsZXUuQP9H+Cud@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/24 12:05), Sergey Senozhatsky wrote:
> > > For ROI user-space also must provide valid auto-controls value, which
> > > normally requires GET_MIN/GET_MAX discovery.
> > >
> > > v4l2 selection API mentions only rectangle adjustments and errnos like
> > > -ERANGE also mention "It is not possible to adjust struct v4l2_rect r
> > > rectangle to satisfy all constraints given in the flags argument".
> > >
> > > So in case when auto-controls is out of supported range (out of
> > > GET_MIN, GET_MAX range) there is no way for us to tell user-space that
> > > auto-controls is wrong. We probably need silently pick up the first
> > > supported value, but not sure how well this will work out in the end.
> > 
> > Shouldn't the autocontrol selection be done via a separate bitmask
> > control rather than some custom flags in the selection API?
> 
> That selection must be done before we send ROI to the firmware.
> Firmware H that I have supports split controls - we can send
> ROI::rectangle and ROI::autocontrols separately. But other
> firmwares don't tolerate such a thing and by the time we issue
> 
> 	uvc_query_ctrl(stream->dev,
> 	               UVC_SET_CUR
> 	               UVC_CT_REGION_OF_INTEREST_CONTROL
> 		       roi,
> +                      sizeof(struct uvc_roi_rect))
> 
> roi rectangle should be of size 5 * u16 and contain values that firmware

      ^^^ roi structure

> will accept, including autocontrols.
