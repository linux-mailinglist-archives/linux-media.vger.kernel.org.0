Return-Path: <linux-media+bounces-61994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM8xKK0PC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:10:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE556D568
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE32130A253B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E38A46AF3F;
	Mon, 18 May 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mh5tCe+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422B3264D4
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109141; cv=pass; b=X2bk7ZoHXZ9wdnigX97xSEjIzeiXjVfLnnZ7nG6WeB1JZib112O1NP1YtUfhzkfJJZ435W+y63OERi7nVsvg4yF80P1OC1weXO8NXznatkSqnX4d5XXqjVGY5GKES+dqAsTC720wzW+La0bQk7zxRNSd+rttF7MFYy+gTd3Z53M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109141; c=relaxed/simple;
	bh=1nJ299rs5r4aCk+S/C4PRmUegyebAnCdRZjhKGuNQUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDzXN0PLjPUq1S21M3tj6I82TimqDpCgKUgNmXyCULIegfB5/Vt5SxHtHVL0LV9bC/9yaCLtV4mBX2AAL7FLxvztZBDtWibZuuabNWZePdnQSaXNDTGxNaltdX5jEkER3j8YU9iGK0kMcvpxrvvSWip2Yqf23qSOU9wNzmek0OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mh5tCe+v; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651bc83e74aso2365456d50.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779109136; cv=none;
        d=google.com; s=arc-20240605;
        b=SkivxDmpz/XeJ/ufo6r5zYiJS69oyEikUiEblyeYpsX6hAoI5aobhvdU0wG91s+SXF
         WLz0ruAdMFrRSRWmLD5QyPEI73WZcy8yL4JBtSBWQFIYx6mVzb6tPhm/XCannGmmPsGP
         9g7kveL8wUfvi3prYVk/qGGVghkm16M1PyBp7N9UaGUqZLibuzzFxCUI7VLVzufSMKuM
         5KuDK4LmFCkgl8v5HQNe9gMDq6H8lbmy+M3XW/ICkI50YvyC+CGcAOLmwoxe/dewnBMg
         3iDyIv1/xTiWEJ2Sklf0shV61Y5ZfB9XH9jzfpOc8VTt4gKhw/5GhUqhUnQqqIp7e+rq
         9VuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=43XOKwod7lkr/JFAt6gp70bo5/ubw+AmY3hOZjjU4ZM=;
        fh=6gkpzjvmvbWo2v6SUwPW+mPsEjsnneC5KO/KA9LrWKM=;
        b=hyqK25TNztPGwhpsXjwDwxQYpVCGPZafH9/0dgWQwBv8B5VNi6JuCBLMSSRWAYRElz
         Ayp41Rsg//36TiJKeRxnFccPMF/LRZVMDeqLfy4iPaMU/aNEcZYrVhQ7djg9lNB1GWzg
         IxfQY649PpIuaukBGQPGNlrMHCJFR0nykGVbUinvtmlTMHTxI30Lc4rudKYKQL/TfcaW
         s3ECskDXRyBOlF1ZTWd0ZseyFw912ZvDiTYMHiZ+udTsGJatRyWexVVX4XzFMbXsC39B
         7BPHQeWK+IAiLR+fMrO+Lq6MqFu0VWPVg2JocUo7ZrOkCwJgDumG9hHYt0ffMckLNzZ4
         9YHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109136; x=1779713936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43XOKwod7lkr/JFAt6gp70bo5/ubw+AmY3hOZjjU4ZM=;
        b=mh5tCe+vg53WMlRSrCdKaPNgWOq84RijlzhXH3CmNXloRLf+qKjqFNz9v+0fXCmuWB
         5Y2pklaHF2Wa4rtPLTnaFAQiGE+C75fliToJD3UPQuvxYqI1MBJeFAzHDKPY3qc/TLaR
         uP7+mPMkRQdUcYkU0bSZ16d3nDX/+1OQC6sAqrG2g67iUI9NgE6uBAKrvjq+rcWS0It1
         7c9yv6YJafhWzoTv/LNikU6Pnbwz3365UnQS/rO6BZvQ7a0pAntPc6Zn5HWkODNdVR5H
         kDlPOSDDpTTpQLskHrmasebubKKgsWfPNazz87jGAhQW2r76I8n8FQ/EmcD78UsrwSKh
         4SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109136; x=1779713936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43XOKwod7lkr/JFAt6gp70bo5/ubw+AmY3hOZjjU4ZM=;
        b=MVxFiroHA6jqzOS7OMdDgNd2Z2YHVtA1d5ApN/6QO99PwWt5IOtYGG8JxTJeADXoxG
         XLUApyCU55lHdOAS37+iDVcD9dEolXiokMiWuuy7FD5k1sF+5l5UjaQvHrk5T6sCFaBn
         L+kbER5NzloN7iqb7NMdbOPgcZ0f9cMpNxYghDAvGFq0+sqUDfgy+NAK378FHTZzqbHT
         7fAGYBzKYzbUI99r5mTuXpJgmZ/XNSFIi1LGu/HaWf9GrxXrmiU7Y2Ht6XXd/bk4ZmOG
         sFnJvVE44nfQHzVLD/zB2YZZCPwrPqnpUYyIMXPl5iBrxr/66KljVtUTmz3CutKHyif4
         zFuw==
