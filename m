Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D9034EC01
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 17:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhC3PTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 11:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhC3PTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 11:19:15 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435EAC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 08:19:15 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id d191so8590156wmd.2
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hCfGCExGZ032atZREFMuWQJ4hKJ6Pjl2rDpU87CxNjI=;
        b=d0tnXFEBbBdt3KAHMvZjgIVuPuUhTN5DpIRb16zr9Wk5NxGjXgpPfg14g44/A2DAeX
         0xH1xn8QdIWzGlu8Ghy6X5ovM6ayJD5ysiyMKXYOPHyLblqh1+i75rYM6w9+edrv+0ei
         jWP8gNuHMEB6Atp2OLtz6mkl0vofFczh8/mP/H5WPiMNg728lZoiDJKH8usabY4Sth8u
         7kgCg0JF0ybA0kgZvQ7ww95DwgsEXt+/XMHHgB2ANxE1zNrC8sssFlvNJvmCt6BS5+ed
         70/r6Eyxo7jcpJglZI/KMfaaLFBQyepOVVmKurGUAFmC82jpSGDcy9EbVcRinorFzDET
         0Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hCfGCExGZ032atZREFMuWQJ4hKJ6Pjl2rDpU87CxNjI=;
        b=oQLihQEnYP9mLPn+1C0RPL4ZhWPLnmbdOGdpKdZGDnJNCfu13VqbgZyZhH7b3oJ+KO
         V+HtO96bekSEQA/sq0ZulUHcK898TZJiWoksHuRn0M2R1Fa9uw+j309sXMfytljm9UZR
         cmQCRHNvYS+/E4jW8EKVuEgGJLmiNn5VpG8O2uPoSpRA6q2UjoO9rxHiBYE/mpC5qpdl
         OONkPTVI3TvqMbyxq7Bos631IDCvqSZgz3J5MSwNx2gW2yORRnxpPsEtS6/QjIT1rM6j
         R5mmlq68HYbbr6HgMhHzgnDD7HJjGLVXdpWbXfZmgFHARcIMLj8rve1qS/CLTfin1B26
         U6Fg==
X-Gm-Message-State: AOAM530zWk7YQBdgh67xmj5COtABbnVQqhFhosvKRIrpHRZ1BHm/hOhn
        NDyfyExgPcMeERSTc0YuTX3rtA==
X-Google-Smtp-Source: ABdhPJyYgKkqcDOow6JJ62djXw3iIsO/j+KvsfseIB+9/rwYszatw8KxsjLaOFanM+fL7Q88Q/+L0w==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr4641496wmb.84.1617117553836;
        Tue, 30 Mar 2021 08:19:13 -0700 (PDT)
Received: from dell ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id n1sm41945988wro.36.2021.03.30.08.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 08:19:13 -0700 (PDT)
Date:   Tue, 30 Mar 2021 16:19:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        nouveau@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND 00/19] Rid GPU from W=1 warnings
Message-ID: <20210330151911.GL2916463@dell>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210324103611.GJ2916463@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324103611.GJ2916463@dell>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 24 Mar 2021, Lee Jones wrote:

> Daniel,
> 
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> > 
> > This is a resend of the remaining patches.
> > 
> > All of these patches have been sent before.
> 
> Are you still keen to 'hoover these up'?
> 
> Just leave the one that requires work and take the rest perhaps?

How would you like me to proceed with this?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
