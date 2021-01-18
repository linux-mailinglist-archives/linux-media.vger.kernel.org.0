Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B822FA386
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 15:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405076AbhAROrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 09:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405264AbhAROr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 09:47:26 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46517C061574
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 06:46:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id y17so16705134wrr.10
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 06:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=OFCYur2p1RG6wq2GuEDBaWE0Jb4tQR4iZ3ZSFGTYM3Q=;
        b=MORI3SlYIrEkdmnCv+sjKCAmt9E08uuQb12loXc/lT36i7Bm4U3JdKozMG0qxvUrzw
         IMVXaOFnQZAzmhic3tx7YaB0IcMjXKAl8lA802YdXPEMuzut8sXnLwFwdIp6dUMmqUjx
         um9R3CaD5IRuDrSAgDos6Nn2Lt9/Q1M2fhjAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=OFCYur2p1RG6wq2GuEDBaWE0Jb4tQR4iZ3ZSFGTYM3Q=;
        b=ekmK03aEjEcCP0SeSoS+uEsGI4OOXQHU1s62JSmwfrzPnsQMSKMQH0TeCbY/w1cCst
         wkH/WcFQ8EJp5BOklidRhx+QN+/+M2z5orq4wD47MRe1YsiBkP4MgJSdLpVEnXdlU6jJ
         CcCSSmZqZH7g1Ah5Co69+1Z/S3ceLbIhI/4Ui2ip3BIKsE42DsEFJwbWUXV8Cu7kpTSx
         nbrI19B64z2kTqXx2hIuNJQSww8TUJY3RupWrsUdpBWsE2FGk29ZgtyL3KhgqtLWLTob
         Aa2MWiUpEp/AtFqxU9ni4JuY8P0B7THGs/edN5PHkmxxWNEgFiDi6TXl9HMsLlsWJVkb
         c3Fw==
X-Gm-Message-State: AOAM530N9Bapdga6UA43+JWwmSq9pqVvlt2jf2zFLMMkMYaz2yB8NBUY
        RhrdAm5sQRxvH2JeuNjQJp3CZg==
X-Google-Smtp-Source: ABdhPJyDCDO+1fmc1K2ew5LzU7f8vg/ienWX3/ewHzh+gElcHa7lnFCJ1WZ1SRCLGxPa5q6k2ZRqsw==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr25684833wrq.78.1610981205075;
        Mon, 18 Jan 2021 06:46:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r1sm31249890wrl.95.2021.01.18.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 06:46:44 -0800 (PST)
Date:   Mon, 18 Jan 2021 15:46:42 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Zack Rusin <zackr@vmware.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Cox <alan@linux.intel.com>,
        Benjamin Defnet <benjamin.r.defnet@intel.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Eric Anholt <eric@anholt.net>,
        Jesse Barnes <jesse.barnes@intel.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH 00/40] [Set 14] Rid W=1 warnings from GPU
Message-ID: <YAWfUl56zsi18/Y+@phenom.ffwll.local>
Mail-Followup-To: Zack Rusin <zackr@vmware.com>,
        Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Cox <alan@linux.intel.com>,
        Benjamin Defnet <benjamin.r.defnet@intel.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Eric Anholt <eric@anholt.net>,
        Jesse Barnes <jesse.barnes@intel.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
 <328B978C-0A69-4220-BE63-7C4E4D627225@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <328B978C-0A69-4220-BE63-7C4E4D627225@vmware.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 06:22:23PM +0000, Zack Rusin wrote:
> 
> > On Jan 15, 2021, at 13:12, Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Penultimate set, promise. :)
> 
> 
> Thank you for all that work. For all the vmwgfx bits:
> Reviewed-by: Zack Rusin <zackr@vmware.com>

I pulled all the non-vmxgfx patches to drm-misc-next, I'll leave the vmw
stuff to Zack.

Thanks for your work here!
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
