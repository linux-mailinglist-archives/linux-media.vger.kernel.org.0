Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DE76D7FD0
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 16:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbjDEOoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 10:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237745AbjDEOoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 10:44:18 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3021630D4
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 07:44:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-4fd1f2a0f82so63917a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Apr 2023 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680705855; x=1683297855;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lLnJ1+P3Iu2mYgt/o+7cyTWl5Q1ydZ9Nz1cnrQ5Nmc=;
        b=UJzXtPPwq73Eu+NmBlgfXI9JxlVitZ4kXrO0pETGtZxMEVTi1y5WaveTdET9Z1qul9
         Rq1swKdnVflb+zz6G7f5yZdKkLbBRw/SLhrRIHaGaQOz0gUUHsYs1b1srMn29K4/4HYD
         j+tBSrvp2UABDduixiEjXDgqUUDvyx/FKcfCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680705855; x=1683297855;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lLnJ1+P3Iu2mYgt/o+7cyTWl5Q1ydZ9Nz1cnrQ5Nmc=;
        b=2Pnvh2TI/9s7aPXChdB1dtM8qHzHPjWo6Nm0JMY4fJtLYkAVg4iTixcHvf5rXz5RcP
         z7uz8vgH9zD+SP9pVh9zdzKKfWt4WH3GMAwjFC8GCKudX4JBDGOdh1YiBbw1JxHNNDjs
         UKkqWT1FA2K3NsxmlLdDYmVlqwMViRbF2w/fE3/stH3zc4ZREI63Pn0d2lwMCu/4BTdT
         j21Byqdl4261fQ9zES/8yi+CQLdmyNcJP6w6uwMOFqVAUcZnuAJxi+5QEK6B/3lVYYBy
         p4FwnfrqoRSlBT+LKMeaBzJpKuwfArIRHPyy40vUenC58vVvtdiCZSSIMAOaKMt3/jeD
         Kv0g==
X-Gm-Message-State: AAQBX9dPc4m6jwuliha9q6BpJ7bl8Fg5/1H5Ak0GKpRlxnD2fQKaH2Cv
        YzYn/EZSCw94xIZ7VFjpk0VPfA==
X-Google-Smtp-Source: AKy350bDxZoWmLNeFdkBJ8tM2X67oz1ppfs8T2swdma6bs6jcrru0HiaIH7cchQxIu2ClUv18HSI+A==
X-Received: by 2002:a05:6402:268e:b0:502:ffd:74a1 with SMTP id w14-20020a056402268e00b005020ffd74a1mr2119026edd.2.1680705855694;
        Wed, 05 Apr 2023 07:44:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id l2-20020a50c102000000b004fa012332ecsm7403362edf.1.2023.04.05.07.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:44:15 -0700 (PDT)
Date:   Wed, 5 Apr 2023 16:44:13 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi driver for Apple AGX
 GPUs
Message-ID: <ZC2JPR3fGm0uE9yW@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
> +/// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
> +pub(crate) fn lookup_handle(file: &DrmFile, handle: u32) -> Result<ObjectRef> {
> +    Ok(ObjectRef::new(shmem::Object::lookup_handle(file, handle)?))
> +}

So maybe my expectations for rust typing is a bit too much, but I kinda
expected this to be fully generic:

- trait Driver (drm_driver) knows the driver's object type
- a generic create_handle function could ensure that for drm_file (which
  is always for a specific drm_device and hence Driver) can ensure at the
  type level that you only put the right objects into the drm_file
- a generic lookup_handle function on the drm_file knows the Driver trait
  and so can give you back the right type right away.

Why the wrapping, what do I miss?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
