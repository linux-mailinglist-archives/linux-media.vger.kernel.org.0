Return-Path: <linux-media+bounces-41135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D541CB37E4F
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 933197A2234
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B24E338F3D;
	Wed, 27 Aug 2025 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5W+BC3u"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACFC31CA42
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285533; cv=none; b=i4ybgeiQz496lpWIi7odqGKmsOfMYUCBlSH4ZTJ7pJ5j2TB96Rubidm/8FQV74AFX1ChSjHAzEcvrK/DXLQ4NfFeD5/fLaPb76VJP/wA0mQbzGc1mA4W9es/+k7YbuqmEJxTDUM4HHHE8LQdTG8x0swsa3hhM7FIHtgbi5RBlcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285533; c=relaxed/simple;
	bh=YgCa6Yb+IJhTRcvtPBQyLHIzSkVOEm93eRC4ehyC/Is=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4P3DBoruoIY8tz7T13rkQE/GQV3onb7jZeWtrjNnjYYyMEgxrGvFLtSuwh6QntNhgXhM47VssROrMgkWpbH3nkN53UKgjaSaaZvY9zvm9umk+yqV0SVUt+WuncHeS9s/zJ0GECkHWGLEKXtW6TExu/EeUccoArwttjhap8tDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5W+BC3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2BAC4CEEB;
	Wed, 27 Aug 2025 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756285532;
	bh=YgCa6Yb+IJhTRcvtPBQyLHIzSkVOEm93eRC4ehyC/Is=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c5W+BC3uSv05CfjdZnonrZyS95CYBv0EfHC687wWZPP6rsmhisP6Zu0MXg2LqtQmk
	 ZmAn4hkkKNHk5fqO5e49bOcWvLOvL0zIk49g66MHAVIxAbu8YaU9RoG0gZsfHNfxWC
	 RSYBxpl9AJbkNd7nbbTbwgK2u5989+8jwpNFyz2SG/i915MrAbcumJA8jCxRP8S9/P
	 3RXvoZZ7qwKCObscKoA8DUZekTr0vuTNNQ2MDPVYC0jtoLc1OIKmmkJOTdpqbTLuhF
	 cIgpDSU+cXPIykftBGsqlPgRShELztLYMsjBqyJ6RQebPgeDF0ZA4r2P0HsrmfvWvM
	 UE81wTbmRYcFg==
Date: Wed, 27 Aug 2025 11:05:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [GIT FIXE FOR 6.17] Drop redundant pm_runtime_mark_last_busy()
 and lt6911uxe fix
Message-ID: <20250827110528.11f21dfb@foz.lan>
In-Reply-To: <aJxVF0MpevVhsH0H@valkosipuli.retiisi.eu>
References: <aJxVF0MpevVhsH0H@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 13 Aug 2025 09:04:23 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Hans, Mauro,
> 
> Here are the patches to drop the redundant pm_runtime_mark_last_busy()
> calls in drivers and an lt6911uxe fix that should also be merged to 6.16.

Please fix your description. The above is not clear and doesn't tell
the hole history.

In this specific case, I would expect the description to be
similar to this one:


	Hi Hans, Mauro,

	Please pull for:

	  - drop the redundant pm_runtime_mark_last_busy() on rkvdec driver;
	  - fix an error handling in probe at rkvdec driver;
	  - fix an issue affecting lt6911uxe/lt6911uxc related to CSI-2
	    GPIO pins at int3472.

	The fix for lt6911uxe/lt6911uxc is against drivers/platform/x86/intel,
	and contains an A-B from one of X86 PLATFORM DRIVERS maintainers.

We need to have those at the merge requests as well, as we're using them
to generate PR summaries.

Regards,
Mauro

