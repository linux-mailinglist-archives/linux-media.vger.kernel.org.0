Return-Path: <linux-media+bounces-33130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFF6AC0D1B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D1F4E58C7
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FAD28C02C;
	Thu, 22 May 2025 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j/4N1Uj1"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427E28C00D;
	Thu, 22 May 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921450; cv=none; b=MZNTgriJjLjnw4EHafobPnxBfogqFKDDgnSvbXdeeE9ZqbSW/B6F5zNWboGM0j0bNkG1lV9TqOEHGUzejQzbiYjBzhdYDR5pj9ZD5EcnHs8f7VmjM5JwZINwd0/ADMrQUqw7y8LOsEU48X4k3Le/T3a8QKEAg6ipWM+4GjhlHB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921450; c=relaxed/simple;
	bh=CBJtGF13Yz/qWtywl3Ovu8vWxRHgqpK9woGtSljKkzM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wbpze9KphDnYWRnGgX7gM78+haOd7j4DXqvDjPlEI/LItZF9xiDyOv9Eg4Rl4gtcd4qO5AK+DejVDhWhRo3VogHp0zVgpp9L7ByDENPD92WzpzbiG2SrfY/n5CYX4U+AawYxh5AMbVZXyx5oo8YANniCy/Mc2asUBFMK/x0rRTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j/4N1Uj1; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b38dq2Y6Dz9tm8;
	Thu, 22 May 2025 15:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747921439; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIJnvIa/3Jg8aseopOpG6NZGewhauVo4xSa65DTl6Lc=;
	b=j/4N1Uj1pxTvp+9++CpwUW7n6iU3QIss/sZ4y2driv53w6ZAboqFy7Yn8LU0pT+8306Tdn
	E8FcvGFLbqVGO+xe8uPHXCWPgJBK+9ubVj4isn/agviHD2QSCfo7O+j9eEfVpsCjZ9kIzk
	Q4xnIWGnQ1Yc2OTtX0fNw5az4sntOkaXBNPDZZMMUmTncb6xkRQBiw6fZN3rSAJ0DVkMy3
	r5moh98TLUsbWuRQCLidncXcRao4r5gcFwkhzfEsHVcGZR0JG43xF0oYFoloXp9kGHwgw6
	H2tuMB4u4+nZC3AQ5yREkvO/QAGbJBmf/bflePZfEH1pJ8EwRdZbW55vYYUK4A==
Message-ID: <3dda25c3108747bf1c7ab2974b2429a26f0762d0.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 22 May 2025 15:43:56 +0200
In-Reply-To: <dcc9f52a-4f46-4f24-bb33-b3af583a1956@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
	 <20250522112540.161411-3-phasta@kernel.org>
	 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
	 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
	 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
	 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
	 <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
	 <dcc9f52a-4f46-4f24-bb33-b3af583a1956@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: c2dc99f67bb1c59b743
X-MBO-RS-META: aew4iha5nipx3gxxwrb9xtkauejjr1xe

