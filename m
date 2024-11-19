Return-Path: <linux-media+bounces-21569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769A9D2119
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E451F217B0
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDF3146A60;
	Tue, 19 Nov 2024 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FCzK2FIi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07FA199FAB;
	Tue, 19 Nov 2024 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732003206; cv=none; b=kJKeaTHBHSfFlz2EMVCO6t75Pygu6gte/CQ8IoZlPcOcfVtf9qCOlkkSNw1uId5bJVHO7l2WYEm6RSYlnYGQz+xY59IvrYruPo2YU65uEvYo4asTtTNYy01W/p+yGsdqeSPo/ujwpofaDWo9aYtSw3Idq5TnMaKNSZDEefz+eyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732003206; c=relaxed/simple;
	bh=AKqXK5hE1lCdeA+EA1n7axXXblY1rK3MxFVF0e5i41Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zf+cB6xi9rGy+eQLagiA+6xBX69jy6c9b+BQ91Ep+TzeWMSdYnSF2xsQUOXbi4Q6NnbTNeW00i+h/Hwlx5gP7rgi0gQLOm0kDz5j0+NMAFTQMj7YozutbimrT1pVj5prsOTAsxECaMZbJOFrIq9NiER7m10a2hxiwyxA9WjcBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FCzK2FIi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A47C2D52;
	Tue, 19 Nov 2024 08:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732003179;
	bh=AKqXK5hE1lCdeA+EA1n7axXXblY1rK3MxFVF0e5i41Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCzK2FIiheA9ZJqCI+GxBdv6ujE0EnBCO4Rq0VkGg3d37wMXmqL1Hq4rcw5C+Cy/R
	 Bz9NVOABjr/XrCCV140q+sRDaQWkRnoArhjI/7t0XzY47D42cYbMIvsZgHVueM9rNP
	 BZHAQsi81Tc+NOpppX25pieVVoWPB2JQzeABRmko=
Date: Tue, 19 Nov 2024 09:59:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Message-ID: <20241119075944.GA31681@pendragon.ideasonboard.com>
References: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>

Hi Dheeraj,

Thank you for the patch.

On Tue, Nov 19, 2024 at 12:56:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). The error condition for the invalid MIPI CSI-2 is not
> properly handled as the break statement would only exit the switch block
> and not the entire loop. Fixed this by returning the error immediately
> after the switch block.

The patch doesn't "return immediately". You can write "Fix this by
breaking from the look immediately after the switch block when an error
occurs." or something similar.

> 
> 'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> optional")'

The Fixes tag should be formatted on a single line, without outer
quotes, and without a blank line between it and the Signed-off-by line:

Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")

> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

I can update the commit message when applying the patch, there's no need
to submit a v5, unless if you want to. Please let me know if I should
take this version and update the commit message, or if you will send a
v5.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index dd114ab77800..9ad5026ab10a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  			break;
>  		}
>  
> +		if (ret)
> +			break;
> +
>  		/* Parse the endpoint and validate the bus type. */
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  		if (ret) {

-- 
Regards,

Laurent Pinchart

