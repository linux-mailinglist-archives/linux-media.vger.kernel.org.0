Return-Path: <linux-media+bounces-21686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E349D40D7
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 18:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 924E01F21C26
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 17:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD9C156677;
	Wed, 20 Nov 2024 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dwdQxF78"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B53153BF7;
	Wed, 20 Nov 2024 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732122618; cv=none; b=DLrGD1CRDE0ej6FtWI9T8xh0H4vHWmDd1E+iJ0pDpacd/tcoJxzcbnm4djcZzafKr9i+1pqcgIQOxDsnyxXxoD963iQLa1IjzMIrgN6QNVCwCPTnyZaKBdqgRDJpCN2bHhPwTR4OgtY57ztljk6PUaPo62YJrJx1vNHBBuf5M+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732122618; c=relaxed/simple;
	bh=6OOO8IFdR9aIC/SVVyp7HAsGg+XEQlgbLko2LnIGNJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEyP2enAO8qdmnkxMQBlmt6+QdDA/3tJ5xF/OmITIBjxqbTrsOzWihhPzLMoxtnZxp0KDr/sVwY9QLTeDzBMdIKK0Y24JzSIM9VqXhTUfByhh58GdgZgsvPQQJGEGKrGXKHznSgA/Acvv4vEJe/LV4Z9O2hegivN8LlKGzbL2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dwdQxF78; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5E873E;
	Wed, 20 Nov 2024 18:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732122594;
	bh=6OOO8IFdR9aIC/SVVyp7HAsGg+XEQlgbLko2LnIGNJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwdQxF78e1Dr0L6ZUUoFVnaFuNAXCRwNygIHHbCLmtYe98lSHTCXNEKI84RRc7+K4
	 ZUAIog1q3i0rJ+uMmrVfkPzGX5Ww9a3zGc2KkbRhC67kkvgocNJzRplthEMaA5aDmh
	 8C/9ZoHgFVhZGabWxqZX6K4KdRaNeyPm+AsD+2O4=
Date: Wed, 20 Nov 2024 18:10:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com, 
	linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 media-next] media: rkisp1: Fix unused value issue
Message-ID: <pbyb5dxy4wbwbnpzpojj6bhjgbqzoebrmk2y6j73szop2ve3wx@jdslb37ejya6>
References: <20241119060220.70124-1-dheeraj.linuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119060220.70124-1-dheeraj.linuxdev@gmail.com>

Hi Dheeraj

On Tue, Nov 19, 2024 at 11:32:20AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). The error condition for the invalid MIPI CSI-2 is not
> properly handled as the break statement would only exit the switch block
> and not the entire loop. Fixed this by returning the error immediately
> after the switch block.
>
> Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> optional")
>
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

(if you receive a tag on a previous version of the patch you should
carry it forward to the next patch version ;)

Thanks
  j

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
> --
> 2.34.1
>
>

