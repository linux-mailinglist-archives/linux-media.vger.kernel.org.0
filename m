Return-Path: <linux-media+bounces-33126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA6AC0C86
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6383ADA1A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C03528BA82;
	Thu, 22 May 2025 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ubolpMVR"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147525D1EA;
	Thu, 22 May 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919795; cv=none; b=rhd/Ao0CK6WlA99aXugBpwIVIALHJdPFoE8mvcY8fTDHDl15pARVSgXHdgkk4prHnErnWC7/gwp75h3j5g+QZVvL6ZA4qwkzHAOnJmsFUUAEe7jmzUd81t9hksPpH0MKOBMWz+5R4ldxmkan9Jrd8yVEYHF7brdTlSJE0uTgU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919795; c=relaxed/simple;
	bh=o1q8MF80lAMyrF/FBQByQE6lclFDIVpCW719GKbPmek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RdBz/r2X5T8kHnBglJ5zh0GIi3bn7+EqZ/68VvjPtjxOxu8SMLBIIBQvD1hIRfFi1mrYXPyogbZ7LFd+0nFbzlMKYLsDlr8D2/7njtCQfJB1iASGpbc6sMSN5R9UXYd4gewSszPjQdD74V6+JHkZAAdVlwM41Y0oUC3X+q59tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ubolpMVR; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b38251lNrz9tFZ;
	Thu, 22 May 2025 15:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747919789; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xY0ojqhuGBcKzHDlcpTqdk5F5P4zkhEB59bIyA/OVQ=;
	b=ubolpMVRg9ftBOJo2ByE6Gh0CtGNWIU4Uc0Aux6mIvl+Ze97x5YLo+34A6nlB5rooQNWYi
	JDko441+ZvW+EzSmD24mnxify0M592Iv9mKgemWy3Ka/pCUJys0YcuUJjzZopzPyC6NPoC
	xR5Bv/pfwQVMqsd9f589+MrozWiDiwio5xtwnvuKAxQiNnFvIds+nHCj2PUlNff0ywI+e4
	xX48IjaBDGJimuAdkaeoCQ4uKHfieEWjolVdXKTe/2cogNLO+IaP+IHK3xrv6RXmaKbUe6
	IpdTon4GXxpoyK8nE+zElOZBoLOmvSVAzrOmgyTpy5ezlsZYeReOl8g9yUt/+g==
Message-ID: <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	 <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Thu, 22 May 2025 15:16:25 +0200
In-Reply-To: <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
	 <20250522112540.161411-3-phasta@kernel.org>
	 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
	 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
	 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
	 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 3c2590ebf42a25dd418
X-MBO-RS-META: rtwsdkhdwdcmpueph13z64fnzp4ku9sf

On Thu, 2025-05-22 at 15:09 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 14:59, Danilo Krummrich wrote:
> > On Thu, May 22, 2025 at 02:34:33PM +0200, Christian K=C3=B6nig wrote:
> > > See all the functions inside include/linux/dma-fence.h can be
> > > used by everybody. It's basically the public interface of the
> > > dma_fence object.
> >=20
> > As you write below, in certain cases it is valid to call this from
> > drivers, so
> > it's not unreasonable to have it as part of the public API.
>=20
> The question is from which drivers?
>=20
> > > So testing if a fence is signaled without calling the callback is
> > > only allowed by whoever implemented the fence.
> > >=20
> > > In other words nouveau can test nouveau fences, i915 can test
> > > i915 fences, amdgpu can test amdgpu fences etc... But if you have
> > > the wrapper that makes it officially allowed that nouveau starts
> > > testing i915 fences and that would be problematic.
> >=20
> > In general, I like the=C2=A0 __dma_fence_is_signaled() helper, because
> > this way we
> > can document in which cases it is allowed to be used, i.e. the ones
> > you descibe
> > above.
> >=20
> > test_bit() can be called by anyone and there is no documentation
> > comment
> > explaining that it is only allowed under certain conditions.
>=20
> That's a rather good argument.
>=20
> > Having the __dma_fence_is_signaled() helper properly documented
> > could get you
> > rid of having to explain in which case the test_bit() dance is
> > allowed to do
> > over and over again. :-)
>=20
> That's an even better argument.=20
>=20
> > I also think the name is good, since the '__' prefix already
> > implies that there
> > are some restrictions on the use of this helper.
>=20
> I'm still hesitating. Adding something to the API always made it
> usable by everybody.
>=20
> Now suddenly saying we add that to the include/linux/dma-fence.h
> header but only certainly code can use it still sounds questionable
> to me.

If I understand the current code correctly, the documentation state and
the question "which driver is allowed to do it?" is the same, because
the documentation for the signaled callback doesn't specify that:


	/**
	 * @signaled:
	 *
	 * Peek whether the fence is signaled, as a fastpath optimization for
	 * e.g. dma_fence_wait() or dma_fence_add_callback(). Note that this
	 * callback does not need to make any guarantees beyond that a fence
	 * once indicates as signalled must always return true from this
	 * callback. This callback may return false even if the fence has
	 * completed already, in this case information hasn't propogated throug
	 * the system yet. See also dma_fence_is_signaled().
	 *
	 * May set &dma_fence.error if returning true.
	 *
	 * This callback is optional.
	 */
	bool (*signaled)(struct dma_fence *fence);


"optional". What if I don't ipmlement it? Who should implement it?

If the callback is optional, then dma_fence_is_signaled() is the same
as __dma_fence_is_signaled().

IOW, it already needs to be better documented who needs to implement
the callback and who doesn't. If we get clarity on that, we also get
clarity on who may use __dma_fence_is_signaled().


P.

>=20
> Regards,
> Christian.


