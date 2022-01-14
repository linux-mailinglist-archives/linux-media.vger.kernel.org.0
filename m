Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7B148EE34
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 17:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243397AbiANQfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 11:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243394AbiANQfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:05 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00500C06161C
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 08:35:03 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso8414850wmj.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 08:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zGlBq5g8ptXdKqtDPcUnhTEEW/MEdyIn3q+yGm9ho3g=;
        b=ckXWl+PtxcOsT0oSIvB6y5mLpkZddQA/u3ayFbKYoRbW1fj6yKJ6DCV9Y3nGdmuuYw
         lUwY6qhx2wx/nUfw61/7J3Q1EebwAmtRIa92UFg2MxoZZjMlswrP8NwJN+g1Le4ca09B
         LWcsVXQzyXmD5eHETwtBpuXNQ2fadfoX0HTMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zGlBq5g8ptXdKqtDPcUnhTEEW/MEdyIn3q+yGm9ho3g=;
        b=GH9TtxjasIO+CiAQrij9mQuCvjFhAFk0yK/CwkaOnWQ9oJblHqEKwAd1z2fItGOrCn
         0DuPV1mAmECl9TnPZ0QjXKhW3ntQ2C1NV7ooUHxFBe6JQSl+82/S/+135wGmm8o/i6pC
         O4OPoMF8YIKOVyGikmKsgKuKDrhxKyKLHDA5j9gCIaUkva9pekeUo6R0Ogy2ZCiRLNSS
         4hGDP/AD6H1AYLNUoHw6oXfEzsg7wlfAW9/7gVLEuvZeE/Rpd1iFyJW+UDvHQiF/Scu9
         8olhjJt3RbRz4aI3yQpQ5NnYcTR64m7j+gVtK3FUI3jrJTVpe8D3VaQwkdhQoxmDrYXM
         t1kQ==
X-Gm-Message-State: AOAM5334JG7bLHL3Z/T3q/yQdR3bQa6hjiC8ffLx24f1gALGLqozbuNB
        0FJYK99qVckinAdtLKXrpfUMjTV4lMIX+g==
X-Google-Smtp-Source: ABdhPJyJ3GXKxktqyZcpdYltCojGpZn7yTTN1XfRK3SbwOwOd76JQriZwRXbLy+Jcv1d26j6z74Nnw==
X-Received: by 2002:a05:600c:3b0e:: with SMTP id m14mr16041188wms.130.1642178102656;
        Fri, 14 Jan 2022 08:35:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o38sm6350798wms.11.2022.01.14.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:02 -0800 (PST)
Date:   Fri, 14 Jan 2022 17:35:00 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: completely rework the dma_resv semantic
Message-ID: <YeGmNGuKtNDYNmsj@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
 <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
 <c63e62cc-e48e-2e81-571c-498e4d16fd21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c63e62cc-e48e-2e81-571c-498e4d16fd21@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 23, 2021 at 10:11:20AM +0100, Christian König wrote:
> Am 22.12.21 um 23:17 schrieb Daniel Vetter:
> > On Fri, Dec 17, 2021 at 03:39:52PM +0100, Christian König wrote:
> > > Hi Daniel,
> > > 
> > > looks like this is going nowhere and you don't seem to have time to review.
> > > 
> > > What can we do?
> > cc more people, you didn't cc any of the driver folks :-)
> 
> Well I've CCed more people and lists and the first round of the patches.
> Just wanted to get some more comments from you first before widening the
> audience.

Ime it's good to just always spam driver authors on big stuff like this,
increases the odds more folks get involved. And in the end we need the
entire subsystem to understand this (or at least not accidentally break
the rules you roll out now like we've done in the past).

Plus you'll get the driver acks faster that way :-)
-Daniel


> > Also I did find some review before I disappeared, back on 10th Jan.
> 
> Good, then I have at least something todo for the first week on January.
> 
> Happy holidays,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > > Thanks,
> > > Christian.
> > > 
> > > Am 07.12.21 um 13:33 schrieb Christian König:
> > > > Hi Daniel,
> > > > 
> > > > just a gentle ping that you wanted to take a look at this.
> > > > 
> > > > Not much changed compared to the last version, only a minor bugfix in
> > > > the dma_resv_get_singleton error handling.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