X-Forwarded-Encrypted: i=1; AFNElJ/7Aio/393sBM3qlWkEVk4FKCwxoRX7Mk1A+i6DgNSbB65jenDVPkIRRCZSO2zQzH0F+tqaP2EaU2lcyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZIdLzpAVBKntpqaUIXGEr9A/eTBOGEFB557cPxy14/6CWdaT
	wmNUCOsBZ79b7B0q+UKBH2A59a75cCFnnOWs+5i8OIwSPuMYfAzfFflgMEmj9PIQ9xwqsRUiX3g
	cfNKZJmlJvpKsKyt82LG6u1Q3f0Q4ha8=
X-Gm-Gg: Acq92OHglDfNuuX8JIVq3GFX5nwJlVu10Ut3hP6vAgW2PHK0h5bH2BJKnrLgnluX/Bw
	673bPG5eaIoQcF4jS2r9i3Pl26ihn2qF+M0YTUu4DzXI1v0GKK/87W2tJyEMFr3WcYEHo3waxwB
	DBnPLLSn+JH/Z3in/kilsYI+yVKn5PNhQw/Oq5NcGHXT1FjVB85QMr+UV+4D0sivLgghTlBdD83
	Z4VH3fOkX32MriUAo649cx6miLtN2YysqnWUtB/9QfoWWftyIFS5qRI4T0a72nqv07sefOd14Yy
	64zKM5wXG1Q7Iju6snvhLasPk2TXp56FOPBKo8LL/MsyN9zC
X-Received: by 2002:a05:690e:1589:20b0:64a:ce9a:ace2 with SMTP id
 956f58d0204a3-65e228a2c9amr12243832d50.56.1779109135713; Mon, 18 May 2026
 05:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
In-Reply-To: <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 18 May 2026 14:58:44 +0200
X-Gm-Features: AVHnY4LKZxHnUpuDd83fvxh1z7FeQsObNJnWqmF56ZyeBHGI_r4jDsz0bjbgq4Y
Message-ID: <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 37AE556D568
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61994-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/18/26 14:02, Julian Orth wrote:
> > On Mon, May 18, 2026 at 1:58=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/16/26 13:06, Julian Orth wrote:
> >>> This series adds a new device /dev/syncobj that can be used to create
> >>> and manipulate DRM syncobjs. Previously, these operations required th=
e
> >>> use of a DRM device and the device needed to support the DRIVER_SYNCO=
BJ
> >>> and DRIVER_SYNCOBJ_TIMELINE features.
> >>>
> >>> There are several issues with the existing API:
> >>>
> >>> - Syncobjs are the only explicit sync mechanism available on wayland.
> >>>   Most compositors do not use GPU waits. Instead, they use the
> >>>   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied t=
o
> >>>   DRM devices means that compositors cannot consistently offer this
> >>>   feature even though no device-specific logic is involved.
> >>
> >> Well the drm_syncobj is a container for device specific dma fences.
> >
> > Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
> > some kind of dummy fence that is already signaled. I don't believe
> > this is device specific. That is also the path that llvmpipe would
> > use.
>
> Yeah I feared that.
>
> This is the wait before signal path and if I'm not completely mistaken th=
at one is not supported by a lot of compositors.

I believe this is supported by all compositors.

>
> The last time I looked for GPU support the compositor needs to spawn a se=
parate thread for each client to support this approach.
>
> It could be that we have eventfd integration for that as well now, but in=
 that case you could give the compositor an eventfd instead of a drm_syncob=
j fd in the first place.

Yes, all compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to wait
async for the timeline point to materialize and/or be signaled. The
wayland protocol was the motivation for that ioctl.

>
> So as far as I can see using drm_syncobj for software rendering really do=
esn't make sense, eventfd is a much better fit for that use case.

Using eventfd has some disadvantages:

