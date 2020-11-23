Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044172C0BAD
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 14:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732408AbgKWN3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 08:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730725AbgKWMaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 07:30:20 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EDDC061A4E
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 04:30:20 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 10so17725436wml.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hQ9274cJRcisj/k1DnNRPg/AWzSpXOLuASkzuQMMEJk=;
        b=loC7jwFZZxCVRUrWK3gkEV+nGPQO8gNgJHe9CO8Ho/sjQ+3TR3d9I8PAGUmT32DpLd
         XF45t36teSRWCy5rRGkpKWWKho4bfob6jVR4z87QtSvdZY+PWwuEG6552uCFfZYGYwWM
         TeYvw5BHHdArvuLvMR6+jWWE7Gf3wl5/CHG1ip4kmRu8V0NI08HHBZtzJx2Nzs78Lifm
         ofQpQZSHatSAZOcoxUFcKOu45nQW820RNRa6+iq0oOol4VBdbXPNzbW6QVWqZLRfRJMu
         8X1JkcflXcrN8J8rJ2VsTx30DouJ3eTevyQcQc/epohTycYBeGuQ+QjUC2P7tdgAjjFH
         IThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hQ9274cJRcisj/k1DnNRPg/AWzSpXOLuASkzuQMMEJk=;
        b=YfRajqsvYMuCKE7J9ZpVPGI50KC7fA0bvHG75AOMUOHaHMjieah+ve5am+wb1//Pyf
         4bF4kdIkEZdzg2hxEVX4e6grvXhOcCt+eMMycukqJw0w50sasNHyJctsQuTEAdrDCCgV
         fGMpqy/pg6Yo1g+lNNVMgBZ1wwrSoacMRjObucyMiWkrXn2K0gWE+lav4KUG0y9XqkV9
         0ktF29kghykEvcdrO08oiw80Z/0bu3UzNUXKa6wUGBpK/CeVjBRUqKD5ba7ql4E1hSCv
         G6KCrx+TBlH3rYrD81X5osKUyrih4il2/hRZo6MDVTY4Kwzg0nTC+0SiVHW3S0k8t6dg
         gCRQ==
X-Gm-Message-State: AOAM533rtClwD6z5as8I+K06mFfNmV8803iz/qDQud+wHghPgugYjm7i
        NL68RnxYwyfuIAxYRRbuY8LTCQ==
X-Google-Smtp-Source: ABdhPJyDOBP0tlstfPSopOHwDgmQuvftD21pkr092ilv2i4DAaBWKV4gEPJF2xEJaLrKvkQTiu1XiQ==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr23315406wme.158.1606134619163;
        Mon, 23 Nov 2020 04:30:19 -0800 (PST)
Received: from dell ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id q16sm19309395wrn.13.2020.11.23.04.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 04:30:18 -0800 (PST)
Date:   Mon, 23 Nov 2020 12:30:16 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Fritz Koenig <frkoenig@google.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Jerome Glisse <glisse@freedesktop.org>,
        Jiansong Chen <Jiansong.Chen@amd.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Likun Gao <Likun.Gao@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Luben Tuikov <luben.tuikov@amd.com>,
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tao Zhou <tao.zhou1@amd.com>
Subject: Re: [PATCH 00/40] [Set 8] Rid W=1 warnings from GPU
Message-ID: <20201123123016.GA4716@dell>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 23 Nov 2020, Christian König wrote:

> Only skimmed over them, but over all looks sane to me.
> 
> Series is Acked-by: Christian König <christian.koenig@amd.com>

Thanks Christian, much appreciated.

> Am 23.11.20 um 12:18 schrieb Lee Jones:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Only 900 (from 5000) to go!
> > 
> > Lee Jones (40):
> >    drm/radeon/radeon_device: Consume our own header where the prototypes
> >      are located
> >    drm/amd/amdgpu/amdgpu_ttm: Add description for 'page_flags'
> >    drm/amd/amdgpu/amdgpu_ib: Provide docs for 'amdgpu_ib_schedule()'s
> >      'job' param
> >    drm/amd/amdgpu/amdgpu_virt: Correct possible copy/paste or doc-rot
> >      misnaming issue
> >    drm/amd/amdgpu/cik_ih: Supply description for 'ih' in

[...]

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
