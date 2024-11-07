Return-Path: <linux-media+bounces-21066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE019C088A
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D3471F21A82
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF1C21265F;
	Thu,  7 Nov 2024 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="MU6whsNF"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D720EA46
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730988596; cv=pass; b=VG649aDnGFk32ziFo7bmnmstXwnvxRZen6WhAsUMo6zqThGwfYwLepJvqQXjDweQKPA94DBlBdbYJVRIMZRh+65E3FDPYoPEYZVTVF6/rlZaTfUB6EOh3ALho+TSViL0WFuE9QTX7XMMgAkRwBCmM21Y+PT59ihe87S30MZZbj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730988596; c=relaxed/simple;
	bh=StUUItPsqDWcO3S6EhCVh92cDHlBPJtnTamhtxFqUp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+6nzT6rXIxUmEirZ+LTg14S/MvkwGKJqV/EURWF7EmyGVrYrwitHrrsQdLiyY6y7uYysQ5Qz3+yuZrDLBErpHyoD3ENqIKqVgmx0eSxnK4Fqtno8+aRyqd5/l1N8z0cJQob9boNQSB11ThQJYzuX9cjEYzqEJyFZaw1jnFO1YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=MU6whsNF; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1730988592; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XPYVPyYfYY8jQX2Ivxs+yHXaaBiugv3pKPetx/2I71o9Odx+kPI3iJ/8ocGDIa/LUFfrVE6A929LO9Yej0ftyWO0yc4u+6JzrnGj/oPaswCDYkmf4KzxgHXsIqJxep9UdmPe9jftCZFt2FfDwm8h/QHCcaid5wPMYHBwa4IhTUM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730988592; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hZ8509EbTtGdyp5AwsuFHWLDg7Ar7fcUR7qU4pa/D6c=; 
	b=Z2jVrD2rYSWyyIReBKK0+urdKIHYoFcaSy7POR3cBqQS6sUnO3kRTl+X8YCTi2rOI+082TiCE33mNyhpy7UsNIuGjAlttrUraixyJWOyvNMbsP8yqDQYGIQ3AzxtIGofDY5dVHP/0XMjLyfhgE5ICJkfcaaGSwCBy/X4e6djLG4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730988592;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=hZ8509EbTtGdyp5AwsuFHWLDg7Ar7fcUR7qU4pa/D6c=;
	b=MU6whsNFlOl0GyjOTD+8Cal7KtpVB9xoA0sT7Ya9vei6ODMCl7g+7ZsPJagozcHR
	xOvM6VU4OWbPGbcJwSq6U+vYB7kgu0C1Wff1DYfrW8o/0kiBUNfPYltTh/ItY9Gw6eV
	OAexPuYCwZgggvib/hI3cOdjJVtiwG5t0zIZLLQs=
Received: by mx.zohomail.com with SMTPS id 1730988591093662.5321486477994;
	Thu, 7 Nov 2024 06:09:51 -0800 (PST)
Date: Thu, 7 Nov 2024 15:09:48 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Cc: corbet@lwn.net
Subject: Re: [0/2] Documentation: Debugging guide
Message-ID: <20241107140948.2ecmna664cvadmg4@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <672cc8a7.050a0220.3428f.0587@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <672cc8a7.050a0220.3428f.0587@mx.google.com>
X-ZohoMailClient: External

Hello,

CC: Jonathan

On 07.11.2024 06:03, Patchwork Integration wrote:
>Dear Sebastian Fricke:
>
>Thanks for your patches! Unfortunately media-ci has not been able to
>test them.
>
>Make sure that the whole series <20241028-media_docs_improve_v3-v1-1-2b1b4=
86c223e@collabora.com> is
>available at lore. And that it can be cherry-picked on top the "next"
>branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git=
".

Woops, I have mine on the media master, but thinking about it I never
actually asked which branch my work should be on for the Documentation
subsystem.

Regards,
Sebastian

>
>Error message:
>Running in OFFLINE mode
>Analyzing 3 messages in the thread
>Checking attestation on all messages, may take a moment...
>---
>  [PATCH 1/2] docs: Add guides section for debugging
>    + Link: https://lore.kernel.org/r/20241028-media_docs_improve_v3-v1-1-=
2b1b486c223e@collabora.com
>  [PATCH 2/2] docs: media: Debugging guide for the media subsystem
>    + Link: https://lore.kernel.org/r/20241028-media_docs_improve_v3-v1-2-=
2b1b486c223e@collabora.com
>  ---
>  =1B[31m=E2=9C=97=1B[0m No key: ed25519/sebastian.fricke@collabora.com
>---
>Total patches: 2
>---
> Base: using specified base-commit 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
>Applying: docs: Add guides section for debugging
>Patch failed at 0001 docs: Add guides section for debugging
>When you have resolved this problem, run "git am --continue".
>If you prefer to skip this patch, run "git am --skip" instead.
>To restore the original branch and stop patching, run "git am --abort".
>error: patch failed: Documentation/index.rst:57
>error: Documentation/index.rst: patch does not apply
>hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
>
>
>Best regards, and Happy Hacking!
>Media CI robot out on behalf of the linux-media community.
>
>---
>Check the latest rules for contributing your patches at:
>https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
>If you believe that the CI is wrong, kindly open an issue at
>https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
>to this message.
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

