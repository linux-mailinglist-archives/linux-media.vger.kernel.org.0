Return-Path: <linux-media+bounces-31182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A5A9ED66
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 12:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3561E7A23B6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B795F25F79A;
	Mon, 28 Apr 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dozLBtUq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB941FF603;
	Mon, 28 Apr 2025 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834390; cv=none; b=O8Z0yNvYwJDXUnsGWS9A/0oLI/gkZmFy0ZXngQsr+tJTC+ur1kwwCQlwoubTW6n8flWteguWntrHhGA88cyYMQqh8bHpF+Z/nsaWR17MGnZ/0TGThqcQbfDQV0NbJlkUNiHJjLtVuXjAXCArqo7w+CUPMRATudsr88frb1CXddc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834390; c=relaxed/simple;
	bh=EPOS8/hUSRgLG5pgNDvPwGT/K+RasiEz9VDnATpjYe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4jGYhVCoVNJPIDfEW4bCTZgnr02A9YbrcU4l8BXSe9C4f3Sn5AQLKablhQ5bZf7glf7S5lJGQebDsJtudgAaeIlhzG4VOkLZxHXFIUQoyRa8oiotgPWC9T0dkfD84AJX99uMCHP9I0dT2ArNDJzgry0+EJ3pq+wQSUtgbU5JnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dozLBtUq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C25E475;
	Mon, 28 Apr 2025 11:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745834381;
	bh=EPOS8/hUSRgLG5pgNDvPwGT/K+RasiEz9VDnATpjYe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dozLBtUqQg/0oXPxVSIMu3TaB4fzBpzjr2o3tHWbbas3U0SsINLoPp3PqU3+dVw4K
	 a+ZBz1Ih76D8JTv493HMLCI2CYmHCZ9LCS6cpgabHB6P0yqdruEJESLMZGFx9Rexv7
	 /9fepj6Z1Xg2meodj7FVdZhu807ay8Y88PgmAzhM=
Date: Mon, 28 Apr 2025 12:59:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
Message-ID: <20250428095940.GE3371@pendragon.ideasonboard.com>
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Simplify the `rzg2l_fifo_empty()` helper by removing the redundant
> comparison in the return path. Now the function explicitly returns `true`
> if the FIFO write and read pointers match, and `false` otherwise, improving
> readability without changing behavior.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 067c6af14e95..97faefcd6019 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  	if (amnfifopntr_w == amnfifopntr_r_y)
>  		return true;
>  
> -	return amnfifopntr_w == amnfifopntr_r_y;
> +	return false;

So the function always returned true. This seems to be a bug fix, please
add a Fixes: tag. The commit message should also make it clear that
you're fixing an issue, not just simplifying the code.

Personally I'd have written

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 067c6af14e95..3d0810b3c35e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
 	amnfifopntr_r_y =
 		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-	if (amnfifopntr_w == amnfifopntr_r_y)
-		return true;

 	return amnfifopntr_w == amnfifopntr_r_y;
 }

but that's also a bit of a style preference.

>  }
>  
>  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)

-- 
Regards,

Laurent Pinchart

