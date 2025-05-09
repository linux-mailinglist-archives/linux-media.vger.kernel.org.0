Return-Path: <linux-media+bounces-32179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64657AB1F07
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20EB4A014AF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193625F98A;
	Fri,  9 May 2025 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f0qS3JRf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10221CC5F
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 21:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825956; cv=none; b=OWjlR/+yP0hE3+QraykSShGtvaXRche5KfUuhFQ5R6KUhB9s6RNMuFFRPeekXGruRqPhh0S6yAGw5PN13EaY0QxbmG32LGmWl97ae6DR2NYdmPDIoR0h+RIG0MX0eDqTkOR58q3u5uO0t3ZzcXoV65ie6LJU3mq88+0q76K2UQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825956; c=relaxed/simple;
	bh=f34EpSh0cK3JPPjJPEjt+JYzfmacSitIdQlNSfFnwfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc+xGlR5PjeR9Vrg54PVCGbV1Rah4Nr3gUjQ6RT88LPPAGZnGoNGYfj7NZKaH6P3352HEuTCNE4PXgUqd4MaF5NF5MuTslRnUPvVslOGBF28mrerLQZTC69uG9ko5ylUe5oz6yy0UTUJjiFRqvK/bRIIv2wdB67bkbNF8Ss3K4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f0qS3JRf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18078DB;
	Fri,  9 May 2025 23:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746825940;
	bh=f34EpSh0cK3JPPjJPEjt+JYzfmacSitIdQlNSfFnwfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0qS3JRfT8rw46snMBaKP3iyb+qQYKKg//phGsZUNNEhlXdSxbX7fjpWq07w/A1hK
	 +M1fr3RypA1Gyyp6I+EwtMhLA3d/cqPwiexPucJ0ZO/Ff+38Rm+ZKG2IfvtCmhjvB/
	 Yi/Y7TgZ3jZQsQVpJiGWP7vNI3FvA29HIGMJ4CxU=
Date: Fri, 9 May 2025 23:25:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 04/13] media: mt9m114: Lower minimum vblank value
Message-ID: <20250509212543.GD19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-5-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:25PM +0200, Hans de Goede wrote:
> As the comment above the defines says, the minimum values are undocumented
> so the lowest values seen in register lists are used.
> 
> The version of the mt9m114 driver shipped together with the atomisp code
> uses 21 for vblank in its register lists, lower MT9M114_MIN_VBLANK
> accordingly.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9m114.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 9fdfd90afc22..b40142aed3e8 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -324,13 +324,13 @@
>  
>  /*
>   * The minimum amount of horizontal and vertical blanking is undocumented. The
> - * minimum values that have been seen in register lists are 303 and 38, use
> + * minimum values that have been seen in register lists are 303 and 21, use
>   * them.
>   *
>   * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
>   */
>  #define MT9M114_MIN_HBLANK				303
> -#define MT9M114_MIN_VBLANK				38
> +#define MT9M114_MIN_VBLANK				21
>  #define MT9M114_DEF_HBLANK				323
>  #define MT9M114_DEF_VBLANK				39
>  

-- 
Regards,

Laurent Pinchart

