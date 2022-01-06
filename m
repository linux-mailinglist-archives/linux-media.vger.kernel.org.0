Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D00486765
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 17:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240992AbiAFQKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 11:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240985AbiAFQKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 11:10:01 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52908C061245
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 08:10:01 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z9so11232686edm.10
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 08:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7BJFmNGV2k9AGO7NgbxihQvyvms13M3j2E24yydNI10=;
        b=QgwRqm6p2c/m63+nWCiYQiyDzvxc19W3Rwo2LpQlQxarOibeTBefC+PgsKLHLtDKUT
         zyHGg04f74JMvvx/ePEeGtKlhlWj81YGd8bch+MFcMgyHtL7yArWnC3LewkNLTjr2yrg
         xsgKlHMI7QlARi6+mpxRk2e8Cxu+Dh68so1KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7BJFmNGV2k9AGO7NgbxihQvyvms13M3j2E24yydNI10=;
        b=0MetzVfvplxJehWl9f97wrO2M7NQFiTOP7hv0W4VrjuEskeaivvHLNEC8j5WtShxNS
         RyAQzC/nfmC8JzewMJRoZ3h7n4BIg+Bt9XlNwYuG7MOxRIVYemrwg5WM1FW05tC84D2u
         axfsKnr5Xec62HdD5QbAe5sMLu/6xyhl7uGpD57EPz6/vgEfduyXLiFpiV8UTc//WkOD
         hJBjU5JI5KbODna414ZfO+KHTI6u/usGPP93lh3rNvlcU3T0ogfFhn3GiQwtiGxHgRPS
         Og65MNgCLiA0uqeh3ciFFSN6bnhMoCPMdRzqBj37bi9tbGbYOpdNCBGHDPeRrZf2iaoa
         8eng==
X-Gm-Message-State: AOAM531cnEFL86uBKQSJhHajKs2HCaHsTnbXIDygDk2Plo5uNRnu2Oep
        v7BgHVmLfCBpMNvo2LNWC3hJVpYsivN0Wg==
X-Google-Smtp-Source: ABdhPJzQgAD0VfVlyUchrBAX39cgDZC9RU50UR5ltKkyf4fjBCWvt++z7VNBiB8ZFJESVwBoRNS/wQ==
X-Received: by 2002:aa7:cd71:: with SMTP id ca17mr18854723edb.19.1641485399795;
        Thu, 06 Jan 2022 08:09:59 -0800 (PST)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n25sm887212eds.9.2022.01.06.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 08:09:59 -0800 (PST)
Date:   Thu, 6 Jan 2022 18:09:58 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@iki.fi, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 0/1] media: ovm6211: Adds support for OVM6211
Message-ID: <YdcUVmuIoPBZQ66B@p310.k.g>
References: <20220106160426.2683742-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106160426.2683742-1-petko.manolov@konsulko.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-01-06 18:04:25, Petko Manolov wrote:
> v3: As usual, not everything is perfect, hence v3.  The patch set is now merged
> into one big patch, redundant code was removed and the end result tested on the
> board.  DT bindings are coming some time later.
> 
> v2: Removes an unused function (ovm6211_set_pix_clk) and this patch series is
> now based on media/master; Didn't receive any comments about the RFC version,
> thus i assume everything is perfect... :P
>                                                                                                                                
>                                                        
> This patch adds ovm6211 driver into the staging directory.  It also creates
> media/i2c entry, where ovm6211.c lives for now, to mimic the generic media
> source tree.
> 
> Petko Manolov (1):
>   media: ovm6211: Adds support for OVM6211
> 
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ovm6211.c | 1043 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1054 insertions(+)
>  create mode 100644 drivers/media/i2c/ovm6211.c

This is a lot cleaner version than before.  I've removed the xclk related code
and header files, removed dead code, etc.  Overall, things are looking a bit
better.  I'll send the DT bindings in a different email, perhaps tomorrow.


cheers,
Petko
