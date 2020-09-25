Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EE32792A7
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 22:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIYUvd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 16:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgIYUvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 16:51:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA60C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:51:33 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id s13so435323wmh.4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Z8BhxippfUZtNdFWughgH1+PbNc8MO7lSd+o3iCM/c=;
        b=az43cNIGArpsiSG7XArxrcjynb+/3qdG+QhjsePPT3YYAqZ27Akk8mwp+GB/ngAWOx
         pYVxv3K1i3Swfguyz4MetZrG4YnJIrLv/S/QGBX+1MO5T24OcvXzkyjRXCL1dHj8rG7Y
         0sQgxghsAT2MkyZtzxfhfx/uA4rkuPiPPv8Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Z8BhxippfUZtNdFWughgH1+PbNc8MO7lSd+o3iCM/c=;
        b=RVYF67KQqYCqNmqvJn8N758yjV0ywYYctC5nqpcDhqIC9jWvPs4+nhSXn+LbmlMEdX
         f9lXLajwEdRJjr8d7YotKYEu8eZFUvT+LNt54Qw0b/6RkbF3Hj/BHnTckg/0Govr8s1D
         +kDiAODXkTpClWgo2o39kMFS4Z/giuH8mrJ0k8Akr/VwmY9H8YsleKOfogWOH804mWor
         Vx4p+2lRkx5ic1Y9bTxbvO5ZJSFouTo3z24KPeaONP+ynkhsNLBGe1r93z4UKPezO9H/
         9dw3GSPHMCTwo3+T2v3xu1svmhBrxHGt+na8+eMRGCAFOHdaXowjoXMKGkNTGyUA0zHw
         UPzw==
X-Gm-Message-State: AOAM530coBMSx6t85r02e6ELZbUOYjq1qw5rCM4o2QtDTbYtIr9TM+NV
        XXQ0/rFM3vc0gHVqy4CaqC0uBg==
X-Google-Smtp-Source: ABdhPJzYUznBEdWLTjkDwuAoMOIGVJulf4/Elk/DYZsm4boK+w9JCf6nqJanlLuh6gjwyoU54cTg1Q==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr381308wmj.65.1601067091972;
        Fri, 25 Sep 2020 13:51:31 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id t6sm4632341wre.30.2020.09.25.13.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 13:51:31 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:51:30 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 11/12] media: staging: rkisp1: use the right variants
 of spin_lock
Message-ID: <20200925205130.GI3607091@chromium.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-12-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922113402.12442-12-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 22, 2020 at 01:34:01PM +0200, Dafna Hirschfeld wrote:
> When locking, use either 'spin_lock' or 'spin_lock_irq'
> according to the context. There is nowhere need to
> use 'spin_lock_irqsave'.
> Outside of irq context, always use 'spin_lock_irq'
> to be on the safe side.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 15 ++++++--------
>  drivers/staging/media/rkisp1/rkisp1-params.c  | 20 ++++++++-----------
>  2 files changed, 14 insertions(+), 21 deletions(-)
>

I'd prefer to keep the irqsave variant, as it doesn't hurt, is more
consistent (all the calls on the same spinlock use the same variant) and
makes it possible to refactor the code easier in the future.

Best regards,
Tomasz
