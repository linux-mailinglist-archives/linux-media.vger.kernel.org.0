Return-Path: <linux-media+bounces-32049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D89AAFFF6
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 18:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9192C1BC1E92
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E5427D763;
	Thu,  8 May 2025 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="h0UnbKvj"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7E27B4E2;
	Thu,  8 May 2025 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720603; cv=pass; b=beQi5k3+vEb0LBYLB/Qdpv+adWPfP28HNne/FGB8PcT+1DaMWuKSOpUbSOzyWU6jhu38TPXryjsntuRRkchGQZ8vj1NQdyAtc182VZiDLVKe1s1l4k2m7n1H9AASDuh5yCnd3Os6LnjO4G18ezBkoO1SmMd7+3mNigFvisOv7js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720603; c=relaxed/simple;
	bh=hc6tjBLcHIi4yO2hjFO6y32aVGoJri1lXLkq1uUUvdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jN5+iv77aiM2KcS191Z7C96IN7bCqmdoe9Iv0tdhzIlwjfWD3M+Ub84Wfjld8wpUaWlVF9imXqjQft0cOEaRPF2GtdxpDVj3cNb3TvuFphTTTFakH76VNvP0O+mSfS3pecEYQsxy/EalL4WObC1GUU0BVmTnhwfBOs5ffUsYq18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=h0UnbKvj; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZtcXk30vrzyNR;
	Thu,  8 May 2025 19:09:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1746720598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mB4iOSPDeq6r2ktFhqlCnPdbiV/liX6fh1FV8+pDOWo=;
	b=h0UnbKvjMHVf0spJIG6eevzcyBAX8k/jRXv9xKbz7HOCi5jRtAJVxJmMRJHTlqa0Q95RRq
	GahNQoEreNssObkUDAru/LJ5XmSAIA0p6ba6L5U/d9NEnaa4Z+BO62sLP+sr+/YMOqElxA
	1hd/QeIUzuibz3aeds66l6/Npk8SAjc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1746720598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mB4iOSPDeq6r2ktFhqlCnPdbiV/liX6fh1FV8+pDOWo=;
	b=lW1P7aDTRPs0xd2+AFyyK3bb5b3qZm1OX+7FGNf8Rb2bAFjiCliXiCreqPaPqDiJMZkoWn
	G1nKGZsG2XPW4S0i5Yz/pmWQT0yO7seTkKp6yo/K0R3M965P2fmU3EskbAGedXjI0QWyOJ
	i4vDD87YC9W9GwId9fmh6BnlO/RnLf4=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1746720598; a=rsa-sha256; cv=none;
	b=awqKYJAUOeyzYiAXIi3DxzuvU9XdG5BLUyX+V6CZdwMoLFOEw90P1Z5+2qF6llU5YCuNa1
	d2lZEMOHCnDpm0rTFvomJJk6bDuQKv0E0bhEJYHRfr7/alM2IN9U8rS7wrBjpO9l2AUjrK
	sjplyULez2RbQrhzPjUa9+IeaPgr7hc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AA00F634C93;
	Thu,  8 May 2025 19:09:57 +0300 (EEST)
Date: Thu, 8 May 2025 16:09:57 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 00/10] Amlogic C3 ISP support
Message-ID: <aBzXVdM5GWnpHNvJ@valkosipuli.retiisi.eu>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>

Hi Keke,

On Sun, Apr 27, 2025 at 02:27:08PM +0800, Keke Li via B4 Relay wrote:
> The Amlogic C3 platform integrates an ISP capable of supporting
> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
> 14-bit raw RGB Bayer data.
> 
> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
> an adapter layer that integrates the inline processing from the PHY to
> the ISP, and the ISP driver itself.
> 
> This implementation consists of several distinct module drivers and
> is expected to support different platforms in the future.

Jacopo has already sent a PR on this and none of my comments address grave
issues. Please post further patches on top instead of changing this set.

-- 
Regards,

Sakari Ailus

