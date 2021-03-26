Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BA534A995
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhCZOW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhCZOWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:22:24 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93944C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:22:21 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id o16so5878895wrn.0
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jPrss6MgeIvEfu+cUNSjrJCOpcljezeh6+dDf7NPDa0=;
        b=NjVCbBdVhpCtF7cQoLz45keDeqicZaSTkXDP951der0x2QQYIp9fHHev6kcunhfpz6
         bUdkTdaiPd2oW5CwM83DHOv6FmDQCUbkZxXVzeOz3Qrd/FjNADrDk6oRM7POjoYXOPTT
         x7PNhS1oVP1P3xCW6vYeVjOCO7CA7bbiNY9Ik38D3mcwW9SCYHoqci7628F8tm57vSmm
         VO+NUhBWAh9mib0vaqb2FCXCjHfWhxHX0b8FhNx8eIMBdoF78kQ7/f3pD2QO8ovWqMwx
         uAAUplq3CihgzTk3bAjsK6w9XUzDrtieZd7xiYqxupACowD34HMzX3HWc0fo9RnjanJc
         elYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jPrss6MgeIvEfu+cUNSjrJCOpcljezeh6+dDf7NPDa0=;
        b=e7WVpkQG76CaYatPpbeOW/4WaknFhWpqIQzA13Jek5s9AbtAYQVDF/x9DcgE4Qpiud
         qzkhAfHD3Pz044Si6SCrF4TcuiR8bW7id24gfK9Q+RCVMkF7ixK7/iW4C9yIlfSPhvJc
         vqO0rZdZ5blolajltZOSW5qUucm7LdjEehf4mUfuIsnSZ8FhBz2Ak7gIltnLSardpG8s
         iGSWEEuy207dFsXqp8vvQHVwmxR5LRNp10+gn8Yaue5BvX4nuEjrCJlBJJ1+4LHi7wzn
         vXUDI8vGRvbOopgfQHDb7c0WTIjWrq4ExnyTxp84B2Wht5CTAkOfbfp894SjUat5Eo70
         tWxg==
X-Gm-Message-State: AOAM530/LIxcb/z/zT3c2XG+rqIF0YaH058s9Zbrg1csz2C5cmi720tD
        aE7BXoIPIssnRl0LyAQL4Qm96Q==
X-Google-Smtp-Source: ABdhPJwZ8BOpa2TGeYwtefzDJ+tZQkFdJIoEeZ72w1wchMYOQ50a7VJGaZoN4pp7Dmug5Uv1b+VT2A==
X-Received: by 2002:adf:d207:: with SMTP id j7mr14783922wrh.150.1616768540289;
        Fri, 26 Mar 2021 07:22:20 -0700 (PDT)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id f16sm12744884wrt.21.2021.03.26.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:22:19 -0700 (PDT)
Date:   Fri, 26 Mar 2021 14:22:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-usb@vger.kernel.org, Lopez Casado <nlopezcasad@logitech.com>,
        "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
        Masaki Ota <masaki.ota@jp.alps.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        message to <vojtech@ucw.cz>,
        Michael Haboustak <mike-@cinci.rr.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Vojtech Pavlik <vojtech@suse.cz>,
        Zhang Lixu <lixu.zhang@intel.com>
Subject: Re: [PATCH 00/25] Rid W=1 warnings from HID
Message-ID: <20210326142217.GA2916463@dell>
References: <20210324173404.66340-1-lee.jones@linaro.org>
 <20210326114202.3862b8c5@jic23-huawei>
 <20210326142041.GZ2916463@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210326142041.GZ2916463@dell>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 26 Mar 2021, Lee Jones wrote:

> On Fri, 26 Mar 2021, Jonathan Cameron wrote:
> 
> > On Wed, 24 Mar 2021 17:33:39 +0000
> > Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > 
> > Lee, it's a bit novel to cc linux-iio on the cover letter but
> > none of the actual patches..  Or least none of them reached
> > me or lore.kernel.org
> 
> Looks like only 18 of the 25 actually made it onto the list.
> 
> How odd!

Ouch!  That's why then:

  4.3.0 Temporary System Problem.  Try again later (10). p19sm1466367edr.57 - gsmtp

> Hold on, I'll submit a [RESEND].
> 
> > I'm sure they are great :)
> 
> Naturally!
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
