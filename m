Return-Path: <linux-media+bounces-35651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44476AE45A5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC36F178599
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5206C253932;
	Mon, 23 Jun 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N/RiUTBB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550B32581;
	Mon, 23 Jun 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686851; cv=none; b=Ip14n0eaHgWy8h/JWbZHoc9PJdNDITAMasEKBn+76/Bo1Ez5191FgzDXxHG/Sa/5pZifvWIBn04Lqfrrs/bNbSI6legVjNOCCU6Ff1dKXieG4yiHrniN1kIcfMvn/GAhjvwbGo9apxZNB6DozEGYIWg7HL7GFx6fiNdFOmRvMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686851; c=relaxed/simple;
	bh=xZVY5BO5DxqJwr9venKLJof1jEf71LvoHEsEP6iWsqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9IrCbcYBNTT15wYuNXHyE9NS7bj3xBio8C36Yhw9hgfroXYQrWRixbjtLL/XYORTnboWeHlHguQpM4ODdx469bKxgbhqX/w208uSbLSSTiKFrsi0hl5JQf971jU7ja+W/UMq2ASpfmLTzqBzMzoGtDS/dzEeB0kJlJ+uS6e9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N/RiUTBB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 57EA08DB;
	Mon, 23 Jun 2025 15:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750686831;
	bh=xZVY5BO5DxqJwr9venKLJof1jEf71LvoHEsEP6iWsqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/RiUTBBxKnzZMSJKuDfLNQgjFgKXDAHC2Mav1tmlwT5fvH56Fq0a5lam3wOfdC4v
	 AUFtyGMCDrT7jR46NvhdJOKVbbPaaVdMpdj5aGGWLomOHl29YMKDPLr7S17dXcqseA
	 Rm9ivjDzIO1wBGLvHjHwxAKjvoJZFdYrG1hRto24=
Date: Mon, 23 Jun 2025 16:53:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, mchehab@kernel.org,
	michael.riesch@collabora.com, nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: uapi: videodev2: Fix comment for 12-bit
 packed Bayer formats
Message-ID: <20250623135348.GB300@pendragon.ideasonboard.com>
References: <20250623135116.93787-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623135116.93787-1-mehdi.djait@linux.intel.com>

On Mon, Jun 23, 2025 at 03:51:15PM +0200, Mehdi Djait wrote:
> For 12-bit packed Bayer formats: every two consecutive samples are
> packed into three bytes. Fix the corresponding comment.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/uapi/linux/videodev2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9e3b366d5fc7..421cc0d22ed7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -726,7 +726,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
> -	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
> +	/* 12bit raw bayer packed, 3 bytes for every 2 pixels */
>  #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
>  #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')
>  #define V4L2_PIX_FMT_SGRBG12P v4l2_fourcc('p', 'g', 'C', 'C')

-- 
Regards,

Laurent Pinchart

