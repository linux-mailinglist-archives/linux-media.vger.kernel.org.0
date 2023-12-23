Return-Path: <linux-media+bounces-2947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C185F81D472
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 15:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1C281C21094
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17367DDD4;
	Sat, 23 Dec 2023 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gHYIs0CX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B257FBE8;
	Sat, 23 Dec 2023 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DCBE833;
	Sat, 23 Dec 2023 15:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703340709;
	bh=p1vfsrTDZxGTFxif12/J40OUdxISK0QNc+VcVy85tt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHYIs0CX0SmlUZ8alGwPmdeoDsw/vfDOdMEVP6mMT//WPL0JaKxafki6jM3yAupm3
	 I12+2F2U/vnoOy0Lrg3g+UdJyHNDU/RxPI5diq8/jUNpz+9Qs0tuZWEqgOG6zRRwww
	 3vozv8jPy2WjyHKdaq6gpovVqql9g7qO/NQe1jjU=
Date: Sat, 23 Dec 2023 16:12:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: media-entity.h: fix Excess kernel-doc description
 warnings
Message-ID: <20231223141247.GA12884@pendragon.ideasonboard.com>
References: <20231223050707.14091-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231223050707.14091-1-rdunlap@infradead.org>

Hi Randy,

Thank you for the patch.

On Fri, Dec 22, 2023 at 09:07:07PM -0800, Randy Dunlap wrote:
> Remove the @major: and @minor: lines to prevent the kernel-doc warnings:
> 
> include/media/media-entity.h:376: warning: Excess struct member 'major' description in 'media_entity'
> include/media/media-entity.h:376: warning: Excess struct member 'minor' description in 'media_entity'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/media-entity.h |    4 ----
>  1 file changed, 4 deletions(-)
> 
> diff -- a/include/media/media-entity.h b/include/media/media-entity.h
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -337,10 +337,6 @@ enum media_entity_type {
>   * @info.dev:	Contains device major and minor info.
>   * @info.dev.major: device node major, if the device is a devnode.
>   * @info.dev.minor: device node minor, if the device is a devnode.
> - * @major:	Devnode major number (zero if not applicable). Kept just
> - *		for backward compatibility.
> - * @minor:	Devnode minor number (zero if not applicable). Kept just
> - *		for backward compatibility.
>   *
>   * .. note::
>   *

-- 
Regards,

Laurent Pinchart

