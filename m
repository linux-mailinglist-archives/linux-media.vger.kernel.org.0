Return-Path: <linux-media+bounces-62167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGNXG2mLDGo1iwUAu9opvQ
	(envelope-from <linux-media+bounces-62167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:10:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D658202E
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6B031DF89D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E533D2F8E87;
	Tue, 19 May 2026 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="aDPUmUeu"
X-Original-To: linux-media@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01022690EC
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205049; cv=none; b=uxMkJ17l1jFfyZ/oK9prgxHJThAkRkpuH3MJ85BIjTcYI3f8AWdf1YgTHimXaC/035iCdQI/nErW6hN9pQS98J7JYiTriApYbxUg+LRXtyEoPjhRYBY8F7jR1o7lSO2Z8utweAckVpug8ZOYH3FIUtxJCG9pJnJ5WjpaMBYq0gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205049; c=relaxed/simple;
	bh=oT6uiKktMScgUXFbTJP5r3yFWiKp5GOGABsHC9u3r+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKSI/zZZImjapUYm4xuNC6wcICRgFvIwZA+SuUAJ/bz60vjK7on+Y9fSDvEkbDBJbgmeu+UMYR4BHxKKVHdHRY2vHWBRirpgEf5cdqASUTIPQsmIt7N3yqSTxMcs4GuPfnw++7kcdy1oO+gGyYxIZDm6K4kxcMMX0ySxofJHBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=aDPUmUeu; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(Authenticated sender: zamundaaa)
	by letterbox.kde.org (Postfix) with ESMTPSA id 21D2C32B102
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 16:31:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1779204713; bh=oT6uiKktMScgUXFbTJP5r3yFWiKp5GOGABsHC9u3r+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aDPUmUeuxJlqZqy46DQkbghe5oLt/7qJ+U9GC1GMXypZ4yMWs9Fc4jxvYNVfhGdBF
	 GiwjepgbzFtOFe1fGLLFCTve/IeCL90e/o7L6U2kzLlFasvIE7sL3BuotnzQMBiW1L
	 cUsIWE9SouMzKLLH2Mz7X55nD6k5l2ea9nJZ/3Yz5/5TdzbAJi15YigNk9pY+3A2sl
	 +ogiM5tf+SpGRtPtfkREMVLa36lsfwTps1or6J7NydftbNZbbmBsKbKllLY3os9Tn+
	 2rFAgvBSGUwHo1N6IwZ1eK0796dXyEKE96czATup9FCe9DXyesJ9N5Czw87WJMO8Yz
	 jPyos493GO4Kg==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65c7efdb7d8so3893418d50.3
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 08:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+dUQeqzfIG9fhv13zuQqu0LnEmQa+/3qNnDlktx36nvfrV3iXDqS/fPaLALOzqQesd2C43+N3Gpde5aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxenNxKfGGyvoPKN2fKKJ/mcijuPWCl0lxBtbNmc5k9kny7qILN
	EhUwYLi+Yb6Zod6wA8rBx9WjTK5RPHTzddYapuzIWGNEUcecEFXq9uvO0Xf88ekbRMTz2Iz5wF0
	Mx+yr/aMgJXJLWSQRIuIU87L4KsG43UY=
X-Received: by 2002:a53:acce:0:20b0:65d:f5e7:72bc with SMTP id
 956f58d0204a3-65e2276b844mr16430681d50.22.1779204711899; Tue, 19 May 2026
 08:31:51 -0700 (PDT)
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
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com>
In-Reply-To: <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Tue, 19 May 2026 17:31:40 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
X-Gm-Features: AVHnY4InFcbGFBQwqAypjrf9D3aYMpjvgQB5CvHgiLxe84oabRYNffn3PUsURt4
Message-ID: <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62167-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C54D658202E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Di., 19. Mai 2026 um 15:29 Uhr schrieb Christian K=C3=B6nig
<christian.koenig@amd.com>:
> > 1. This series makes the ability to manipulate syncobjs available
> > independently of attached hardware.
> > 2. It makes it available under a consistent path /dev/syncobj.
>
> Exactly that is a big no-go. This has to be under /dev/dri.
FWIW udmabuf is also under /dev directly, but I don't think any
compositor developer would complain about a different path.
What are the rules for that? Could this simply be put in /dev/dri/syncobj?

The part where we get this independent of attached hardware is quite
important for us though, since we can't just ignore explicit sync once
the device we previously imported the syncobj into is disconnected.
Buffers can be from any device or allocated in system memory and
access should be synchronized properly in all cases.

How exactly it's made available isn't all that critical.

> > 3. It removes the need to translate between syncobjs fds and handles.
>
> That's a pretty big no-go as well. The differentiation between FDs and ha=
ndles is completely intentional.
Could you expand on why it's needed? For compositors, the handle is
just an intermediary thing when translating between file descriptors.

FTR for me at least, this part would be merely nice to have, since it
slightly reduces the amount of ioctls a compositor needs to call, but
it's not important.

> >> What about using VGEM for this?
> >
> > If the vgem render node were made available unconditionally under,
>
> Software rendering is a complete corner case, I don't think that this wil=
l be enabled by default.
That simply makes vgem unsuitable for solving the problems we face in
compositors.

- Xaver

