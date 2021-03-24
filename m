Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89477346FCB
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 04:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbhCXDFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 23:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbhCXDFO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 23:05:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390DAC061763
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:05:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so419901pjg.5
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EhPV3KVrzkPHXSPWlu07vX6xVGTVkVHyIa1YY2b8Otw=;
        b=JFUuXK6Tas6z7Evj0JZdtYJjiCfg7dti/qpuhyE8T3457+msCSfMN5TkdBHWI9gLX7
         HwqE4GDarrYFO/9ra0rAqSZKBEktQ9rpXHatOpXW9o6UbPJyH3VhM7WftzhHBtTdmAv0
         r5DWRZS3XsgV7ejdsg8ftEetrX2Szi8NAFowk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EhPV3KVrzkPHXSPWlu07vX6xVGTVkVHyIa1YY2b8Otw=;
        b=UMYSdoTvXGfAd58u8mK+i8rktBqvYQQTRlXW9zViyn2CVtPdvh04T18SwC4uuc0p1J
         yvA5qnaU9W2uZTBsCILTOPWu9JXygGY7kepSMzqLKfZdJYwng21g/u6Kn+TBkfgx1B6O
         sKmnDrSG/yLG5kWiB633DRj8Gnhp+9YIdXMYMsZOzOSpzWCip1oeg4lR4EJtscXO2JyL
         gvftFiZYqHX5SLOWfuWurhldr8YwRGpNyskd6I0zmqJiNSalAIV6hIgS9t5BojQmLiUp
         EHMzOnBk0wPInDW5r0PyZjgSQZ2GDKHZ8fY4DCnC02zycmnXhP/jCD4OfPJ8fvpTumFS
         iNcg==
X-Gm-Message-State: AOAM531FLS6EOdtLwb/LEKvk81T9GqHln/lzN+Ew9jxEcicsfKDKSHsZ
        ZBoHKLFloZRGYsLiA+p2QwUgNg==
X-Google-Smtp-Source: ABdhPJzFBNWkmTNIKtNNzlwKE5UR9znR+x2311GojQrFD6USVTuPrRTYw1IFXCjRT6OK8T0qr3wNSQ==
X-Received: by 2002:a17:902:b7c5:b029:e6:1a9f:5f55 with SMTP id v5-20020a170902b7c5b02900e61a9f5f55mr1479501plz.57.1616555113706;
        Tue, 23 Mar 2021 20:05:13 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bcf2:e05a:a993:9494])
        by smtp.gmail.com with ESMTPSA id j20sm470526pjn.27.2021.03.23.20.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 20:05:13 -0700 (PDT)
Date:   Wed, 24 Mar 2021 12:05:09 +0900
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
Message-ID: <YFqsZXUuQP9H+Cud@google.com>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org>
 <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com>
 <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
 <YFqkaumASvjrYP/n@google.com>
 <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
 <YFqpcR60384JWbNP@google.com>
 <CAAFQd5CJBPtLo22u2dM-vOGmqaD2e=TU5Qv1eoKcHsxuumgXGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CJBPtLo22u2dM-vOGmqaD2e=TU5Qv1eoKcHsxuumgXGw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/24 12:00), Tomasz Figa wrote:
[..]
> > I guess in our case we need to talk about rectangle,auto-controls tuple
> > that we send to firmware
> >
> >         rect {
> >                 (0, 0), (INT_MAX, INT_MAX)
> >         }
> >         auto-controls {
> >                 INT_MAX
> >         }
> >
> > For ROI user-space also must provide valid auto-controls value, which
> > normally requires GET_MIN/GET_MAX discovery.
> >
> > v4l2 selection API mentions only rectangle adjustments and errnos like
> > -ERANGE also mention "It is not possible to adjust struct v4l2_rect r
> > rectangle to satisfy all constraints given in the flags argument".
> >
> > So in case when auto-controls is out of supported range (out of
> > GET_MIN, GET_MAX range) there is no way for us to tell user-space that
> > auto-controls is wrong. We probably need silently pick up the first
> > supported value, but not sure how well this will work out in the end.
> 
> Shouldn't the autocontrol selection be done via a separate bitmask
> control rather than some custom flags in the selection API?

That selection must be done before we send ROI to the firmware.
Firmware H that I have supports split controls - we can send
ROI::rectangle and ROI::autocontrols separately. But other
firmwares don't tolerate such a thing and by the time we issue

	uvc_query_ctrl(stream->dev,
	               UVC_SET_CUR
	               UVC_CT_REGION_OF_INTEREST_CONTROL
		       roi,
+                      sizeof(struct uvc_roi_rect))

roi rectangle should be of size 5 * u16 and contain values that firmware
will accept, including autocontrols.
