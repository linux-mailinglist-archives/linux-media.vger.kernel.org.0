Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71791CD61A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 12:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgEKKMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 06:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729231AbgEKKMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 06:12:07 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2113C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 03:12:06 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id w19so3755168wmc.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=AxDN71QWVlIvPR/Qe9BjED7lK/KCTSrcSC7GeFvMB4Y=;
        b=b+tSFMrvsOVBFnenMDfROizokqqsnSkXcglzgocb+51zy42IXbNcvm5CHNupiOZMBs
         ANqitFhidqbalpsVfp+bA/q0JND5ePnK4K7dgxr1Y+0WOZLuIknw/CLde/AY7WU+iUoV
         fDLkN/x1hi73cW3Lol0SnEsnc+wQwS//RVi7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=AxDN71QWVlIvPR/Qe9BjED7lK/KCTSrcSC7GeFvMB4Y=;
        b=ZXn5s1iXVyngRHrt+xyJVd/dfGXsrT/IeCBGqR3YuIunbBQId9HEAA8f0Ez9BoYuru
         c953/FRyjRtq/sanKJk49pHW3RbI826yf+kvMCPSJO93jX0Di9owvID5pcotPK23Pthi
         xo0CjIN6Vwo9EJSR4HRA33TRszes1mxADuGNDPtxS2gR+XLzoMtjjQgvxL2FkEMX6jRg
         /oq9u8pb91pDpLd/9sSNniGiSobwutiMqtflcMvD1HA1Pgc6vPnx/84cLIix0COngJ72
         f+yFqYeH8IFBnw9KfOyNueg2SauZbXcbnbKfLlipjCAWVBzQ8OHfxqxveAcBn2AWCCoK
         24bg==
X-Gm-Message-State: AGi0Pub9uTZHGPC6M5YpmYBngkeufZGfO8f91tpb25yEvHUEAiDes2vi
        tnoj8cl0dHE4BA7k+W0pXv4IpdYpuRA=
X-Google-Smtp-Source: APiQypJduS5g8MSJy/JNzf+Alo7zIfVFjEdcgIp2nM0k6p91EvBmHQ+tR8aq272pVf8oIkv+vmiJPw==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr2914697wmo.45.1589191925721;
        Mon, 11 May 2020 03:12:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a10sm18015507wrp.0.2020.05.11.03.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 03:12:05 -0700 (PDT)
Date:   Mon, 11 May 2020 12:12:02 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        LKML <linux-kernel@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] dma-fence: use default wait function for mock fences
Message-ID: <20200511101202.GB206103@phenom.ffwll.local>
Mail-Followup-To: Chris Wilson <chris@chris-wilson.co.uk>,
        LKML <linux-kernel@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-2-daniel.vetter@ffwll.ch>
 <158919006380.1729.6928823811672806738@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158919006380.1729.6928823811672806738@build.alporthouse.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 11, 2020 at 10:41:03AM +0100, Chris Wilson wrote:
> Quoting Daniel Vetter (2020-05-11 10:11:41)
> > No need to micro-optmize when we're waiting in a mocked object ...
> 
> It's setting up the expected return values for the test.

Drat, I suspect something like that but didn't spot it. Kinda wondering
whether we should maybe lift the -ETIME special case to the generic
version. But that's not really a safe thing to do there, drivers might
actually use it for funny stuff.

Anyway motivation is that I'm pondering some extensions of dma_fence_wait
and removing as many of the ->wait hooks as possible would have helped.
But there's some nastier stuff like the legacy nouvea and radeon ones.
-Daniel
