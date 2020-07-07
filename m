Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700B8217543
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 19:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgGGRe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 13:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbgGGRe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 13:34:28 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A3BC08C5DC
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 10:34:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f2so18112124wrp.7
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ITreFSF3QwB0kHeLsgLwmjRqxc7iMrP7mMrAbIuhNUU=;
        b=FgAys2nNA7C9G59JR2094Dn1BI10+vaU1RGrdY3HbiFXgeubNKu7Qi5fHE7DqvFI58
         V4VtDi210MNlIp2kmbfEU4Cr1JqcdQS/JhjfjNhghH8yQnqQgHZ65gMO8VZM/z/Szz+1
         eSKtRG5Dl18VIInxkT6IbeXAy26ssTJUNLU9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ITreFSF3QwB0kHeLsgLwmjRqxc7iMrP7mMrAbIuhNUU=;
        b=EvvcPpsqgDNED7ZSD6RWfJNBcTORdcnxuauhiNzhdYp5Nun62pyJ+/uspPpOOVMdyP
         S24+QqCSpnejLBTF2cheiTYwNm7AigZk6UApwjRcrVBBke4kysiG7/ZgRPmn4yv8Y3lR
         zKJJ05tfdqx1l5er67O1j64UqqJj6zjwCQW+iqYRkKSZ4YG/unmKp7CQnHb5/lXimlDP
         7Y8VuV5dZ66NxZFe3q0S/F8P9n3HOIKDEr7QNTbn1x0lXteuOjrtCU5KZcP+Ri6OZL2l
         1sNr1lfXD99B8tNMjCj7wnyi0MzgP63dxMtgK/mGYeJ/wP2Xi2y5p4t8sD46SPzJb78f
         8BcA==
X-Gm-Message-State: AOAM533W4MhRDHI4k+woOKKdNg7Q5QsePwcrHhbm7BF5lGA39LwCH4bL
        Bpyh2eOYwbR/JtzbvT4qXZbvlg==
X-Google-Smtp-Source: ABdhPJwHYhg0CvN95fbCzB2YKA5y0Ej4SSs/h2hUyk34tRNvM1SJJ+fd0GK7wdywTV7GzQxoVx6gCA==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr53889112wrr.325.1594143264656;
        Tue, 07 Jul 2020 10:34:24 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id n16sm1860378wrq.39.2020.07.07.10.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 10:34:24 -0700 (PDT)
Date:   Tue, 7 Jul 2020 17:34:22 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 02/11] media: exynos4-is: Request syscon only if ISP
 writeback is present
Message-ID: <20200707173422.GB2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:41PM -0700, Jonathan Bakker wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> On FIMC variants which don't have writeback channel, there is no need to
> access system registers. This patch makes the driver request sysreg
> regmap conditionally depending on whether writeback is supported.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
