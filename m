Return-Path: <linux-media+bounces-30649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B5A956FC
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3BFF170D31
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9511EEA54;
	Mon, 21 Apr 2025 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JgO3ar0x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F31C8623
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265815; cv=none; b=R+N2mRR7I7OkdNeI8bcHdzLOmZoO07dVHUWj+oyIlml9LjBVANzPsB7V8JEUK65Obt/YoVd+Ltu5Jgz2ikY1qi4/hI4jk/cwhEAUF8tVelVfW1zfbIUGnl0R7wZ5I6hYhaoEPUsDE7DCcfObHkwSTynhTi73/mRwAQH0fON6IOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265815; c=relaxed/simple;
	bh=LM3PCcIjvZdCnX/5oxwne17ru1Rq1tWbiuE32u1E21M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6u6/doXhvVH2JxWGkMoMocseorhRwKIBx6YULT6+0xIKhmepz3XB6RYPhi8u5QgiAM2bHg+J8NWmJ2DmuLDY3bDFcgp0VymYT6aOifiKYzYMuosFRdC7WoP5e4UJeQpIbhpW86+uZrtEHWwkTpYbcPzilNec4ezgd0MKu66oMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JgO3ar0x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 367D86D5;
	Mon, 21 Apr 2025 22:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265686;
	bh=LM3PCcIjvZdCnX/5oxwne17ru1Rq1tWbiuE32u1E21M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgO3ar0xlN5oB7/yV+4Kzt21mocFTo4nx0/5hImhPs+YI7ipukoWXT58uIfqibHwt
	 wc6NJC9OO0rKimnMGyok3FH8Hb9UmmUBk8mw+t44QrJmu5zrNTm8d+D62p0e8YMJ5G
	 R5QmWyya6Sk1pOEOSDBBUdUIyjWEoeJ2QVYPPcyQ=
Date: Mon, 21 Apr 2025 23:03:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 06/11] media: ccs-pll: Drop LINK_DECOUPLED flag
Message-ID: <20250421200331.GG17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-7-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:49AM +0300, Sakari Ailus wrote:
> The LINK_DECOUPLED flag wasn't used by the PLL calculator other than

s/wasn't/isn't/

> printing it. The number of OP/VT lanes are already printed in any case.
> Thus drop the flag as it has no function.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs-pll.c       | 3 +--
>  drivers/media/i2c/ccs-pll.h       | 1 -
>  drivers/media/i2c/ccs/ccs-core.c  | 1 -
>  drivers/media/i2c/ccs/ccs-quirk.c | 3 +--
>  4 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 66d046d576f7..16eb09462c8b 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -124,9 +124,8 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
>  	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
>  		pll->pixel_rate_csi);
>  
> -	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s\n",
> +	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s\n",
>  		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
> -		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
>  		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
>  		" ext-ip-pll-divider" : "",
>  		pll->flags & PLL_FL(FLEXIBLE_OP_PIX_CLK_DIV) ?
> diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> index 6eb1b1c68e1e..ee206e5b287b 100644
> --- a/drivers/media/i2c/ccs-pll.h
> +++ b/drivers/media/i2c/ccs-pll.h
> @@ -24,7 +24,6 @@
>  #define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
>  /* CCS PLL flags */
>  #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
> -#define CCS_PLL_FLAG_LINK_DECOUPLED				BIT(3)
>  #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
>  #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
>  #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 004d28c33287..06e0ba53f2a8 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3451,7 +3451,6 @@ static int ccs_probe(struct i2c_client *client)
>  				CCS_LIM(sensor, NUM_OF_VT_LANES) + 1;
>  			sensor->pll.op_lanes =
>  				CCS_LIM(sensor, NUM_OF_OP_LANES) + 1;
> -			sensor->pll.flags |= CCS_PLL_FLAG_LINK_DECOUPLED;
>  		} else {
>  			sensor->pll.vt_lanes = sensor->pll.csi2.lanes;
>  			sensor->pll.op_lanes = sensor->pll.csi2.lanes;
> diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
> index e3d4c7a275bc..e48a4fa1f5dd 100644
> --- a/drivers/media/i2c/ccs/ccs-quirk.c
> +++ b/drivers/media/i2c/ccs/ccs-quirk.c
> @@ -190,8 +190,7 @@ static int jt8ev1_post_streamoff(struct ccs_sensor *sensor)
>  
>  static int jt8ev1_init(struct ccs_sensor *sensor)
>  {
> -	sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL |
> -		CCS_PLL_FLAG_LINK_DECOUPLED;
> +	sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL;
>  	sensor->pll.vt_lanes = 1;
>  	sensor->pll.op_lanes = sensor->pll.csi2.lanes;
>  

-- 
Regards,

Laurent Pinchart

