Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEA120F9FB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 18:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387980AbgF3Q5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 12:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387967AbgF3Q5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 12:57:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E793C03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:57:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so19494921wmh.4
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F1OVcMRdH7pfFMyxoqH7cO8CnvCQwxHqOdJ8t5mlJ+4=;
        b=RFqYuhFLqVjsyWdGQ9GHbHyRyDnPG/M/cqmGqFMCIwjdRLdiVpGrYhpUoBD0qH0TjP
         m0BPgZ4VdFm+LloP3pVQQba7mNsNLGh/bBWMKgAmKZp841rSctvs0EjosoBY2a9TyAuq
         TcD8nZt4GVrbsrp7huNpZCQHENgKUZXHC55w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F1OVcMRdH7pfFMyxoqH7cO8CnvCQwxHqOdJ8t5mlJ+4=;
        b=oVoRxhT3S9OAdCWZNs+VHKeEjLqYw7YELIO4ursznx5410QQPS2eLiglVIPUM8N5nz
         g+7l8SrfHYe2OB5K7ZsjbcwOgzI/9aj39KOJzaaYl0p6Q2mVUpQZ35hwVL7wIRvEGN6Q
         oQ4EN+AAVSebRLfeWT4kVbpwgLpu9hl++wvUtdM74Fa8Y9OPSB9/j0ptFCVnrICOugld
         46Vl/U0rIDZEUEeEavkZUDsqbSCEOvCculqqcVQnBoEsrtIigUBaVU0jP3+gtkoMOAfj
         6yIGE9v2Ff70qTJLAezFA2sqRCQT1qSmmnbEt+ZlRQSEMCdiqAczTlMiqFAYTHCFvgTr
         XfPw==
X-Gm-Message-State: AOAM530ex2FqnXxkhDB25dlwODuRswOhXJQwcjvlrnwvZSjHE0K9gOoF
        rPkAgGgUloJEQkGSgcvHVtXu6A==
X-Google-Smtp-Source: ABdhPJze1CyJQ1QCR4KBTWFIsYVngiTV+R7vUWN3M7L2nNrUKSGogwkdt41fB1NfGMtkkwTqs4kipw==
X-Received: by 2002:a1c:2183:: with SMTP id h125mr23738626wmh.83.1593536222373;
        Tue, 30 Jun 2020 09:57:02 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id g144sm37289406wme.2.2020.06.30.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 09:57:01 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:57:00 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V9 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200630165700.GB1212092@chromium.org>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200630062211.22988-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630062211.22988-3-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 30, 2020 at 02:22:11PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor,
> providing control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  12 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 554 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 568 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
