Return-Path: <linux-media+bounces-12127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212F8D299E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 02:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F311F26585
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 00:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D98D15A841;
	Wed, 29 May 2024 00:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VmjXxOa+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875F1F176;
	Wed, 29 May 2024 00:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943783; cv=none; b=Hra89GnZmFfjFRrc050qHEGQ2L4wVdtNtWelGkru+o6qim743zOsbbBJ0WlDwz0/4m+SJZpqqJUYfmNhnka06xntQeMonWEkK/kZbsgH+aUSSF6sUhiv0fqdGEnnGIfMrzM0HGLyrmqSLYOKmjT4lXdcQM3YuSlychjQXFo8ueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943783; c=relaxed/simple;
	bh=VdwTB4Oxm+SC4YlvQmRAb69BROWhRaNImmbKAIX+StI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s70cLVjr/oE0PnRMSSlrdVjOONxoO0EH1ha3ote1wVcrXZAejT4SZs/CETwpn6Dp4ODucxtqkUi29YzzBnPvnOlb4x6/9j6GEkkWDuet5gd2GkiOvgll5nzTfyus35TxWF4jmuED4FionjasQQrpSl1L/BUCo9TqudEwMMBKT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VmjXxOa+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 168989CA;
	Wed, 29 May 2024 02:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943777;
	bh=VdwTB4Oxm+SC4YlvQmRAb69BROWhRaNImmbKAIX+StI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmjXxOa+Tr2u4vgYvW4CpImYiY66H7Hdd70Plau2jw9VkFQVu2N1j8xXaEs+3YMpH
	 ZWQkdncIvWHFduGbd630WEg8w/f+DoZ8kaRyRFwgHyAjsgAP42tWVssX5IY4xe8Cge
	 PV9eZppbYZ+iFwEhE4UzfvHco33GKszLmUjKOogQ=
Date: Wed, 29 May 2024 03:49:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 5/8] media: platform: xilinx: use
 for_each_endpoint_of_node()
Message-ID: <20240529004928.GE1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87bk4p4hkt.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bk4p4hkt.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:46PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/xilinx/xilinx-vipp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 996684a730383..38818b82a575e 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -205,12 +205,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)

I think ep doesn't have to be initialized to NULL anymore.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	dev_dbg(xdev->dev, "creating links for DMA engines\n");
>  
> -	while (1) {
> -		/* Get the next endpoint and parse its link. */
> -		ep = of_graph_get_next_endpoint(node, ep);
> -		if (ep == NULL)
> -			break;
> -
> +	for_each_endpoint_of_node(node, ep) {
>  		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
>  
>  		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);

-- 
Regards,

Laurent Pinchart

