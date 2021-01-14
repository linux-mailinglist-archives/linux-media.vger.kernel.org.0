Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCDD2F5EDA
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 11:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbhANKeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 05:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbhANKeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 05:34:37 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A201CC061573
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 02:33:54 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id n16so5225771wmc.0
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yaIv+nhOILu/3I9bOPLxY99wOuAF6NciDB+QzXelzGY=;
        b=x8ApzkDMlTt2JG1XTWJhNr1UKtQ6IFke3c3xr3SNGi+9jXp61r4rSclfE/x1ZsbC6E
         kc3JWmQopOjyxq44LwowQmbznGUqSL8wNXevUO002EUou0BIqTw8RYLVCiGE12+CxOX/
         fxzIAzI7B2R4ewJDEktxUkcQ9SXPjACGgvZ9SFyT7k+98Hh+k6Ffwn0+1CFwBNjXgJeC
         HZ9wtKBjT9978oC3ER0xABCm+aUUHni1g67qqK7MQvH1V6NJJE0oBi422TUbvcXF/XDo
         OhKFaCHNP4yp/yeXwV/H58LDpQdqoatqp/ojdlHvfoNnH0n1NERfvwFqNzaDrli1Oe+I
         VJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yaIv+nhOILu/3I9bOPLxY99wOuAF6NciDB+QzXelzGY=;
        b=InKLZVSFgLNdr++nLEDErNf7eF+Js9exVSkO2FJEm4v7Bcv+K5OA00jCwHIffRGGew
         5DuN3c6cIWegRDKzwFTKfJ4hqxjrkn/OsI+MapFGzEYfybTCPSKgiYY2P6TYpodINLIL
         /I31VRi11X8TeEPNcmqLKdK04t7UgjDtVNlbxCPgYq5totWohCJZ0MOgS7rnPzM6q8Xe
         DZUHjHNSPThoXio6qNzbIwtBAVGDFEf4CAOfe6YWOwfrHSfm1iRdZvKLaV4JPlz7ncnw
         /u6hmXGrUFtmQ9VIomodTCnRJdB9HbKUv/dGCoOhv4ufMkQKopaEUoKLRsQOackwAcnr
         1U9g==
X-Gm-Message-State: AOAM532S86mtM5cB397Olby3aBAy8b1lgCOAfWRp3BsbMBDiJiXGk4tk
        wIAjQGcNQGSJ/phxR8pbRZa3Pg==
X-Google-Smtp-Source: ABdhPJxOYTenjJAea68Lbo43i7Qv6whisJfp5qKHWu1LHfCUfeuuNEisJHD+dQOSAgNSMN4zAvV+tQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr3262314wmj.52.1610620433288;
        Thu, 14 Jan 2021 02:33:53 -0800 (PST)
Received: from dell ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id m17sm9413232wrn.0.2021.01.14.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:33:52 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:33:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>, Leo Li <sunpeng.li@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Noah Abradjian <noah.abradjian@amd.com>,
        nouveau@lists.freedesktop.org,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 00/30] [Set 13] Finally rid W=1 warnings from GPU
Message-ID: <20210114103350.GT3975472@dell>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Jan 2021, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> 0 out of 5000 left!
> 
> LAST SET!  You're all clean.  Can you believe it!?

Ah, fair warning for you: we're not yet done.

Arm is clean.  There are still fix-ups required for x86 and PPC.

I'll get right on it.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
