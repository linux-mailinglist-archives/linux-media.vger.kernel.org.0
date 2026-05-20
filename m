Return-Path: <linux-media+bounces-62324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOcBJqrcDWqE4QUAu9opvQ
	(envelope-from <linux-media+bounces-62324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:09:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A0591856
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2D433329DE6
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4894A3F39ED;
	Wed, 20 May 2026 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="T419hTEV"
X-Original-To: linux-media@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138403F39C7
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290855; cv=none; b=EsNjY/ASUkQ6JJQm9EyAKg8x+SaLBeLsIBx5J49D+VXrakZLrh4jOij1oNZm0HG+2hU/0jB3fA283desXBt3kOBi9ABSBRmar7pYatrPHHfZOB/ObsLS1wj/YjOH66OrZA+U3HdJIRgR5ZO4sD1A3tg9BdbIvxC47+GxSzqDJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290855; c=relaxed/simple;
	bh=gcOIwOeeWzpvsrYJGYkpmTBiDOCGGGdp9mfugdpA+HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMNNilK1Em/mfwzWoMI1HEvl0Zqj6IE/Nihh7dzUJyOtAgOVq6yj7DXZtwAlWWQdfVP0NDXTLOMfb2w3tx+OW+TTEFXCGxYQdRvWGo3wme7TqYCW3EEE4D4uSHuQvEv9upVy+3BkdgzytcvbAawxMm3h8XEZRWfw5oUFnpRg63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=T419hTEV; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(Authenticated sender: zamundaaa)
	by letterbox.kde.org (Postfix) with ESMTPSA id B044432BAF8
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:27:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1779290852; bh=gcOIwOeeWzpvsrYJGYkpmTBiDOCGGGdp9mfugdpA+HY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T419hTEVZCJohJJRY3tDRT94FAIrYPv48owA0ZwRJgpDxJ1GkS5YE5qsTj7HlWxqG
	 3V0OQc9p8tVe1bzlkJw3wH9CgwBa4Tq6Qt2swVgcATaH/NH/QqycIMymlsurhx5jJp
	 xoG7LB7vXJ2K1lJ6Rkao4L9H+YB3Mn93NyiK+FCSPeWNK8iY/Z1JHqT3ZpAHZcXfaK
	 qRrsxp2MMtDMY+IW84d/Pr+INHZmye7hTxOVzdVNAtQRhU01gdhn40M1qUTchoyBzi
	 mlCfRZVWAkqKhESz66+ZAA+K/TFRvVH3AtGOREFlYIHVplh2s/Xja6CMu+wBIRuke7
	 /nTJQ/XCRtuog==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65e39d1dd38so4484884d50.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8eRBVKSYkg2IuWyZpfzahR49D8ivd98oTbT4H9kKAKiD22K5A0tMy2Xb1AlfBfkkhM5NGuYkfGHC+9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5X3GeIdIOT8nNJHd/CLWItYh98xRFYAxrIzvJdRPxCQ0ofgPg
	fb8c0GOmXeMr5kL8930GKYJraUy3LYbslYXw9LdkltT7QGwlzlGY7g7TFTYu/RTcxuWRV5PtDTy
	wf4PbiLvtDXMWmi7P0RBYqxlrpHEpj6E=
X-Received: by 2002:a05:690e:151b:b0:65d:8f98:6bb4 with SMTP id
 956f58d0204a3-65e2272ee9bmr21554674d50.29.1779290850965; Wed, 20 May 2026
 08:27:30 -0700 (PDT)
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
 <53edf0b5-e733-4b96-87d7-3307275500c0@amd.com> <CAFZQkGxpPm081Fz8UtDuBA1PKD42+9YDA+cc6fbSpfawXwu9+g@mail.gmail.com>
 <c9fbfdaf-2a58-4423-8dc5-6e29a88f6293@amd.com>
In-Reply-To: <c9fbfdaf-2a58-4423-8dc5-6e29a88f6293@amd.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 20 May 2026 17:27:20 +0200
X-Gmail-Original-Message-ID: <CAFZQkGyK-ZV-2QuC21sbGu2BELbAicN7EqCAY=bo+WsKXcA+Yg@mail.gmail.com>
X-Gm-Features: AVHnY4KO7S743c3zkoDggQQ_Kb7Ge56iO-xUbB5sb3ZY8i7QvLODzDohK8-8SEc
Message-ID: <CAFZQkGyK-ZV-2QuC21sbGu2BELbAicN7EqCAY=bo+WsKXcA+Yg@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62324-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kde.org:dkim]
X-Rspamd-Queue-Id: F35A0591856
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> In general the answer is yes, userspace needs to take care of inserting fences when wait before signal is used and the work can not be submitted to the HW for some reason.
>
> Currently we only have an IOCTL to insert the signaled dummy fence at some timeline sequence, but it should be trivial as well to insert a signaled fence with an error code.
>
> But the compositor needs to be able to handle that case anyway, because it can be that a malicious or just buggy client just never inserts the fence.
>
> So that a device is hot plugged is not different to just a client not inserting the fence in the first place.
A buggy client can always freeze its own surface, it doesn't need
handling beyond cleaning up properly when the client disconnects.
The hotplug case is different, since currently a well-behaved client
can only attempt to signal the point in the syncobj... but the drm
device is gone, so the ioctl will fail and the client's surface is
frozen, even though it did everything right.

So afaict, whatever new ioctl is added for this will need to be
independent of the drm device, or be special cased not to fail when
the device is removed.

> >> One problem is that only syncfile allows for querying such error codes at the moment, we have patches pending to add that to syncobj as well but we lack a compositor with support for that as userspace client.
> > As long as the error case can be detected with an eventfd,
>
> Yeah that's the problem. The eventfd only tells you if the operation is completed (or at least has materialized).
>
> To query the error you would need to ask the underlying syncobj or syncfile directly.
Issuing an additional ioctl after the eventfd fired for this rare case
wouldn't be particularly nice, but also not difficult. If we'd get
that with the eventfd directly, that would be much better though.

> Ah! I think I got the problem now. You basically want to avoid importing the syncobj because when the wrong device goes away you are busted.
Exactly.

> The reason we didn't considered having the IOCTLs on the FD is because if you don't import them and instead keep them around you can run out file descriptors quite quickly.
>
> When you have an use case where you receive an FD from the client and do a one shot conversion to an eventfd that will probably work, but for keeping them in the long run you need some kind of container for the syncobjs, don't you?
Compositors always run with vastly increased fd limits since they have
to handle a lot of fds for dmabufs alone, so keeping the fd around
wouldn't be an issue for us.

> > A device-independent way to create and use syncobj would still be
> > useful to us though, both to simplify the compositor and to improve
> > the software rendering use cases.
>
> Yeah not sure how to cleanly do that. We could have a dummy /dev/dri/rendersync or something like that, but that would be quite a hack.
I think for userspace it would be less of a hack than searching for a
random drm node that can import it. I'd gladly take another solution
as well though, if there is one.

- Xaver

