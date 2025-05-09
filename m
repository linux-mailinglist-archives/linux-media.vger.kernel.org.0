Return-Path: <linux-media+bounces-32131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2DAB1359
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 14:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B5A3A7931
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FCD290BAA;
	Fri,  9 May 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wc13+ol7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0628FFD8;
	Fri,  9 May 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793755; cv=none; b=aT0QXlY0+3tYS7gFGF9vLfisGpWY2Te6pNMbAbd2fR0tSTBy+NunWv0PC6f6uAmHTzSgBboW+enieGoJ03iZFWjzL5RztnZloQfHfdNCvo8TkkQ2r+AJX4kykBY29ihn1ZikhuuUkWmUboPyk9e9nCcRBzdLID+yT8dndowYEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793755; c=relaxed/simple;
	bh=AUaHMoaWFUQ4iEYeil8536kyUZaoosXunY70b+YQh7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hrg8dhslgXD86KAC3w+4bhyVpG5Ee+f24lHiKs0Yg9kQqncMruAsnKBw18oQIKW+zi4Ry45gJ76TuTS2Y/u0IvdKCCn44UaKxxk9ruxEuKgMw5EbI9aeO0q11FLszT3wmQlBNFr4WPSHb48l7cWyLf8IFAlvZ7+Frbw+R/8IPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wc13+ol7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (unknown [IPv6:2001:861:3a80:3300:4f2f:8c2c:b3ef:17d4])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F12A48DB;
	Fri,  9 May 2025 14:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746793738;
	bh=AUaHMoaWFUQ4iEYeil8536kyUZaoosXunY70b+YQh7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wc13+ol7l9WuIdWoCMeCe+l5jMDGEObMTCn9YtYSmkVqET8X+kyQqwt+cQJT2fOUv
	 tJ8+3bweTC+8n5wvRT+vzN08eW12zIp0QmsKwzyVgzKSya9qy8w913ntmGfCJ0Mzcx
	 gd5KTqvTVa0l23Ypasjl9T8tcQRy466VlsefrJD8=
Date: Fri, 9 May 2025 14:29:06 +0200
From: Paul Elder <paul.elder@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
Message-ID: <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
References: <m3tt5u9q7h.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3tt5u9q7h.fsf@t19.piap.pl>

Hi Krzysztof,

Thanks for the patch.

The code change looks sound, but I'm confused about the reasoning behind
it.

On Fri, May 09, 2025 at 09:51:46AM +0200, Krzysztof Hałasa wrote:
> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> HIST_STEPSIZE = 3 (lowest permitted):

According to the datasheet, the histogram bins are 16-bit integer with a
4-bit fractional part. To prevent overflowing the 16-bit integer
counter, the step size should be 10.

Do you have any other information on this? Is it known that it's stable
and consistent to use all 20 bits anyway?

> isp_hist_h_size: 383 (= 1920 / 5 - 1)
> isp_hist_v_size: 215 (= 1080 / 5 - 1)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
> 
> Apparently the histogram is missing the last column (3-pixel wide,
> though only single pixels count) and the last (same idea) row
> of the input image: 1917 * 1077 / 3 / 3 = 229401

I don't quite understand this. With a sub-window width of
1920 / 5 - 1 = 383, shouldn't the resulting total window width be
383 * 5 = 1915? Same idea for the height.

Also according to my understanding, the / 3 calculation is correct, but
it comes from the step size and not about missing last column/row.
Where does the missing last column/row come from?

> 
> with the patch applied:
> isp_hist_h_size: 384 (= 1920 / 5)
> isp_hist_v_size: 216 (= 1080 / 5)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 230400
> 
> 1920 * 1080 / 3 / 3 = 230400

The fix looks fine though. Although, I'm wondering if there's a reason
why there was a -1 in the first place. Does anybody know?


Thanks,

Paul

> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..ca9b3e711e5f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -819,8 +819,8 @@ static void rkisp1_hst_config_v10(struct rkisp1_params *params,
>  		     arg->meas_window.v_offs);
>  
>  	block_hsize = arg->meas_window.h_size /
> -		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
> -	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10 - 1;
> +		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10;
> +	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10;
>  
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
>  		     block_hsize);
> 
> -- 
> Krzysztof "Chris" Hałasa
> 
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

