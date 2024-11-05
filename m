Return-Path: <linux-media+bounces-20951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966439BD304
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C49DB21A07
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B19E1DD0DF;
	Tue,  5 Nov 2024 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jPHZviIt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B410F2;
	Tue,  5 Nov 2024 16:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825978; cv=none; b=VQE1mJz1jO7KnR3iARoZizZoDfiUnSQPEDdfVv7Anzh+SyrJwZWad1lwzjPrCyZBBmRcHDUZEWSkjYmh40/fMt9BhPZpTlGB4W6sPNwj8ESDmPz89/Hl4BH5SID+gBPqidP9KQrM00cc9euy3Nwdbond79YKGBX9jpbod7w79fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825978; c=relaxed/simple;
	bh=ydILT59GR8AEnvXxgxP0u5JaNtkOLQNmxYiS5gzdAA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ka+yGlg0m9wIQHrwAOZrB7Zl3fN03avskXuB8fjzSjVuGFVAx4+3fMW6equPJBV/lSwdgbkikZ1zeW7PkRBcb9vTCg/XOtRnZe0FStUYgPjWXdLqQUexVi3WJdzIG9NnRQWrU5RodskrmS21C9rM8Ryk4fTAEhBj/MBVYnk4J90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jPHZviIt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F08F73E;
	Tue,  5 Nov 2024 17:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730825967;
	bh=ydILT59GR8AEnvXxgxP0u5JaNtkOLQNmxYiS5gzdAA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPHZviItmxp0MX6rGq+j/1nW53lOV34Hr2i2bSDsQ0xDT+W7L1Cn1RbqrHaHByBgb
	 R3hOioTR0i9iPhHwVNTOi5gXy8qRQzEWO0LSfa+puUUioFjBfNuXLcPGq+ibrM7c6r
	 qEtjWyQuEwpmwvXH8KLzaU2rBSMbzzmPfIcCFqVM=
Date: Tue, 5 Nov 2024 18:59:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <20241105165928.GJ14276@pendragon.ideasonboard.com>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>

Hi Dan,

Thank you for the patch.

On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> This loop was recently converted to use for_each_of_graph_port() which
> automatically does __cleanup__ on the "port" iterator variable.  Delete
> the calls to of_node_put(port) to avoid a double put bug.
> 
> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The offending commit wasn't merged through the media tree, so we can't
easily merge the fix there either. I'm fine merging this fix through
Rob's tree.

> ---
>  drivers/media/platform/xilinx/xilinx-tpg.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> index cb93711ea3e3..7deec6e37edc 100644
> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -722,7 +722,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
>  		format = xvip_of_get_format(port);
>  		if (IS_ERR(format)) {
>  			dev_err(dev, "invalid format in DT");
> -			of_node_put(port);
>  			return PTR_ERR(format);
>  		}
>  
> @@ -731,7 +730,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
>  			xtpg->vip_format = format;
>  		} else if (xtpg->vip_format != format) {
>  			dev_err(dev, "in/out format mismatch in DT");
> -			of_node_put(port);
>  			return -EINVAL;
>  		}
>  

-- 
Regards,

Laurent Pinchart

