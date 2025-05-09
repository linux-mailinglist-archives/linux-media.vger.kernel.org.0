Return-Path: <linux-media+bounces-32180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 851CDAB1F13
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29FE1BA2567
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E66E2609DF;
	Fri,  9 May 2025 21:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kg5OpMkg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6F16D4E6
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 21:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826219; cv=none; b=sYvE64qEc6wJIEIEt5yZ4st84Q3/X14noG45jkU75KGb20IPKkur7Fwigoaub0yfNNisnxHN5aDwIGY6p0Q+JZwQ++nQbWu89hFq/2lg8zhX69MpLtdD8AftC3vTI24JSDry7ooPzJT/m7ekwM6xk9CQVVuGccN6vkX6FQ9f0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826219; c=relaxed/simple;
	bh=0/rik8mrxER4yrEN5BIOOx5+mGqKfhmDD4NS9UeGq/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRgQ0m1oG7PxEou5r2B+iuHWPBkhoJpB3gBRQzcdFbS/fKXMCDdWjOPxTgAmEAM0hywFKTN93JQhVG3fievrxOh0Z9JUTzcbZZTxykcwjzHxPJ2TNIUzz88lIkWKHut/LNYdJ1fUIsIxkNtkWGcrHCsEk9FtqrNLl8blE4Hrfzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kg5OpMkg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B73D78DB;
	Fri,  9 May 2025 23:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746826201;
	bh=0/rik8mrxER4yrEN5BIOOx5+mGqKfhmDD4NS9UeGq/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kg5OpMkgzjcbiw7Wrt5+kBSOXgs2HJMlv5OTLalrZHCRB2Qo/3KclVYuKb2o5aaq1
	 zdxtLacGF+rsEvaopsF/SfYFB2To3faxCmgpCry3HLum1KmQgRfceplzvh8e1Oz85W
	 3PsjdS0py4C6jXUVNZGI3+THqNP4gig4OcsK3zf0=
Date: Fri, 9 May 2025 23:30:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/13] media: mt9m114: Fix default hblank and vblank
 values
Message-ID: <20250509213005.GE19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-6-hdegoede@redhat.com>

Hi Hans,

On Sun, May 04, 2025 at 12:13:26PM +0200, Hans de Goede wrote:
> The old default hblank and vblank values were based on reaching 30 fps

s/old/current/ and s/were/are/

> with the pixel-array outputting 1280x960, but the default format for
> the pixel-array source pad and the isp sink pad is 1296x976, correct
> the default hblank and vblank values to take this into account.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/mt9m114.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index b40142aed3e8..52337c719e22 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -327,12 +327,12 @@
>   * minimum values that have been seen in register lists are 303 and 21, use
>   * them.
>   *
> - * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
> + * Set the default to achieve 1296x976 at 30fps with a 48 MHz pixclock.

1280x960 is referring to the output resolution. I agree about the new
blanking values, but maybe we could be more precise in the comment:

 * Set the default to achieve full resolution (1296x976 analog crop
 * rectangle, 1280x960 output size) at 30fps with a 48 MHz pixclock.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   */
>  #define MT9M114_MIN_HBLANK				303
>  #define MT9M114_MIN_VBLANK				21
> -#define MT9M114_DEF_HBLANK				323
> -#define MT9M114_DEF_VBLANK				39
> +#define MT9M114_DEF_HBLANK				307
> +#define MT9M114_DEF_VBLANK				23
>  
>  #define MT9M114_DEF_FRAME_RATE				30
>  #define MT9M114_MAX_FRAME_RATE				120

-- 
Regards,

Laurent Pinchart

