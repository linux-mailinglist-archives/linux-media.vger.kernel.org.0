Return-Path: <linux-media+bounces-18754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90670989ADB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 003B4B2192C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 06:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0DC2629D;
	Mon, 30 Sep 2024 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kw7lWz1B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506101AACA
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727678883; cv=none; b=Pbfmzg5miNhFJvL+k2QWb83yH569F0h3a/RBzfn0nVDLLurUzZaOaYAsncgEfCvOqTzvgPGxxTfGjRjvW5zFZVBiqnPpvsEvc90M2aPAT0zzxnNDV9SB6aGVBQ8bkbsz3YBBNxUlW0bhtIEK18JEvZOjjn0Z8bxOJx9zjkH0ATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727678883; c=relaxed/simple;
	bh=/g7wcCRzbGOfKggOUpSf67kFofiDrk/MwfNEDFyqkIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgGt7WMNz3V/z5Lb7Mhy1skz7z+NoG3ApR+xkxkcfjqUU+scPXFDObVVRNrKylby4jqJ4KUuBZkS52NvmmhUR51G4j75Al4nS9SNh4VZZx2zD4ueSlfRa72IggBdOwO2H+kJDp5cI0yr9+W0W19NMF7iK5HfkaN4pzFyXcJtRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kw7lWz1B; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4a3a728804eso572531137.2
        for <linux-media@vger.kernel.org>; Sun, 29 Sep 2024 23:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727678880; x=1728283680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g7wcCRzbGOfKggOUpSf67kFofiDrk/MwfNEDFyqkIs=;
        b=Kw7lWz1BcRHocG9XslUcnqTtpbQCNMS/08+10d7xHBFHOSPX2kqFMu8KgDERjNi5v9
         7GPc0rn/VKCyoG06d7hYvfqSzEfKVnkOe73fh2pGMHaKdhrkaeC6mShj6T02smXFC+36
         6B+7dRLoMthAXoJ+42WsTCN7P6nzPtXnYuxRAyi4IbmLxTNZjH7lrXZfOsnwPMKykee1
         +cA6SRe11E6j94SNNfyjrvNqH0Lip4JT/YPloKF+7mJ3Tcc5niyWRRnKCpqfQ12uYGbq
         gZJ/p9W5i2+ZIDWytHdD+JLRRzGODZ8AcMoucZ2LVP+7RRucE2QfqneX92snLaM+KHnc
         BDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727678880; x=1728283680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g7wcCRzbGOfKggOUpSf67kFofiDrk/MwfNEDFyqkIs=;
        b=NVh11++svyf5sl2EtKFEiQctG5wbJi0N2itQV+Y0gELWONF1mn6Jtt9HmI7Pfi7RiF
         sUIQv05b+wSJn0TQe2R8wTDVK2O6kfSRMUnPdnyGLge2qyxlSV8JTm4tmQ/qol8sOSxF
         scf6QjD3BS09eJ69uOpMrm7n9qKdmiaKv7W9O3AwXdcu0dUX/Som+Exn0+sOyuAgyZ1+
         fZBeQwyWcimjafEdJmlg/5f2KtQq3d+6vN/jXtNo7G7u2yWmItzzdJAuVYK+Kb8ilqER
         ywyOCkMDYtn5rCKT6RH7mvI0FjqlBvWL5JHX3bekLfdvFFtglzru+KbRhQavPa2RU2Z5
         DQYA==
X-Forwarded-Encrypted: i=1; AJvYcCUV7LF4S97hhD7KoDV4SnL+iOsZjluXE4WN70VFE/8d4XuPC0nalQAcN7ZB+jdflRMgIkLIRNu6mnjjCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHZMUOs5k1xpvfSfQNZuUJItq0xP/BDXwYD1mTzMeovRnO/TF
	PpeNTOTGUbXPoaBM345HcBe4JICnQJsGkgii46FsUohTgI3fei/0pqTUgpMRFEdDUH7fqfTEvCZ
	E5Lr+J60Z8iYFSZJaSzGsXfqcNjHmkHjEE8l/UQ==
X-Google-Smtp-Source: AGHT+IENLg636fnVEFtXZnVhYI/GV41eTTwvpGWanS5Q2ZuCDFhgWVQXRcNuHd6kGYhdZRRAC+0Sh6m6yruVp+iycL0=
X-Received: by 2002:a05:6102:2ac7:b0:493:f097:e5b7 with SMTP id
 ada2fe7eead31-4a2cefd1c4bmr7333978137.1.1727678880054; Sun, 29 Sep 2024
 23:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com> <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com> <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
 <04caa788-19a6-4336-985c-4eb191c24438@amd.com> <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
 <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com> <7c9e3a1a6092f6574c17d7206767ece0bcefc81f.camel@ndufresne.ca>
