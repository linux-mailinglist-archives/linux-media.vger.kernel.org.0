Return-Path: <linux-media+bounces-33372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341BAC3EE9
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373FE3BB366
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB50E1FC0EA;
	Mon, 26 May 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G3S3FhXc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E581F7580;
	Mon, 26 May 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260114; cv=none; b=CQpKUPzju2jevmxZLubrz6BopNYUhfrtIq9JqzX3cqTOXXDp1fdV+VeYDQsn71GIvUjqTAa3uMdKArPYwvrBV2k7hLmUEWtxZ9J3MB2NLLNop5NL0g2X/DF3TVQ993vY42va/LsvDyQgg044/LYN9jg7KLQn+CacEJ79F2DofAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260114; c=relaxed/simple;
	bh=pSmYkZtOIKnR5jsr0vOqaPB1+ARyeaia23kddpVXRIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laJXgz4XXvwaWwCUKHHrKiyTd6WMDh+ueb9UR5jI5lDFzkss78FzzCTxo5YxQvVQ+ggBBZ/ZiMz6hXoVjlgRdHtonSzgiR75h8ovnNdlJ+OF2YDKVGgORjFO5Ih7pOfunFsFZCk5WSn0pMCK/T3EjVH68QPynCBsTz8sLekcVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G3S3FhXc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E985982;
	Mon, 26 May 2025 13:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748260085;
	bh=pSmYkZtOIKnR5jsr0vOqaPB1+ARyeaia23kddpVXRIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3S3FhXcfiJONuF9gz0H5sICxp93+1GwyfLiVjzOP0QtEhc/J9/PQrR/8PISbdvTB
	 uZtddzbbKhbAfKh/eEc0Q8swx2i3NVZgN1T0mDYuOfBaqhlADEC6SSbk6UqhhkjRVJ
	 9qLhvQVl5v7iXnbHbJmpHLGfSElC4JdyodAoNd4E=
Date: Mon, 26 May 2025 13:48:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 2/2] media: uapi: Document IOCTL number assignment
Message-ID: <20250526114824.GE17743@pendragon.ideasonboard.com>
References: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
 <20250526111732.487229-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526111732.487229-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.


On Mon, May 26, 2025 at 02:17:32PM +0300, Sakari Ailus wrote:
> Document MC IOCTL number assignment in linux/media.h. In the past the
> assignment up to 0x7f was missed so to prevent that from happening again,
> document the value here as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/uapi/linux/media.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf..2808132fcf49 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -381,6 +381,10 @@ struct media_v2_topology {
>   */
>  #define MEDIA_REQUEST_IOC_QUEUE		_IO('|',  0x80)
>  #define MEDIA_REQUEST_IOC_REINIT	_IO('|',  0x81)
> +/*
> + * Don't allocate new IOCTL numbers past 0x8f, MC IOCTL number assignment ends
> + * there!
> + */
>  
>  #ifndef __KERNEL__
>  

-- 
Regards,

Laurent Pinchart

