Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327BD6B8810
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 03:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjCNCIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 22:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjCNCId (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 22:08:33 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0CDEFB8;
        Mon, 13 Mar 2023 19:08:29 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id w23so15382396qtn.6;
        Mon, 13 Mar 2023 19:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678759708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWTJH0CSLNac6UVipxWuVXfQaQBNmUQAslbEyp9pC7k=;
        b=n9GX7fgKLXEEUCs308GhW0N9wL9c7lItfOWri36b1p4qKLfQX8nSK2JNFWDhziddb/
         AG2xDnaJeKtvJSLJGf2ELiNQrebE5A6RKC3pvYYwyTBsQkUfwtPlbJNFVDEY3+I8FYOX
         C9ipdeUIRneIBtaCZMFDgPzPWSMBSICHLsBp1/mJHpv7PYjlWjHgIzXOT/e7/5CwIpN0
         ivpON3P9Hj6WTvo7Z+H2aav1CroOXkqWMLa09WEeSeA9rRRGccjT1r+IjUKV8Th37baN
         095PMsTEDXI5JtoeqS7WLBp/SlK3HYUmZRoX8Q4qZYDdEw39Es36utttFc8lPfYT0YmQ
         8KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678759708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWTJH0CSLNac6UVipxWuVXfQaQBNmUQAslbEyp9pC7k=;
        b=5fxAOUVGWk2HIX/B2vxgMhAsyxLkqylLjvb9Xexx8QzACQcd7wr8qCP06pXpfTjp/r
         UBZVemPFHhbQfS5e16AvhhyLFp3J0YmUpJSH9dnTxvFYUmWd/8ZKza+8Cqaa92+YkGr/
         OIHsRy1Shm1W1wP4yF5k90G/H+pE9F2awwDQ8/ONRXHDQdMUrFESOTkORZ0XVctObT7/
         6LC/RrEfeDF313yPIZJ7ZswlAN8UVXAb/aTWINLFCfXTPwMUXc5QTUyPEowSC+so0bZE
         TB9++t7ahlJ5sx+TGz/XKR/AdXq0CU5MYPXKs3fXbBK2zOM/QD5xYXCPs0qrQ1GXN5gu
         YKFw==
X-Gm-Message-State: AO0yUKVwiJYD1fc0MMEUdjT6n9ZB7gea+FYd8oeRugKSoYJvBEnjB09Y
        TdflvrYxVw6YGPsQ9BOI0l4=
X-Google-Smtp-Source: AK7set/2hv3q6fM3gm5E6q08d2RY+ZIQxFg1BAiQ2LhwTR2QsVn7phoYK2hVcgRM5RAlkcRMukImhA==
X-Received: by 2002:a05:622a:4d1:b0:3b8:5bc6:deab with SMTP id q17-20020a05622a04d100b003b85bc6deabmr59233513qtx.8.1678759708045;
        Mon, 13 Mar 2023 19:08:28 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id y13-20020a37f60d000000b00745a27b4b30sm837945qkj.67.2023.03.13.19.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 19:08:27 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailauth.nyi.internal (Postfix) with ESMTP id 8D3AE27C0054;
        Mon, 13 Mar 2023 22:08:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 13 Mar 2023 22:08:26 -0400
X-ME-Sender: <xms:GdcPZJt1YWkkqoCYsYDBkVPciDc8T6htlkbPl662zwk4Fjvvk5nUMw>
    <xme:GdcPZCdxAovOAOsvq8KslU1q6mRf03lt6uelSCEuHQZd51DVM7y9rNTd3FuvDxr0s
    0Iws7wunS22ZN0Z_w>
X-ME-Received: <xmr:GdcPZMyPB3t3_-MbUVlPY3eDeI9Pm3y84orFviyII-Jivc6kYOfBl5jBU38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvhedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdlfedmnecujfgu
    rhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeuohhquhhnuc
    fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
    vghrnhepteekvddvjeehvdfhvdetkeekffehveetiedtvdfhvdfhuddvteefgeegtdfggf
    etnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdhiohenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
    hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
    hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:GdcPZAPuXOrudqbZH1oRHHJIqo5O15dXvhOwWcrEOLBkSpwQfnqduw>
    <xmx:GdcPZJ_Nb4gzwL0G7nqYXNkAYL3diWg3KQjjxns4i11ZFOArGJOCIg>
    <xmx:GdcPZAUD0nv8GVxtZKDXmZBo8VBMtJTuftlKZEuxoNyk4QTgfdyqIA>
    <xmx:GdcPZEsWc10LHl0QgSP2y3Qz_LsrA2Kd2pQxiWkqMc2fCFtBh5XUFA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Mar 2023 22:08:23 -0400 (EDT)
Date:   Mon, 13 Mar 2023 19:07:09 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Faith Ekstrand <faith.ekstrand@collabora.com>
Cc:     Asahi Lina <lina@asahilina.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>, Mary <mary@mary.zone>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org,
        asahi@lists.linux.dev
Subject: Re: [PATCH RFC 03/18] rust: drm: file: Add File abstraction
Message-ID: <ZA/WzQj97lI2rNeK@boqun-archlinux>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-3-917ff5bc80a8@asahilina.net>
 <9ba89e97155400fb379f5101ccb8960d0bcbc025.camel@collabora.com>
 <28fa3f97-4c7c-212e-2be2-fb1c05f7f576@asahilina.net>
 <5a0db63c043adc47b289b3f1d22935a0a63c926e.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a0db63c043adc47b289b3f1d22935a0a63c926e.camel@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 13, 2023 at 12:49:57PM -0500, Faith Ekstrand wrote:
> On Fri, 2023-03-10 at 07:16 +0900, Asahi Lina wrote:
> > On 10/03/2023 06.16, Faith Ekstrand wrote:
> > > On Tue, 2023-03-07 at 23:25 +0900, Asahi Lina wrote:
> > > > A DRM File is the DRM counterpart to a kernel file structure,
> > > > representing an open DRM file descriptor. Add a Rust abstraction
> > > > to
> > > > allow drivers to implement their own File types that implement
> > > > the
> > > > DriverFile trait.
> > > > 
> > > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > > ---
> > > >  rust/bindings/bindings_helper.h |   1 +
> > > >  rust/kernel/drm/drv.rs          |   7 ++-
> > > >  rust/kernel/drm/file.rs         | 113
> > > > ++++++++++++++++++++++++++++++++++++++++
> > > >  rust/kernel/drm/mod.rs          |   1 +
> > > >  4 files changed, 120 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/rust/bindings/bindings_helper.h
> > > > b/rust/bindings/bindings_helper.h
> > > > index 2a999138c4ae..7d7828faf89c 100644
> > > > --- a/rust/bindings/bindings_helper.h
> > > > +++ b/rust/bindings/bindings_helper.h
> > > > @@ -8,6 +8,7 @@
> > > >  
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_drv.h>
> > > > +#include <drm/drm_file.h>
> > > >  #include <drm/drm_ioctl.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/device.h>
> > > > diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> > > > index 29a465515dc9..1dcb651e1417 100644
> > > > --- a/rust/kernel/drm/drv.rs
> > > > +++ b/rust/kernel/drm/drv.rs
> > > > @@ -144,6 +144,9 @@ pub trait Driver {
> > > >      /// Should be either `drm::gem::Object<T>` or
> > > > `drm::gem::shmem::Object<T>`.
> > > >      type Object: AllocImpl;
> > > >  
> > > > +    /// The type used to represent a DRM File (client)
> > > > +    type File: drm::file::DriverFile;
> > > > +
> > > >      /// Driver metadata
> > > >      const INFO: DriverInfo;
> > > >  
> > > > @@ -213,8 +216,8 @@ macro_rules! drm_device_register {
> > > >  impl<T: Driver> Registration<T> {
> > > >      const VTABLE: bindings::drm_driver = drm_legacy_fields! {
> > > >          load: None,
> > > > -        open: None, // TODO: File abstraction
> > > > -        postclose: None, // TODO: File abstraction
> > > > +        open: Some(drm::file::open_callback::<T::File>),
> > > > +        postclose:
> > > > Some(drm::file::postclose_callback::<T::File>),
> > > >          lastclose: None,
> > > >          unload: None,
> > > >          release: None,
> > > > diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
> > > > new file mode 100644
> > > > index 000000000000..48751e93c38a
> > > > --- /dev/null
> > > > +++ b/rust/kernel/drm/file.rs
> > > > @@ -0,0 +1,113 @@
> > > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > > +
> > > > +//! DRM File objects.
> > > > +//!
> > > > +//! C header:
> > > > [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/dr
> > > > m_fi
> > > > le.h)
> > > > +
> > > > +use crate::{bindings, drm, error::Result};
> > > > +use alloc::boxed::Box;
> > > > +use core::marker::PhantomData;
> > > > +use core::ops::Deref;
> > > > +
> > > > +/// Trait that must be implemented by DRM drivers to represent a
> > > > DRM
> > > > File (a client instance).
> > > > +pub trait DriverFile {
> > > > +    /// The parent `Driver` implementation for this
> > > > `DriverFile`.
> > > > +    type Driver: drm::drv::Driver;
> > > > +
> > > > +    /// Open a new file (called when a client opens the DRM
> > > > device).
> > > > +    fn open(device: &drm::device::Device<Self::Driver>) ->
> > > > Result<Box<Self>>;
> > > > +}
> > > > +
> > > > +/// An open DRM File.
> > > > +///
> > > > +/// # Invariants
> > > > +/// `raw` is a valid pointer to a `drm_file` struct.
> > > > +#[repr(transparent)]
> > > > +pub struct File<T: DriverFile> {
> > > > +    raw: *mut bindings::drm_file,
> > > > +    _p: PhantomData<T>,
> > > > +}
> > > > +
> > > > +pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
> > > > +    raw_dev: *mut bindings::drm_device,
> > > > +    raw_file: *mut bindings::drm_file,
> > > > +) -> core::ffi::c_int {
> > > > +    let drm = core::mem::ManuallyDrop::new(unsafe {
> > > > drm::device::Device::from_raw(raw_dev) });
> > > 
> > > Maybe you can help educate me a bit here... This feels like a
> > > really
> > > sketchy pattern.  We're creating a Device from a pointer, an
> > > operation
> > > which inherently consumes a reference but then marking it
> > > ManuallyDrop
> > > so drm_device_put() never gets called.  It took me a while but I
> > > think
> > > I figured out what you're trying to do: Make it so all the Rust
> > > stuff
> > > works with Device, not drm_device but it still feels really wrong. 
> > > It
> > > works, it just feels like there's a lot of unsafe abstraction
> > > juggling
> > > happening here and I expect this operation is going to be pretty
> > > common
> > > in the Rust abstraction layer.
> > 
> > So I think this is going to be a pretty common pattern in this kind
> > of
> > abstraction. The problem is that, of course, in C there is no
> > distinction between an owned reference and a borrowed one. Here we
> > have
> > a borrowed reference to a struct drm_device, and we need to turn it
> > into
> > a &Device (which is the Rust equivalent type). But for &Device to
> > exist
> > we need a Device to exist in the first place, and Device normally
> > implies ownership of the underlying drm_device.
> 
> Thanks! Putting it in terms of borrow really helps clear up the
> difference.
> 
> > We could just acquire a reference here, but then we're needlessly
> > grabbing a ref only to drop it at the end of the function, which is
> > pointless when the caller is holding another reference for us while
> > the
> > callback runs. And of course Rust likes to claim to offer zero-cost
> > abstractions, so it would be kind of sad to have to do that... ^^
> 
> Yeah, I agree we don't want to take extra references.
> 
> > Just doing drm::device::Device::from_raw(raw_dev) is a ticking time
> > bomb, because we haven't acquired a reference (which would normally
> > be
> > required). If that Device ever gets dropped, we've messed up the
> > refcounting and stolen the caller's reference. We could try to ensure
> > it
> > gets passed to core::mem::forget in all paths out, but that gets
> > error-prone very quickly when trying to cover error paths. So
> > instead,
> > we put it into a ManuallyDrop. That takes care of neutering the ref
> > drop, so we don't have to worry about messing that up. Then the only
> > remaining safety requirement is that that the ManuallyDrop<Device>
> > never
> > escape the callback function, and that's easy to ensure: we only pass
> > a
> > &ref to the user (which via auto-deref ends up being a &Device), and
> > then nothing bad can happen. If the user wants an owned reference to
> > the
> > device to keep around, they can call .clone() on it and that's when
> > the
> > incref happens.
> > 
> > Basically, ManuallyDrop<T> where T is a reference counted type
> > represents a borrowed reference to a T coming from the C side. You
> > can
> > see another use of this pattern in gem::Object, which contains a
> > ManuallyDrop<Device> that represents a borrowed reference to the
> > device
> > that owns that object. The DRM core (as far as I know!) guarantees
> > that
> > DRM devices outlive all of their GEM objects, so we can materialize a
> > borrowed reference and as long as it never leaves the GEM object, it
> > will be sound. Then we can take &Device references from it whenever
> > we
> > want, and the usual Rust borrow checker rules ensure we can't do
> > something illegal.
> 
> Ok, that all matches my understanding of what I thought was going on. I
> do wonder if it would be good to wrap this up in a
> 
> struct DeviceBorrow {
>    dev: ManuallyDrop<Device>
> }
> 
> impl DeviceBorrow {
>    pub unsafe fn from_raw(*mut bindings::drm_device) -> DeviceBorrow;
> }
> 
> impl Deref<Device> for DeviceBorrow {
>    ...
> }
> 
> with documentation, etc.  Seeing a ManuallyDrop which is never dropped
> sets my rust senses tingling.  Maybe that's too much typing for each
> object?  I don't want to add a bunch of extra work but this seems like
> a pretty common pattern we're going to hit everywhere.
> 

I just want to mention, there is a different way to do the abstraction
here:

similar to https://lore.kernel.org/rust-for-linux/ZA9l0EHCRRr%2Fmyoq@boqun-archlinux

* Define Device as tranparent represention of struct drm_device:

	#[repr(transparent)]
	struct Device(Opaque<bindings::drm_device>);

* impl `AlwaysRefCounted`[1] for `Device`, therefore we can use
  `ARef<Device>`[2] as a smart pointer to `drm_device`.

* drm_device related methods are still implemented in `impl Device`

* In `open_callback`, we can just get a `&Device` from `*mut
  bindings::drm_device` unsafely, and that's all. Or introduce a helper
  function if we want:

    pub unsafe fn with_device<F>(ptr: *mut drm_device, f: F) -> Result
    where
      F: FnOnce(&Device) -> Result
    {
    	let d = unsafe { &*ptr };
	f(d)
    }

The main difference is that we now treat a pointer to drm_device as a
reference to the device, not the owner.

It seems we need to also change our driver/device framework to use this
approach, but it looks better to me.

Regards,
Boqun

[1]: https://rust-for-linux.github.io/docs/kernel/trait.AlwaysRefCounted.html
[2]: https://rust-for-linux.github.io/docs/kernel/struct.ARef.html

> ~Faith
