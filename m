Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5B947D943
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 23:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241391AbhLVWRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 17:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhLVWRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 17:17:47 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1523BC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 14:17:47 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id b13so13920073edd.8
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ofS9l2qebwP/4iVIsemnUHzvM6pKNrDlGzoJ6fIi4zg=;
        b=GnhmZe1h6FTTH2nJh32MPELKTW7ojgKXikumoF92vVm8XujNXZdnZN0/d4zrgpJj/l
         jcI54ELsP9vg3li/ZgE4WKFEzI71oupPrTMs0+vIDhUe0qCtfleux6ZM3z+21hzn7zQr
         zujEh5K11y9nfS2dzepGCDKqUaEAtPDC1R1+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ofS9l2qebwP/4iVIsemnUHzvM6pKNrDlGzoJ6fIi4zg=;
        b=Of2rVx4hPE7uT7lw/vRXR8zQyRrdCzYMA4LT07ZPhXVQ9Qb3ZnjrPeiykwgphXqsu+
         uL6JZCNikOw1kk/vrX3r0u6Di0/+aRMcX7G/fPxnlDhVCq7irpPp630EWuQt4a9OMTKc
         ctV4oUjeg4vbFo8KHhTRYb/C9FyDQtNnd95mx9/bFP5SAkwE6MhLehZQQnfApe2fT+SN
         PyxjSw+sagnegmjm2xF83p+MvoJE94+73rhabkvfjFA1uD1QGafdT6kLL68je2hV42oh
         smucJ4EwCIRXUfOFkyK45/6dU0KeUMa54iVTg916ZmV8mrO1sc+8Rj/J/QQgPgeWZnTH
         AkaQ==
X-Gm-Message-State: AOAM531jwgxmIQAfCRvOjKySF55q+doBaSBxaGzOsYr8+30XJPvGRY/h
        FWtRWcgSrxmTFGkHg9GnykLbDw==
X-Google-Smtp-Source: ABdhPJyKQZiPqbmCmMmzckiH9gys1Mq4AY8wyy4rqynP1muKZHFdKlWttPT4i3NqFoj/nb0zYSrwYg==
X-Received: by 2002:a17:906:580a:: with SMTP id m10mr3807993ejq.213.1640211465721;
        Wed, 22 Dec 2021 14:17:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i6sm1305577edx.46.2021.12.22.14.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 14:17:45 -0800 (PST)
Date:   Wed, 22 Dec 2021 23:17:43 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: completely rework the dma_resv semantic
Message-ID: <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 17, 2021 at 03:39:52PM +0100, Christian König wrote:
> Hi Daniel,
> 
> looks like this is going nowhere and you don't seem to have time to review.
> 
> What can we do?

cc more people, you didn't cc any of the driver folks :-)

Also I did find some review before I disappeared, back on 10th Jan.

Cheers, Daniel

> 
> Thanks,
> Christian.
> 
> Am 07.12.21 um 13:33 schrieb Christian König:
> > Hi Daniel,
> > 
> > just a gentle ping that you wanted to take a look at this.
> > 
> > Not much changed compared to the last version, only a minor bugfix in
> > the dma_resv_get_singleton error handling.
> > 
> > Regards,
> > Christian.
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
