Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECFC3593AE
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 06:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhDIERL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 00:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhDIERL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 00:17:11 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118EEC061761
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 21:16:59 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t7so2109112plg.9
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 21:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a0qsp2jIyenJ7KHlPYVUT6/QMykCuCokvpYJBkoNKqc=;
        b=UwV8R/Q8+Casp+Pr+/Ktx9Z6WK5t0P2rFMKBKIpUjWSSl8OSpfZViFSMulAfx4hbnP
         W49eveLRdRyxptJtTAhj7Ikfmsb9guP7kMgG4HGKmLeg9RZJ1zmYfrtgkFl1LJLvvd+M
         jAYoAdCI5eDyI/Y457bz2jfz3irfpyRFuTLaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a0qsp2jIyenJ7KHlPYVUT6/QMykCuCokvpYJBkoNKqc=;
        b=jxvVp6czjjfjOT6IkMj6S0VJv9gVYbQRkB7WrlSu4dFx1JNry8F6mXbODqljtuP87V
         SRKxmPUP3C/S56uhPykboTUdBRq7dHrD8Lbkno9G4Tl2hCe9aS/tyDSnncku/Fr0rjMt
         4esIMdAbUkm5QgW1T914OjkOsMOXBM/QCnO6qey6cO+3p2KRLU5f6bi+uq5Cp71YWIlK
         88dxlGta4nxPQrFqKcC7ikrNLlalO3QFE4/DvKGHa8F6cnr1DstYUYrVfhx66rEWCIRM
         d2g6OgHBVsf0eLlWmoUt1ELvzmmPzf65ZjJuwY1wNkvTIYhbguehCy1iPQ5mx1MQtb1C
         dCHQ==
X-Gm-Message-State: AOAM530Ygzn9BoPKoWU+ZkVEPlMh1RZc6W8pnkApTxd61fJXN07qu+fA
        uf/l1+RpOzk1hQj7D4GLWh37jg==
X-Google-Smtp-Source: ABdhPJyGyvCVEa7LiGau1j+FxGNErVPRWIzRVPPBHEYkQhjh2VoBYdj4TU0vPnGb3OyVgIqdufgkqQ==
X-Received: by 2002:a17:90b:ecc:: with SMTP id gz12mr11681301pjb.79.1617941818642;
        Thu, 08 Apr 2021 21:16:58 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:2:4c17:c5d7:544d:4527])
        by smtp.gmail.com with ESMTPSA id y66sm794846pgb.78.2021.04.08.21.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 21:16:58 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:16:54 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging/intel-ipu3: Fix set_fmt error
 handling
Message-ID: <YG/VNufYSadPL9a9@chromium.org>
References: <20210315123406.1523607-1-ribalda@chromium.org>
 <20210315123406.1523607-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315123406.1523607-2-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 15, 2021 at 01:34:06PM +0100, Ricardo Ribalda wrote:
> If there in an error during a set_fmt, do not overwrite the previous
> sizes with the invalid config.
> 
> [   38.662975] ipu3-imgu 0000:00:05.0: swiotlb buffer is full (sz: 4096 bytes)
> [   38.662980] DMA: Out of SW-IOMMU space for 4096 bytes at device 0000:00:05.0
> [   38.663010] general protection fault: 0000 [#1] PREEMPT SMP
> 
> Cc: stable@vger.kernel.org
> Fixes: 6d5f26f2e045 ("media: staging/intel-ipu3-v4l: reduce kernel stack usage")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
