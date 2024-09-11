Return-Path: <linux-media+bounces-18169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9F9758F1
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEBC11F269BB
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C561B3B0D;
	Wed, 11 Sep 2024 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="snfVTIMJ"
X-Original-To: linux-media@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606742A94;
	Wed, 11 Sep 2024 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074108; cv=none; b=fNFvZ+Fivt9/fq8ktyNTX6yq+yFNYaMH/svY4IJZQeTFAO0Yn3EKMU47UtU48jX5v46jPqPtpgjq78/v7i7H9YesMQU9LItiXep1mLN2jjiD4vb5ny2A9V3Dwm0o/mWm9E9s2cFpOqhyd7ZhTXo5piNHXxcUgPoTIkndox5mqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074108; c=relaxed/simple;
	bh=RNgLdxn/t27OpBg31frAcAyKQqgU3gJaax1e5m4X/OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jejj+U2awbyl2JD4l6clSRBfkNOVTi8bLdGeq9TDWYOry0D8on9/QZi+JlG468omDujIadtrRd+I/3HcSLfICFWc/LWJh08U29FfFJes00cofdTkjLoR1IxMJgE6iYrWN3/ZEwGwKl42Xqo9ahP63wOhgL6VjlikKBN5mWYR+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=snfVTIMJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zJjl1DTYUBIleSL6J3+UmTBgZ5S/ulWa8bQqD/ny+X8=; b=snfVTIMJyFVsPaiBjhTvb8kMrk
	g2C/e2l1JJCglFLD5y6a2b5qFPQCPLrkDSgPAFUw+5zen0Pxe6tNnrsT5jCceQS7tITwuC0Kv8ruN
	228XiVxGiuCKQiLha+gFPa/DDP3Hnis2ot1drqdcPCrbENH2E2x3O3ZBBEZm0oF+jbmA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1soQic-007EcV-QP; Wed, 11 Sep 2024 19:01:26 +0200
Date: Wed, 11 Sep 2024 19:01:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Richard Narron <richard@aaazen.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <7c1e025d-ee56-4cb5-826a-877d29a31739@lunn.ch>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>

>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  2 +-

For this part only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