In-Reply-To: <7c9e3a1a6092f6574c17d7206767ece0bcefc81f.camel@ndufresne.ca>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 30 Sep 2024 12:17:47 +0530
Message-ID: <CAFA6WYPtp3H5JhxzgH9=z2EvNL7Kdku3EmG1aDkTS-gjFtNZZA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Sept 2024 at 01:20, Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le jeudi 26 septembre 2024 =C3=A0 19:22 +0530, Sumit Garg a =C3=A9crit :
> > [Resend in plain text format as my earlier message was rejected by
> > some mailing lists]
> >
> > On Thu, 26 Sept 2024 at 19:17, Sumit Garg <sumit.garg@linaro.org> wrote=
:
> > >
> > > On 9/25/24 19:31, Christian K=C3=B6nig wrote:
> > >
> > > Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
> > >
> > > On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian K=C3=B6nig wrote:
> > >
> > > Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> > >
> > > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> > >
> > > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > >
> > > Hi,
> > >
> > > This patch set is based on top of Yong Wu's restricted heap patch set=
 [1].
> > > It's also a continuation on Olivier's Add dma-buf secure-heap patch s=
et [2].
> > >
> > > The Linaro restricted heap uses genalloc in the kernel to manage the =
heap
> > > carvout. This is a difference from the Mediatek restricted heap which
> > > relies on the secure world to manage the carveout.
> > >
> > > I've tried to adress the comments on [2], but [1] introduces changes =
so I'm
> > > afraid I've had to skip some comments.
> > >
> > > I know I have raised the same question during LPC (in connection to
> > > Qualcomm's dma-heap implementation). Is there any reason why we are
> > > using generic heaps instead of allocating the dma-bufs on the device
> > > side?
> > >
> > > In your case you already have TEE device, you can use it to allocate =
and
> > > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > >
> > > This goes to the heart of why we have dma-heaps in the first place.
> > > We don't want to burden userspace with having to figure out the right
> > > place to get a dma-buf for a given use-case on a given hardware.
> > > That would be very non-portable, and fail at the core purpose of
> > > a kernel: to abstract hardware specifics away.
> > >
> > > Unfortunately all proposals to use dma-buf heaps were moving in the
> > > described direction: let app select (somehow) from a platform- and
> > > vendor- specific list of dma-buf heaps. In the kernel we at least kno=
w
> > > the platform on which the system is running. Userspace generally does=
n't
> > > (and shouldn't). As such, it seems better to me to keep the knowledge=
 in
> > > the kernel and allow userspace do its job by calling into existing
> > > device drivers.
> > >
> > > The idea of letting the kernel fully abstract away the complexity of =
inter
> > > device data exchange is a completely failed design. There has been pl=
enty of
> > > evidence for that over the years.
> > >
> > > Because of this in DMA-buf it's an intentional design decision that
> > > userspace and *not* the kernel decides where and what to allocate fro=
m.
> > >
> > > Hmm, ok.
> > >
> > > What the kernel should provide are the necessary information what typ=
e of
> > > memory a device can work with and if certain memory is accessible or =
not.
> > > This is the part which is unfortunately still not well defined nor
> > > implemented at the moment.
> > >
> > > Apart from that there are a whole bunch of intentional design decisio=
n which
> > > should prevent developers to move allocation decision inside the kern=
el. For
> > > example DMA-buf doesn't know what the content of the buffer is (excep=
t for
> > > it's total size) and which use cases a buffer will be used with.
> > >
> > > So the question if memory should be exposed through DMA-heaps or a dr=
iver
> > > specific allocator is not a question of abstraction, but rather one o=
f the
> > > physical location and accessibility of the memory.
> > >
> > > If the memory is attached to any physical device, e.g. local memory o=
n a
> > > dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose th=
e
> > > memory as device specific allocator.
> > >
> > > So, for embedded systems with unified memory all buffers (maybe excep=
t
> > > PCIe BARs) should come from DMA-BUF heaps, correct?
> > >
> > >
> > > From what I know that is correct, yes. Question is really if that wil=
l stay this way.
> > >
> > > Neural accelerators look a lot stripped down FPGAs these days and the=
 benefit of local memory for GPUs is known for decades.
> > >
> > > Could be that designs with local specialized memory see a revival any=
 time, who knows.
> > >
> > > If the memory is not physically attached to any device, but rather ju=
st
> > > memory attached to the CPU or a system wide memory controller then ex=
pose
> > > the memory as DMA-heap with specific requirements (e.g. certain sized=
 pages,
> > > contiguous, restricted, encrypted, ...).
> > >
> > > Is encrypted / protected a part of the allocation contract or should =
it
> > > be enforced separately via a call to TEE / SCM / anything else?
> > >
> > >
> > > Well that is a really good question I can't fully answer either. From=
 what I know now I would say it depends on the design.
> > >
> >
> > IMHO, I think Dmitry's proposal to rather allow the TEE device to be
> > the allocator and exporter of DMA-bufs related to restricted memory
> > makes sense to me. Since it's really the TEE implementation (OP-TEE,
> > AMD-TEE, TS-TEE or future QTEE) which sets up the restrictions on a
> > particular piece of allocated memory. AFAIK, that happens after the
> > DMA-buf gets allocated and then user-space calls into TEE to set up
> > which media pipeline is going to access that particular DMA-buf. It
> > can also be a static contract depending on a particular platform
> > design.
>
> When the memory get the protection is hardware specific. Otherwise the de=
sign
> would be really straightforward, allocate from the a heap or any random d=
river
> API and protect that memory through an call into the TEE. Clear seperatio=
n would
> be amazingly better, but this is not how hardware and firmware designer h=
ave
> seen it.
>
> In some implementation, there is a carving of memory that be protected be=
fore
> the kernel is booted. I believe (but I'm not affiliated with them) that M=
TK has
> hardware restriction making that design the only usable method.

Yeah I agree with that. The point I am making here is that the TEE
subsystem can abstract all that platform/vendor specific methods for
user-space to allocate restricted memory. We already have a similar
infrastructure for shared memory among Linux and TEE implementation.
The user-space only uses TEE_IOC_SHM_ALLOC [1] where underneath it can
either allocate from static carveout of shared memory (as a reserved
memory region) OR simply allocate from the kernel heap which is
dynamically mapped into the TEE implementation. The choice here
depends on the platform/TEE implementation capability.

[1] https://docs.kernel.org/userspace-api/tee.html

>
> In general, the handling of secure memory is bound to the TEE application=
 for
> the specific platform, it has to be separated from the generic part of te=
e
> drivers anyway,

It is really the TEE implementation core which has the privileges to
mark a piece of memory as restricted/secure. The TEE application in
MTK is likely a pseudo TA (a terminology similar to Linux kernel
modules in the TEE world). So it is rather easier for TEE
implementation drivers to abstract out the communication with the
vendor specific TEE core implementation.

> and dmabuf heaps is in my opinion the right API for the task.

Do you really think it is better for user-space to deal with vendor
specific dmabuf heaps?

>
> On MTK, if you have followed, when the SCP (their co-processor) is handli=
ng
> restricted video, you can't even call into it anymore directly. So to dri=
ve the
> CODECs, everything has to be routed through the TEE. Would you say that b=
ecause
> of that this should not be a V4L2 driver anymore ?

I am not conversant with the MTK hardware/firmware implementation. But
my point is the kernel shouldn't be exposing 10s of vendor specific
DMAbuf heaps to the user-space to choose from which can rather be just
a single TEE device IOCTL used to allocate restricted memory.

>
> >
> > As Jens noted in the other thread, we already manage shared memory
> > allocations (from a static carve-out or dynamically mapped) for
> > communications among Linux and TEE that were based on DMA-bufs earlier
> > but since we didn't required them to be shared with other devices, so
> > we rather switched to anonymous memory.
> >
> > From user-space perspective, it's cleaner to use TEE device IOCTLs for
> > DMA-buf allocations since it already knows which underlying TEE
> > implementation it's communicating with rather than first figuring out
> > which DMA heap to use for allocation and then communicating with TEE
> > implementation.
>
> As a user-space developer in the majority of my time, adding common code =
to
> handle dma heaps is a lot easier and straight forward then having to glue=
 all
> the different allocators implement in various subsystems. Communicating w=
hich
> heap to work can be generic and simple.

Yeah I agree with that notion but IMHO having ifdefry to select vendor
specific DMA heaps isn't something user-space should be dealing with.

-Sumit

>
> Nicolas
>

