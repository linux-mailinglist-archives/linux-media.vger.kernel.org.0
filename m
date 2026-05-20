Return-Path: <linux-media+bounces-62277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPi5FJ+rDWqP1QUAu9opvQ
	(envelope-from <linux-media+bounces-62277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:39:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4658DE95
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C10B306A358
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E658C3DD85E;
	Wed, 20 May 2026 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="Whq6NoHV"
X-Original-To: linux-media@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABC3E0C4D
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280423; cv=none; b=fZaQEhxCXkrmNGwD3kET3yF62PeWQur56Ex1pxsT/cUDDTrj/s4iLfSl88e3G7O76a4TpZ+QUEyLKm3HGuMoxfLvXoOU0KVZW16Uput0Zvt1RyUgdBd13RWrahJk/woph3VOaSU2AmBzR5ipasKLaPGdLEmCep8bxQVp6nnJIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280423; c=relaxed/simple;
	bh=QAPUhSFoYr4bUaOZROL9kMB0XxGMQA2LYNnfIiF3fpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbHH6YkiewHO7ZBtaBN3Bh3KVE0hKNd9y0oNaksRvJ5Q5UDADW+oyo+WvtVzukPxQwytANFvZomz005LT2iaTQQm6h/FqSuACVu37Iv+wOy4Ooyb3SmSBpEPgafV7OFkcK1DG00Y/HrIqGxKP2CBFMzFDwaZmzv0CtArTBt8QHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=Whq6NoHV; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(Authenticated sender: zamundaaa)
	by letterbox.kde.org (Postfix) with ESMTPSA id 571FC32BA42
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 13:33:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1779280420; bh=QAPUhSFoYr4bUaOZROL9kMB0XxGMQA2LYNnfIiF3fpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Whq6NoHVvcJFXcYunt2by+cUOjwnj5qoXA3T2bsBSlE6re6nm2tCRX78zTQiUSpeT
	 Z8gqcl0bxQkQ04sGGDoPKApr8jQhjYnMz4tnNztA/QPBCQO6WtOYx+H20DWNn0LWe/
	 7RADW8TNKcBmaYESpnHv0/JYuQiiWxCcf7S6OCqalQxhVc2kZjAO3zDKdCKBlvx3BC
	 Nui2oS88fh84B2/uTjK6axPUV0cIkLquf0d/bY8IKHQm9Md3fc1iJ/hcZpK1PY+YvN
	 k3LQqb2/h6ZPn1RpEdanRdFYpQdwMG9QWuz4OFrJG0avYWo3hpZ2yf/qrRiD0R91W1
	 qiumSiHGDGc+g==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651b4d09141so4616088d50.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 05:33:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/woo9B9q2+vPWaw0KkTFRNOHvSi5wWRGeYcJG+0C4YHSM4GHJudKbZAGqHFlVDWHqlrg177n0ieNgh4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3OvwB9KPpCKJUi4SlcEiUz6aCaA7wnvgR3204FCGXo4w+jIwV
	xirzMjpC55Ke5TDW6AeFrYHkQmbJvWs4QyZHTf6q2LS0IJ8eQKb7WiYiMSqb6IhBh5qmV6nhTdS
	oaZnw45d4ERr6c774Cqn68YD/tAPzHIk=
X-Received: by 2002:a05:690e:1c05:b0:65e:9e71:7942 with SMTP id
 956f58d0204a3-65e9e718592mr625005d50.37.1779280418541; Wed, 20 May 2026
 05:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com> <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com> <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com> <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com> <CAFZQkGz=UJqaJ_eTwKBy1pAg5xL+PLibh7W1vYf7JD7Jrx-LZQ@mail.gmail.com>
 <53edf0b5-e733-4b96-87d7-3307275500c0@amd.com>
In-Reply-To: <53edf0b5-e733-4b96-87d7-3307275500c0@amd.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 20 May 2026 14:33:26 +0200
X-Gmail-Original-Message-ID: <CAFZQkGxpPm081Fz8UtDuBA1PKD42+9YDA+cc6fbSpfawXwu9+g@mail.gmail.com>
X-Gm-Features: AVHnY4Jgk8foYzRi5plZzxfmXsVMwh3FA7NaYflBHH8P8EN0Be3BzPmLSUlyKpc
Message-ID: <CAFZQkGxpPm081Fz8UtDuBA1PKD42+9YDA+cc6fbSpfawXwu9+g@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Julian Orth <ju.orth@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62277-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kde.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kde.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,amd.com:email,kde.org:dkim]
X-Rspamd-Queue-Id: C9F4658DE95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Mi., 20. Mai 2026 um 10:08 Uhr schrieb Christian K=C3=B6nig
<christian.koenig@amd.com>:
> Well I would say the other way around is a pretty common use case.
>
> In other words the compositors uses the internal GPU for composing and di=
splaying the picture. And the client uses the external GPU for fast renderi=
ng.
Sure, but that's not what I'm talking about.

> > - the buffers from the client stay valid
>
> Buffers from the hot plugged GPU don't stay valid. Accessing CPU mappings=
 either result in a SIGBUS or are redirected to a dummy page.
Again, not what I wrote about. The buffers are on the integrated GPU.

> > - the syncobj stays valid on the client side
> > - the syncobj becomes invalid on the compositor side
>
> Nope that's not correct. The syncobj itself stays valid even if you compl=
etely hot plug the device.
>
> It can just be that the fences inside the syncobj are terminated with an =
error.
What about eventfd created for a point on the syncobj?

Another (future) problem with hotplugs will be if the sync file hasn't
materialized for the timeline point when the device is hotunplugged,
since there can't be an error on the fence if there isn't one. Or
could userspace somehow set an 'artificial' fence with an error in
that case?

> > "invalid" there means either
> > - the acquire point of the client is marked as signaled, before
> > rendering on the client side is completed
> > - the acquire point of the client is never signaled. Since the
> > compositor waits for the acquire point, the Wayland surface is stuck
> > forever
>
> Both of those would be a *massive* violation of documented kernel rules f=
or hot-plugging which could lead to random data corruption and/or deadlocks=
.
>
> If you see any HW driver showing behavior like that please open up a bug =
report and ping the relevant maintainers immediately.
If there are no error codes with syncobj yet, then to userspace, the
latter behavior is exactly what we get, isn't it?

> When a hotplug happens all operations of the device should return an -ENO=
DEV error, even when exposed to other devices/application through syncobj o=
r syncfile.
Okay, that at least gives us a way to fail imports somewhat
gracefully. Normally, failing to import a syncobj is a fatal error in
the Wayland protocol.

> One problem is that only syncfile allows for querying such error codes at=
 the moment, we have patches pending to add that to syncobj as well but we =
lack a compositor with support for that as userspace client.
As long as the error case can be detected with an eventfd,
implementing that in KWin shouldn't be a challenge.

> Well the question here is if the device the compositor is using or the cl=
ient is using is gone?
>
> If the client device is hot removed the compositor should be perfectly ca=
pable to import the syncobj.
>
> If the compositor device is gone then you don't have a device to display =
anything any more, so generating the next frame doesn't seem to make sense =
either.
>
> What could be is that you want the compositor to be kept alive even when =
the display device is gone to switch over to vkms or whatever so that a VNC=
 session or other remote desktop still works.
There are two GPUs in the example I gave. The compositor can use both
for rendering (in cosmic-comp's case) or switch between them (what I'm
trying to do with KWin), or use one device for rendering, and another
for importing the syncobj.

> >>>>> 3. It removes the need to translate between syncobjs fds and handle=
s.
> >>>>
> >>>> That's a pretty big no-go as well. The differentiation between FDs a=
nd handles is completely intentional.
> >>> Could you expand on why it's needed? For compositors, the handle is
> >>> just an intermediary thing when translating between file descriptors.
> >>
> >> Well what we could do is to add an IOCTL to directly attach an syncobj=
 file descriptor to an eventfd.
> > That would be nice.
>
> Take a look at drm_syncobj_file_fops and how drm_syncobj_add_eventfd() is=
 used. Adding that functionality shouldn't be more than a typing exercise.
Yeah, this patchset already adds that functionality (on the new device).

> Do I see it right that this would already solve most problems in the comp=
ositor side?
Skipping the syncobj handle step would only reduce the amounts of
ioctls the compositor does, but afaict it wouldn't solve any
compositor problems. At least not as long as it's still tied to a drm
device.
For device hotplugs, the only new thing we need for correctly handling
syncobj is a way to receive errors on the eventfd.

A device-independent way to create and use syncobj would still be
useful to us though, both to simplify the compositor and to improve
the software rendering use cases.

- Xaver

