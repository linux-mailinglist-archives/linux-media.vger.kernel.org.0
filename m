Return-Path: <linux-media+bounces-40419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C9B2DD4A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03875189328B
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D2831AF13;
	Wed, 20 Aug 2025 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xEz0H/73"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570E2DCF5B;
	Wed, 20 Aug 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695108; cv=none; b=f4HQC1r8QN11p2plh9zVlFeJeaWAABjHg/av540JgmeWuvdKbY5qcHY6NJVqsU5bbZPRYC/r04VEmlQaiHMLLq6E8lYy+0JkgdKIXOYA7yceqmW0yujRh1qZ1w5lVtzv3op9MkUf7VQbEaLs7rWDGgbEjP4vhYCLCFAZHnCBRdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695108; c=relaxed/simple;
	bh=seQOEZvJO9KjymI84Ci9i0zoKr8TEdkcxikuBeZPQ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXcz11PX67PFc2lWRSvUXjmeGFiTatRW8AEUxCs4upiKYVDDuVrtVoxjBZX3BGbGsd93a/zM4TadMHrXDpOH41g8YxVA0pa0Bpp4TLWH8UeRqXXh4zAVEVdHptwZRgf6v/yQBW0XMOqcaeCDeB8FDpdRH03ubqNTaiNKqfFodPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xEz0H/73; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE06BC4CEEB;
	Wed, 20 Aug 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755695107;
	bh=seQOEZvJO9KjymI84Ci9i0zoKr8TEdkcxikuBeZPQ/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xEz0H/7380yXwEgWBgCJNtI9lfzHeDB3BA4A6yl7kcgeKu0PZZDLtqgZEljeur7n/
	 D/OwBrsBy3StcBlqCvgTEgnDy6Zttp5Pq46PvdJ3gyF7wFcDY7ppx4MveoWduWnxf5
	 X1qC9Ahqk6f7MkKI5MNwstTRPG84hNA3Pu/3FSjg=
Date: Wed, 20 Aug 2025 15:05:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Whitespaces style cleanup in
 gdc.c
Message-ID: <2025082052-antarctic-pluck-8e05@gregkh>
References: <20250820124519.2287171-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820124519.2287171-1-abarnas@google.com>

On Wed, Aug 20, 2025 at 12:45:19PM +0000, Adrian Barnaś wrote:
> NFC: This patch cleans up coding style whitespace issues
> in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c

What does "NFC:" mean?

And take a look at the kernel documentation, it recommends not using
stuff like "This patch", but write it in an imperitive mode:

	Clean up coding style whitespace issues in...

hope this helps,

greg k-h

