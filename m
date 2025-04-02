Return-Path: <linux-media+bounces-29194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A13A7889B
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7209418918EB
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 07:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0C320ADF8;
	Wed,  2 Apr 2025 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRXeaYZk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E220CCE8;
	Wed,  2 Apr 2025 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577709; cv=none; b=lZhoc4YC6DGwvLC63ULmZVu5gaAuIMBn/me9h+OD0SINFwp48KHgypMWeDG9EO1NNGep79ZrKCNA7VfplKs8WvEwHaUsAKY9I69Czh7ot3nPvRioWOyrsIN4OzsWaJvDS6JUajEfiKVypiym1Pu0YJszNxfaYBK3rN8bR85z8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577709; c=relaxed/simple;
	bh=V0fOz0lqv2C+VmGCRklE/5cDBz+lCE6+y+wyDB6Z5gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEWpVXxCVmyAkZVl9qJ0uWyCfrgXMgkATuG+gnBerHObeByQ4AHzoi00k9wWN9f5SPF6jwO2RjxZra2ghoN9T4LBm06NvdMClzFBPx6R1ypXhPupU91v+jpWdMHl3mOZyYqSZHZYVonDQgX/hFcOjY2KjVmKJiS+rTS6iDgCDIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRXeaYZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C052C4CEDD;
	Wed,  2 Apr 2025 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577708;
	bh=V0fOz0lqv2C+VmGCRklE/5cDBz+lCE6+y+wyDB6Z5gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRXeaYZkNROVdV6DDVqeivBdTPrM9rHSKD+Rk+DSRXqZEWcKJobQIU8uR/5xL0NB1
	 WTyZoBTdexi9vMrATvf0DvlSYqmxb8J9hun+kCIrZSgzWYSI6irN13LelNKXLXASyY
	 Qmmgu5Lksd4tOXJEaktSfYZrC2TEDoXYFYazMC59NKCf4CySihoTrGoJ80lGNJMYl0
	 6HfFCBGx8ayBlwjSXXabb+KzDVnXJX5XcMH/1lyOU7EZYvRhAzr6m4H0/Evhfombm+
	 b9nuBvpfkDUinDyvpLnKMCwY6n5FlNvKqHIxbsvJDAA9ogg9fpzc3R5ZXVlVgT7g2W
	 6Ip047SRD3oTA==
Date: Wed, 2 Apr 2025 09:08:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
Message-ID: <20250402-glorious-olive-seahorse-eb505a@krzk-bin>
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>

On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
> Also update MAINTAINERS file accordingly.

Since there will be one more version:

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


