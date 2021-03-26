Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED7934A989
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhCZOUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCZOUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:20:48 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDF7C0613B4
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:20:47 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so5002914wmd.4
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6xcgNGeiKXVzTZo3oILiZykt3w8GnNqVy7yzUHjFBQQ=;
        b=XeWeBn8WX5c+uJ8CnM+CQZtmzh/4bB4qoMOD512ejsGsAJhBMpIRE45WmKhdf2TLqx
         MiQ6KDk6/7dK5bC7/+YYWLHrtI06Ylrvmd6twooQS+XegMtZPl4Yf+uUHzXSdofzs0cp
         bvHUTHcKSdaDDHV+Y53fP3oLBS8LcoFCOQn4l1FbEJucpwut9t3dciREPiwQSF0ZQKKQ
         Ee1jr+vVwrB3+iekJsvmKwpu8RuaJaotHb+gkCtGTJOoxCEV/+4RHUazLmcluVA1pSht
         YojJg8tbVnIbRSxGQoaeSJBznKPSXq3Clwm4mlT+W4SXXom4TtpEkaUJ2pRM4TzCKw5Z
         FVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6xcgNGeiKXVzTZo3oILiZykt3w8GnNqVy7yzUHjFBQQ=;
        b=OGPXdgihioqBagXdhZBJV17SUriSZgUbLYXqXwhgC8BwPz6qjCJsWYvjJ/amtIaXzA
         cMvzHxqEGkWAuBqGOydY9AzO0vNHeKZv90rMeeoIVzL9mvZUZJcqZxFGxh7qo5vT6KDN
         sNJ0SZemkdOHNb97R4QdtJsiXxrFhu3sqNHqPHihAjP3xxL5xB5bAKkuJ3ebrVlH00ux
         mcQW7XXBb82Crp43m/fY7b+wNYSDtf/Vokuu3D4s1wTSV9cL95kv2nZ3yBDM95tBHmdn
         Fl8ZyiWjnMIhiffjIRaBJAQxrHHAQhFbAFON0fgopvq3dliqCd5y6Tidqzxb7GamGewT
         k6FQ==
X-Gm-Message-State: AOAM531GF4GjCpMSnNDE0V5wLHDgK//Bx3j4gUabyh12H40/vg1COLo7
        1rufdUi/B4q/TeDZ6jqv+rLX4w==
X-Google-Smtp-Source: ABdhPJzCoDvRJ0yro1yeYdy8gIdvQTImgu841Bp+OkX3kL6D2LJpK0xk7inIx+W3Fy7Q3UcDJTIu1w==
X-Received: by 2002:a05:600c:378c:: with SMTP id o12mr13377556wmr.69.1616768446113;
        Fri, 26 Mar 2021 07:20:46 -0700 (PDT)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id e8sm11125675wme.14.2021.03.26.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:20:45 -0700 (PDT)
Date:   Fri, 26 Mar 2021 14:20:41 +0000
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
Message-ID: <20210326142041.GZ2916463@dell>
References: <20210324173404.66340-1-lee.jones@linaro.org>
 <20210326114202.3862b8c5@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210326114202.3862b8c5@jic23-huawei>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 26 Mar 2021, Jonathan Cameron wrote:

> On Wed, 24 Mar 2021 17:33:39 +0000
> Lee Jones <lee.jones@linaro.org> wrote:
> 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> 
> Lee, it's a bit novel to cc linux-iio on the cover letter but
> none of the actual patches..  Or least none of them reached
> me or lore.kernel.org

Looks like only 18 of the 25 actually made it onto the list.

How odd!

Hold on, I'll submit a [RESEND].

> I'm sure they are great :)

Naturally!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
