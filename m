Return-Path: <linux-media+bounces-61975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBTXEBwCC2qJ/QQAu9opvQ
	(envelope-from <linux-media+bounces-61975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:12:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CD56C55E
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C9B23200766
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915053F9A15;
	Mon, 18 May 2026 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9wqCwKN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8B3F99E7
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105790; cv=pass; b=bgbRJDFUZGVaWEAjLX8oEpE67DR+Ok1zz87Nr2+dL/oogNUzExcOjsLpupI4n+dLixDNHKDsMGDKhFclQLMnu85bVvMwQpqan3jDGXzSP9nSf/Dre5qoR0keCbkS1WYR1aifjVmRnROoDSt7jQuqY/DLwwmbH9foDPCfZ8I+a9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105790; c=relaxed/simple;
	bh=CIL2dYcCy6pyiuOQOFaduBB+E5eqMEsHA9bpVm3m//Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgAXmd4UNGTP8O4HoUEqqHSYCzj4GhYPKXgbfkcOs+s8WFUZ9MMITf0xGKAhPPkT0oS5360UGdNCHQP7fTOIHha5CWziiVE1ZVnjcmlJfJVfA4kDZj3pgVYdrdg77Alw/6qJRDjHjN99j/w1kog87LuARUkHXcLGWZ7Xdfc0peA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9wqCwKN; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c37eafcbeso2401065d50.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779105787; cv=none;
        d=google.com; s=arc-20240605;
        b=VEjBubv1/fiigk2SnNUgbrlBPNb982+bp1bU84HtWNgAq3fSnpndM3tp+l+OAV9kDo
         x3Boglo3JIr3VU8UE6531ZcKTdE6zkaEUm6ekWVi0SLC4MIwtHVN/0kX/ZsfMET3dFml
         f8umP4lwerPkkBL5AuBVooDPgWpGNRdv3kJS85yKM9V1DcxoanD82+M87pksBKStNaeT
         FoV5NZnvomjWwoYlVAGm8z9d7HDGYTS3JA0k9dJOS6bMnJeCyCuyocWzFV3WJwfBHrj/
         izKENlD/rvVai6d0FtJZmq7bhV6SDJ/YMcCyqaJIK71yuEhgkPwYm5KltXZwOFPx+kHw
         me0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQfhxPsXqrqiZeeyVw9wkJXgorhextrPmIU5IhGc6HM=;
        fh=neYBuBETuvDCJNHVmNmL5y02aLM5LYDgazTBgbSRAHU=;
        b=UcFCtFkC8kVBSXhEmBCuzbayZPFBG0TD9eXUDR2EVNhL8hKFcx7eIjotrcqv4aVpqG
         t6sLtbKA1kITeMJlp5XHOz3SOyqDRBijk0VqZ7EkM5wQgSEiQT1d5RWotHfvMd1ntzSf
         AOlTQ+gPe6OXOF84e3LYMkDYos9eGg4mLfyBtttWJMTGjPqmFh2XBRGCxCqq0Bibg7/H
         LI3TIymIHdHct2JvuwirhbKR9upjjTt8iG62O9QUyLmKaGV6FOQAjtdm2yiYesjKbord
         KYMGgmn/lVmiaxXYC47rfxxYne4/Ylu83EdTUsWy5gUDiWtpYNuS3tkO6+KvE1AzA2ix
         /Jmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779105787; x=1779710587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQfhxPsXqrqiZeeyVw9wkJXgorhextrPmIU5IhGc6HM=;
        b=k9wqCwKNs5fou+RJaGyhXcmC8nb5lMXspADbSPivjmvVgJ3GpyWvusun5LaKSGKWDT
         dIc46FYjxAGdcGjG/kAKNx+HQRIx7J1zVuFLgVhs+ozKFu1pO9aDJpUu1qdcWmPZp9Tp
         YwOQYNM/NPX4qC3yibG+asLbVs0VkagZEf9sYYjBPjENc/DnRKUa/u5vHjbpjSmzfVoo
         Iqo6IqsadjAGL8nDGsUhaanXpmcHltsthxTiXOVqfE/51a4q6z8/EcVypvsgdFeAubSJ
         hLkp36jXENOTesndLZ8UuWpcBtX/YC46CVL0afDFFrqlgeiCl84Ve14PjqFDx+YhiilB
         LE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105787; x=1779710587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQfhxPsXqrqiZeeyVw9wkJXgorhextrPmIU5IhGc6HM=;
        b=iSLoT51C9ho2wEME5wnu6ynJVCOUtAHJhsSnl2wZPvA+m/Z/3gOFnq02+oh6kT1FzV
         a9uBXEsW7kr11r3TTnBSPYMKgkT7q75WXKkSGNiZUHB/SpJz1x3Y63TC+072PYZGSU2h
         BkVQk6xOx/IHoq9XWfgEPDZH++BtqhPcObQrZC+J4phrRnk8N4jhgYyBY69adGrhOVGC
         ugd6dpAm2baFtetdeTOl7+kypUH+YNY7r2ZI/aqYYK6/UTutW6M84xJUKU6DGnBg3faX
         NnGBUYh6vEhA5IrOruX1j8h+OadYRVYREYyWRvsxN4Kf9wuFtY/MlAD9W48MW8F9YNZC
         +F4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9srnepYLRwFU98UWFGWtku2S3GPyFnqHWXaBIueCGozn6RG8OU3jz0qm0aOJWnQroMbqXiqBHhQe2fjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVM1hsAQ0UxjPMiFwhhqjvCtwYTLmV5dITU00V5F2NN8KmoUN
	6Cmtj3tFCINVQgThr899m07sj0MA3xfS3/6nP1WBEqljrtXkIUsdP/rCiQ+ZwZa08bR68OqWoCT
	wUNfokXumInqFUwywDab8eo1kxbvbkbMzXPzgjG0=
X-Gm-Gg: Acq92OG80Gg3Ws2YjOvCuwiN9ApmrDN0vAd36WKcitAWxbl2kmdG6hYtV3xUbH5JKf1
	cI2iTTyBxXFSjNY15T2hL06NT6oQwdaX9ATUantIhAWfbbpqICHuDRQipzvSI52WQjOsxPH1uQ1
	CPmamVNdHpWqJLQzJZTvQ0le6TMUKtWxc3kyu4zmtJ/gLen67hCFlE0Hlm/qRBC4l2WDmB9GyTR
	TUgziWYJGblOOJjjZtkrdGaGQkjbUWwWVyUYSaMvALkzQCeSeSnPgUjLzdNuwPxUlwCzdXjkdy6
	RPpG/O/000ppjDQF6/nZKDyXvuB+gzLcnAZtk6d78Xc+nhAk
X-Received: by 2002:a05:690e:d4c:b0:64e:d622:9d1a with SMTP id
 956f58d0204a3-65e22663ef0mr13926928d50.4.1779105787361; Mon, 18 May 2026
 05:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com> <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
In-Reply-To: <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 18 May 2026 14:02:56 +0200
X-Gm-Features: AVHnY4KJe2qI5pXNXCOzwBarOTRKtwJTNVIpdIJzUsAV6Iz4wL27sHKB6tNYDng
Message-ID: <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A20CD56C55E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61975-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 1:58=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/16/26 13:06, Julian Orth wrote:
> > This series adds a new device /dev/syncobj that can be used to create
> > and manipulate DRM syncobjs. Previously, these operations required the
> > use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
> > and DRIVER_SYNCOBJ_TIMELINE features.
> >
> > There are several issues with the existing API:
> >
> > - Syncobjs are the only explicit sync mechanism available on wayland.
> >   Most compositors do not use GPU waits. Instead, they use the
> >   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
> >   DRM devices means that compositors cannot consistently offer this
> >   feature even though no device-specific logic is involved.
>
> Well the drm_syncobj is a container for device specific dma fences.

Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
some kind of dummy fence that is already signaled. I don't believe
this is device specific. That is also the path that llvmpipe would
use.

>
> What could be possible instead is to pass an eventfd into Wayland, but th=
at is something userspace needs to decide.
>
> > - llvmpipe currently cannot offer syncobj interop because it does not
> >   have access to a DRM device. This means that applications using
> >   llvmpipe cannot present images before they have finished rendering,
> >   despite llvmpipe using threaded rendering.
>
> Yeah, but that is completely intentional. You *CAN'T* use a dma_fence as =
completion event for llvmpipe rendering. See the kernel documentation on th=
at.
>
> What could be possible is to use the drm_syncobjs functionality to wait b=
efore signal, but that has different semantics.
>
> Regards,
> Christian.
>
> > - Clients that do not use the Vulkan WSI need to manually probe /dev/dr=
i
> >   for devices that support the syncobj ioctls in order to use the
> >   wayland syncobj protocol.
> > - Similarly, clients that want to use screen capture have no equivalent
> >   to the WSI and are therefore forced into that path.
> > - Having to keep a DRM device open has potentially negative interaction=
s
> >   with GPU hotplug.
> > - Having to translate between syncobj FDs and handles is troublesome in
> >   the compositor usecase since syncobjs come and go frequently and need
> >   to be cleaned up when clients disconnect.
> >
> > /dev/syncobj solves these issues by providing all syncobj ioctls under =
a
> > consistent path that is not tied to any DRM device. It also operates
> > directly on file descriptors instead of syncobj handles.
> >
> > The series starts with a number of small refactorings in drm_syncobj.c
> > to make its functionality available outside of the file and without the
> > need for drm_file/handle pairs.
> >
> > The last commit adds the /dev/syncobj module. I've added it as a misc
> > device but maybe this should instead live somewhere under gpu/drm.
> >
> > An application using the new interface can be found at [1].
> >
> > [1]: https://github.com/mahkoh/jay/pull/947
> >
> > ---
> > Julian Orth (12):
> >       drm/syncobj: add drm_syncobj_from_fd
> >       drm/syncobj: add drm_syncobj_fence_lookup
> >       drm/syncobj: make drm_syncobj_array_wait_timeout public
> >       drm/syncobj: add drm_syncobj_register_eventfd
> >       drm/syncobj: have transfer functions accept drm_syncobj directly
> >       drm/syncobj: add drm_syncobj_transfer
> >       drm/syncobj: add drm_syncobj_timeline_signal
> >       drm/syncobj: add drm_syncobj_query
> >       drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_fe=
nce
> >       drm/syncobj: add drm_syncobj_import_sync_file
> >       drm/syncobj: add drm_syncobj_export_sync_file
> >       misc/syncobj: add new device
> >
> >  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >  drivers/gpu/drm/drm_syncobj.c                      | 374 +++++++++++++=
+-----
> >  drivers/misc/Kconfig                               |  10 +
> >  drivers/misc/Makefile                              |   1 +
> >  drivers/misc/syncobj.c                             | 404 +++++++++++++=
++++++++
> >  include/drm/drm_syncobj.h                          |  21 ++
> >  include/uapi/linux/syncobj.h                       |  75 ++++
> >  7 files changed, 795 insertions(+), 91 deletions(-)
> > ---
> > base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> > change-id: 20260516-jorth-syncobj-d4d374c8c61b
> >
> > Best regards,
> > --
> > Julian Orth <ju.orth@gmail.com>
> >
>

