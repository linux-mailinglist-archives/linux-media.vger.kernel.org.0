Return-Path: <linux-media+bounces-47298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C21ECC69D4C
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 6146728D24
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 14:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC7C3596F9;
	Tue, 18 Nov 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9kFa/E8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899412FFFB4;
	Tue, 18 Nov 2025 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474958; cv=none; b=oDSXfTtt4zIR86GpOpc67h+lhcRxgfEJoPrTyjhe5Xtl+A+4evvtc2fUhtckMaogrUd8WAim96CGZn/jfWB3MAM3V7iooluEQwA+PJbgaXcUL12ozE+1LkpuZL0xk5Z+PySR2RQ3d9Q5wrfJ697gM1G28wwx/Uc4obxZjiULK64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474958; c=relaxed/simple;
	bh=nrTGR5b2VdJfs2Bp44Aa5+BK6AQuXNBiakDGZoA+KZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7CpcTLkgjqhiWGWEFafqVYwqJv5AMG1MQTrYDLv1+FfhetbR5+6lXdSyN7Ks5qVg75kHfHgY9yeGlYB9ZcL2nsD5clI/zQ89O6en846keDOfB9GYM73AjSRE6t/v2AArpxc1lsj4xa5qP7HFCPH9Xh8fJSUNL+i33cfJmpXOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9kFa/E8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C07FC19425;
	Tue, 18 Nov 2025 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763474958;
	bh=nrTGR5b2VdJfs2Bp44Aa5+BK6AQuXNBiakDGZoA+KZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9kFa/E8z4UscfIn/Nt/R5Ns9WIUgtjk9fCP0BM88HYGFjx90YKZDkwxQ9nDcM1hQ
	 FdmC9hFIp/aMOFF/Agac/Ms+sDj1CDjQuElA6fBZDtkkh9LDdA9apYBxMt0Qfnq038
	 oMdnV7F335HR4OqQl6WlF7iHDbtQYyDNpS5MWIcGkTV3AhPpOtHgVPUXquRyeAFv46
	 zwGARRGaIKNnKIS+8TYJGKFHdMfsVZ2Q5BEb5nXIw3B/JUUv8/N9HCquwrzBs+BSw7
	 5bgLOklGvyE1Z9PXFAUB5zIWILegQu204kUPvD30X9E5JHQ95+KsKHfIOl2K1i7cup
	 XTgRipoE+gbHg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vLMOS-000000039Fh-1ZaZ;
	Tue, 18 Nov 2025 15:09:16 +0100
Date: Tue, 18 Nov 2025 15:09:16 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Message-ID: <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
 <2025111817-wages-anyone-e39a@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025111817-wages-anyone-e39a@gregkh>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Tue, Nov 18, 2025 at 06:14:09AM -0500, Greg Kroah-Hartman wrote:
> On Mon, Nov 17, 2025 at 08:14:19PM +0000, Ricardo Ribalda wrote:
> > Some camera modules have XU controls that can configure the behaviour of
> > the privacy LED.
> > 
> > Block mapping of those controls, unless the module is configured with
> > a new parameter: allow_privacy_override.
> 
> This is not the 1990's, please do not add new module parameters, they do
> not scale, nor work properly at all for modern hardware where you can
> have multiple devices in the same system.
> 
> This isn't an agreement that we should do this feature at all, just that
> if you do, it should NOT be a module parameter.

I agree with Greg: modprobe makes things harder specially on usb.

Also, in the specific case of privacy leds, IMO it should never be
possible to directly disable it, not even root via a modprobe or
runtime parameter.

Ok, as it might be some case where someone really wants to disable for his
special pet toy. If such cases are relevant, a Kconfig parameter could
be added (maybe depending on BROKEN), having privacy LED enabled by default. 

This way, any sane distro-generated Kernel should always have the privacy
LED on when camera is in use. 

On other words, if someone has secure boot enabled, he can be more confident
that a distro-vendor signed Kernel will honour the privacy LED, and not
even the root can tamper with - as BIOS access to disable secure boot would
be needed to change it - plus, booting a non-signed kernel.

Regards,
Mauro