On Thu, 2025-05-22 at 15:24 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 15:16, Philipp Stanner wrote:
> > On Thu, 2025-05-22 at 15:09 +0200, Christian K=C3=B6nig wrote:
> > > On 5/22/25 14:59, Danilo Krummrich wrote:
> > > > On Thu, May 22, 2025 at 02:34:33PM +0200, Christian K=C3=B6nig
> > > > wrote:
> > > > > See all the functions inside include/linux/dma-fence.h can be
> > > > > used by everybody. It's basically the public interface of the
> > > > > dma_fence object.
> > > >=20
> > > > As you write below, in certain cases it is valid to call this
> > > > from
> > > > drivers, so
> > > > it's not unreasonable to have it as part of the public API.
> > >=20
> > > The question is from which drivers?
> > >=20
> > > > > So testing if a fence is signaled without calling the
> > > > > callback is
> > > > > only allowed by whoever implemented the fence.
> > > > >=20
> > > > > In other words nouveau can test nouveau fences, i915 can test
> > > > > i915 fences, amdgpu can test amdgpu fences etc... But if you
> > > > > have
> > > > > the wrapper that makes it officially allowed that nouveau
> > > > > starts
> > > > > testing i915 fences and that would be problematic.
> > > >=20
> > > > In general, I like the=C2=A0 __dma_fence_is_signaled() helper,
> > > > because
> > > > this way we
> > > > can document in which cases it is allowed to be used, i.e. the
> > > > ones
> > > > you descibe
> > > > above.
> > > >=20
> > > > test_bit() can be called by anyone and there is no
> > > > documentation
> > > > comment
> > > > explaining that it is only allowed under certain conditions.
> > >=20
> > > That's a rather good argument.
> > >=20
> > > > Having the __dma_fence_is_signaled() helper properly documented
> > > > could get you
> > > > rid of having to explain in which case the test_bit() dance is
> > > > allowed to do
> > > > over and over again. :-)
> > >=20
> > > That's an even better argument.=20
> > >=20
> > > > I also think the name is good, since the '__' prefix already
> > > > implies that there
> > > > are some restrictions on the use of this helper.
> > >=20
> > > I'm still hesitating. Adding something to the API always made it
> > > usable by everybody.
> > >=20
> > > Now suddenly saying we add that to the include/linux/dma-fence.h
> > > header but only certainly code can use it still sounds
> > > questionable
> > > to me.
> >=20
> > If I understand the current code correctly, the documentation state
> > and
> > the question "which driver is allowed to do it?" is the same,
> > because
> > the documentation for the signaled callback doesn't specify that:
> >=20
> >=20
> > 	/**
> > 	 * @signaled:
> > 	 *
> > 	 * Peek whether the fence is signaled, as a fastpath
> > optimization for
> > 	 * e.g. dma_fence_wait() or dma_fence_add_callback(). Note
> > that this
> > 	 * callback does not need to make any guarantees beyond
> > that a fence
> > 	 * once indicates as signalled must always return true
> > from this
> > 	 * callback. This callback may return false even if the
> > fence has
> > 	 * completed already, in this case information hasn't
> > propogated throug
> > 	 * the system yet. See also dma_fence_is_signaled().
> > 	 *
> > 	 * May set &dma_fence.error if returning true.
> > 	 *
> > 	 * This callback is optional.
> > 	 */
> > 	bool (*signaled)(struct dma_fence *fence);
> >=20
> >=20
> > "optional". What if I don't ipmlement it? Who should implement it?
> >=20
> > If the callback is optional, then dma_fence_is_signaled() is the
> > same
> > as __dma_fence_is_signaled().
> >=20
> > IOW, it already needs to be better documented who needs to
> > implement
> > the callback and who doesn't. If we get clarity on that, we also
> > get
> > clarity on who may use __dma_fence_is_signaled().
>=20
> Well there is no need to implement it, but when it is implemented the
> caller *must* call it when polling.

I don't understand. Please elaborate on that a bit more. If there's no
need to implement it, then why can't one have a
__dma_fence_is_signaled(), which is then identical?

>=20
> IIRC the background that we didn't allowed this was that we already
> had the case that users only looked at the signaling bit and then
> where surprised that it never changed.

Why would anyone expect that a fence gets signaled by calling a
function with the name "dma_fence_is_signaled()"? :-)

That was my original point, the name is not intuitive at all.

For example, if a driver doesn't implement that callback but signals
fences in interrupt handlers, and then forgets to (re-)activate the
interrupt, fences will never get signaled and callers to
dma_fence_is_signaled() will never read 'true', which isn't surprising.

Again, the point remains the same: the driver must guarantee that
fences will get signaled. Independently from how consumers of the fence
check it. Consumers could just stop calling dma_fence_is_signaled()
after the point in time T alltogether and then the driver would still
have to signal everything.


P.



>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Christian.
> >=20
>=20


