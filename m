Return-Path: <linux-media+bounces-7335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789788073D
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52662283E5C
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 22:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9694F894;
	Tue, 19 Mar 2024 22:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SWwmPYxN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71905F86E
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 22:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710886834; cv=none; b=tPfr2YxFUMdD40Gko4Q/LdUcHWFN+Cwf7sgEGXc/Qg55mRK0YodxczXQgE+qlNTCZ4OGOpRk0giX6Lrx+LJ9fblZexfKOOUIKoSDBZACSLwJrpyP9xURXKn0g3xVoVYAUkQciG0/txlVgj5Md1MyrTDHi19+YwpIuBXuM+dOo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710886834; c=relaxed/simple;
	bh=B5Ae9/yA9KT0eVTBOsJXBjeSspDuMU0ULaNINWSW9eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJJSxp7pr5WTVkoQdZ2xJN8jx3xF1/4PwXOsbj9N/pu6yZXci47PKkajnX5I6X1Ib+lSztkgbWCmw29GfPE+d8QxGK0Njj6gQPAnrJhrCO52YRm2KUKK9s7gZGHN+YnzPzSXgdpSzRrA48uuiwQlMNWJG1s2w5LCVJx8ym+v/kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SWwmPYxN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 423DB7E9;
	Tue, 19 Mar 2024 23:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710886803;
	bh=B5Ae9/yA9KT0eVTBOsJXBjeSspDuMU0ULaNINWSW9eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWwmPYxNQmfnzY+w6fMFGtyLcyZeudRmDj7qb/YjGfKTyP2K5g26qHcOS2i4lpqb5
	 NBhRf4x9HRNhkLlkcz0XSkJc0wAIWaklJ+6VZHcyTBRTpfQ3qbHaH25pdAY3noMIZM
	 FWBJMKWt3ug1xKHWn66cu/LoOs0bM827vE98Fc+4=
Date: Wed, 20 Mar 2024 00:20:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 02/38] media: Documentation: Add "stream" into glossary
Message-ID: <20240319222027.GE8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:40AM +0200, Sakari Ailus wrote:
> Add term "stream" to the glossary of the Media subsystem documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

I would add

	A link may carry multiple streams.

or something similar.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>      V4L2 API
>  	**V4L2 userspace API**
>  

-- 
Regards,

Laurent Pinchart

