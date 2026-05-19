Return-Path: <linux-media+bounces-62175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAPTM5WZDGo6jwUAu9opvQ
	(envelope-from <linux-media+bounces-62175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:10:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B80582DCF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415F1302DF9F
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD57480DDC;
	Tue, 19 May 2026 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="ULomDrS9"
X-Original-To: linux-media@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3836A40961B
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210552; cv=none; b=aV6pJcb2fS7HN6K6fdYhoUix5x0V6iF33RoaFhc4MyD2PzXInbs7rFSZtkdiyyoH1IlezF4nHG6kC5IxrQ/HtQGtoIIDwxt+eKtXe/ePBDxReroyqonxcjYrBQdg1mx3SYRmMPSY1oVcEeSJfmcd/P7TVwKUUi3MB81Ita7WOAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210552; c=relaxed/simple;
	bh=AlJ1/t/6JcBQn3xvZ12SbKOodlIQ8ueQNBgDtOCG+Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCrvMjgnwTPwJ/UauDPKFod9cQaWw0uASH71n4DZgSz4TqVzChvQ+8s47MUradFzcyM1ATzllgf5p1mTR6n1Qk4bIGL+VDloEjv3rq0XVCunhK2o55GHPcG6ZS4jZHSrBRoartqdT6vBjXLzMD91zXfBHn1MKUzdVSmkjVvVX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=ULomDrS9; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(Authenticated sender: zamundaaa)
	by letterbox.kde.org (Postfix) with ESMTPSA id C520532B23B
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 18:09:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1779210548; bh=AlJ1/t/6JcBQn3xvZ12SbKOodlIQ8ueQNBgDtOCG+Xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ULomDrS9UqUbxh3IzJyvC4+q/VmRHFROIzfDMEyYaPejcn1rB1NEXGg3KBPnjmAEh
	 iAPC/67qui6nmReo5x4MtCM9fnKz+0kMn4dTCuab25hyJJLy1Q9YTn4uW9hEH03S0g
	 N1PfoTIr+iaK05XtPwZUOcd8Trz0rhKcZeeMgbhaWTAkM17z8cWoZ1kwXBXXdDd/9T
	 3/iUa7kTM03makIM4O9+zXpGE3wRZFda52gjJGeBD+ck/25Vqhy9I9SqPXGq6wBaf1
	 YkIRxjUw+J/Rz1TYDm3b+nP5PfQrVVIiQNgSwROSkJLhq1zjzkrOxqJLR1vGXyFmZe
	 OatGh1T1ZXZrA==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65890a6ca20so4292083d50.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 10:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8i9qjywY4/tIAu1sTcPlkKrgE0AlhqIFzDH7TWK3Hng2Rl1ByfO175tc30HQinh8qPiD8vAR1ZVYC5ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMJN6ev1TkbGkuGTKt2q7TOLbTwHctvXkr6tYdKlFyFk7yuIJ
	JeoBPW9myJT9LDLNrsoPOQ4FBFGtWWWyX3QphpCwyKAw3bFti6ZMZ1oQLF9LXwOu6t8HX3Fpkgg
	CGTQjAX2lXxlFrDyGTEg7FSnYbluIVxU=
X-Received: by 2002:a53:c041:0:20b0:658:509a:754f with SMTP id
 956f58d0204a3-65e226bb1acmr16811065d50.18.1779210546198; Tue, 19 May 2026
 10:09:06 -0700 (PDT)
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
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
In-Reply-To: <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Tue, 19 May 2026 19:08:54 +0200
X-Gmail-Original-Message-ID: <CAFZQkGz=UJqaJ_eTwKBy1pAg5xL+PLibh7W1vYf7JD7Jrx-LZQ@mail.gmail.com>
X-Gm-Features: AVHnY4K_IfI4nF31sGUOpZQLLhRb2Bvzlif26PEgJHTzyC-9E6RsTuVsRZfgh_U
Message-ID: <CAFZQkGz=UJqaJ_eTwKBy1pAg5xL+PLibh7W1vYf7JD7Jrx-LZQ@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62175-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kde.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kde.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kde.org:dkim]
X-Rspamd-Queue-Id: 74B80582DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > The part where we get this independent of attached hardware is quite
> > important for us though, since we can't just ignore explicit sync once
> > the device we previously imported the syncobj into is disconnected.
>
> Can you elaborate more on this?

In Wayland, the client is allowed to attach dmabuf and syncobj
independently, they don't have to be from the same device (and the
compositor wouldn't be able to verify the opposite anyways). The
compositor will usually import both into the same drm device, but
especially with compositors that render on multiple devices, that's
not necessarily the case either.

If for example we had a system with one internal GPU and one external
GPU, the client renders on the internal GPU and the compositor uses
the external one. Now when the user yanks the USB C cable, afaiu
- the buffers from the client stay valid
- the syncobj stays valid on the client side
- the syncobj becomes invalid on the compositor side

"invalid" there means either
- the acquire point of the client is marked as signaled, before
rendering on the client side is completed
- the acquire point of the client is never signaled. Since the
compositor waits for the acquire point, the Wayland surface is stuck
forever

Afaik the latter is currently the case. The former wouldn't be much
better though, not when it's preventable.

This is admittedly an edge case, but GPU hotunplug is something we try
to support as well as possible in Plasma, and all the edge cases cause
a lot of problems in combination and are a lot of headaches to handle
(or really work around) in the compositor.
Another edge case is when the client asks the compositor to import the
syncobj, which can fail when a hotunplug is in process, and ends up
disconnecting the client for no fault of either client or compositor.

> >>> 3. It removes the need to translate between syncobjs fds and handles.
> >>
> >> That's a pretty big no-go as well. The differentiation between FDs and handles is completely intentional.
> > Could you expand on why it's needed? For compositors, the handle is
> > just an intermediary thing when translating between file descriptors.
>
> Well what we could do is to add an IOCTL to directly attach an syncobj file descriptor to an eventfd.
That would be nice.

- Xaver

