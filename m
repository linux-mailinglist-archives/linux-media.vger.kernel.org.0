Return-Path: <linux-media+bounces-59272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENEYGpcs6GlWGQIAu9opvQ
	(envelope-from <linux-media+bounces-59272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 04:04:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B54413BE
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 04:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E91BD30211E6
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 02:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCCA2D7DD7;
	Wed, 22 Apr 2026 02:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZZ8A1//"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7240DFA1
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823443; cv=pass; b=fO4LZtZb2+3lRzmNVR3uEg8Pp5ognmPi9WAe7Q84qB+YsuAVNEBRZQ0ZgfnhWLvTD7QhoO64ibDBlj+fKNPu39feL4pOESJxB2AHEY8Hvfzv4tXn+O+eSxe6Ufne745Ck1jL6WAfmMHe6FaNQUhz38ig1Fi3nHttg/htZW9afog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823443; c=relaxed/simple;
	bh=9kpc/fdbUzmFAjpR4+uGuEyFqwVNI7ri82lrwriuUfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jps/q45Ng9VtFZS8JHyRNbkIK2gvlxwHpbyyOlrGePXM8RIGKhGn3Cn0DNbY17n7DxS4LmTa4AmaIGwq9L2bhP0O/j5O2OAlolLaoFpPtJzHH9vEKuKGED00OHvIhMm8Yf9HozmNRmHbO0QmR1PjafHx3/cADMvzruvxkrDaOhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZZ8A1//; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bda3b4318dso666387eec.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 19:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776823441; cv=none;
        d=google.com; s=arc-20240605;
        b=iqI8FXgo2iS6zyLuIoFSflwOQ/FNCN4a56k8spsP/Of1JOcX+nPgzoWX5RweTE+B9T
         k1UtyXNXsQ2u2TVwN+9raaNxP//Jt+uBfFLoRXJAOyK5e0LPvDYZ3uPhzOI277CeeJdb
         rmmLkTKX/pndGSRArDqBgVEFb3gRpNQl44DpHZR1bKHRxEzW3Uii3KWVMB+msL1FnliW
         Zc9UDqkQnI3TRI1csBoPC6iJoxk7v4UxmkSn9fBlNMJUdAxgJTWt8A5hEEQCFf14HRJ7
         xRXMcMRDMihXxdu9UeZCGk3wnEu86S6xYHbYxHMVKxKGi1ZyTcU/9aI3VpXCngPOpuXi
         bnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KXwfE/915Iuu5tjJxurXwHhruslbzJKEkqu1zMBps88=;
        fh=HPfEyikjxZ6I1eflzPmjGujXO6kwCDT7cQD7r/qkpNg=;
        b=FjY8KvKjU607GlwVvqm2CmB1fq3dFqiFQgu2+ceKseSR0FJbExnnPnIj4/6gzKaGmz
         TpZ852gsrQXdp2Ibh45gIOUJbf9D2pfNBqiUNgNn6NRgI5/clCM01fWiQEmjbWdc0kTc
         RR9F1xXxfTgL85yRtVvv9wqBrFl4+TwuqVGDXoNU0fQbdHPWn7KwCTmHbLKrSF9QZ5Um
         30IhzpXWvpspCQg5c5tV3MPa2dUBFKX/QBXiIOUMX1SrtZFsz2Tl3MnIWeFeSPnf80UN
         p3QzQ0DboI9/5QWwS0TNOxVqHpkul2gxBdySxA3giWGkg2j+2rzSghVfl6rnwqPF/Yo1
         EnCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776823441; x=1777428241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXwfE/915Iuu5tjJxurXwHhruslbzJKEkqu1zMBps88=;
        b=mZZ8A1//8h+RKDMu3QkIFeUSb5fMoXZYFAeKmTDuTJz5Rc5Q2rMLjqFFwwYiXnc55x
         MEjhhnkIzRxKgT690xM8iDmt84OtCjPHWHxg48DkXgf5CIME+zpssLdWMb4xNCEPfPGu
         f+6+pUxzfh86jwIUmFSdFstQFEAS3beakQ2Fg9jmNL9q5/M/q3k8iQ6zOK7e+gfb/kJY
         pgjZTsaQ8CiWWnnWDnINKdbhyBUCKS4MUeNPI30m+gfPQ7V5y9S/XBXIMXOjEsWdIW2T
         6CGe081Ot2+Taree4AzMa1EyDM99QRfBh2TfsGVa4jN1BGCJO8BDwUxepvddv94vAOZC
         IcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823441; x=1777428241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXwfE/915Iuu5tjJxurXwHhruslbzJKEkqu1zMBps88=;
        b=h0cYS4lZNw4MOO3OA83nSUMBmYDWRhIw41LKXc67abuj0q4dBiOvRCWRifsROaTRTP
         4U89755nYdHWOFV1+Op4YLmrYqEMq9tSuOpnB8agPHyvaj337dpXzV6MsXASv2byWcHp
         gUBCTkockqSbiEAy3haA5iOqo6K8/jiOjtBC4bgT+VikPVpfY7/Gqgvwq9Zq9JpvrX64
         O/RHWLHpYAWa9Dp5SH2/dyRVKHt5N9F2JJrrd7Fp+XT4isZwaYgJeUANBBQw6bfb0yHe
         MKxo5ArRvX7r79IobrMN7A3mcTp/mVkWXB4mD5a1vYurhWJ2B7qsQ+6zNOGQ6WUfbDBT
         aIIA==
X-Forwarded-Encrypted: i=1; AFNElJ/6bIcWzZTHB0TyrT/wdsx/JzQ5yDUiMw74TFyspi9H107DAPfQvdaWLwbEVtb9GXokYOLtgSBh3MHJkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyodPB9jvAKyXz8+XORSWpMVBcxA3fVSOjaCb8wK7JZJ/vsUjQC
	s6TnaojqEW/0jMz2n4/yYGxuNfK3dEr5Z7PePPpe+9GzsilCFKWi15xqpcTEGQcACfh1e4rxh42
	5wHRE8NSa3lhdAZUiMSefu6gX+EuyYb8=
X-Gm-Gg: AeBDieuvfApYPj99W0LSzD9ebXA7ArJQkfOKFAw1NL8JqfII68aloIwDgOPGL2UWRJe
	dwwUlbLXJuqvd04y/k6GynEqRHkj7duGHGbFb83LcMY2ypH25r7XQunUC20UhqGmtswd3gOCa0J
	kcG/npXDJX52aZNwubpDbPt2UBra7jUaD4KkrSGod8PmfIVl+P9eDxEWG5uRz2yUSiEM9eil2ZL
	6dW6vR9WPU5lXoMVnK8zTgHLAGPzV94kG4yFEUD4uJWFy7ZnmBtgNh7zY0vg3r4YGLHTqg6eRP8
	LXCrKHCF3lGVhDqWYDAgb67N2Ra+6jl4NXo0rhRde+MQNep3Kd9C0r7SNsBlLX+U94mZAGGGOaL
	OCWBH
X-Received: by 2002:a05:7022:5f01:b0:12d:b654:8180 with SMTP id
 a92af1059eb24-12db65484bfmr455959c88.2.1776823441162; Tue, 21 Apr 2026
 19:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com> <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
 <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com> <7472bfcf-8c22-4ac7-b903-a883cdb8f1c6@gmail.com>
 <8fe8b78b-5294-4319-af92-a4fb00527417@amd.com> <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
 <964c3670-fad3-44ce-bd93-2057bca2dcb8@amd.com> <08ad2301-3163-4497-8869-fa4cea30b384@gmail.com>
 <e5c00f2c-0819-48b4-b66e-71b9a40a7235@amd.com> <686713fc-c762-4b1b-88b2-d486d4f38ac6@gmail.com>
 <de6777c1-1165-4ace-a5a7-3004aa9ea8c5@invisiblethingslab.com> <d045e25d-0bc5-4056-b4a2-9eda73fb5be7@gmail.com>
In-Reply-To: <d045e25d-0bc5-4056-b4a2-9eda73fb5be7@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Apr 2026 22:03:49 -0400
X-Gm-Features: AQROBzCq3JY-5ArkKnDyVVr-Wl_czV3R7nte4oTZblqOBZ3Fd9cc3qiKy3Gryh4
Message-ID: <CADnq5_Og_eAA2QkN_TM=AqY2rz_B6cwbm5tePzwrAXzK3BypGg@mail.gmail.com>
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Val Packett <val@invisiblethingslab.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, linux-media@vger.kernel.org, 
	Suwit Semal <sumit.semwal@linaro.org>, 
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59272-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 086B54413BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 9:34=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 4/21/26 12:55, Val Packett wrote:
> >
> > On 4/20/26 4:12 PM, Demi Marie Obenour wrote:
> >> On 4/20/26 14:53, Christian K=C3=B6nig wrote:
> >>> On 4/20/26 20:46, Demi Marie Obenour wrote:
> >>>> On 4/20/26 13:58, Christian K=C3=B6nig wrote:
> >>>>> On 4/20/26 19:03, Demi Marie Obenour wrote:
> >>>>>> On 4/20/26 04:49, Christian K=C3=B6nig wrote:
> >>>>>>> On 4/17/26 21:35, Demi Marie Obenour wrote:
> >>>>> ...
> >>>>>>>> Are any of the following reasonable options?
> >>>>>>>>
> >>>>>>>> 1. Change the guest kernel to only map (and thus pin) a small su=
bset
> >>>>>>>>     of VRAM at any given time.  If unmapped VRAM is accessed the=
 guest
> >>>>>>>>     traps the page fault, evicts an old VRAM mapping, and create=
s a
> >>>>>>>>     new one.
> >>>>>>> Yeah, that could potentially work.
> >>>>>>>
> >>>>>>> This is basically what we do on the host kernel driver when we ca=
n't resize the BAR for some reason. In that use case VRAM buffers are shuff=
led in and out of the CPU accessible window of VRAM on demand.
> >>>>>> How much is this going to hurt performance?
> >>>>> Hard to say, resizing the BAR can easily give you 10-15% more perfo=
rmance on some use cases.
> >>>>>
> >>>>> But that involves physically transferring the data using a DMA. For=
 this solution we basically only have to we basically only have to transfer=
 a few messages between host and guest.
> >>>>>
> >>>>> No idea how performant that is.
> >>>> In this use-case, 20-30% performance penalties are likely to be
> >>>> "business as usual".
> >>> Well that is quite a bit.
> >>>
> >>>> Close to native performance would be ideal, but
> >>>> to be useful it just needs to beat software rendering by a wide marg=
in,
> >>>> and not cause data corruption or vulnerabilities.
> >>> That should still easily be the case, even trivial use cases are mult=
iple magnitudes faster on GPUs compared to software rendering.
> >> Makes sense.  If only GPUs supported easy and flexible virtualization =
the way CPUs do :(.
> >>
> >>>>>>> But I have one question: When XEN has a problem handling faults f=
rom the guest on the host then how does that work for system memory mapping=
s?
> >>>>>>>
> >>>>>>> There is really no difference between VRAM and system memory in t=
he handling for the GPU driver stack.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Christian.
> >>>>>> Generally, Xen makes the frontend (usually an unprivileged VM)
> >>>>>> responsible for providing mappings to the backend (usually the hos=
t).
> >>>>>> That is possible with system RAM but not with VRAM, because Xen ha=
s
> >>>>>> no awareness of VRAM.  To Xen, VRAM is just a PCI BAR.
> >>>>> No, that doesn't work with system memory allocations of GPU drivers=
 either.
> >>>>>
> >>>>> We already had it multiple times that people tried to be clever and=
 incremented the page reference counter on driver allocated system memory a=
nd were totally surprised that this can result in security issues and data =
corruption.
> >>>>>
> >>>>> I seriously hope that this isn't the case here again. As far as I k=
now XEN already has support for accessing VMAs with VM_PFN or otherwise I d=
on't know how driver allocated system memory access could potentially work.
> >>>>>
> >>>>> Accessing VRAM is pretty much the same use case as far as I can see=
.
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>> The Xen-native approach would be for system memory allocations to
> >>>> be made using the Xen driver and then imported into the virtio-GPU
> >>>> driver via dmabuf.  Is there any chance this could be made to happen=
?
> >>> That could be. Adding Pierre-Eric to comment since he knows that use =
much better than I do.
> >>>
> >>>> If it's a lost cause, then how much is the memory overhead of pinnin=
g
> >>>> everything ever used in a dmabuf?  It should be possible to account
> >>>> pinned host memory against a guest's quota, but if that leads to an
> >>>> unusable system it isn't going to be good.
> >>> That won't work at all.
> >>>
> >>> We have use cases where you *must* migrate a DMA-buf to VRAM or other=
wise the GPU can't use it.
> >>>
> >>> A simple scanout to a monitor is such an use case for example, that i=
s usually not possible from system memory.
> >> Direct scanout isn't a concern here.
> >>
> >>>> Is supporting page faults in Xen the only solution that will be viab=
le
> >>>> long-term, considering the tolerance for very substantial performanc=
e
> >>>> overheads compared to native?  AAA gaming isn't the initial goal her=
e.
> >>>> Qubes OS already supports PCI passthrough for that.
> >>> We have AAA gaming working on XEN through native context working for =
quite a while.
> >>>
> >>> Pierre-Eric can tell you more about that.
> >>>
> >>> Regards,
> >>> Christian.
> >> I've heard of that, but last I checked it required downstream patches
> >> to Xen, Linux, and QEMU.  I don't know if any of those have been
> >> upstreamed since, but I believe that upstreaming the Xen and Linux
> >> patches (or rewriting them and upstreaming the rewritten version) woul=
d
> >> be necessary.  Qubes OS (which I don't work for anymore but still want
> >> to help with this) almost certainly won't be using QEMU for GPU stuff.
> >
> > Yeah, our plan is to use xen-vhost-frontend[1] + vhost-device-gpu,
> > ported/extended/modified as necessary. (I already have
> > xen-vhost-frontend itself working on amd64 PVH with purely xenbus-based
> > hotplug/configuration, currently working on cleaning up and submitting
> > the necessary patches.)
> >
> > I'm curious to hear more details about how AMD has it working but last
> > time I checked, there weren't any missing pieces in Xen or Linux that
> > we'd need.. The AMD downstream changes were mostly related to QEMU.
> >
> > As for the memory management concerns, I would like to remind everyone
> > once again that the pinning of GPU dmabufs in regular graphics workload=
s
> > would be *very* short-term. In GPU paravirtualization (native contexts
> > or venus or whatever else) the guest mostly operates on *opaque handles=
*
> > that refer to buffers owned by the host GPU process. The typical
> > rendering process (roughly) only involves submitting commands to the GP=
U
> > that refer to memory using these handles. Only upon mmap() would a
> > buffer be pinned/granted to the guest, and those are typically only use=
d
> > for *uploads* where the guest immediately does its memcpy() and unmaps
> > the buffer.
> >
> > So I'm not worried about (unintentionally) pinning too much GPU driver
> > memory.
> >
> > In terms of deliberate denial-of-service attacks from the guest to the
> > host, the only reasonable response is:
> >
> > =C2=AF\_(=E3=83=84)_/=C2=AF
> >
> > CPU-mapping lots of GPU memory is far from the only DoS vector, the GPU
> > commands themselves can easily wedge the GPU core in a million ways (an=
d
> > last time I checked amdgpu was noooot so good at recovering from hangs)=
.
> >
> >
> > [1]: https://github.com/vireshk/xen-vhost-frontend
> >
> > ~val
>
> I think it is best to handle things like GPU crashes by giving the guest
> some time to unmap its grants, and if that fails, crashing it.  This shou=
ld
> be done from a revoke callback, as afterwards the VRAM might get reused.
>
> Does amdgpu call revoke callbacks when the device is reset and VRAM
> is lost?  It seems like it at least ought to.
>
> As an aside, Qubes needs to use the process isolation mode of the
> amdgpu driver.  This means that only one process will be on the GPU
> at a time, so it _should_ be possible to blow away all GPU-resident
> state except VRAM without affecting other processes.  Unfortunately,
> I think AMD GPUs might have HW or FW limitations that prevent that,
> at least on dGPUs.

The driver has supported per queue resets for a few kernel releases
now so only the bad app would be affected in that case.

Alex

>
> It might make sense to recommend KDE with GPU acceleration.  KWin can
> recover from losing VRAM.
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

