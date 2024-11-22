Return-Path: <linux-media+bounces-21828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CE9D5D76
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62EB41F21A55
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE0A1DD886;
	Fri, 22 Nov 2024 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Uv8mOMYe";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="RF4ER7WZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEF1CC8AA
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732272341; cv=pass; b=BppNXXtj7zBrslQPYpYR4BWnuZbiG8PtU7Enl70Er8M3le09va7ezl07ETI8BZ+xjuqxawz6ysAhHQUgdllciBEb0i9JOryATtjP7ScwrFn5P8Cdt5v4xcq7VG+WBmxVDO/rc8ELCP05rXTzjDWnTvYI7Ro+vFGUqkrkd3xa4bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732272341; c=relaxed/simple;
	bh=f54Oiq1QH0K4oCG7mPiY5qRvSpt8NYVW+0w0jB7wOHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4b8UBt7TDpg9JvwK+cz33JZzLwpo9Z1vWk5jnxk/tI1g0I02l1hEjykWTQD6J1iTzAEFs1CGwkqWNgXDBjBBcFKdjuCw6Gcx3gXFbZZI/VSqebRxXKBrW2ivWTYk1iwivaC3GcCZBHzdBDyjVvcqaramXvXoka9cKQcdvzmVe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Uv8mOMYe; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=RF4ER7WZ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4XvsFP5qpMz49Q4q
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 12:45:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1732272329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x189macaAUU8KJ/Oi8RoGp+J4rdstz3CX5gB3Y/4n6I=;
	b=Uv8mOMYehi/Q7kLPUH3WIEpHa8LBj4kLaDb7dOtikJmuVrqhru0GJJtMWCMch6gnBtkL7h
	NkjrGdRxKUVwbR4NRPLpOZbadF6WG1dTBe7zd6dI2Yk0pHEsXAiuzioXMj4E0aepXV+iKM
	g6SSyI/IgvGXPc/AXyEBTBLjuGWkuNk+eqWGg+ll1Q1Oj8u3hTZrD3KwIucozGaz51UW2G
	+Y5zF3m/J6zDhYwj2l6garHYzBDMflDwSIUlZVIxhrePPeKokTy2pu3V4vnjns6RWm0mBJ
	tCuOmounr1ruxy8mZbIGM+TLQnt/WWu4quurPwGldBzn8LrSFvbctGr/or9aGg==
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XvsFD0lrBzyNf;
	Fri, 22 Nov 2024 12:45:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1732272321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x189macaAUU8KJ/Oi8RoGp+J4rdstz3CX5gB3Y/4n6I=;
	b=RF4ER7WZS4BRj/77crMNgfvUPO66o1EqwxRfUd9kgMJKYimKMCq5EvBZ4KodIkL/Aawrj1
	UJgxJVDI695pADuMY8o14Z7GXrJM/B+PLXMoPtHB9ju0AYjovv4wHq99TA/PVWBytuGZZ2
	X2Eyv4XandGI09kzv++CUHb4hX8dAu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1732272321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x189macaAUU8KJ/Oi8RoGp+J4rdstz3CX5gB3Y/4n6I=;
	b=qClgtfulYOvgZe/kt4YUJXwTycyvP6Z6vX5IzgpKZWNv+optB7+Kla42xsTjd1/ynJAsmk
	tVKTRtQoAVUtmnyOR110zKFTPv6V6VtOm+M4fLHz6UWeS0qRrWERuzaqkOod4BbdPwa+OY
	gw9SNdItkE2cjhg7IwRseaEfBHlLbTI=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1732272321; a=rsa-sha256; cv=none;
	b=GuVMYlGuqUJkVe3NwgUTuPYO8r7pF4TeKue69DwaeT4GTvGaFC93ELOO6AiXwxIfR36YOP
	DAlMGE+YMHnYWmjOYXCYi9a0ngYkmLcWcjBPLyNudLphQAEqeyIcJP7r8KgtRX5Mm36nC1
	QGnHHmxIX66WptfSXk/+Ybf8QRyB8A0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7C425634C93;
	Fri, 22 Nov 2024 12:45:17 +0200 (EET)
Date: Fri, 22 Nov 2024 10:45:17 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 0/8] Sub-device configuration models
Message-ID: <Z0BgvYqvA3zEddXN@valkosipuli.retiisi.eu>
References: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122100633.8971-1-sakari.ailus@linux.intel.com>

Hi folks,

On Fri, Nov 22, 2024 at 12:06:25PM +0200, Sakari Ailus wrote:
> The compiled documentation can be found here
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/output/userspace-api/media/v4l/dev-subdev.html#media-subdev-config-model-common-raw-sensor>.

The patches depend on the metadata patches that haven't been merged yet.
All of them can be found in
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

-- 
Sakari Ailus

