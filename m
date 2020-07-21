Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B9822799C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgGUHmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgGUHmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:42:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EEFC0619D6
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:42:01 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c80so1810937wme.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8I4d3yfRPKUddAXMH4OKFOkQh1gH0jweTktqrHFJPqI=;
        b=SVvv7WmMU/Y5r7Bz1LS9CJ5KZudcoOtUtpIHe4inw8Fdgpk0vWbt2aZSxRVvT1RbGP
         +dIqAIlwAMOTZjCAL5PJnhSHjxfyl5xPlAcgOiAUQtvZYQZ1VAnxWN3lgsNyuZh9PE+7
         ShZBr3S4wXdEzKLr/G5+xzpOoA5vtHu1FCB8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8I4d3yfRPKUddAXMH4OKFOkQh1gH0jweTktqrHFJPqI=;
        b=gAzD2KhN0S6LwJ7JWrERNMj5n9wefwRCkx4vVw6mp6kYx4Gf7BT3YxrsW3KfkgwhL7
         iAmjCcrkahs5FRnswB+6p0U7x3B5bJcCKEAmzdkzeqJ2WVupy+lKtrDFwJkSNiM5GKDa
         RMcazS43aRAeVGL+PPvOnkW7u4yAyobcRxj6vSBnQxrvOZ0x7BUyG66i9IYMXV7TaniE
         UYy3StelvS9I6GeLpgZ5332ll1o3r6htp/LFxoPm99+hiybPdF/5HJx0qx5SoPzusvzp
         U4ftiQRGpi42JNBMTdxcY9AiTqkPyc3tL2/IXrovwgXaRy/ZCM7cseV9s1mHBSGFTXYH
         l8iQ==
X-Gm-Message-State: AOAM532UeV7NfGs6tdQ6e7wMLV+XWNV2bFlAtnsuFw9ThpkPvavIBAo7
        7mXXEoTLxuPffyR/9ala6hAuuQ==
X-Google-Smtp-Source: ABdhPJwELMZ3FDmnBcjPCFuUIAq0UQy6OzxYenXzQ86GtS8M6350pulmMr/zJSvRpUKbu1kZupVbTQ==
X-Received: by 2002:a1c:2349:: with SMTP id j70mr2752286wmj.22.1595317320339;
        Tue, 21 Jul 2020 00:42:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w1sm5246860wra.73.2020.07.21.00.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:41:59 -0700 (PDT)
Date:   Tue, 21 Jul 2020 09:41:57 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Stone <daniels@collabora.com>,
        linux-rdma@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Steve Pronovost <spronovo@microsoft.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Jesse Natalie <jenatali@microsoft.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        linux-media@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
Message-ID: <20200721074157.GB3278063@phenom.ffwll.local>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 20, 2020 at 01:15:17PM +0200, Thomas Hellström (Intel) wrote:
> Hi,
> 
> On 7/9/20 2:33 PM, Daniel Vetter wrote:
> > Comes up every few years, gets somewhat tedious to discuss, let's
> > write this down once and for all.
> > 
> > What I'm not sure about is whether the text should be more explicit in
> > flat out mandating the amdkfd eviction fences for long running compute
> > workloads or workloads where userspace fencing is allowed.
> 
> Although (in my humble opinion) it might be possible to completely untangle
> kernel-introduced fences for resource management and dma-fences used for
> completion- and dependency tracking and lift a lot of restrictions for the
> dma-fences, including prohibiting infinite ones, I think this makes sense
> describing the current state.

Yeah I think a future patch needs to type up how we want to make that
happen (for some cross driver consistency) and what needs to be
considered. Some of the necessary parts are already there (with like the
preemption fences amdkfd has as an example), but I think some clear docs
on what's required from both hw, drivers and userspace would be really
good.
>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@intel.com>

Thanks for taking a look, first 3 patches here with annotations and docs
merged to drm-misc-next. I'll ask Maarten/Dave whether another pull is ok
for 5.9 so that everyone can use this asap.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
