Return-Path: <linux-media+bounces-12308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C878D55A3
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 00:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0493285F7D
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF46149C7C;
	Thu, 30 May 2024 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cgv/Q7eC"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FD9335A7;
	Thu, 30 May 2024 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109102; cv=none; b=uhDW0OvghlN9gEhY1lV5B1jBWajznPBNzQ/YSRX8jWmddqpReIRv8VpnH4M6BjCr5SiILz+etMcL7fnJM0cftcwRhSy5hZ9MHFjhe/71NrSqI9m+WRoLCGAL/PDueOU5WJHOCcV2hc6l1A9lqwXOSN1Q2BRhBVEilkJa/dMxQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109102; c=relaxed/simple;
	bh=kdx3TMxJYojAFm5/PbyiKBq8xS46txgT5B+lf63HuzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dk4a2u4O7nDf+Z9GtizgDL+tmjxXOG/12H7mkROVdVaDay+zci/GYg7qup3CTrqMkDK6lpvJfICweaaZqbGUuNBjO/BmySK0OTF685uN0J8oVf5XfzPLhpRUBD4Qk/GXCj0fqynKXc5SIFhqeY0UBrzAktIGFYrECJSnpyfI++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cgv/Q7eC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=e3NB/mDwRctn3iwAMjuc5/uFGUFjegxDUG7u7jpVJ+s=; b=cgv/Q7eC94kt5eEfPb5w5slwyv
	RTKpG43piRHMly9hzg+YvIAsIVZI03XQ79HeT3acLdWu8BGSwE3GPOvNHhUw0hG++yfArv0aVVJfr
	/ji7WJKmORZ0p9dNNwelSs2k4U9+LbZJbH3iQxTrHzPTX1JAS+t+wZm+ck++NOAWCmivP7PTLwCvn
	5VkBq7r6mxrdOaxy0BM8kOx9dEIL+wxp8TV6yO5QbOsXi23inDrq/1lSo8KS9JgCspxWeTCZzeOOg
	XMy6YPcjotgXy31GclMpcKiHeu5o+3/1/DGr9czv5/Of9674/JfkLINloooBQYADQTTjYKa7RdvN1
	Tl3kC3pg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCoVu-00000008b9H-1B8a;
	Thu, 30 May 2024 22:44:50 +0000
Message-ID: <4951656c-2d15-49f6-89d8-aa7b5c333ec7@infradead.org>
Date: Thu, 30 May 2024 15:44:46 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/11] Documentation: core-api: Add math.h macros and
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
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171740.2763221-1-devarsht@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240530171740.2763221-1-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/30/24 10:17 AM, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V1->V9 (No change)
> V10: Patch introduced
> ---
>  Documentation/core-api/kernel-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index ae92a2571388..fb467783d491 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -185,6 +185,12 @@ Division Functions
>  .. kernel-doc:: lib/math/gcd.c
>     :export:
>  
> +Rounding, absolute value, scaling and 32bit division functions

                                         32-bit
please.

> +--------------------------------------------------------------
> +
> +.. kernel-doc:: include/linux/math.h
> +   :internal:
> +
>  UUID/GUID
>  ---------
>  

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

