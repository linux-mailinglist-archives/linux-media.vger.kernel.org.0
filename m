Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C6E6D8EAB
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 07:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbjDFFJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 01:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbjDFFJd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 01:09:33 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C549027;
        Wed,  5 Apr 2023 22:09:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 855124245E;
        Thu,  6 Apr 2023 05:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1680757770;
        bh=9KtJPlD9zeqv2Dz9Vzm2xyc+FrETB5RDWMnpMHhmv4c=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To;
        b=IZ7mn08oMJYBXZU+vYik1Hk33QaEPOwr2RCQkYDVzja8OVxPmzb68ON1PJM/vR08I
         ft0m2y2tcWALNm6yQdThL9L+po29mgAP41m7tEcFTxn2bLoiv5KN0Fg8XQrP4a0JKO
         cdIJ9tOnmApZBwIKreBPxhb5Sh2st+V/5+GwAMz/jqMSKpbNx4VCUsCwK0TOwpCv0Q
         pnoKC3433xScdLNDDeCReILTaTQOqUPiIHDy0/f2nZA76s9TddfvDwuG9Xxnb+mWXW
         roTsOwqfc4IBRHJIB1P3cBdlCN6rXg5/92xLVF/ezOiaAAdNjmzsceUQrGHV+/aVYL
         LIljlLcA0wCaw==
Message-ID: <6c7b9a98-bcd0-29e6-af72-a2fcae10148c@asahilina.net>
Date:   Thu, 6 Apr 2023 14:09:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi driver for Apple AGX
 GPUs
Content-Language: en-US
From:   Asahi Lina <lina@asahilina.net>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev,
        David Airlie <airlied@gmail.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
 <ZC2HtBOaoUAzVCVH@phenom.ffwll.local>
 <8d28f1d3-14b0-78c5-aa16-e81e2a8a3685@asahilina.net>
In-Reply-To: <8d28f1d3-14b0-78c5-aa16-e81e2a8a3685@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Argh. This (and my other reply) was supposed to go to Daniel, but 
Thunderbird... just dropped that recipient? And then my silly brain saw 
all the Cc:s go to To: and figured it was some weird consolidation and 
so I moved everything to Cc: except the only name that started with "Da" 
and... yeah, that wasn't the same person.

Sorry for the confusion... I have no idea why Thunderbird hates Daniel...

On 06/04/2023 13.44, Asahi Lina wrote:
> On 05/04/2023 23.37, Daniel Vetter wrote:
>> On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
>>> +/// A generic monotonically incrementing ID used to uniquely identify object instances within the
>>> +/// driver.
>>> +pub(crate) struct ID(AtomicU64);
>>> +
>>> +impl ID {
>>> +    /// Create a new ID counter with a given value.
>>> +    fn new(val: u64) -> ID {
>>> +        ID(AtomicU64::new(val))
>>> +    }
>>> +
>>> +    /// Fetch the next unique ID.
>>> +    pub(crate) fn next(&self) -> u64 {
>>> +        self.0.fetch_add(1, Ordering::Relaxed)
>>> +    }
>>> +}
>>
>> Continuing the theme of me commenting on individual things, I stumbled
>> over this because I noticed that there's a lot of id based lookups where I
>> don't expect them, and started chasing.
>>
>> - For ids use xarray, not atomic counters. Yes I know dma_fence timelines
>>     gets this wrong, this goes back to an innocent time where we didn't
>>     allocate more than one timeline per engine, and no one fixed it since
>>     then. Yes u64 should be big enough for everyone :-/
>>
>> - Attaching ID spaces to drm_device is also not great. drm is full of
>>     these mistakes. Much better if their per drm_file and so private to each
>>     client.
>>
>> - They shouldn't be used for anything else than uapi id -> kernel object
>>     lookup at the beginning of ioctl code, and nowhere else. At least from
>>     skimming it seems like these are used all over the driver codebase,
>>     which does freak me out. At least on the C side that's a clear indicator
>>     for a refcount/lockin/data structure model that's not thought out at
>>     all.
>>
>> What's going on here, what do I miss?
> 
> These aren't UAPI IDs, they are driver-internal IDs (the UAPI IDs do use
> xarray and are per-File). Most of them are just for debugging, so that
> when I enable full debug spam I have some way to correlate different
> things that are happening together (this subset of interleaved log lines
> relate to the same submission). Basically just object names that are
> easier to read (and less of a security leak) than pointers and
> guaranteed not to repeat. You could get rid of most of them and it
> wouldn't affect the driver design, it just makes it very hard to see
> what's going on with debug logs ^^;
> 
> There are only two that are ever used for non-debugging purposes: the VM
> ID, and the File ID. Both are per-device global IDs attached to the VMs
> (not the UAPI VM objects, but rather the underlyng MMU address space
> managers they represent, including the kernel-internal ones) and to
> Files themselves. They are used for destroying GEM objects: since the
> objects are also device-global across multiple clients, I need a way to
> do things like "clean up all mappings for this File" or "clean up all
> mappings for this VM". There's an annoying circular reference between
> GEM objects and their mappings, which is why this is explicitly coded
> out in destroy paths instead of naturally happening via Drop semantics
> (without that cleanup code, the circular reference leaks it).
> 
> So e.g. when a File does a GEM close or explicitly asks for all mappings
> of an object to be removed, it goes out to the (possibly shared) GEM
> object and tells it to drop all mappings marked as owned by that unique
> File ID. When an explicit "unmap all in VM" op happens, it asks the GEM
> object to drop all mappings for that underlying VM ID. Similarly, when a
> UAPI VM object is dropped (in the Drop impl, so both explicitly and when
> the whole File/xarray is dropped and such), that does an explicit unmap
> of a special dummy object it owns which would otherwise leak since it is
> not tracked as a GEM object owned by that File and therefore not handled
> by GEM closing. And again along the same lines, the allocators in
> alloc.rs explicitly destroy the mappings for their backing GEM objects
> on Drop. All this is due to that annoying circular reference between VMs
> and GEM objects that I'm not sure how to fix.
> 
> Note that if I *don't* do this (or forget to do it somewhere) the
> consequence is just that we leak memory, and if you try to destroy the
> wrong IDs somehow the worst that can happen is you unmap things you
> shouldn't and fault the GPU (or, in the kernel or kernel-managed user VM
> cases, potentially the firmware). Rust safety guarantees still keep
> things from going entirely off the rails within the kernel, since
> everything that matters is reference counted (which is why these
> reference cycles are possible at all).
> 
> This all started when I was looking at the panfrost driver for
> reference. It does the same thing except it uses actual pointers to the
> owning entities instead of IDs, and pointer comparison (see
> panfrost_gem_close). Of course you could try do that in Rust too
> (literally storing and comparing raw pointers that aren't owned
> references), but then you're introducing a Pin<> requirement on those
> objects to make their addresses stable and it feels way more icky and
> error-prone than unique IDs (since addresses can be reused). panfrost
> only has a single mmu (what I call the raw VM) per File while I have an
> arbitrary number, which is why I end up with the extra
> distinction/complexity of both File and VM IDs, but the concept is the same.
> 
> Some of this is going to be refactored when I implement arbitrary VM
> range mapping/unmapping, which would be a good time to improve this...
> but is there something particularly wrong/broken about the way I'm doing
> it now that I missed? I figured unique u64 IDs would be a pretty safe
> way to identify entities and cleanup the mappings when needed.
> 
> ~~ Lina
> 

~~ Lina

