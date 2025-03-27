Return-Path: <linux-media+bounces-28820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA15A72AFB
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 09:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17A818916DB
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600941FFC46;
	Thu, 27 Mar 2025 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShlgxuNB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09483A1BA;
	Thu, 27 Mar 2025 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062686; cv=none; b=HiTYEYVwALJKzPDNohaN+pulVygsRnN/yHqNTQutO4YRpTaQNGp8aFTO6ipLc8AI5QTACf3pL+7r35rctAh0DFyiks0WXJFmbLY/jk81YnlUs+Os+UP+pAaD8TWSyLD64g/XCYbGMMOQeqF7MvH2APoSejcfgNVUGyCj+VxM0l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062686; c=relaxed/simple;
	bh=Nd3JhLAW8m9vlheZ9He/JNyCremw9y50OzQYsF+gcEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM5B60uDsJV3eSkxDwT5AQ9IbZfmS9UZzlsG6/5wZ4AT+1pUmeI2UljyolfGkByST4V+Nywx/ISJ/yMYVwRlCmii+bkPBAnPuIxW/WGCRAM/NQZd+RZdEJR8M0w5IaTaTJj4x0nCyniDRhUi+X+VhE683b3U7TudLHPajaGnRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShlgxuNB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607A1C4CEDD;
	Thu, 27 Mar 2025 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743062686;
	bh=Nd3JhLAW8m9vlheZ9He/JNyCremw9y50OzQYsF+gcEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShlgxuNB7w03gaJnOCSfGwVY/pbn3j9fi5fXZiHVV7GSeFMjDJw6jHqQQYtpOYSvl
	 d/SuzLSuxXkobozm9isdTklVGNNVyXPETBy8eobow3gPGPtYkv17POKIEMmIEpoqGO
	 lMJzOyWQTGcMeSo/cCT/cNeaBnmkGPhmFWBroEbXxJWPUDtYclQnciXbq0q8wFWd5u
	 GYNotwh+a2cBtTo1LjxzgjEWMU/TOY8GSXg3H3uCXz78KfCjEnFRrGCRBWwAqc8OCy
	 iKV5YlybLyxlUF2AnXQVj1AsXjXfWupy0LvbDmrA4MkQKHKcUmSPinj3O5aP9kfC1S
	 wS/qbHQ5zLuqg==
Date: Thu, 27 Mar 2025 09:04:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Niklas Cassel <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Dmitry Perchanov <dmitry.perchanov@intel.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v4 5/6] media: dt-bindings: rockchip: Document RK3588
 Video Decoder bindings
Message-ID: <20250327-kickass-pumpkin-bear-1dacbd@krzk-bin>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
 <20250325213303.826925-6-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325213303.826925-6-detlev.casanova@collabora.com>

On Tue, Mar 25, 2025 at 05:22:21PM -0400, Detlev Casanova wrote:
> Document the Rockchip RK3588 Video Decoder bindings.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/media/rockchip,vdec.yaml         | 73 ++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


