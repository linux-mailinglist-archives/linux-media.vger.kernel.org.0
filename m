Return-Path: <linux-media+bounces-15263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F83939176
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDC72281C8A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD24016DEBB;
	Mon, 22 Jul 2024 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pFmbNAqf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BBC16DC3F;
	Mon, 22 Jul 2024 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661057; cv=none; b=UWH+lJ8kkQvpJZhG/5IaZRnAKAlUi1SXkWGEbPl0kXJ012q7PRTQxLETX2QiZGxqByA64eqN2hymzWKjem9GP/GMNVijADpXNOdn3mYEDeqJDrkKDpcMIBkXYn9Nhvij9XnjW/AE3v0s84hFFIH7/5CPsk6hzLviChUzBwLqX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661057; c=relaxed/simple;
	bh=dyxL6DyS/3Rsh17E03qLzwN1Qt1eKMwVSphTPdr/jA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj8edimDP6l2bc5kOzAuj/Vi26EE0U00uB+jTvnYQ6+v6F95KIb0JFYahP6YrhRAhVwhOKqLcwPb25mhHrxv+EOggZRq1nfF6Z/WQDV6aTDISh7/a10B2wrSEuQFJ+J8wjNK4jXJMdsapq0ZiDUhv2hSuf2LQYEfhXCUYZdEHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pFmbNAqf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642412B3;
	Mon, 22 Jul 2024 17:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721661012;
	bh=dyxL6DyS/3Rsh17E03qLzwN1Qt1eKMwVSphTPdr/jA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFmbNAqfG5sUAp/ndPD4KGsBJ3I19V0FwD4KAU+w3b+tq4ZjSRRB02UXcDlMm69rD
	 ESm/nWhBZtGL6Y484wmNwDkFNS7GL5DNT7KS0rC/wBVgAWf5CL+QLzEzjShPoJkmpK
	 AntskOkygaX8aoNc1FP22mpILKngecc8zlajn1Kw=
Date: Mon, 22 Jul 2024 18:10:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/6] media: videodev2.h: add visconti viif meta
 buffer format
Message-ID: <20240722151035.GA31490@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709000848.1108788-3-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.

On Tue, Jul 09, 2024 at 09:08:44AM +0900, Yuji Ishikawa wrote:
> Adds the Toshiba Visconti VIIF specific metadata format
> 
> - V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
> - V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>

This patch looks fine. Assuming the corresponding documentation patch is
fine too,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog v10:
> - add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
> - add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS
> 
> Changelog v11:
> - no change
> 
>  include/uapi/linux/videodev2.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4e91362da6..562038f144 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -858,6 +858,10 @@ struct v4l2_pix_format {
>  /* Vendor specific - used for RaspberryPi PiSP */
>  #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
>  
> +/* Vendor specific - used for Visconti VIIF sub-system */
> +#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
> +#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

