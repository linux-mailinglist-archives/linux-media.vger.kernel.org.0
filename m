Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3106D8EA0
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 07:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbjDFFDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 01:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjDFFDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 01:03:07 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61AE6E9F;
        Wed,  5 Apr 2023 22:03:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 7962F42459;
        Thu,  6 Apr 2023 05:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1680757384;
        bh=9LSGzmx6M9H0xI3wvYbHSNfzzJs4iZ0NJj4FDdwyAIE=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To;
        b=kLYzPn+mAQDFNM45Jb7a4fO3xxRPCcwGN935IYwDXFXm6WLjQB+j0Tn3xA5fpOeWq
         uPwlA/5xFoVUyvPPL5kCib8VXaQEQlkCfLDeRJ7nCNdJzCeibJoxLwTkHy94mPIWmQ
         JaDW+A26avYbKFJ/YxrNj7maTs9THieWUbFp9acxCxaOXdfyrPjgGkAUyVppUmCXE3
         hYf4xj1Bq3z9QEGxDWtyL/BHpFnfeGSAR5KUrlmk2VF/JF3CHuyyM4BuX1/fA4cYQb
         Y+psf0sDIkuFFCF040KYI2vkrObwPDaTWqkCXh6s61gnilCrB3bj5EiQKixZB92Hj5
         pGyeBIKe1Z0wA==
Message-ID: <6200f93d-6d95-5d03-cc1c-22d7924d66eb@asahilina.net>
Date:   Thu, 6 Apr 2023 14:02:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi driver for Apple AGX
 GPUs
Content-Language: en-US
To:     David Airlie <airlied@gmail.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
 <ZC2JPR3fGm0uE9yW@phenom.ffwll.local>
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
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
From:   Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZC2JPR3fGm0uE9yW@phenom.ffwll.local>
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

On 05/04/2023 23.44, Daniel Vetter wrote:
> On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
>> +/// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
>> +pub(crate) fn lookup_handle(file: &DrmFile, handle: u32) -> Result<ObjectRef> {
>> +    Ok(ObjectRef::new(shmem::Object::lookup_handle(file, handle)?))
>> +}
> 
> So maybe my expectations for rust typing is a bit too much, but I kinda
> expected this to be fully generic:
> 
> - trait Driver (drm_driver) knows the driver's object type
> - a generic create_handle function could ensure that for drm_file (which
>    is always for a specific drm_device and hence Driver) can ensure at the
>    type level that you only put the right objects into the drm_file
> - a generic lookup_handle function on the drm_file knows the Driver trait
>    and so can give you back the right type right away.
> 
> Why the wrapping, what do I miss?

Sigh, so this is one of the many ways I'm trying to work around the 
"Rust doesn't do subclasses" problem (so we can figure out what the best 
one is ^^).

The generic shmem::Object::lookup_handle() call *is* fully generic and 
will get you back a driver-specific object. But since Rust doesn't do 
subclassing, what you get back isn't a driver-specific type T, but 
rather a (reference to a) shmem::Object<T>. T represents the inner 
driver-specific data/functionality (only), and the outer 
shmem::Object<T> includes the actual drm_gem_shmem_object plus a T. This 
is backwards from C, where you expect the opposite situation where T 
contains a shmem object, but that just doesn't work with Rust because 
there's no way to build a safe API around that model as far as I know.

Now the problem is from the higher layers I want object operations that 
interact with the shmem::Object<T> (that is, they call generic GEM 
functions on the object). Options so far:

1. Add an outer wrapper and put that functionality there.
2. Just have the functions on T as helpers, so you need to call 
T::foo(obj) instead of obj.foo().
3. Use the undocumented method receiver trait thing to make 
shmem::Object<T> a valid `self` type, plus add auto-Deref to 
shmem::Object. Then obj.foo() works.

#1 is what I use here. #2 is how the driver-specific File ioctl 
callbacks are implemented, and also sched::Job<T>. #3 is used for fence 
callbacks (FenceObject<T>). None of them are great, and I'd love to hear 
what people think of the various options...

There are other unexplored options, like in this GEM case it could be 
covered with a driver-internal auxiliary trait impl'd on 
shmem::Object<T> buuut that doesn't work when you actually need 
callbacks on T itself to circle back to shmem::Object<T>, as is the case 
with File/Job/FenceObject.

~~ Lina

