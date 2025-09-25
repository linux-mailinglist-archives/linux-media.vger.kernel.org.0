Return-Path: <linux-media+bounces-43174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB62B9FACA
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FD71C2363B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 13:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1152128688E;
	Thu, 25 Sep 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5Plug5K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935821C9EA;
	Thu, 25 Sep 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808406; cv=none; b=RRqZJrcAN3ddjJ5EpQzZgNyrvRjFZWzlp/9Izj4upFNqmbvyh0socX2Dosc+QFO4qwH7U83JpoDwxfiT1CJoHXMfDQksDk3CPMH39YBBMKDGZozhKuUqNxs1JnEnyGnusDMeL0A6hCRdyh7gTkyfv31brPic6n9Ch1R3OGdW+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808406; c=relaxed/simple;
	bh=3Fpb6XuuqQ4tMU4I4bBktsh7QB2mNAlQIyyGYi1/dBI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jss5czph4Y3ksmEO//7kj68Mr3aeUIzT0dQCSWJlfzrrWo0xueP5qRt4TvCLx9oafQ9JCkynTudm0LTTMNRFEpH80W+SjT1YD8IaAp7/LoZ4MgpOhH1k5dATMeC2QNCdNrG1Y9yRyctVq9XZS902cXPBvULAOSRLpp2M3OXocbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5Plug5K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758808405; x=1790344405;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=3Fpb6XuuqQ4tMU4I4bBktsh7QB2mNAlQIyyGYi1/dBI=;
  b=R5Plug5Kknz77ZcC7comZpgJiNGaSQAdhLfCGxAa6ZByePxF+68NOZdj
   heqPT/OnfYG5nAWn8quIEs0GuDHFhRsoYT0s2KDxC7m3XTXxudwCVk/Bm
   G/2xwWeilbWhYAiC0PE1gIgmCCse4HNXDcDri/s/0gUAEiFcGjZpBhole
   epZLRdxWdF88RFONDDAp9PPCq+p0ZaWRqTWe08uhabyupS0k7YV1yVN5c
   gXOlbiuUGdTXN1XCpvQkewZTMqhaE9vPYiGfxcBImFRfL6H8sT8eND+G9
   m+UnT6Dl9TStX7L/Bk2HqUqoxm7eA+OowHK0AsKbSEb9pUK6+wisXAv5M
   g==;
X-CSE-ConnectionGUID: uwkl/IkTRBWiypZvvVSmHw==
X-CSE-MsgGUID: mIzlA4LSQGq16ANuedSr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72483961"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="72483961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 06:53:24 -0700
X-CSE-ConnectionGUID: S83XiSvdTkuU5U9a9mz0ag==
X-CSE-MsgGUID: k+N4f4txRSG/qaHV5GcjmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="176914592"
Received: from dev-409.igk.intel.com (HELO localhost) ([10.211.128.26])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 06:53:21 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ammcxcfamq6f6ip35ccre4an7tcnksksifrjy2alq3eh3eqgai@hvsmgmw5i35n>
References: <20250924124852.11-1-alsp705@gmail.com> <ammcxcfamq6f6ip35ccre4an7tcnksksifrjy2alq3eh3eqgai@hvsmgmw5i35n>
Subject: Re: [PATCH] gpu: i915: fix error return in mmap_offset_attach()
From: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,  intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, lvc-project@linuxtesting.org, Krzysztof Karas <krzysztof.karas@intel.com>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Date: Thu, 25 Sep 2025 15:51:42 +0200
Message-ID: <175880830233.2803386.1327911402611756316@DEV-409>
User-Agent: alot/0.10

Quoting Andi Shyti (2025-09-24 22:20:33)
> >       mmo =3D insert_mmo(obj, mmo);
> >       GEM_BUG_ON(lookup_mmo(obj, mmap_type) !=3D mmo);
> >  out:
> > -     if (file)
> > -             drm_vma_node_allow_once(&mmo->vma_node, file);
> > +     if (file) {
> > +             err =3D drm_vma_node_allow_once(&mmo->vma_node, file);
> > +             if (err)
> > +                     goto err;

You cannot jump to err here, as that will try to free(mmo) which either
was not allocated by the caller, or ownership has already been
transferred to the mmo tree. It is sufficient to just return the err.
-Chris

