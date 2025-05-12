Return-Path: <linux-media+bounces-32300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A0AB3519
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 12:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2865D16ADFA
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047B426773F;
	Mon, 12 May 2025 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIVEnHDg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65C25B674;
	Mon, 12 May 2025 10:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046580; cv=none; b=eUmFBBs2zl+IoyscyUqAeq9G6CPaC5eywsIUqiD/IH8pT4hbz+KysRFUuObEfDVuivdNSCQWf4mHXtmKUu08ckcd28BsR6AABB7MmKjQZ8bdlE9STO01qtN4/jkahGQ/7fUqFamdZBfzX7ovpr+gHcNbYnfMOsr2lZWaBNyf3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046580; c=relaxed/simple;
	bh=6x1QLi7LcIsqD3IL8qJqmDDVfdxhcPb5ez1PwvD2gPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsVbBnOJbkftma0aC6K8MvflaSL44yM2ppoyymEMvgzhQAjX9FjRyeCqhv/yYu5isE+38NIpQoZW2c6myaS18EhdVPbn9NC3A1bnsWbHpn1/ORaJRmyiHLrMFxEWfeh/6UNE5tDBIhRY0tL/z2MaMls1moytA6smZ6rNH6+eFHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIVEnHDg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECF8C4CEE7;
	Mon, 12 May 2025 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046580;
	bh=6x1QLi7LcIsqD3IL8qJqmDDVfdxhcPb5ez1PwvD2gPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIVEnHDgmreN03M4pVM94GM8M6XPKPEjCVjYIWFe12NeiDynEGP2x78sn6Q6FBYiJ
	 f337hafcKQy9A0gTNaSjGN7pew+e3YOr9NXA6mBVxPfroE4f20DnNvPWqFsaNJFjbI
	 zNAGMtgF0+biOs5OrNsYgzR+OdSY6Nx6k2z0pDBfmXl+Nil03X0xNbw68Mo5y9nBf+
	 pGkWjZ5OG7sj3AKBwRdNEucgmFfPh2wa+FPfg1vcDbUwjF+gWkGiWaAigw5lqC0KuM
	 sNl2x2E8PSvYYULuPiZcgzB0w+PpAZUjWfm9u/SmaIKxGfwVEZUqq2RUgrCKgW+OP9
	 kceRFI8b3QJcw==
Date: Mon, 12 May 2025 12:42:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Junhao Xie <bigfoot@classfun.cn>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3 IP
Message-ID: <20250512-fabulous-provocative-raven-ec3a81@kuoka>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
 <595adbaa-15b4-4917-b3ad-9bac3e2333e2@kernel.org>
 <knnumpmyq4ewvqcfor3vqynxbplynajdlmz3p6f2ywadvmz6wo@5uz53eubbkfg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <knnumpmyq4ewvqcfor3vqynxbplynajdlmz3p6f2ywadvmz6wo@5uz53eubbkfg>

On Mon, May 12, 2025 at 08:23:11AM GMT, Yassine Ouaissa wrote:
> issue fixed also, thanks.
> > > +  significant advancements over its predecessors. This new decoder features
> > > +  enhanced processing capabilities with improved throughput and reduced latency.
> > > +
> > > +  Communication between the host driver software and the MCU is implemented through
> > > +  a specialized mailbox interface mechanism. This mailbox system provides a
> > > +  structured channel for exchanging commands, parameters, and status information
> > > +  between the host CPU and the MCU controlling the codec engines.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: allegrodvt,al300-vdec
> > 
> > Undocumented prefix.
> > 
> > What is the actual device name? al300? Can you have al300-adec? or
> > al300-dec?
> > 
> > 
> 
> the device name is al300, the vdec is for decoder driver.

So drop vdec. Compatible should reflect device name.

Best regards,
Krzysztof


