Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30946AEFBD
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 19:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjCGS0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 13:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbjCGSYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 13:24:49 -0500
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BA89E068;
        Tue,  7 Mar 2023 10:20:12 -0800 (PST)
Date:   Tue, 07 Mar 2023 18:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1678213207; x=1678472407;
        bh=81yotlRkinPt+LgDPonYCzQeaxo1RZaEBv5T44I7zyc=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=VQ0fH7sd/cb/l+Ncxodj/10+Hes9nE5Kj3LVjit+cnzjtGOg15BfeIrjNy29i0gCZ
         GqBQsdZeMqk6QQYFpx/o17WGsj05txE7A5syzBI2EfX5F51GA0UXuNLI6h1TiDdFwa
         kuN7dWGB1KKWlQGQxVWsI5kqEF25/bpCKY6kLig1JEh/OvYEBuAquOaYU6RMofhpOT
         KAIWNZRQxT503z12fzKC6JNnnSfTvCqzkd/jz/MLimACKJFuiUCDicWglgc+C8+2vQ
         KPnlF76GC/5TsBtCbjWfD12AKvgZ50iF4Q91muaW71o0ZqLJX6DtXHkuD2o0BbN38L
         xldiF2qEpGRZA==
To:     Asahi Lina <lina@asahilina.net>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
Subject: Re: [PATCH RFC 02/18] rust: drm: Add Device and Driver abstractions
Message-ID: <LgJBjn9Sl_vEeMPI8yvQkT5yQzZGk3eC8zdazRRupvjTuysDp8AJU1KY937LoPXugI78XH35UbTxn5tQzunr_pnr63bV_4HC_Ft6VW_mRL8=@protonmail.com>
In-Reply-To: <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net> <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

------- Original Message -------
On Tuesday, March 7th, 2023 at 15:25, Asahi Lina <lina@asahilina.net> wrote=
:

> Add the initial abstractions for DRM drivers and devices. These go
> together in one commit since they are fairly tightly coupled types.
>=20
> A few things have been stubbed out, to be implemented as further bits of
> the DRM subsystem are introduced.
>=20
> Signed-off-by: Asahi Lina lina@asahilina.net
>=20
> ---
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/drm/device.rs       |  76 +++++++++
>  rust/kernel/drm/drv.rs          | 339 ++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/drm/mod.rs          |   2 +
>  4 files changed, 420 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 2687bef1676f..2a999138c4ae 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,10 +6,13 @@
>   * Sorted alphabetically.
>   */
>=20
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/fs.h>
>  #include <linux/ioctl.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/ktime.h>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> new file mode 100644
> index 000000000000..6007f941137a
> --- /dev/null
> +++ b/rust/kernel/drm/device.rs
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM device.
> +//!
> +//! C header: [`include/linux/drm/drm_device.h`](../../../../include/lin=
ux/drm/drm_device.h)
> +
> +use crate::{bindings, device, drm, types::ForeignOwnable};
> +use core::marker::PhantomData;
> +
> +/// Represents a reference to a DRM device. The device is reference-coun=
ted and is guaranteed to
> +/// not be dropped while this object is alive.
> +pub struct Device<T: drm::drv::Driver> {
> +    // Type invariant: ptr must be a valid and initialized drm_device,
> +    // and this value must either own a reference to it or the caller
> +    // must ensure that it is never dropped if the reference is borrowed=
.
> +    pub(super) ptr: *mut bindings::drm_device,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: drm::drv::Driver> Device<T> {
> +    // Not intended to be called externally, except via declare_drm_ioct=
ls!()
> +    #[doc(hidden)]
> +    pub unsafe fn from_raw(raw: *mut bindings::drm_device) -> Device<T> =
{
> +        Device {
> +            ptr: raw,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    #[allow(dead_code)]
> +    pub(crate) fn raw(&self) -> *const bindings::drm_device {
> +        self.ptr
> +    }
> +
> +    pub(crate) fn raw_mut(&mut self) -> *mut bindings::drm_device {
> +        self.ptr
> +    }
> +
> +    /// Returns a borrowed reference to the user data associated with th=
is Device.
> +    pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
> +        unsafe { T::Data::borrow((*self.ptr).dev_private) }
> +    }
> +}
> +
> +impl<T: drm::drv::Driver> Drop for Device<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we know that `self` owns a re=
ference, so it is safe to
> +        // relinquish it now.
> +        unsafe { bindings::drm_dev_put(self.ptr) };
> +    }
> +}
> +
> +impl<T: drm::drv::Driver> Clone for Device<T> {
> +    fn clone(&self) -> Self {
> +        // SAFETY: We get a new reference and then create a new owning o=
bject from the raw pointer
> +        unsafe {
> +            bindings::drm_dev_get(self.ptr);
> +            Device::from_raw(self.ptr)
> +        }
> +    }
> +}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, which is safe to=
 be used from any thread.
