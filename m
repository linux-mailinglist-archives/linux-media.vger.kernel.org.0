Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6582D6B8D
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 00:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbfJNWLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 18:11:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48812 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731418AbfJNWLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 18:11:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8087324;
        Tue, 15 Oct 2019 00:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571091095;
        bh=DEPNbhLq7sTiy9LDVlbT1nNmklT5YJuxqx48OpkamwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=clzu+zHDOR9NwVtjo2VM7NVYvFJDDgH47FiLDDH6d5HPj5Cq6Vq5EM4RL3HZyR1ed
         0WVlAx/i6nPllKhTI0EFCFvNsECwAvAcqXRvfJcDuJzehw0GVBUPqnQCBBtmod0rqh
         yJ5QG8iWh4RUEHvtJVeIw1+69k+GNLeJBlKMiDV0=
Date:   Tue, 15 Oct 2019 01:11:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rcar-vin: Define which hardware supports NV12
Message-ID: <20191014221131.GJ23442@pendragon.ideasonboard.com>
References: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
 <20191014001615.2865301-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191014001615.2865301-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Mon, Oct 14, 2019 at 02:16:14AM +0200, Niklas Söderlund wrote:
> Most but not all Gen3 hardware support outputting NV12, add a flag to
> indicate which SoCs do support it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 6 ++++++
>  drivers/media/platform/rcar-vin/rcar-vin.h  | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 334c62805959cc8a..dcb539711151a3b5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -983,6 +983,7 @@ static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
>  static const struct rvin_info rcar_info_r8a7795 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a7795_routes,
> @@ -1077,6 +1078,7 @@ static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
>  static const struct rvin_info rcar_info_r8a7796 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a7796_routes,
> @@ -1121,6 +1123,7 @@ static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
>  static const struct rvin_info rcar_info_r8a77965 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77965_routes,
> @@ -1168,6 +1171,7 @@ static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
>  static const struct rvin_info rcar_info_r8a77980 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77980_routes,
> @@ -1184,6 +1188,7 @@ static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
>  static const struct rvin_info rcar_info_r8a77990 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77990_routes,
> @@ -1196,6 +1201,7 @@ static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
>  static const struct rvin_info rcar_info_r8a77995 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77995_routes,
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 86e9bad44484092c..a36b0824f81d171d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -126,6 +126,7 @@ struct rvin_group_route {
>   * struct rvin_info - Information about the particular VIN implementation
>   * @model:		VIN model
>   * @use_mc:		use media controller instead of controlling subdevice
> + * @nv12:		support outputing NV12 pixel format
>   * @max_width:		max input width the VIN supports
>   * @max_height:		max input height the VIN supports
>   * @routes:		list of possible routes from the CSI-2 recivers to
> @@ -134,6 +135,7 @@ struct rvin_group_route {
>  struct rvin_info {
>  	enum model_id model;
>  	bool use_mc;
> +	bool nv12;
>  
>  	unsigned int max_width;
>  	unsigned int max_height;

-- 
Regards,

Laurent Pinchart
