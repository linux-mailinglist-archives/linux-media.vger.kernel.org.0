Return-Path: <linux-media+bounces-14212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D22919B7E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 01:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF95C1F23CF9
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 23:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15DE1946B2;
	Wed, 26 Jun 2024 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KcRPMiBK"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9AB194131;
	Wed, 26 Jun 2024 23:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719446364; cv=none; b=uRmH3LVSuzUffavL4vp71Q2EchK5XUadz+UksdlLKA3CelTM0z7090je/BTI7BsZEUYI+/96NCA9ET+HIIStlU98vBRFCcSVkNN1t+oi/74cjyMCPQ3HCreypsiw8oTIi1iDd1YwTEDnqIjlGLcKvlwzy7Lq70QRCwaDMW0ilg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719446364; c=relaxed/simple;
	bh=DxLRCAVICbLwOm0878hwUG6U+CN6JJNqa9c+zYlLcBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+NRn5kTmI1PYZqUKs29pfwt69OR9xrNc9FPg5de8NmlZeuaJWNwjfFEVNxWEA9LtVmRZrBxCqwzyUwAB6l9ZF6xuwKkId5oIGyddUG4JUJUS+4MNdMSDKiS0nSJXF9rMmOOL+7pE0dh1KptFsVBRBVrQ++eFZigVDYhZ/HDDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KcRPMiBK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sgYM6lwzKouyTUa3YEQEjqMk2OfmUlxgF+rIcH1SYZM=; b=KcRPMiBKWGM78GYlWUEYrBeFrC
	R2sBZDqHBl8Uc9OjNooyz9R/DD5sFND5vFZ0FZ2cegVHmjV012zR4UQ5R8U5fAlwUgdWUtjOPeEsp
	6BdLeMq5wZmxrzzxWw0+lHOBqakZ3twyE86faPYQ4vQkrO0ZePwXDYpgJutZOogz9kRgVnv6uvq6A
	CQE/NRBBHiuVi8K9XTIE8/XA9Xyru/CcR8RRkWOlvG0haatWlWxaMHgS/Kbl2TLIeFP6FnjIEZwzx
	+eysRmr+6KSraILfaY9n1Qn+gMh2H+Ldnv2gfuahHiC0qbGMfd8qQ7IMUuD4gjjrf9Kr3o7UV1eCE
	2yxRvryg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMcXp-00000008ghU-3Zaf;
	Wed, 26 Jun 2024 23:59:21 +0000
Message-ID: <f7cf6002-239e-459f-a8ec-75cc0406fcc9@infradead.org>
Date: Wed, 26 Jun 2024 16:59:20 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/13] Documentation: core-api: Add math.h macros and
 functions
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 corbet@lwn.net, broonie@kernel.org, linux-doc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607133120.3556488-1-devarsht@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240607133120.3556488-1-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/7/24 6:31 AM, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and 32-bit division
> related macros and functions exported by math.h header file.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> V13: No change
> V12: Add Reviewed-by
> V11: Fix title for math function header
> V10: Patch introduced
> V1->V9 (No change)
>  Documentation/core-api/kernel-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index ae92a2571388..7de494e76fa6 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -185,6 +185,12 @@ Division Functions
>  .. kernel-doc:: lib/math/gcd.c
>     :export:
>  
> +Rounding, absolute value, division and 32-bit scaling functions
> +---------------------------------------------------------------
> +
> +.. kernel-doc:: include/linux/math.h
> +   :internal:
> +
>  UUID/GUID
>  ---------
>  

-- 
~Randy

