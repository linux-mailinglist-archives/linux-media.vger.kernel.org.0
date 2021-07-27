Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333B03D708A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 09:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbhG0HqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 03:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbhG0HqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 03:46:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DC2C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:46:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z2so20210770lft.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KfCDgIimmujgmwup6cGCcNH0e7Hg9J1Xzvh1WHXXQOQ=;
        b=VYJLmO34wz7IWES3EsUCIEzauaeK8p7Gx2MH7HRsKCs3VJZ2BnuRHkVqTKRbJA5TKg
         h+4s4y5iWhf48xRKMHokBfCW5L2EsEUwTVPFgh/F0yjjc8d26H0435W/AvuRbU9Wowmv
         cFdgMns7UHu0it4BkqgpewULEIC6zgeym8QKtIs6KMKIiic1b9lsVZ84QOvW4KFu7d9H
         QQnzOrg0bpRlUCZ4OcNNHXRV4tiMNC5CGfrVciMKdJDyPIXQjfIY0RaqCInIl6S7fjNS
         YFvmSzo2mOPLvD82XqZlwTnqdVsOE0SWx6bz6xIVl08HUesb6nqb1WUASJcSg7usj8mK
         sNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KfCDgIimmujgmwup6cGCcNH0e7Hg9J1Xzvh1WHXXQOQ=;
        b=H5ZczI0pqga4mAlhnQ1MYzKZ9O6AwEjdMIoXfkrFJlNx8MI1Rhyxoi01GZfmmIPFXM
         nnwoBOU39f9dkbqwDJeRaqRKCL+9oDYyELGUCOSE9vUbOtMPpaoZw9/U9izo7BbvXmBx
         4XEaJOXGq10caDEG3i0lns5ti+AE+2PjYMpCso+V9Ap6I1S5pX8Vy2ka814U26abbsdh
         uOjXAAv4z+3H8aXbBBGYoAeF8XV/5BB0Oulj1Wwl8ZQ6wQ56fimAgwuUALgCbwdOUbzh
         8MaqI2rVuc7nNvCg19s1weoVQWH6/8NwnUy6+DlzY4GLyWtNuzNViBzRJkwGFDLfQ/Bo
         Bvww==
X-Gm-Message-State: AOAM5301fSVEXYGFUEknMcDOkSpJJPuE1q53xjg8Fh8hB4j28N/+SJrb
        xyTwJkOIS6hyjtDf+MR57E2sMA==
X-Google-Smtp-Source: ABdhPJwaP9lorJKPUP5nF8YCzif70ALCdnN/uFtmGPZfXCrMjbfwgnv4OIIBZUrMCRn0/MLwY/E+iA==
X-Received: by 2002:ac2:4888:: with SMTP id x8mr15382864lfc.19.1627371974010;
        Tue, 27 Jul 2021 00:46:14 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id 8sm215654lfq.178.2021.07.27.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 00:46:13 -0700 (PDT)
Date:   Tue, 27 Jul 2021 09:46:12 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2.1 11/11] rcar-vin: Add r8a779a0 support
Message-ID: <YP+5xIKq+hOVLOOy@oden.dyn.berto.se>
References: <3b15cc12-2c3c-c622-fcbb-3aed583f09d1@xs4all.nl>
 <20210721085357.4181098-1-niklas.soderlund+renesas@ragnatech.se>
 <20210726160532.GE3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726160532.GE3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2021-07-26 19:05:32 +0300, Sakari Ailus wrote:
> On Wed, Jul 21, 2021 at 10:53:57AM +0200, Niklas Söderlund wrote:
> > Add support for the R-Car V3U (r8a779a0) to the driver. The V3U has the
> > VIN modules connected to a ISP instead of directly to the R-Car CSI-2
> > receivers. The reason being that the ISP performs channel selection
> > based on CSI-2 VC/DT pairs and routes the video data to different VIN
> > modules. In other SoC versions this filtering is done by the VIN modules
> > themself.
> > 
> > While the media graph is very different from other SoCs the only
> > difference in operating the VIN modules is that the VC/DT filtering
> > should be skipped as that is performed by the ISP.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Hi Niklas,
> 
> I discussed the set and the PRs with Hans. This conflicted with my other
> pull request with async notifier rename patch and a bunch of other stuff. I
> noticed I needed to change something else in the set (for ti-vpe changes)
> so I thought I can change this for rcar-vin, too.

Thanks for sorting this out! Looking forward to have the notifier rename 
merged.

> 
> It's here:
> 
> <URL:https://lore.kernel.org/linux-media/20210726154828.19693-1-sakari.ailus@linux.intel.com/>
> 
> I intend to send that in a pull request tomorrow.

Looks good, thanks!

> 
> -- 
> Sakari Ailus

-- 
Regards,
Niklas Söderlund
