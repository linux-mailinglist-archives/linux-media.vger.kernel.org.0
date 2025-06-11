Return-Path: <linux-media+bounces-34510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E51AD55F4
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 14:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DEE67A8250
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD8728314E;
	Wed, 11 Jun 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Wobpye/t"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6022113635E;
	Wed, 11 Jun 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646245; cv=none; b=P2yLRvxIlLD+hHGfpFHiYFSU6uyPFyl4368NBJpa7oieBu0alsjY+VJs0UpYxYQ+vWOWX5iWe2itM0QjTTLL9O8tIjt1BRpZQVH856YDPwehKuvkV/TqAV4nf6k5xzj4Y38l2mz2k4YFPsgMH2U4y8jVkAJLJLshCV0GuV/7NBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646245; c=relaxed/simple;
	bh=a4Pe6Hrx1bmJT+ddJQdiMkCsR84XUPzU0+wqpELBmE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZYhUGBCK5SG+Gko2oO5b3CIFGfPzBfZI6YuYjbXEQpKLcA6e8KYCVEf704I9wMkc3RpdJImoRLSq/d6wL07hf+5BL0GeMioKqDUGSN8zGFLO5K1yQ8N5xotIVo4JRifZhagdQFnjUM0kMvS1jQXg2dmvCbQFVcQ9/Xky9XPV0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Wobpye/t; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE47941ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749646237; bh=a4Pe6Hrx1bmJT+ddJQdiMkCsR84XUPzU0+wqpELBmE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wobpye/tfQSWG2Ji0OTS32YWOvaq1VmgIsYRUYO4x8ntQ+kTDgq0vaPHrnttixcAV
	 +yhxVyxLsO4XKAQfd+299rOQt+la03SDy9qA1TvmxZ/D7L/2nmpAT/xdw170imnbLl
	 MyB1eMCswaUXq7W6OSg94oP/UikzkV/YOqP0a3nXjNCGiVMc+gBR0m0zpVsBf5srPB
	 eEIkdBHX1a1Iwklq3ZvKL5MxRenFK1Lj+E/sK3QUO0DCZjFK8jqUqmfY+CkkKJaR04
	 awqhKgF1hh/ncaoo0+pTaBusd4iVi83Lc1hmu7h9XfPotU23S3sffLwE/FszJaeU0F
	 i9rojaGKfMgfw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DE47941ECC;
	Wed, 11 Jun 2025 12:50:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>, Bagas
 Sanjaya
 <bagasdotme@gmail.com>, mchehab@kernel.org, ribalda@chromium.org,
 hverkuil@xs4all.nl, hljunggr@cisco.com, dave.jiang@intel.com,
 jgg@ziepe.ca, saeedm@nvidia.com, Jonathan.Cameron@huawei.com,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com, W_Armin@gmx.de,
 mpearson-lenovo@squebb.ca, skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 1/4] docs: Improve grammar in Userspace API/DVB API
In-Reply-To: <5dad612b-495b-4f1c-82ff-e8ed4ef34c07@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <aDAOhl7gKhkcTEjk@archie.me>
 <5dad612b-495b-4f1c-82ff-e8ed4ef34c07@gmail.com>
Date: Wed, 11 Jun 2025 06:50:36 -0600
Message-ID: <87v7p230ir.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com> writes:

> On 5/23/25 08:58, Bagas Sanjaya wrote:
> What is the best way to send an update on this patch, now that patches=20
> 3/4 and 4/4 have been applied, but 1/4 and 2/4 have not been applied?
>
> Do I send v3 for the first two only?

Yes, it has been long enough that you resend the two unapplied patches.
They are media-subsystem patches, so the media folks need to pick them
up.

Thanks,

jon

