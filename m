Return-Path: <linux-media+bounces-48109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDEC9D95D
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 03:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E20F349D22
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 02:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918FE23EA97;
	Wed,  3 Dec 2025 02:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XKWSLNF5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78423594F;
	Wed,  3 Dec 2025 02:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729377; cv=none; b=rhV+PbV17S0Usw8MwDM5CvSS/mxMNpDJQ7a3S/QWvhLnNg344GJbZa5Pu8ZoNwFDaiH+AEOrcCjwTFy83hB7VT9IQOysPj9KNrZFAjN5cR5EBXLzsPhtTW3/84X9tIuH8JwV8nuUAx43RMP67jY+XCgGyvE2nIFKm7CfV5GgbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729377; c=relaxed/simple;
	bh=c+s1dne0mbz3AnPoVXy4Byv6cQ7Q2XGcR5ov+GOUt7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAL6oTCHN4erRMSgg4b5ODX7HXBugmBupZ3Cb10yH9jgC87gM2O4EAG+jH2B7VbAhx6tSj4W3QEJfdLF/peMdr9aDRvYFI1kVc55Ab6zAAHW9L5YeoIC7XeO9tMHC4u6uwr5VCopgWlImRxoWZ5fST4fXBiPG4VxWc9VX30CcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XKWSLNF5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p100198.f.east.v6connect.net [221.113.100.198])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 207E71691;
	Wed,  3 Dec 2025 03:33:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764729237;
	bh=c+s1dne0mbz3AnPoVXy4Byv6cQ7Q2XGcR5ov+GOUt7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKWSLNF5mBvWG6It+0sCMXH8kk96OjRleoSN8G4A/osPMdIHJyDNe9gFhNC261JRd
	 tHzrkTizXESuEOSCjQ+aHLUns36mxdpHFD6Qwu47C+eyMLFL4i68QLBcLDZ8Qom6HW
	 L3ZkKBI7Jub+HLdGz80Kk1SGnsZnUgighTXrCH1g=
Date: Wed, 3 Dec 2025 11:35:52 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Khai Nguyen <khai.nguyen.wx@renesas.com>,
	Hao Bui <hao.bui.yg@renesas.com>
Subject: Re: [PATCH] media: rzg2l-cru: Replace usleep_range with udelay
Message-ID: <20251203023552.GM8219@pendragon.ideasonboard.com>
References: <8d9896e0482a1e04ae8934a1bdaaa7de73f919f1.1764691610.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d9896e0482a1e04ae8934a1bdaaa7de73f919f1.1764691610.git.tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Tue, Dec 02, 2025 at 05:08:41PM +0100, Tommaso Merciai wrote:
> `usleep_range()` should not be used in atomic contexts like between
> spin_lock_irqsave()/spin_lock_irqrestore() pair inside function
> rzg2l_cru_stop_image_processing(). That may cause scheduling while
> atomic bug.
> 
> Signed-off-by: Khai Nguyen <khai.nguyen.wx@renesas.com>
> Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..1355bfd186d4 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -369,7 +369,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  		if (cru->info->fifo_empty(cru))
>  			break;
>  
> -		usleep_range(10, 20);
> +		udelay(10);

There's an instance of msleep() earlier in this function, surrounded by
spin_unlock_irqrestore() and spin_lock_irqsave(). I wondered if we
should do the same here, but that lead to a second question: why does
the driver need to cover the whole stop procedure with a spinlock in the
first place ?

>  	}
>  
>  	/* Notify that FIFO is not empty here */
> @@ -385,7 +385,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  			AMnAXISTPACK_AXI_STOP_ACK)
>  			break;
>  
> -		usleep_range(10, 20);
> +		udelay(10);
>  	}
>  
>  	/* Notify that AXI bus can not stop here */

-- 
Regards,

Laurent Pinchart

