Return-Path: <linux-media+bounces-11906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F18CF989
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8ECC1C20AAD
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 06:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B27168A9;
	Mon, 27 May 2024 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="vT0OE7BY"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3401863C
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 06:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716792452; cv=pass; b=W9A1CBu1DOYpMZE6AWJqB8dV0qn+xRnEzaw7X+340JT+axEb3J4fTwaXiuIjehBORHzoUsq8F2Xaww1cEYKpm8/oHOISA8qESiRlvOoiqMd1r4E0eNNscTHdt/9m8O7IVgIB2C64Ypycdt5mnBFMYVItp16T+04ApyodoPtUcik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716792452; c=relaxed/simple;
	bh=dGMTp/pXEgiMedHufI21m7M/2KfYPCzjg601MXeJCtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jte9RXoBaoSsaJYHIRlGWLOJSKqAGje6FnxmK2kBJbzC8gbmP/kk2+A92y/j37J4YXIb7qd38QFisLlfk1ww+w4HU0ld2JuuisFWG9W0ShmRyyWENBcHXrZg+nv0/lbfdtXkPwGfPmSyrmAvJjbw6lAZXOYHu01E3wV3E2l4ORg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=vT0OE7BY; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VnmRF2yqHz49Pyq;
	Mon, 27 May 2024 09:47:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716792441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3iP0/YKwu74TUwu/uup1GaPBavE3PurEkqLlDl1KmYI=;
	b=vT0OE7BY96MhvhQ1BlJQy/EZ2qjQVmJ6ELRBL+e701SjPsD3ZWxQ70ABvYU2a8vyG4qDEv
	bwre6id3j6oGzPqFK1nf/NQnlUdQtB/BRM6LYwnnlh4OADDSDFwz71nit/b0+PGLLoW9wo
	U4UiKKC7uDiorboxzHCYaFtUZ0afQu7VajCzla179jecBn/8ZfJqBTeHDHIPBdhNlSDzDb
	9uJgx1xlidJ9gfQNkjlIRq1kkaBuGF5/na5K9DBUTS/wStNyzVmFD4RrvnIHJhU/G4SS+E
	7Kuhj4x7Vy59DLGjLcnFuffCzvr3xyIKahc1J+TqHNjfZTnsmGRe/DkAA8YUSQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716792441; a=rsa-sha256;
	cv=none;
	b=I7q5uOpNcD1Vj9nBqhXMssBZsVh39vN/Mur1JQc8GYFy9eCcaWwBL2Nys+D/3c5DamaDWN
	gSdiAUfi0XBqs+rg6kYleEe66ebYxpihfcCNgurO5qlPw5wC7N/suwwuDldsMddFoZRlGz
	BshoxjkewjWRvtvZ7mKk7VQ1+moZpA9XNSDztCZXBMJg+JHjAFMyBbEjajNnGJI7lHCCSO
	tOEaafkiKixXyz28QWN6C53zygh564TdnLDlHlIgCscXiBd1r2TQuDTeQnlKkyHGySNdjV
	iiNDW0N9NujfAXY7Uk+6dPa00eetjaJt7MFethJRpiGkykCcqfh+I0ZtNRbz5A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716792441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3iP0/YKwu74TUwu/uup1GaPBavE3PurEkqLlDl1KmYI=;
	b=lfzuwT3W0kzaMkRxmoEWTGqaOOiJZiV3elFO1QSphoyNV5ULcO+V6OVUyEZrjKTIFLspiJ
	mW2S+rNtxiBj5nL/2iMnKIbXEsaiFVVDvFSoEwFfQNcjdB1WCviE5gjwRUnLAm2sRGu6rP
	h7P9Hcs6eX6Sgx3NXDnV4Yx1PUeI3soVO2Rdu/kmDdVwkUDqz8no2OjdpBJ7aV5VjUvdzV
	bKG5gglw5SSO5TsRQGVKPh1ZZv6ldhjMrGZPkGBlCWpJxaOHG+f0p2RRtmGnjnStMTR7WR
	J4KXkIlYlROHxPqhcbK+sQIzbXku8fm/MfXvdis+Hy4OhNUncyqPuP2EqzaMSg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 47B7A634C93;
	Mon, 27 May 2024 09:44:26 +0300 (EEST)
Date: Mon, 27 May 2024 06:44:25 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <ZlQryf4bA4CsubPR@valkosipuli.retiisi.eu>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <20240527011911.GD24374@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527011911.GD24374@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, May 27, 2024 at 04:19:11AM +0300, Laurent Pinchart wrote:
> > One API-based solution could be moving the IOCTL interface to MC device
> > node only. This wouldn't be a small change so I'm not proposing doing that
> > now.
> 
> I think we could also use the request API. It is a bit more cumbersome
> to use from a userspace point of view, but this driver is meant to be
> used from libcamera, so we can isolate applications from the extra
> burden.
> 
> We will need to add support for formats in the request API (or rather
> for requests in the format ioctls).
> 
> From a kernel point of view, the helpers used by the codec drivers may
> not be suitable for ISP drivers, but I don't think it would be very
> difficult to implement other helpers is needed, isolating the ISP driver
> from the complexity of the request API.
> 
> This doesn't preclude developing a better userspace API with ioctls on
> the MC device node only at a later point. If the above-mentioned kernel
> helpers are done right, transitioning to a new userspace API will have
> minimal impact on drivers.

This is indeed the third feasible option. I agree. The work on the
framework side might not be that much either.

-- 
Regards,

Sakari Ailus

