Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BC735FD4C
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 23:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhDNVam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 17:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhDNVag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 17:30:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D746C061574
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 14:30:11 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z13so18581008lfd.9
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+8jDbRYpf2+3MLXejbj9s6bo0ZqIqzLMTExtFok79dQ=;
        b=cq74Xqk56OAReUniCHNV8wmJmylv646o+yGJ0+gk77n0P0HCRECjfEdILzqp4prtd1
         /VAKu0OxFGFP6Ye6tsLBt7pX4wu+Pcoq1cv856IFgZrGL/AaiBvommp1+L1+osOkVNQv
         PIZwjvwzu7wvKkSTocwMiOdWG3IUwUQ3bq6MQcL4cR4A1dDxmUNAYOYJKyaLhpLHvKR7
         5KgI6Lro0ctEBkKZKHJMA7Q7kVFGyt4sS/mR14JlfLrKlzC54nFzvXFosWb7q7Sx5xxz
         RtPjuOkiVpTKvrC1S1/Hrl7OQYhAXR7FbiNPiz4jNPfvTHuSCgYzes6XXqf7ARKORpU4
         2JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+8jDbRYpf2+3MLXejbj9s6bo0ZqIqzLMTExtFok79dQ=;
        b=QLP7I1Gywo3SOCiRyIzzXon+kqy6bmv9yLkavecV7sSxU9DvXz6oPj5xHy/IIie4r8
         bDtL+y0M11c5pNToS4iX5ecdG0uaMw10nOJRHOWnR+SD+OU9tn+9InJxAPJQdWxU9Uxo
         8hknuPEgSM4nldnwMU27/OQbVvBWi81j9DM+5Qi53JcEkySMjy8VuALYtqbjyGY5AAUo
         MuzzzxXS43qNxMZQKmCYPrVP4vQi2I806lQ32BaGzFeHmZhsa6hVy4SWB+jXJrpf1Wsw
         2W9dpORYGUgW92sHqDKt2MYRFEKtluM9S0/dsDvphzJrGT6T4r1dhCl4QK8iStUBb1Eo
         KjoA==
X-Gm-Message-State: AOAM5300+Rxv9+SCTu6dwHglYGzh9PbFhlwSelXpoc/qwSEACZX3hraL
        dj2EJR+Kb09ShG2RgCnV0GHdm/lzho1Llg==
X-Google-Smtp-Source: ABdhPJxjyRxlRHCJ8qVJ91kQLkVBuV/dPICrhilRx8DFulPWCL5/JldLLYGO1kcDk0xJDi+6hKimvg==
X-Received: by 2002:a19:c70e:: with SMTP id x14mr149720lff.52.1618435809824;
        Wed, 14 Apr 2021 14:30:09 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r11sm253795lfp.10.2021.04.14.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 14:30:09 -0700 (PDT)
Date:   Wed, 14 Apr 2021 23:30:08 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <YHde4J3daEc1VRJq@oden.dyn.berto.se>
References: <20210413173552.2560222-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413173552.2560222-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I managed to screw up the order of the compatibility string in this 
patch, it should be 'renesas,r8a779a0-isp' and noting else.

On 2021-04-13 19:35:52 +0200, Niklas Söderlund wrote:
> Add a V4L2 driver for Renesas R-Car Image Signal Processor. The driver
> supports the R-Car V3U SoC where the ISP IP sits between the R-Car CSI-2
> receiver and VIN and filters the CSI-2 data based on VC/DT and directs
> the video stream to different VIN IPs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/media/platform/Kconfig    |  16 +
>  drivers/media/platform/Makefile   |   1 +
>  drivers/media/platform/rcar-isp.c | 500 ++++++++++++++++++++++++++++++
>  4 files changed, 518 insertions(+)
>  create mode 100644 drivers/media/platform/rcar-isp.c

<snip>

-- 
Regards,
Niklas Söderlund
