Return-Path: <linux-media+bounces-32124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF75AAB10D9
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AC51C034CD
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0344A28F519;
	Fri,  9 May 2025 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h7UT3Xjs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539E28ECE1;
	Fri,  9 May 2025 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787065; cv=none; b=bTT4PYb02J5mmdfhs3z5zBKckpO/hrcpThr2pWFrvxV4FxcN3qUxuUtr6lvY8CcPgVbbPYl7kq31s+Ginoa5M0arSIN2xFA0qBmvlZ8rTjOMAvLFk2M4b4xiG9qTQ1Wu3sAegKf8K5RlLaCq6g4Hpo6XREQpFRxrFCi6qFUmWbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787065; c=relaxed/simple;
	bh=AfXvqVxIz0QcRni0bewoQ8SDWdd4YjFQcafte966bIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZu091q4/QEEH0gOrZnan7SgyxoLzJ9wEv2OOSxiXvz34p1+WwJKixR6SQc+Os6vxJg5sVBO7F47yArdPSF4hSR//UT7ozdWPawB0kfZDLK8LOjKjvlz9owG1pzfe98NHbYG2FuK1VS+KyYRQHZPlgBhMdvSn9gnvfB5E262SkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h7UT3Xjs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 097798DB;
	Fri,  9 May 2025 12:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746787049;
	bh=AfXvqVxIz0QcRni0bewoQ8SDWdd4YjFQcafte966bIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7UT3Xjs/pRKhU7lxaM7WRQzVzWXhWuGkKSZOVmofA/WwZhYru/+PZSvgknKuF1io
	 7yJl7/1OKYS1WcQS+7fOrgo6TQiFhCzwe2JfRfSElkSSS8v4VRUhaCoeF/EqXEDaSY
	 Noa+E4+cX5kKCjN0bwC/cIqTP8Qn2TJvN+XUtzZE=
Date: Fri, 9 May 2025 12:37:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Message-ID: <20250509103733.GE28896@pendragon.ideasonboard.com>
References: <m3h61u9jy2.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3h61u9jy2.fsf@t19.piap.pl>

Hi Krzysztof,

Thank you for the patch.

On Fri, May 09, 2025 at 12:07:01PM +0200, Krzysztof Hałasa wrote:
> In addition to raw image data, certain MIPI sensors send additional
> information like NULL packets or "embedded 8-bit non-image data".
> Without DT (data type) filtering, these packets end up in the frame
> buffer, corrupting it.
> 
> Tested on i.MX8MP with IMX290 sensor.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 29523bb84d95..d53a4262b63d 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
>  	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> -	if (csis->info->version == MIPI_CSIS_V3_3)
> -		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> +	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT */

The condition was added because the CSIS in the i.MX8MM doesn't
implement the INTERLEAVE_MODE field. We can't remove it unconditionally.

You mentioned i.MX8MP, that's a platform where I'd like to see proper
support for *capturing* embedded data, not just dropping it. Have you
looked at how this could be implemented ?

>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
>  
>  	__mipi_csis_set_format(csis, format, csis_fmt);

-- 
Regards,

Laurent Pinchart