> +unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, references to wh=
ich are safe to be used
> +// from any thread.
> +unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
> +
> +// Make drm::Device work for dev_info!() and friends
> +unsafe impl<T: drm::drv::Driver> device::RawDevice for Device<T> {
> +    fn raw_device(&self) -> *mut bindings::device {
> +        // SAFETY: ptr must be valid per the type invariant
> +        unsafe { (*self.ptr).dev }
> +    }
> +}
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> new file mode 100644
> index 000000000000..29a465515dc9
> --- /dev/null
> +++ b/rust/kernel/drm/drv.rs
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM driver core.
> +//!
> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/=
drm/drm_drv.h)
> +
> +use crate::{
> +    bindings, device, drm,
> +    error::code::*,
> +    error::from_kernel_err_ptr,
> +    error::{Error, Result},
> +    prelude::*,
> +    private::Sealed,
> +    str::CStr,
> +    types::ForeignOwnable,
> +    ThisModule,
> +};
> +use core::{
> +    marker::{PhantomData, PhantomPinned},
> +    pin::Pin,
> +};
> +use macros::vtable;
> +
> +/// Driver use the GEM memory manager. This should be set for all modern=
 drivers.
> +pub const FEAT_GEM: u32 =3D bindings::drm_driver_feature_DRIVER_GEM;
> +/// Driver supports mode setting interfaces (KMS).
> +pub const FEAT_MODESET: u32 =3D bindings::drm_driver_feature_DRIVER_MODE=
SET;
> +/// Driver supports dedicated render nodes.
> +pub const FEAT_RENDER: u32 =3D bindings::drm_driver_feature_DRIVER_RENDE=
R;
> +/// Driver supports the full atomic modesetting userspace API.
> +///
> +/// Drivers which only use atomic internally, but do not support the ful=
l userspace API (e.g. not
> +/// all properties converted to atomic, or multi-plane updates are not g=
uaranteed to be tear-free)
> +/// should not set this flag.
> +pub const FEAT_ATOMIC: u32 =3D bindings::drm_driver_feature_DRIVER_ATOMI=
C;
> +/// Driver supports DRM sync objects for explicit synchronization of com=
mand submission.
> +pub const FEAT_SYNCOBJ: u32 =3D bindings::drm_driver_feature_DRIVER_SYNC=
OBJ;
> +/// Driver supports the timeline flavor of DRM sync objects for explicit=
 synchronization of command
> +/// submission.
> +pub const FEAT_SYNCOBJ_TIMELINE: u32 =3D bindings::drm_driver_feature_DR=
IVER_SYNCOBJ_TIMELINE;
> +
> +/// Information data for a DRM Driver.
> +pub struct DriverInfo {
> +    /// Driver major version.
> +    pub major: i32,
> +    /// Driver minor version.
> +    pub minor: i32,
> +    /// Driver patchlevel version.
> +    pub patchlevel: i32,
> +    /// Driver name.
> +    pub name: &'static CStr,
> +    /// Driver description.
> +    pub desc: &'static CStr,
> +    /// Driver date.
> +    pub date: &'static CStr,
> +}
> +

Could you please add an Invariants section to the doc comments indicating w=
hat requirements these function pointers must satisfy?

> +/// Internal memory management operation set, normally created by memory=
 managers (e.g. GEM).
