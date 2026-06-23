Return-Path: <linux-media+bounces-65447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sjLpLldDOmrx4wcAu9opvQ
	(envelope-from <linux-media+bounces-65447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:27:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD776B544B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:27:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="CrlgJ/mF";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65447-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65447-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8AD30789AD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EA03CEB8F;
	Tue, 23 Jun 2026 08:25:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E0E3CCFA8
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 08:25:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203106; cv=none; b=lCdMXGZIKHY8FKTI04cVN5RG/e38nYZ85b0tfoZpWrDdl7E8sbNxjGECheNBK08AlzER1ZkDEaL+ktRKx792WbAoGd84dNOcSfI5i9D1mG9SoXA6OXs8/SFgnYCSS/zYGTQO5A1pvahsQNNtjuzF3i9+5hRr/bXJJisbyhV9lG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203106; c=relaxed/simple;
	bh=ALu77l9JWVXGe1A3hUFppTa6Pdqm7Gq1p7JR3rm89DU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogaz4MT4k50mOOF2jzMX8oR8yISvUGFJam5YL+ccwWHKokDu+/iXuj+E3ZgWzhFAEUQxJ9rn0CO48RyNYZ3lp6JQD+t3Jz92xfGG55v7jWvfzueVwtpleT6cHjSX1SWp0TFY+SizHxwL9HTlaPpF92SCg3Rx/yG084NvTKklv2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrlgJ/mF; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49241a577d8so27002705e9.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782203103; x=1782807903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqWt0bI44jas3c/HR//JGgX6WMjaPFSRIYH+iY3eOF4=;
        b=CrlgJ/mFJMMhclIQfH5UZLv8UMNvdShR3QoAmhwaNitLBJcLRiBlrsUfeZl4+ETK0o
         4hDXPyzbKjpou5rwFUiVCZFpwoJMs5PjTWP0bsAvxy8+eTHkGmAm0AsHRoLfrpD8Nhe1
         Z/D9N6kTHy/R8yvrioyvVEK5thF71O0azIGQv4KyXXF76QYy+QSbqjyMQ4gJpyv+GhGQ
         JhRcUwa1k6vQ0vaycjKHi2N4Q3srUolQD0EmNuOM2LgsPfTfGCU55N4qVbKorv/LrHDX
         W5++kk/lBUw+4g5zhLrkoHyfSHcm/pw9j98V6S0wXeBIoiAjgO1xlFHUzgMMMNdmAGqi
         J3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203103; x=1782807903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqWt0bI44jas3c/HR//JGgX6WMjaPFSRIYH+iY3eOF4=;
        b=loIuhQxcJNs016czTqXE45RfAKGEEhG65cQFjlinY3Ylr6LnQKnshX9iENbwmYow5O
         XgMLjrYdNpxrgEJpjhd4Ec5EShIn9Fg9EaHYkeZcLJnIOnVm0cyFZlkBsCAI5PtSX+0l
         Rer6rTqEBeRd4bu9l36DhF9XvArCUu5Sgi2VTcbOUmPtTqZWtZ1p0ISgHykly92enbSw
         eudjV1U9MYpTnW1WBIHEUbaIFT2Wq7loVpE2xGvJMWfZDpyyvU77/nAqbmHShOKM792B
         +C4uoxGzhNOBPKUVXTfI+ubh5bn14ujfBZ1/cnuEzuQqDCVjwATxvZHKwgojuBLcEfDk
         7XqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/SpfsO1vUDuKz1tOZ37XE9CfsS0zcIXlWGZUAxYRb8K1maxzKWVEDSrVuHlE7oUWCSeF53ZMq7DKXxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHM44cufRBlbSkZ/escKWxyMpoYX3KF1GiCQ8i9uanDLLr36B5
	6+9RAhKF7162gkmydrusom6M2Xg5o7OiIq4MR3XPhadSwoQFymFYzsiM
X-Gm-Gg: AfdE7cncSNu80LZ0c7mXXBp/ohxC751LkSa9uEFMHMZ4OmGFkej/IvoAIKssoo2it2u
	riuxlqPdPspbCO1x1T6OSnRgSQdRGlA6+zb0YsFEw57kcFnEdno7f5ayqJ/KFdSzolYICax/hIe
	dtfTmtwy1nngzX36cDuckApR0/usjbzCtu8KwrZKLP3ncrkon8MS1j2X535La4hZscZXn2we7ou
	2mkj4a0AJTE3XaLYJfm4eOIn2cSoB7a/AbKlliJUyfyqGlkngW2GkjWEYwaJRH7fU39Sx0MjYf1
	RRjDZ17t+A/i1rQRC5+by1COUo+bonMlqvLZpI1rfa2T9Wrl7bjaU0FnA/AiEQJ/V68mN5qZgT9
	fC+b6MoE5KaGNaoDxalitsFH8ExbV5kpKB6G0Bz71NtuR5tUWZibanUbLBX2NsUzq/K64Ikf94f
	TI+agsjQvx+3KMY8wnJeVtI/h9/yWBeKCeAm8mtLI9252wqqDbZA==
X-Received: by 2002:a05:600c:348f:b0:492:4636:87ae with SMTP id 5b1f17b1804b1-492463687d1mr271367215e9.17.1782203103276;
        Tue, 23 Jun 2026 01:25:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923c862sm262149435e9.7.2026.06.23.01.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:25:02 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:25:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Hu <xuehaohu@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen
 <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Alex Williamson
 <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com,
 praan@google.com, kpberry@google.com, sashiko-bot <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Split sgl by largest page-aligned chunk
Message-ID: <20260623092501.17bef195@pumpkin>
In-Reply-To: <CAPd9Lg9+d=Rw4230FdcMFd0VYfyhXhD=eju53iURR8c61iXsWw@mail.gmail.com>
References: <20260621222130.1667453-1-xuehaohu@google.com>
	<20260622091344.794e0d74@pumpkin>
	<CAPd9Lg9+d=Rw4230FdcMFd0VYfyhXhD=eju53iURR8c61iXsWw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65447-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pumpkin:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AD776B544B

On Mon, 22 Jun 2026 17:26:10 -0400
David Hu <xuehaohu@google.com> wrote:

> On Mon, Jun 22, 2026 at 4:13=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> > =20
>=20
> Hi David,
>=20
> Thank you for your review. You raised many good points regarding
> optimizations here. I'll switch to using 2G as the max entry size
> (`SZ_2G` from `linux/sizes.h`), and remove divisions and
> multiplications. I'll also replace the `for()` loop with `while
> (length)`, and drop `min_t()` in favor of `min()` by casting `SZ_2G`
> to `size_t`.

You shouldn't need a cast at all.

	David L.

> I'll send out a v2 with these changes shortly.
>=20
> Thanks,
> David

