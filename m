Return-Path: <linux-media+bounces-33865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D032ACA8E4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 07:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677883B8268
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 05:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0081885B4;
	Mon,  2 Jun 2025 05:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d1CpqV/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEBE2C3255;
	Mon,  2 Jun 2025 05:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748842283; cv=none; b=pZGFmbr81UR/fR8bPkg/biOr9HgqXFU8m+rLo5sOXHKdgKHqSFmlPPgH96kxqTrgPkYgb4Imee47JzJvzdypGmhQdJ0wkNPeAHkU1YFO5UABN05RDYAbzM56xVgzZfMaDTPM23Omzeo2eyfjAzshuOj3O9q+E+v0lxBk1FEmZAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748842283; c=relaxed/simple;
	bh=htmy+IjUpSNIPz1gu7az+7dIDslLsgMksI5QpgRTWMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad5xrurzY8Y/V2sXd9JO99gUq3fYGVK9HFSoZjb5mrWpP+b2vF4P0Ic9ktMS2QhxeCA1NrnUIeJi1uT70YoINFeV+4aAQBh9bCu7xGHgsY8ILItirpVG0++wXB1GCKpzAP2jN+6BMwnJcn99ODHb5zWL0FqawkRkZMaf7I4fAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d1CpqV/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB996C4CEEB;
	Mon,  2 Jun 2025 05:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748842282;
	bh=htmy+IjUpSNIPz1gu7az+7dIDslLsgMksI5QpgRTWMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1CpqV/YCZGbD2mb0xnDolaakWCo40GeeaZKc3TU44PLnRq3UwxEamArfybPHO8Cq
	 OdWIZxumNk0N7f8r3Aycu6ziAGjbGQd71Uz9YJQ1+h8FRXyGszY104AfDJE03V3hWU
	 Eyj649v0TJI9iCSf+46GVyJqBZX9QgCXfA7nVzsI=
Date: Mon, 2 Jun 2025 07:31:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.15 052/110] media: rkvdec: h264: Use
 bytesperline and buffer height as virstride
Message-ID: <2025060258-properly-pristine-f112@gregkh>
References: <20250601232435.3507697-1-sashal@kernel.org>
 <20250601232435.3507697-52-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601232435.3507697-52-sashal@kernel.org>

On Sun, Jun 01, 2025 at 07:23:34PM -0400, Sasha Levin wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> [ Upstream commit d5e0aa61470c48ddc04d433a00e79cef8716377a ]
> 
> Use bytesperline and buffer height to calculate the strides configured.
> 
> This does not really change anything other than ensuring the
> bytesperline that is signaled to userspace matches what is configured
> in HW.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> 
> ### Key Reasons for NO Backport: 1. **Not a Bug Fix**: The commit
> message explicitly states "This does not really change anything other
> than ensuring the bytesperline that is signaled to userspace matches
> what is configured in HW." This is not fixing a functional bug but
> rather improving consistency between userspace and hardware
> configuration.

As the bot said "NO", why was this picked up?

thanks,

greg k-h

