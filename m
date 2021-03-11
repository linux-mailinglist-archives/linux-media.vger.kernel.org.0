Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481C6337406
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhCKNcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbhCKNb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:31:58 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF6DC061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:31:57 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id y16so1898030wrw.3
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
        b=CIIAC/BD4HiWZJv5qwhQ9qfLc69qrTy9QBuntzXqyQsbcdQGtlF0Uxjcy0ZFTg+b8P
         sfXuhYSDbtS+1H84ubJowHGoova+nTvdE4WmseXf7gU0a1+St18coJMHpU4NlUAqNlBn
         G6gVDx+Mqi73FbYtvA+zLBz4Tt2LtFMujxiCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
        b=NVQ0QcbpPZSGR/EB0cv2+btdNxdhJIT+vCG9/bpw7JsVSzSW8/dnjf7J3KsbEZB79L
         NCQtYdIfsBEIvsU+jCIdHrX9jPOKL3SKrNbikIxlKExBRuL3D39iXCPA6Kpov1MOsQgv
         9oSdEyhHVqGWYL/8shcs6d8/xCY7sOqXhnJf55iWJcG7pWRylfaesnfOpAhf7yK18/gR
         voL4xeA8cEK7owuzIU0WvmxXpXlb1kj4ij8NBnRkH81Sz7P2892PmclgcwMzHv+9Ts3N
         0WPazE9K4L7sEwjXq+2yc+wqJHtWlr6yyvKdYSjS3i7ws7dVuAYs3yy10Md6ztUub4Vy
         tpgQ==
X-Gm-Message-State: AOAM530JHMW5J/OxZadhiAQSFs5TKlMEpiLGS1QJ/sv737NUj/V4+YtO
        cbpQ+1aqPChg2/U5Njzuu3Oxiw==
X-Google-Smtp-Source: ABdhPJxEmOy2Yvf9KHNGocEPM7wKMMIxgjmjn3qYWtNne7YIpJNNmJ0zRgu4I8/UJrCDTEqBBwHj5w==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr8924011wrv.348.1615469516566;
        Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c9sm3590049wml.42.2021.03.11.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Date:   Thu, 11 Mar 2021 14:31:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Roland Scheidegger <sroland@vmware.com>,
        linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
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
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <YEobySvG0zPs9xhc@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        Roland Scheidegger <sroland@vmware.com>,
        linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308091932.GB4931@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> 
> > The vmwgfx ones look all good to me, so for
> > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > That said, they were already signed off by Zack, so not sure what
> > happened here.
> 
> Yes, they were accepted at one point, then dropped without a reason.
> 
> Since I rebased onto the latest -next, I had to pluck them back out of
> a previous one.

They should show up in linux-next again. We merge patches for next merge
window even during the current merge window, but need to make sure they
don't pollute linux-next. Occasionally the cut off is wrong so patches
show up, and then get pulled again.

Unfortunately especially the 5.12 merge cycle was very wobbly due to some
confusion here. But your patches should all be in linux-next again (they
are queued up for 5.13 in drm-misc-next, I checked that).

Sorry for the confusion here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
