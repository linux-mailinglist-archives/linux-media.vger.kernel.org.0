Return-Path: <linux-media+bounces-32587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59084AB8569
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576AC8C519D
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF694298C0A;
	Thu, 15 May 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI7G6l0g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D329899A;
	Thu, 15 May 2025 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310213; cv=none; b=PD8VafpGekyXuQ6sAJ5pBP4X6cTt10r8dofFDDt2SeVQw7l9VJ7z8xSRBqMOS4Y+seATsy9dmh+uq7EfqzffsbzjN1HZ1oSEUhdbK1wYALpzKdRSI6GXfkmQE8VL6toPIq6QkR/oT/bPYBnJBTZFOS9GfBAZ9qpPl1fZcjoQKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310213; c=relaxed/simple;
	bh=A37oPoJr/xW/8WeMjuz+ZrhTONoL97JTrDKtzDs/w0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2J6U0Pa/0gOvJ0juRAbIt11cQNb7gB9+VuAbcu5ZQLnRPglm1TA5AnhSMCQ8s7WZ4KRKQVxxhe1nVaBA6Th+r6d/vwGq79WCQboqaVYNaCdGmvOBKX6K+xtljHjdhcFV3maJHGLHZGu3RfDeZfeXsMSaovs0HaFT8nvcdf3qZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI7G6l0g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747310212; x=1778846212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A37oPoJr/xW/8WeMjuz+ZrhTONoL97JTrDKtzDs/w0c=;
  b=GI7G6l0gLYbcHEctCftD4xhXRdqa3E7AnyUJpAmhry5Mw1QyR4YNFHY6
   /qM7yo6YVwFpAZ1QYAqfijD/kehAruRVdRHZcFXe/91oz7OwIra/82nIp
   0SQDTk7RszuUKEKlVwIhWYw2XlnAdQJvEMdBObQ8JnWwpMTOrufTzKjp+
   kJeZyqKjt4G+/SMxiXR8RthedKZFkMhiNleQoUec1OlXi87DhcK5maWY9
   8BzXcjOVzAGwNcVkdYOqkZh+spGcCD4k/DjX3vc3eiUX2T4j74ZNDmOaF
   Zz36or1p9mrzLRO5GFvxkabWyBk8bf/pG4XQ6ameJqA8bxJmaw4ul8Ucx
   Q==;
X-CSE-ConnectionGUID: ZPGyiE+eQ3KQzkhdBUJ1Qw==
X-CSE-MsgGUID: fHD75Rj7SN+ObHJ4WwX85g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48491757"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48491757"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:56:51 -0700
X-CSE-ConnectionGUID: 0eZkWyyiTESGGbWuZKZMQA==
X-CSE-MsgGUID: xfw+2KHBRBGQ4ef5GCZYdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138400753"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO svinhufvud) ([10.245.244.230])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:56:47 -0700
Date: Thu, 15 May 2025 14:56:43 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, tomm.merciai@gmail.com,
	martin.hecht@avnet.eu, michael.roeder@avnet.eu
Subject: Re: [PATCH v2] MAINTAINERS: update my email address to gmail.com
Message-ID: <aCXWe7hmF6twuAjB@svinhufvud>
References: <20250514154523.239435-3-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514154523.239435-3-mhecht73@gmail.com>

Hi Martin,

Thank you for the patch.

On Wed, May 14, 2025 at 05:45:25PM +0200, Martin Hecht wrote:
> replace my corporate email address by @gmail.com

Please use capital letter in the beginning of the sentence and a period at
the end of it.

The subject also begins with a capital letter.

> 
> Changes to be committed:
> 	modified:   MAINTAINERS
> 
> Changes since v1:
> 	whithespace in front of Signed-off-by removed

These should go after the '---' line so they won't end up to the commit
message, they're relevant only for review.

> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5dee8459a614..e4a4f247d826 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -811,7 +811,7 @@ F:	drivers/media/platform/allegro-dvt/
>  
>  ALLIED VISION ALVIUM CAMERA DRIVER
>  M:	Tommaso Merciai <tomm.merciai@gmail.com>
> -M:	Martin Hecht <martin.hecht@avnet.eu>
> +M:	Martin Hecht <mhecht73@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml

-- 
Kind regards,

Sakari Ailus

