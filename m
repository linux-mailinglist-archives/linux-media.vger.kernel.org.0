Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4619656A01A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 12:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbiGGKiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 06:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiGGKiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 06:38:22 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9A032068
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 03:38:21 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id o18so16540955pgu.9
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+OvvoQpRMUBXNwZMipObHdm5ZbPPau13auF+4YgO+uQ=;
        b=dieFHrPL/5r5YBocpAbCrENsMjL6T5giDlGVEg2cOTONGcG6J8X5FPum0E7qPM8bGO
         ot6zYWEANBSpuVnkC4dYlmsCdN5VXZd9+Q1QgFIl4jYPeV4B89HxMj7M9+vYRTfDh2eD
         6yt2TKV8O9d38MgLk/Ynf1u7Pk8WJXYGQ1AQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+OvvoQpRMUBXNwZMipObHdm5ZbPPau13auF+4YgO+uQ=;
        b=w4LqUTp5qS+MvNjv34zx2HwHsXs3IA3PPi1nfOzupt1bD8ky609Ke1CcSTwmJRz8yu
         LkU5vkNIdd18N33zuZMy1R3bDH3qfQoyvKaMIJK7LEKKqB7UcCkcLDozv5p+TL0CV6Wo
         Xcqcqea/CPumqft7GwgcO6ATw0/0vxiBjzc8pfYMbMobEiFcNV7eSFWplN1pvsGMoAyU
         bXnX0aKsxBtfjWRJYgtAd5vHtT7rLrSi1JuW/7L2hgt8AW/UooN6o12Yfet0kFJ+6QUv
         dsaiLNzvCJISna6Wbl/AOKuWnIkxZJxXJz3d92qatxtXqDIewrPTaYnX0dnJvNLJ/HcQ
         K6qg==
X-Gm-Message-State: AJIora+N7RgYU3SbXSlempglJG8Xs/FwkDD8fl6mjuh/uXQFHywUVAyh
        VFQ9fgyUuB25JmMoFXutFRpgoQ==
X-Google-Smtp-Source: AGRyM1tX5KDrP3gS1b/LTZGEMPL0jXG+GGlQtZRm43aRLJMV5y9lrNjwz8/dF6z9DfY+LGljrFbMgQ==
X-Received: by 2002:a17:902:db11:b0:16b:9057:8007 with SMTP id m17-20020a170902db1100b0016b90578007mr50015661plx.49.1657190301278;
        Thu, 07 Jul 2022 03:38:21 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:e189:4251:f442:cb5b])
        by smtp.gmail.com with ESMTPSA id z3-20020a170902ccc300b0016be368fb30sm8625566ple.212.2022.07.07.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:38:20 -0700 (PDT)
Date:   Thu, 7 Jul 2022 19:38:17 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 00/36] v4l: routing and streams support
Message-ID: <Ysa3mVW7Mf95ZMcR@chromium.org>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 01, 2022 at 06:11:20PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> Here's v11 of the streams series (used to be "multiplexed streams").
> 
> v10 can be found from:
> 
> https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com/
> 
> This series is based on the v5 of the subdev active state:
> 
> https://lore.kernel.org/all/20220301105548.305191-1-tomi.valkeinen@ideasonboard.com/
> 
> My work branch with additional drivers can be found from:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git streams/work-v11
> 
> And there's also the v4l-utils series to add support to v4l2-ctl and
> media-ctl:
> 
> https://lore.kernel.org/all/20211130141815.892354-1-tomi.valkeinen@ideasonboard.com/
> 
> The main changes compared to v10:
> 
> - Rebased on the v5 of the active state series, which has different
>   locking system than what we had in v10 of this series.
> - Moved code around in v4l2-subdev.[ch] so that the functions are inside
>   the correct ifdefs
> - A better route validation helper v4l2_subdev_routing_validate
> - Subdev enable/disable_streams ops (see "media: v4l2-subdev: Add subdev
>   .(enable|disable)_streams() operations")
> 
> There are still some comments I haven't addressed from the v10 review,
> and I'd like to change the route flags a bit. We've also thought about
> adding more support for drivers that don't need multiple streams but
> would still use the new streams APIs to simplify the drivers.
> 
> However, as the v10 is already quite old, and I posted the v5 for the
> active state, I thought it's better to also post the current version of
> the streams series.

Thanks Tomi and everyone for working on this series. With the few nits I
posted addressed:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

