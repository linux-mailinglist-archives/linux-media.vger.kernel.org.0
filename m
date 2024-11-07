Return-Path: <linux-media+bounces-21077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E39C0BF9
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 17:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 510211F22722
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 16:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A085216E08;
	Thu,  7 Nov 2024 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gXGx+7RO"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C4216A20;
	Thu,  7 Nov 2024 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730998225; cv=none; b=bL2VXOtHHO053asl+ZfksUboCC//5je09p6LPxHs1ylFJCNmC6yjlc1LEk+NWq6GL3aRuhQHsHhfHDBV98QGsA0cDKmqTYP0YWhKl2oUi0lyGaxoyjvuoe0/2rD9fT4t3AEKKvMirlmbAOklour6AwoCXqFTQrjWQe9ZmBJx8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730998225; c=relaxed/simple;
	bh=rNoa7mRnZwJ/KTYmtyEmTizUmSewi0zvkmHKYsN3uZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zgnw1SaWyo9lf+SfRIFPQatUobelTkl+ZWFcIy3PW/ioeTOAD15JyYPK6d1C7XJ9W/8GIHCMMfcaMYSvP+ITrwSnID9S5hjIv9zSvbWAu3Pfdzsaq3rxskAY6ShlXyn+lZ5McKsD+p4vllsO7ibhJSALbUwyi5hfbzD2xNxTvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gXGx+7RO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7F1842C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1730997903; bh=OF2OmjsYyh2AJqblU+JyZH89+Sa1MgWYtrIS8n5K7Ws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gXGx+7RO6HDb3juKi+lieA6V3k5D5CQCRJtDFFlC/Auyj7ecgvC75gsk2GbQMWnR9
	 tAiFGOKBhLUo8H4SNKnKGTbCJjpDl7YORhXHowmUcanCWekbkJ0JyjUclO6JTrM/D6
	 r0R3NkL8Bb3BtyXzfcJp5n565K/otB5fuTOQIfy7z2k8ob946Na6e1BnN2OSqW8dxf
	 Qw9WaoMAf/eUr1m3eSdzgZvZplMulQ/xEIqWrXele+12cK2s64xn1U8rBCQDB2MAmi
	 ZdqDwYCKsK3hP2M5vMO85DwVLIZRARDIbaVbeYvvb+BM4M6nU5+Gz7GSZkSjDmtRtv
	 r7E+9CS1cCZ6Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A7F1842C18;
	Thu,  7 Nov 2024 16:45:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com, Sebastian
 Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH 0/2] Documentation: Debugging guide
In-Reply-To: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
Date: Thu, 07 Nov 2024 09:45:02 -0700
Message-ID: <87ttcj0z8x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> The series contains:
> - a general debugging guide split into debugging for driver developers and
> debugging from userspace
> - a new summary page for all media related documentation. This is inspired by
> other subsystems, which first of all allows a user to find the subsystem
> under the subsystems page and secondly eases general navigation through the
> documentation that is sprinkled onto multiple places.
> - a guide on how to debug code in the media subsystem, which points to the
> parts of the general documentation and adds own routines.

So I am just getting into looking at this; the fact that I had a hard
time applying the series has not helped...

> base-commit: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5

That is ... 6.9?  Why are you basing your patches on such an ancient
kernel?  If you want me to apply them for 6.12 (not guaranteed in any
case, it's getting late) you'll need to bring them forward to current
docs-next.

Thanks,

jon

