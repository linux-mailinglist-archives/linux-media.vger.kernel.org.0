Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C723374AA
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbhCKNwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbhCKNwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:52:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A65FC061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:52:01 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso13231646wmi.3
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GdXN3z4xkG8mhrjjLyuf+xPSPLFfHaqc7TyE3s6lR5o=;
        b=mzyHuGYkxuGBqtX56UH+ZqkeHQrY7cxjlNcTXAnF2iB0rcPRz1a0NOXIcbCaQA03iz
         EDY3iXzg3ylmx6DshXuHd/xYeDBmICAzMcMb1ziWGbtGMp88T3If/JFMeDUTgYLA5FaR
         lZzyUcqQNlTgrbOWxIiCNNkGXcN+YcAkRa7XtcndRuHIISjtS1bqOozbZsz1nC5hcsDD
         u26KEay0y9NGORuXLNCFAGzVfuTbflhbbVeY0FwDzd47mAegDitFXQlidZ+r3vc4qp62
         2wq4Ap9JOFRY2OG3rj7JvheiELYyUdtdiEu9Q/yHgDadrXZxY7kRNmrLS7Phdb9dJhjR
         /WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GdXN3z4xkG8mhrjjLyuf+xPSPLFfHaqc7TyE3s6lR5o=;
        b=Oini8DeX37UpzOQo+v/NTF66L0Knw6+0yzwaztW1S4Sg6vc4ilcaPt32l11CD3fepX
         Ti8dTv5Fvl2XovaFzFTIzZkRfgah3guvfbcSDwkzJRUI//5xeJcUbFuTpgFE56Y4hi4D
         KjBYrzLD1mWdohDoiSQTEkUCu25lt3WeZDutv5uOb2beKtRJvP5X83TruAJBDbAvhO4b
         tcKRJ3YZkoDFPexde1FAQLirhDK7BmXnXHhs96r0/+PRBaWAv/D8tEFEZxHUA9uSSsdP
         POUSD17Ec8potFBLq0AJQAqYcFNfeKilVmeX54+7ssFK2rbdJq1K4F4anyphuzdtnQsR
         iMgA==
X-Gm-Message-State: AOAM530zE3mm3sipRmUUDQN+jH7VoHpAZuS0jZBaBq7r0DDsUJIt7Fq3
        e3t7S/2/s6X7zNgtwIUo3YfSsA==
X-Google-Smtp-Source: ABdhPJwtZ3Lak0tbe7621fR5C5wI2ILNInbUcMVPIDqge9Cl2Uqimu1nbUPn2VLmqrVsQ9qrcxz2sA==
X-Received: by 2002:a7b:cd81:: with SMTP id y1mr8400832wmj.51.1615470715019;
        Thu, 11 Mar 2021 05:51:55 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id h10sm4119795wrp.22.2021.03.11.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:51:54 -0800 (PST)
Date:   Thu, 11 Mar 2021 13:51:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Roland Scheidegger <sroland@vmware.com>,
        linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
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
Message-ID: <20210311135152.GT701493@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEobySvG0zPs9xhc@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 11 Mar 2021, Daniel Vetter wrote:

> On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > 
> > > The vmwgfx ones look all good to me, so for
> > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > That said, they were already signed off by Zack, so not sure what
> > > happened here.
> > 
> > Yes, they were accepted at one point, then dropped without a reason.
> > 
> > Since I rebased onto the latest -next, I had to pluck them back out of
> > a previous one.
> 
> They should show up in linux-next again. We merge patches for next merge
> window even during the current merge window, but need to make sure they
> don't pollute linux-next. Occasionally the cut off is wrong so patches
> show up, and then get pulled again.
> 
> Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> confusion here. But your patches should all be in linux-next again (they
> are queued up for 5.13 in drm-misc-next, I checked that).
> 
> Sorry for the confusion here.

Oh, I see.  Well so long as they don't get dropped, I'll be happy.

Thanks for the explanation Daniel

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
