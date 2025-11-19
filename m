Return-Path: <linux-media+bounces-47337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FAC6CB35
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 173144EC34B
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CFF2F6907;
	Wed, 19 Nov 2025 04:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZkEyA49H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA902F2610;
	Wed, 19 Nov 2025 04:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763525986; cv=none; b=XJ+Upo0DtHFlgArJ2Nl2R9nlHe4Jeg1PKUtsxb5nh3Xf3QNSo20f85KwvKCMNuv2o0m88E9dPHIvGz5AT1rI22BPhrHJg4fDSWSSeAjY5hz86N7UbRxxMFkO0pcJpVLp8wSjLUIjoAFiBIPrabn5lUPaC93Ur4jLlA4IZkC8umw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763525986; c=relaxed/simple;
	bh=oMKI+mm6NvcX1Nhkehj2oI0t10jkBqILOytoJ0ie2aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIRNbAYHvzNm7ESAqG1F8IQXtooNPleFzYUl+ylxcHCk+A2M2ztK6e44ntPOf8uUFZjKIun/4tWe7kO/0HfMDrz+FOuUPWmgcl5WuLmoDrhLXYu9Vs9eaTskDvIdxfx3RuMVch0ay3Tf6yL+7rPzOUaxQH2M7OFZJJhotX4iqr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZkEyA49H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 47A3EDD9;
	Wed, 19 Nov 2025 05:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763525855;
	bh=oMKI+mm6NvcX1Nhkehj2oI0t10jkBqILOytoJ0ie2aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkEyA49HzyQff15tgiyv30o02DpF05eCWgOFFeyRIftld88mZGWYFqvFfpq5tFiT7
	 qmh06MOv94SYitDIjq8gAMZipxjtWpXj/ASkTTm2DstrjCpcK/4iexQpDe7t9mvVEm
	 /BixVLKPTXHGLQLjalm7JQInjWqsceOgxEB2V83c=
Date: Wed, 19 Nov 2025 13:19:07 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Message-ID: <20251119041907.GH10711@pendragon.ideasonboard.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
 <2025111817-wages-anyone-e39a@gregkh>
 <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>

On Tue, Nov 18, 2025 at 03:09:16PM +0100, Mauro Carvalho Chehab wrote:
> On Tue, Nov 18, 2025 at 06:14:09AM -0500, Greg Kroah-Hartman wrote:
> > On Mon, Nov 17, 2025 at 08:14:19PM +0000, Ricardo Ribalda wrote:
> > > Some camera modules have XU controls that can configure the behaviour of
> > > the privacy LED.
> > > 
> > > Block mapping of those controls, unless the module is configured with
> > > a new parameter: allow_privacy_override.
> > 
> > This is not the 1990's, please do not add new module parameters, they do
> > not scale, nor work properly at all for modern hardware where you can
> > have multiple devices in the same system.
> > 
> > This isn't an agreement that we should do this feature at all, just that
> > if you do, it should NOT be a module parameter.
> 
> I agree with Greg: modprobe makes things harder specially on usb.
> 
> Also, in the specific case of privacy leds, IMO it should never be
> possible to directly disable it, not even root via a modprobe or
> runtime parameter.
> 
> Ok, as it might be some case where someone really wants to disable for his
> special pet toy. If such cases are relevant, a Kconfig parameter could
> be added (maybe depending on BROKEN), having privacy LED enabled by default. 

The feature was added by Logitech to their webcams to avoid the red
privacy LED showing as a reflection on users' glasses. Whether or not
users ended up caring, I don't know.

The situation is different for webcams embedded in devices (even if
they're internally UVC cameras), as the privacy LED is typically smaller
and less bright in those devices.

> This way, any sane distro-generated Kernel should always have the privacy
> LED on when camera is in use. 
> 
> On other words, if someone has secure boot enabled, he can be more confident
> that a distro-vendor signed Kernel will honour the privacy LED, and not
> even the root can tamper with - as BIOS access to disable secure boot would
> be needed to change it - plus, booting a non-signed kernel.

-- 
Regards,

Laurent Pinchart

