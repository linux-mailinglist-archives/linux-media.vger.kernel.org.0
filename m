Return-Path: <linux-media+bounces-27174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60961A48923
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 20:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A31316D6B2
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 19:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC03E26F44E;
	Thu, 27 Feb 2025 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L1YFfwMD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EC270054;
	Thu, 27 Feb 2025 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740685216; cv=none; b=a2bvQgmNamssDxPDc6CM2RgbGYwa4Z+112lbCSNqXZWH3B/PWEQnd4KWR2HDJk/FE5pi1ZaP5BqhsDfLMvrtOMCa03Q81c+882PXyIOL7WWnQnsQKFiYQo4fS1CDnIw7LFDZnUdW2zHL0T//p6HuWvEALN7iudb559Lghw/KNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740685216; c=relaxed/simple;
	bh=NkAwTqksSU4AEzN7KRQ2MeSnIOrOPp2KKDZRrChKYu4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gSJgHlM/iHsGR2rmvReAj68oYZg+BKWYKYvVIPfXAakaOpGwA3MZoM9Ru/bSi70ReMmTElirfxh+aAEmTmNqr1BUrzf3ifAIqYJwqRQLzB71ewV4t9gzkybWFH1HL+F0Pd3bL7WUHR501xjR3KnEfoTxnwohnDoAMNwUcZWoIiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L1YFfwMD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740685212;
	bh=NkAwTqksSU4AEzN7KRQ2MeSnIOrOPp2KKDZRrChKYu4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=L1YFfwMDat/2mPLCqAj3/mY1YakblrZsc/IW/+gaVrJ4FF7e4hybBdd50L4HTgQKI
	 +wwGqt3OvggdFOFARvtz1oB/tIporOks6DYCLhOZmefbhPfKCcN4TlApRK/UsIkJCC
	 yBXJ08NyE0Jhe0OkyNzehXOgyfp0fQlxZLNepiQPbzUEmLJIz4XmjIJ8vh7hQwfGQs
	 uHlmbOl+KtAxrshZYbABjLBZ+Atw6voYxV6dhp6jBhH7gWDwix64tmdRhaL3ZNQw+B
	 nk+sZd3aBCE0ABPVl1wo5camBn7rWm14xKhsKUShzC32284Oni3GvlNqK2o3Qeqicw
	 YeY15ZSc0cjBA==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C54C17E068B;
	Thu, 27 Feb 2025 20:40:08 +0100 (CET)
Message-ID: <3872267b32d1386827635f15eda99d2709b44a96.camel@collabora.com>
Subject: Re: [PATCH v10 3/6] media: platform: synopsys: Add support for HDMI
 input driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Diederik de Haas	
 <didi.debian@cknow.org>, Shreeya Patel <shreeya.patel@collabora.com>, Heiko
 Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil	 <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com,  Sebastian Reichel
 <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 27 Feb 2025 14:40:06 -0500
In-Reply-To: <f0c3a16e-c4a2-4cd9-9afa-a21a975a45c9@collabora.com>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
	 <20250225183058.607047-4-dmitry.osipenko@collabora.com>
	 <D82H4F6J4V4V.2BLHVUVD3BVX9@cknow.org>
	 <f0c3a16e-c4a2-4cd9-9afa-a21a975a45c9@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 27 février 2025 à 08:28 +0300, Dmitry Osipenko a écrit :
> On 2/26/25 18:14, Diederik de Haas wrote:
> > > +config VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID
> > > +	bool "Load default EDID"
> > > +	depends on VIDEO_SYNOPSYS_HDMIRX
> > > +	help
> > > +	  Preload default EDID (Extended Display Identification Data).
> > I see some value in making explicit what you mean by EDID ...
> > 
> > > +	  EDID contains information about the capabilities of the display,
> > > +	  such as supported resolutions, refresh rates, and audio formats.
> > ... I do not think a/this Kconfig needs to explain it.
> > 
> > > +
> > > +	  Enabling this option is recommended for a non-production use-cases.
> > My guess is that it could be useful for development/debugging/CI work
> > which possibly do not have an actual device (monitor) which provides
> > actual EDID data? Is CI work the reason why you (initially) enabled it
> > in the defconfig?
> > But when you have an actual monitor (=production use-case?), you
> > (really) do not want it? Would it be harmless if 'still' enabled?
> 
> Disabling this option is only relevant if you're making a commercial
> product using this driver. It's a quite widespread issue that HDMI
> projectors utilize default EDID that comes from BSP driver they use,
> while a rebrand EDID should be used. Keeping this option enabled is
> harmless, but you don't want to do it in a product.
> 
> For all other use-cases you would want to enable this option, otherwise
> driver won't be usable until you will load EDID from userspace.
> 
> Hans has strong opinion RE this option and wants to have it disabled by
> default.

Hans, can you detail your reasons ? We personally make default config
toward generic Linux distributions. If you don't turn this on, the
driver won't work with any existing userspace (OBS, GStreamer, Web
browsers, etc). While having it disabled, to avoid not having your
brand or specific choices on the first go is clearly the "specialized"
usage and configuration.

> 
> > Thus a more extensive description what this Kconfig item does and why
> > and when I want to enable it or not, seems more useful to me.
> 
> Will update and expand the description with more clarification. Thanks
> for suggestion.
> 

regards,

-- 
Nicolas Dufresne
Principal Engineer at Collabora