- We've just added syncobj support to vulkan:
https://github.com/KhronosGroup/Vulkan-Docs/issues/2473#issuecomment-444611=
7280.
For eventfd we would not only have to add yet another extension, that
would realistically only be exposed by llvmpipe, but also every
compositor and every client would have to support both extensions.
- Similarly, a new wayland protocol would need to be designed to
support sync over eventfd.
- Eventfd does not support timeline semantics. Meaning that you would
have to send two eventfds over the wire for each commit, one for the
acquire point and one for the release point. Whereas with syncobj you
only need to send two integers per commit.

I don't see the advantage when drm_syncobj already does everything we need.

You seem to believe that compositors would not be ready for this and
from that perspective I can understand your apprehension. But I can
assure you that compositors are already fully set up to support all of
the usecases I've described: The wayland protocol requires the
compositor to support wait before signal.

>
> Regards,
> Christian.
>
> >
> >>
> >> What could be possible instead is to pass an eventfd into Wayland, but=
 that is something userspace needs to decide.
> >>
> >>> - llvmpipe currently cannot offer syncobj interop because it does not
> >>>   have access to a DRM device. This means that applications using
> >>>   llvmpipe cannot present images before they have finished rendering,
> >>>   despite llvmpipe using threaded rendering.
> >>
> >> Yeah, but that is completely intentional. You *CAN'T* use a dma_fence =
as completion event for llvmpipe rendering. See the kernel documentation on=
 that.
> >>
> >> What could be possible is to use the drm_syncobjs functionality to wai=
t before signal, but that has different semantics.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> - Clients that do not use the Vulkan WSI need to manually probe /dev/=
dri
> >>>   for devices that support the syncobj ioctls in order to use the
> >>>   wayland syncobj protocol.
> >>> - Similarly, clients that want to use screen capture have no equivale=
nt
> >>>   to the WSI and are therefore forced into that path.
> >>> - Having to keep a DRM device open has potentially negative interacti=
ons
> >>>   with GPU hotplug.
> >>> - Having to translate between syncobj FDs and handles is troublesome =
in
> >>>   the compositor usecase since syncobjs come and go frequently and ne=
ed
> >>>   to be cleaned up when clients disconnect.
> >>>
> >>> /dev/syncobj solves these issues by providing all syncobj ioctls unde=
r a
> >>> consistent path that is not tied to any DRM device. It also operates
> >>> directly on file descriptors instead of syncobj handles.
> >>>
> >>> The series starts with a number of small refactorings in drm_syncobj.=
c
> >>> to make its functionality available outside of the file and without t=
he
> >>> need for drm_file/handle pairs.
> >>>
> >>> The last commit adds the /dev/syncobj module. I've added it as a misc
> >>> device but maybe this should instead live somewhere under gpu/drm.
> >>>
> >>> An application using the new interface can be found at [1].
> >>>
> >>> [1]: https://github.com/mahkoh/jay/pull/947
> >>>
> >>> ---
> >>> Julian Orth (12):
> >>>       drm/syncobj: add drm_syncobj_from_fd
> >>>       drm/syncobj: add drm_syncobj_fence_lookup
> >>>       drm/syncobj: make drm_syncobj_array_wait_timeout public
> >>>       drm/syncobj: add drm_syncobj_register_eventfd
> >>>       drm/syncobj: have transfer functions accept drm_syncobj directl=
y
> >>>       drm/syncobj: add drm_syncobj_transfer
> >>>       drm/syncobj: add drm_syncobj_timeline_signal
> >>>       drm/syncobj: add drm_syncobj_query
> >>>       drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_=
fence
> >>>       drm/syncobj: add drm_syncobj_import_sync_file
> >>>       drm/syncobj: add drm_syncobj_export_sync_file
> >>>       misc/syncobj: add new device
> >>>
> >>>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >>>  drivers/gpu/drm/drm_syncobj.c                      | 374 +++++++++++=
+++-----
> >>>  drivers/misc/Kconfig                               |  10 +
> >>>  drivers/misc/Makefile                              |   1 +
> >>>  drivers/misc/syncobj.c                             | 404 +++++++++++=
++++++++++
> >>>  include/drm/drm_syncobj.h                          |  21 ++
> >>>  include/uapi/linux/syncobj.h                       |  75 ++++
> >>>  7 files changed, 795 insertions(+), 91 deletions(-)
> >>> ---
> >>> base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> >>> change-id: 20260516-jorth-syncobj-d4d374c8c61b
> >>>
> >>> Best regards,
> >>> --
> >>> Julian Orth <ju.orth@gmail.com>
> >>>
> >>
>

