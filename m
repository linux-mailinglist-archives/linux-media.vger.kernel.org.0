Return-Path: <linux-media+bounces-18167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E69758E2
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 18:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D8DDB22C97
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 16:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80E81B1D60;
	Wed, 11 Sep 2024 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aF9/SEtZ"
X-Original-To: linux-media@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406F383B1;
	Wed, 11 Sep 2024 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726073886; cv=none; b=K6EAhrsSYDLDzmYB8ySOiQhkcuZPm46MWYPJ0a/2BKYBhyR3U1Lu2SfkK9ZURHeqgvLj8SY3OO2bkDG0aSDun5npiVFDg8O/C0hiI34ad1xJhbgMgzh5EGvv8HPUvqzF8kbjf5cMoZWRVSpCLBn6nzWanQ43r6G0Dj/NuIwpehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726073886; c=relaxed/simple;
	bh=3BA8CII8ozvN36TheCpKcb00djcu5pWrM/ZNnb/B0BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK+l7xM5T1twLIlz+J/2KApzOvFhgXAgZmxJCozCeFU9ucftoKxSMO+GStN7aCssay2iwnB2IKjBvQVodT44sCCKM6k7W68PpqJ/AD4fHOYx64m7QAqh2Xdb/pyED7LyNKGg1xsBNoqRHZrcAq6zvmJkQH0OPyNlfz7gB/uYhe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aF9/SEtZ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W+/LEUKP/xtU0+T0eqY7BQH8KV8T8pZ4KeigsgrDIe0=; b=aF9/SEtZbC2PG/Or6pQLM1bOVU
	GLwMtrQa/QuDn8ca5V1YXoWiAo3XyGh+DYx2EPquErO/VGpRNIDARLGc7UECApwVz6+or8zu7VPzW
	NafaE5bU00njOZDHbm4TSDs6ZTjyAl1D7smaxafG85rMw043wmGjc6YFWvbHNB8K4BkE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1soQf5-007Eag-UR; Wed, 11 Sep 2024 18:57:47 +0200
Date: Wed, 11 Sep 2024 18:57:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Richard Narron <richard@aaazen.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH hotfix 6.11] minmax: reduce egregious min/max macro
 expansion
Message-ID: <827b2d90-d23f-41c8-8e72-ecd5ca9ee534@lunn.ch>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
 <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
 <3f622e05-9843-4763-9191-c980feb831d2@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f622e05-9843-4763-9191-c980feb831d2@lucifer.local>

> > I think that you can then also replace clamp_t() with clamp()
> 
> The use of clamp_t() is to avoid egregious macro expansion in
> clamp(). After the series improving min/max the clamp() is probably
> equivalent. But in 5.15 it will likely not be. So this is, in line with the
> purpose of this change, I believe necesasry.

Maybe that should be in the commit message?

	Andrew

