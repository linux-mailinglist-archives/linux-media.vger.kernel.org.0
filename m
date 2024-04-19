Return-Path: <linux-media+bounces-9773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5D8AB2BC
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 18:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2291F21448
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 16:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47586130A7A;
	Fri, 19 Apr 2024 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LBgkAH44"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7C12FB3F
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713542568; cv=none; b=F2IU7+fI0a2D1VcW/q8yLMyj2jy6z8YwcteYBMMevGPJ7WgUjk9Nh8NcHtGzs59q3CeTTh7woun2ptUMcdEzRF0pY+/N+AEGwAsLyUaUibVWimwFxLFjq5REEv8HmpNd3DzTyVsdf6oSsRsE6EdjXEf5e0s59+ELvK2pNGUEGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713542568; c=relaxed/simple;
	bh=h8NsrVqpt43sPaupd8QW68rR21XBf5DLUFlTqexguPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPNju3IqtODF5IFQSFctQM4PC3ElVqCaCsFF189AyIgsyOXOINpKr82ud/X3KTfUwZYVF2xlioU/a5HWJ46cvSw+SzORzOCTU0gRiXaOVXgCURd30+BDdrbJFjsJXdW5pIj+I3FYoz3oeQrbh9iP7wtZbJU1k5ldOXBaMRUOaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LBgkAH44; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B6AC827;
	Fri, 19 Apr 2024 18:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713542516;
	bh=h8NsrVqpt43sPaupd8QW68rR21XBf5DLUFlTqexguPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBgkAH44Vgdqsa9sU/6iWUISUv7q1b4Dv2h3zh4UqI8xLEZ38qcZHz7ekDmIKDP++
	 zHvaWzPljma9bY8mn2An6Sz6rK/ICwXaJwL0xyYzeKTmVrwVNc22FZu8jt3XNytcUl
	 /k0Tlb+HWdlpPBZxSQN3Ls8nOpFNCIFNDzNkqgSo=
Date: Fri, 19 Apr 2024 19:02:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 03/46] media: Documentation: Add "stream" into glossary
Message-ID: <20240419160237.GD6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:36PM +0300, Sakari Ailus wrote:
> Add term "stream" to the glossary of the Media subsystem documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/glossary.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index 96a360edbf3b..ef0ab601b5bf 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -173,6 +173,12 @@ Glossary
>  	An integrated circuit that integrates all components of a computer
>  	or other electronic systems.
>  
> +_media-glossary-stream:
> +    Stream
> +	A distinct flow of data (image data or metadata) from an initial source
> +	to a final sink. The initial source may be e.g. an image sensor and the
> +	final sink e.g. a memory buffer.
> +
>      V4L2 API
>  	**V4L2 userspace API**
>  
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart

