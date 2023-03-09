Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD03C6B268A
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 15:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjCIOQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 09:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbjCIOQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 09:16:39 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4E92CC42;
        Thu,  9 Mar 2023 06:16:36 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 8735242037;
        Thu,  9 Mar 2023 14:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1678371395;
        bh=tUUTZQN+QgD1rn1cHyCzhI7aFoqTUUMz0V4QKuTRQe4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=HjY8oRPlc2CKr20/2jvE1xNtj9x6nJjr9+b1EGdHtTJOh8GMnTUNULcz049Y2BCc7
         zNix/c/l5q04IeQPfaE8EacKG/v3bkO1C4SDe4Jv7CEVNPvuAENth2GdoDWRBxvPpm
         SjDtPv89trwUCLVxH/2a6sSJAcw36eKjpLq+W1zVWssd5HHEEbEesEeRj2qGgp5Fn2
         XbHgR14z2/1bmxa1zbiQSjiiCh4OkRUc4zj6AHT3MvQv4VN384RsyrlOMLi9KEzZM5
         oPddH7HwLjDPcE+kPmXoSXwheMydufOcxaKPxmTTHE6plTgfpKPVlVOSusvbcQcuSG
         TsFvLK+TY0Uxg==
Message-ID: <ac5a748a-bd1c-1076-a17f-42367494976c@asahilina.net>
Date:   Thu, 9 Mar 2023 23:16:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 06/18] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
Content-Language: en-US
To:     =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Cc:     linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
        Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        linux-media@vger.kernel.org
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-6-917ff5bc80a8@asahilina.net>
 <ff51483e-2d72-3a7b-0632-58ea36cc3d8e@igalia.com>
 <488728fc-ada2-20a3-79be-8109d891a8cb@asahilina.net>
 <8e091158-7826-1215-e717-081b25f48108@igalia.com>
From:   Asahi Lina <lina@asahilina.net>
In-Reply-To: <8e091158-7826-1215-e717-081b25f48108@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/03/2023 20.47, Maíra Canal wrote:
> On 3/9/23 02:25, Asahi Lina wrote:
>> On 08/03/2023 22.38, Maíra Canal wrote:
>>> On 3/7/23 11:25, Asahi Lina wrote:
>>>> The DRM shmem helper includes common code useful for drivers which
>>>> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
>>>> this. Drivers can choose the raw GEM implementation or the shmem layer,
>>>> depending on their needs.
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>    drivers/gpu/drm/Kconfig         |   5 +
>>>>    rust/bindings/bindings_helper.h |   2 +
>>>>    rust/helpers.c                  |  67 +++++++
>>>>    rust/kernel/drm/gem/mod.rs      |   3 +
>>>>    rust/kernel/drm/gem/shmem.rs    | 381 ++++++++++++++++++++++++++++++++++++++++
>>>>    5 files changed, 458 insertions(+)
>>>>
>>>
>>> [...]
>>>
>>>> +unsafe extern "C" fn gem_create_object<T: DriverObject>(
>>>> +    raw_dev: *mut bindings::drm_device,
>>>> +    size: usize,
>>>> +) -> *mut bindings::drm_gem_object {
>>>> +    // SAFETY: GEM ensures the device lives as long as its objects live,
>>>> +    // so we can conjure up a reference from thin air and never drop it.
>>>> +    let dev = ManuallyDrop::new(unsafe { device::Device::from_raw(raw_dev) });
>>>> +
>>>> +    let inner = match T::new(&*dev, size) {
>>>> +        Ok(v) => v,
>>>> +        Err(e) => return e.to_ptr(),
>>>> +    };
>>>> +
>>>> +    let p = unsafe {
>>>> +        bindings::krealloc(
>>>> +            core::ptr::null(),
>>>> +            Object::<T>::SIZE,
>>>> +            bindings::GFP_KERNEL | bindings::__GFP_ZERO,
>>>> +        ) as *mut Object<T>
>>>> +    };
>>>> +
>>>> +    if p.is_null() {
>>>> +        return ENOMEM.to_ptr();
>>>> +    }
>>>> +
>>>> +    // SAFETY: p is valid as long as the alloc succeeded
>>>> +    unsafe {
>>>> +        addr_of_mut!((*p).dev).write(dev);
>>>> +        addr_of_mut!((*p).inner).write(inner);
>>>> +    }
>>>> +
>>>> +    // SAFETY: drm_gem_shmem_object is safe to zero-init, and
>>>> +    // the rest of Object has been initialized
>>>> +    let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };
>>>> +
>>>> +    new.obj.base.funcs = &Object::<T>::VTABLE;
>>>> +    &mut new.obj.base
>>>> +}
>>>
>>> It would be nice to allow to set wc inside the gem_create_object callback,
>>> as some drivers do it so, like v3d, vc4, panfrost, lima...
>>
>> This is actually a bit tricky to do safely, because we can't just have a
>> callback that takes the drm_gem_shmem_object instance inside
>> gem_create_object because it is not fully initialized yet from the point
>> of view of the gem shmem API. Maybe we could have some sort of temporary
>> proxy object that only lets you do safe things like set map_wc? Or maybe
>> the new() callback could return something like a ShmemTemplate<T> type
>> that contains both the inner data and some miscellaneous fields like the
>> initial map_wc state?
> 
> I see that most drivers use this hook to set map_wc and set funcs. What
> are your thoughts on something like this?
> 
> Best Regards,
> - Maíra Canal
> 
>  From 61f23f4a39028c9d34d3df58d7640bfcd64e9af9 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
> Date: Thu, 9 Mar 2023 08:24:09 -0300
> Subject: [PATCH] rust: drm: gem: shmem: Set map_wc on gem_create_object
>   callback
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Some drivers use the gem_create_object callback to define the mapping of
> the object write-combined (map_wc). Currently, the DRM Rust abstractions
> doesn't allow such operation. So, add a method to the DriverObject trait
> to allow drivers to set map_wc on the gem_create_object callback. By
> default, the method returns false, which is the shmem default value.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   rust/kernel/drm/gem/shmem.rs | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 8f17eba0be99..a7f33b66f60a 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -24,6 +24,11 @@ use gem::BaseObject;
>   pub trait DriverObject: gem::BaseDriverObject<Object<Self>> {
>       /// Parent `Driver` for this object.
>       type Driver: drv::Driver;
> +
> +    /// Define the map object write-combined
> +    fn set_wc() -> bool {
> +        false
> +    }
>   }

I think if you're going to make it a static function like that, we might
as well just make it an associated constant like `DEFAULT_WC`? After all
there is no information gem_create_object gets other than the size so we
can't really do anything more useful, and `set_wc()` can't do much other
than return a constant ^^

The only corner case I can think of is cases where the WC mode depends
on the device (for example, if some devices want to enable it or not
depending on whether the particular hardware variant is cache-coherent),
but then it should probably just be part of the return value for T::new
since that function already gets all available information (device and
size). But I think a constant works for now, we can always extend it
when a use case comes for doing more.

~~ Lina
