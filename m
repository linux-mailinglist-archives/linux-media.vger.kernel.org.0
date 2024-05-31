Return-Path: <linux-media+bounces-12370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA318D68FF
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 20:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0224D1C233FC
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 18:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4FF7C6C9;
	Fri, 31 May 2024 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JbDwwtoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997957C082;
	Fri, 31 May 2024 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717180282; cv=none; b=tPbIqn68Cpc7mSupUOm/hbPDuqqqhmwwzfuR8gx81oA1XyacRnKawgAOGK7ClY9RPmhOhQEU2pKkewOLBdmNxbdYU2uXrUhmNmnGaeh8dk6h3cEk/gJ15Mu48jK4fRFLikZSjSXJrihdBOQrEq5rQb20bO7qdJ0fLmegemHi6yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717180282; c=relaxed/simple;
	bh=hCXSLE4r2AnTT6HxGeXdZGVQDBKoHt4v004XWnI33Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvJmL+VtyLTy1X1NEk/qr7uGLapygcIE00CMbjGvrQyju8wjT15AxCkJ7Zww2CHlUoMDOyI/InwD+p5NDQI/+AGiWzbLlWozo7Y6CczcOWViKPQgeev98qFRFsjCMsB/xeIlBXlwHzIhZAKBQggrIUwKYc1H8IJytuQZGF/i//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JbDwwtoZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y29TmkHKYUwNvGcW0y3qxFwKo3onKquOFuAOIt1KwWk=; b=JbDwwtoZyGApmQT3cWI28iV9h2
	bnK+AzMfkDP0VylFy6mrmPYJ5D6RuWSUvkn4On0u7ltxr22WqyCL8BtlOa9/GVIGHTQHmXI+G157W
	xfNnSAHTe0PQni+yiCql0ZnAZRaolA9hMtdW6uf916xMqpg5pihKXKbEJgV+QLKxO1Ew5RkkGEJjj
	mWuOoz9HghVXp5bwnkCfb/sOjOLh9jygymSCOjLbCnF1FbCzWbaysc4BThCbSafR4gRLUj0G09ufV
	XVyiMikS5ndPn2JuFq1Mh6REHlN7q3Cq9XRse2Qi6WvkVJoCqwZk+eIFJUVQOcdXBqDaAcDKe1s4l
	WXy/bi0w==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD722-0000000B89T-2GB5;
	Fri, 31 May 2024 18:31:14 +0000
Message-ID: <c14215bd-96ff-4aec-83c4-e25375f6fe88@infradead.org>
Date: Fri, 31 May 2024 11:31:13 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/11] Documentation: core-api: Add math.h macros and
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
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171220.1295881-1-devarsht@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240531171220.1295881-1-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 10:12 AM, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.
> 

I don't see any kernel-doc for division functions in this header file.

Do some division functions get rendered somehow?

Thanks.

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V11: Fix title for math function header
> V10: Patch introduced
> V1->V9 (No change)
> ---
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
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

