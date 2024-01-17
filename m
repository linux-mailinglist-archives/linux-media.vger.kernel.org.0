Return-Path: <linux-media+bounces-3807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B88306F9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 14:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A141428826F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9571EB51;
	Wed, 17 Jan 2024 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bV4mEH7N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28221EB45
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497754; cv=none; b=rdaaoOWDDbDyO+WuX59/xC9UI031SRrVBkV5fHIuBr1ogXtfvhrZCTzmOLSNq60iSJ2TaBCYZt6ODJh2sU3J9VDzlBWHrjyjPYIyvVVC8z72FAH5Z9wfYEbYVgdIYZgQcNT8TvpUenLur4gT9Rp85b5zicarTGHet3Lmk4g1XXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497754; c=relaxed/simple;
	bh=DByqYT66oyTg73jEGW7TqHOgUMF33jF4YK9ymKY+zsU=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=eGds+KOpYmWbIcX7u6ytqHn7TszOJW8YXBM81HBPKDC3/XlTvtVzY38orSc376xLyeDocnGnsj0P5swCDqz6E/X2kkW8yKe0KzIEhyT+kgk2w3PAp6/UsN7FiLgXiaNBzHk+h0FPZNM5bIMI1WPWvNtb5y44ZusKnnDnQSRt/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bV4mEH7N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BC387E2;
	Wed, 17 Jan 2024 14:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705497681;
	bh=DByqYT66oyTg73jEGW7TqHOgUMF33jF4YK9ymKY+zsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bV4mEH7N3oJbuw0p22P1BVcMzVHP4Bnhx8ZHxN5RGsSzjn/mbNSOu8t1cF/t/PLzX
	 rVZa755WmaFCKDox1Ugzfu4fDeBb58OQbEHs7yMc0z553JYefsjl+tSXKRMJKZ5nwQ
	 NzQH53fFVSjdC+jzoAtYR0/CjIkZIM+L97GVsBBY=
Date: Wed, 17 Jan 2024 15:22:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 2/2] media-ctl: Re-order setting format and routes
Message-ID: <20240117132234.GG4860@pendragon.ideasonboard.com>
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
 <20240117130805.939312-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117130805.939312-2-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, Jan 17, 2024 at 01:08:05PM +0000, Daniel Scally wrote:
> Currently media-ctl attempts to set formats that are passed to it
> with -V _before_ setting routes passed to it with -R. This is a
> problem, because the formats that one wants may not be valid until
> routing has been configured (for example, if the format is for a
> route that is inactive by default).
> 
> Reorder things so that setting routes comes before setting formats.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  utils/media-ctl/media-ctl.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> index 961d10c8..2081f111 100644
> --- a/utils/media-ctl/media-ctl.c
> +++ b/utils/media-ctl/media-ctl.c
> @@ -751,20 +751,20 @@ int main(int argc, char **argv)
>  		}
>  	}
>  
> -	if (media_opts.formats) {
> -		ret = v4l2_subdev_parse_setup_formats(media,
> -						      media_opts.formats);
> +	if (media_opts.routes) {
> +		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
>  		if (ret) {
> -			printf("Unable to setup formats: %s (%d)\n",
> +			printf("Unable to setup routes: %s (%d)\n",
>  			       strerror(-ret), -ret);
>  			goto out;
>  		}
>  	}
>  
> -	if (media_opts.routes) {
> -		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
> +	if (media_opts.formats) {
> +		ret = v4l2_subdev_parse_setup_formats(media,
> +						      media_opts.formats);
>  		if (ret) {
> -			printf("Unable to setup routes: %s (%d)\n",
> +			printf("Unable to setup formats: %s (%d)\n",
>  			       strerror(-ret), -ret);
>  			goto out;
>  		}

-- 
Regards,

Laurent Pinchart