> +///
> +/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
> +pub struct AllocOps {
> +    pub(crate) gem_create_object: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            size: usize,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) prime_handle_to_fd: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            file_priv: *mut bindings::drm_file,
> +            handle: u32,
> +            flags: u32,
> +            prime_fd: *mut core::ffi::c_int,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) prime_fd_to_handle: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            file_priv: *mut bindings::drm_file,
> +            prime_fd: core::ffi::c_int,
> +            handle: *mut u32,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) gem_prime_import: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            dma_buf: *mut bindings::dma_buf,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) gem_prime_import_sg_table: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            attach: *mut bindings::dma_buf_attachment,
> +            sgt: *mut bindings::sg_table,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) gem_prime_mmap: Option<
> +        unsafe extern "C" fn(
> +            obj: *mut bindings::drm_gem_object,
> +            vma: *mut bindings::vm_area_struct,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_create: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            args: *mut bindings::drm_mode_create_dumb,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_map_offset: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            handle: u32,
> +            offset: *mut u64,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_destroy: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            handle: u32,
> +        ) -> core::ffi::c_int,
> +    >,
> +}
> +
> +/// Trait for memory manager implementations. Implemented internally.
> +pub trait AllocImpl: Sealed {
> +    /// The C callback operations for this memory manager.
> +    const ALLOC_OPS: AllocOps;
> +}
> +
> +/// A DRM driver implementation.
> +#[vtable]
> +pub trait Driver {
> +    /// Context data associated with the DRM driver
> +    ///
> +    /// Determines the type of the context data passed to each of the me=
thods of the trait.
> +    type Data: ForeignOwnable + Sync + Send;
> +
> +    /// The type used to manage memory for this driver.
> +    ///
> +    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Obje=
ct<T>`.
> +    type Object: AllocImpl;
> +
> +    /// Driver metadata
> +    const INFO: DriverInfo;
> +
> +    /// Feature flags
> +    const FEATURES: u32;
> +
> +    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
> +    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
> +}
> +
> +/// A registration of a DRM device
> +///
> +/// # Invariants:
> +///
> +/// drm is always a valid pointer to an allocated drm_device
> +pub struct Registration<T: Driver> {
> +    drm: drm::device::Device<T>,
> +    registered: bool,
> +    fops: bindings::file_operations,
> +    vtable: Pin<Box<bindings::drm_driver>>,
> +    _p: PhantomData<T>,
> +    _pin: PhantomPinned,
> +}
> +
> +#[cfg(CONFIG_DRM_LEGACY)]
> +macro_rules! drm_legacy_fields {
> +    ( $($field:ident: $val:expr),* $(,)? ) =3D> {
> +        bindings::drm_driver {
> +            $( $field: $val ),*,
> +            firstopen: None,
> +            preclose: None,
> +            dma_ioctl: None,
> +            dma_quiescent: None,
> +            context_dtor: None,
> +            irq_handler: None,
> +            irq_preinstall: None,
> +            irq_postinstall: None,
> +            irq_uninstall: None,
> +            get_vblank_counter: None,
> +            enable_vblank: None,
> +            disable_vblank: None,
> +            dev_priv_size: 0,
> +        }
> +    }
> +}
> +
> +#[cfg(not(CONFIG_DRM_LEGACY))]
> +macro_rules! drm_legacy_fields {
> +    ( $($field:ident: $val:expr),* $(,)? ) =3D> {
> +        bindings::drm_driver {
> +            $( $field: $val ),*
> +        }
> +    }
> +}
> +
> +/// Registers a DRM device with the rest of the kernel.
> +///
> +/// It automatically picks up THIS_MODULE.
> +#[allow(clippy::crate_in_macro_def)]
> +#[macro_export]
> +macro_rules! drm_device_register {
> +    ($reg:expr, $data:expr, $flags:expr $(,)?) =3D> {{
> +        $crate::drm::drv::Registration::register($reg, $data, $flags, &c=
rate::THIS_MODULE)
> +    }};
> +}
> +
> +impl<T: Driver> Registration<T> {
> +    const VTABLE: bindings::drm_driver =3D drm_legacy_fields! {
> +        load: None,
> +        open: None, // TODO: File abstraction
> +        postclose: None, // TODO: File abstraction
> +        lastclose: None,
> +        unload: None,
> +        release: None,
> +        master_set: None,
> +        master_drop: None,
> +        debugfs_init: None,
> +        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
> +        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
> +        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
> +        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
> +        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import=
_sg_table,
> +        gem_prime_mmap: T::Object::ALLOC_OPS.gem_prime_mmap,
> +        dumb_create: T::Object::ALLOC_OPS.dumb_create,
> +        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
> +        dumb_destroy: T::Object::ALLOC_OPS.dumb_destroy,
> +
> +        major: T::INFO.major,
> +        minor: T::INFO.minor,
> +        patchlevel: T::INFO.patchlevel,
> +        name: T::INFO.name.as_char_ptr() as *mut _,
> +        desc: T::INFO.desc.as_char_ptr() as *mut _,
> +        date: T::INFO.date.as_char_ptr() as *mut _,
> +
> +        driver_features: T::FEATURES,
> +        ioctls: T::IOCTLS.as_ptr(),
> +        num_ioctls: T::IOCTLS.len() as i32,
> +        fops: core::ptr::null_mut(),
> +    };
> +
> +    /// Creates a new [`Registration`] but does not register it yet.
> +    ///
> +    /// It is allowed to move.
> +    pub fn new(parent: &dyn device::RawDevice) -> Result<Self> {
> +        let vtable =3D Pin::new(Box::try_new(Self::VTABLE)?);
> +        let raw_drm =3D unsafe { bindings::drm_dev_alloc(&*vtable, paren=
t.raw_device()) };
> +        let raw_drm =3D from_kernel_err_ptr(raw_drm)?;
> +
> +        // The reference count is one, and now we take ownership of that=
 reference as a
> +        // drm::device::Device.
> +        let drm =3D unsafe { drm::device::Device::from_raw(raw_drm) };
> +
> +        Ok(Self {
> +            drm,
> +            registered: false,
> +            vtable,
> +            fops: Default::default(), // TODO: GEM abstraction
> +            _pin: PhantomPinned,
> +            _p: PhantomData,
> +        })
> +    }
> +
> +    /// Registers a DRM device with the rest of the kernel.
> +    ///
> +    /// Users are encouraged to use the [`drm_device_register!()`] macro=
 because it automatically
> +    /// picks up the current module.
> +    pub fn register(
> +        self: Pin<&mut Self>,
> +        data: T::Data,
> +        flags: usize,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        if self.registered {
> +            // Already registered.
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We never move out of `this`.
> +        let this =3D unsafe { self.get_unchecked_mut() };
> +        let data_pointer =3D <T::Data as ForeignOwnable>::into_foreign(d=
ata);
> +        // SAFETY: `drm` is valid per the type invariant
> +        unsafe {
> +            (*this.drm.raw_mut()).dev_private =3D data_pointer as *mut _=
;
> +        }
> +
> +        this.fops.owner =3D module.0;
> +        this.vtable.fops =3D &this.fops;
> +
> +        // SAFETY: The device is now initialized and ready to be registe=
red.
> +        let ret =3D unsafe { bindings::drm_dev_register(this.drm.raw_mut=
(), flags as u64) };
> +        if ret < 0 {
> +            // SAFETY: `data_pointer` was returned by `into_foreign` abo=
ve.
> +            unsafe { T::Data::from_foreign(data_pointer) };
> +            return Err(Error::from_kernel_errno(ret));
> +        }
> +
> +        this.registered =3D true;
> +        Ok(())
> +    }
> +
> +    /// Returns a reference to the `Device` instance for this registrati=
on.
> +    pub fn device(&self) -> &drm::device::Device<T> {
> +        &self.drm
> +    }
> +}
> +
> +// SAFETY: `Registration` doesn't offer any methods or access to fields =
when shared between threads
> +// or CPUs, so it is safe to share it.
> +unsafe impl<T: Driver> Sync for Registration<T> {}
> +
> +// SAFETY: Registration with and unregistration from the drm subsystem c=
an happen from any thread.
> +// Additionally, `T::Data` (which is dropped during unregistration) is `=
Send`, so it is ok to move
> +// `Registration` to different threads.
> +#[allow(clippy::non_send_fields_in_send_ty)]
> +unsafe impl<T: Driver> Send for Registration<T> {}
> +
> +impl<T: Driver> Drop for Registration<T> {
> +    /// Removes the registration from the kernel if it has completed suc=
cessfully before.
> +    fn drop(&mut self) {
> +        if self.registered {
> +            // Get a pointer to the data stored in device before destroy=
ing it.
> +            // SAFETY: `drm` is valid per the type invariant
> +            let data_pointer =3D unsafe { (*self.drm.raw_mut()).dev_priv=
ate };
> +
> +            // SAFETY: Since `registered` is true, `self.drm` is both va=
lid and registered.
> +            unsafe { bindings::drm_dev_unregister(self.drm.raw_mut()) };
> +
> +            // Free data as well.
> +            // SAFETY: `data_pointer` was returned by `into_foreign` dur=
ing registration.
> +            unsafe { <T::Data as ForeignOwnable>::from_foreign(data_poin=
ter) };
> +        }
> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 9ec6d7cbcaf3..69376b3c6db9 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -2,4 +2,6 @@
>=20
>  //! DRM subsystem abstractions.
>=20
> +pub mod device;
> +pub mod drv;
>  pub mod ioctl;
>=20
> --
> 2.35.1

Cheers,
Bjorn
