Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1789855A286
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 22:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiFXUV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 16:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiFXUV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 16:21:58 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCCA8268C
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 13:21:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u12so6873985eja.8
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=aI/Wm30z63oEYhq+jLGxZI/tPMnn/tbFlzZ2xbhv+F4=;
        b=DSfCIl93ErkZQTmodLqWf6MxjRIpF1ZnQis6V2AmfYLHN/rGtlxKfpfQusYdU3/UoQ
         cGZ9t8NGw8N1UESLaZQtt9KE8BCcJRvCrZjHW4cY3x/vspkpF+H+OZ9YyYSAm/sR4To9
         S80AKWsZyDrPVwQDWYceohfI1JDJJuzPD7o2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=aI/Wm30z63oEYhq+jLGxZI/tPMnn/tbFlzZ2xbhv+F4=;
        b=igBC4Na7GcJgMlrzfcR7XzOW3/L2WALpKO6JCOtQXsUK+u/aFO/NMbyMhKFidYCJMZ
         JyUaGc6iEsygjoMf5QFZabqZkqJ5s2OqaISwvYjEBvUMc0nPzs+30chiTq2ExT9o3AP+
         HRtX3oeBJK/5iQLR7JAnoMx0Si2PEZvO+Bu0df1HeS37/RLYVUzG2tcWoHkMLNk2GvSZ
         kcmqHWOtJQ+/IcEIS7cJ36AKIdRFefy2ndeXoNYbN3a1425nO2kmB/o0xVwUa6QAY8a6
         CPpEfxBPTK+tAbi14kmh7jDn4jrv7H8KevZdp7iRUrVDV50FSxGfbqCqk/W66DaLu8Lx
         c1kA==
X-Gm-Message-State: AJIora99QPrDjYIfO5COVc7e+CiLrAnzcO0ILDPlH39lvMoTIBTpD8cg
        chmbXl7d2IntVQxvqFayaiNe/A==
X-Google-Smtp-Source: AGRyM1vMLazEoSIRdqrX8zCM+3y9xklBh+nj+P3ouSsHUhI81GOe3I6uIj9foVrhcJrq+L6LjvY0lQ==
X-Received: by 2002:a17:906:72d1:b0:722:e714:e9ff with SMTP id m17-20020a17090672d100b00722e714e9ffmr758067ejl.748.1656102115311;
        Fri, 24 Jun 2022 13:21:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906559600b00722e7919835sm1623844ejp.111.2022.06.24.13.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:21:54 -0700 (PDT)
Date:   Fri, 24 Jun 2022 22:21:52 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory shrinker
Message-ID: <YrYc4IUHJWSbC6AX@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kernel@collabora.com
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-18-dmitry.osipenko@collabora.com>
 <CAF6AEGt61t2truYDCxm17hqUPV-UdEdHjLs+6vmj5RPoPuVBYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGt61t2truYDCxm17hqUPV-UdEdHjLs+6vmj5RPoPuVBYg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 19, 2022 at 10:53:03AM -0700, Rob Clark wrote:
> On Thu, May 26, 2022 at 4:55 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> > +       mutex_unlock(&gem_shrinker->lock);
> 
> As I mentioned on other thread, count_objects, being approximate but
> lockless and fast is the important thing.  Otherwise when you start
> hitting the shrinker on many threads, you end up serializing them all,
> even if you have no pages to return to the system at that point.

Yeah agreed, seems like I was wrong here :-) Atomic counter or something
would also be in link the the lru_list stuff.

It would be to record this in the kerneldoc for the shrinker structure
though, to make sure this is all understood.

> > +               /* prevent racing with the dma-buf importing/exporting */
> > +               if (!mutex_trylock(&gem_shrinker->dev->object_name_lock)) {
> > +                       *lock_contention |= true;
> > +                       goto resv_unlock;
> > +               }
> 
> I'm not sure this is a good idea to serialize on object_name_lock.
> Purgeable buffers should never be shared (imported or exported).  So
> at best you are avoiding evicting and immediately swapping back in, in
> a rare case, at the cost of serializing multiple threads trying to
> reclaim pages in parallel.

Yeah this sounds really bad. Plus this is a per-device lock, and doing
those with trylock means the shrinker will fail to find shrinkable memory
way too often. We need to engineer this out somehow.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
