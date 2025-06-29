Return-Path: <linux-media+bounces-36186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D7AECEF4
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521D93A71F7
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2B3224B14;
	Sun, 29 Jun 2025 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FDFrEqYz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924812F5A5;
	Sun, 29 Jun 2025 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217390; cv=none; b=I6ObUP0NpuVh2ZEqull6iEpZYoAqd82L/q5TqlnzvbuwTU3CtqgZbcagV0tEL4GYNFVlcM/vQub++Opmdhz982+aMa4jpMKWAzQ9HIvndcPXSs0UKCHKGLHf5xl7aYuAGA1UDr6YlPeoAzRem/28oTB4VR7guj67gNKVPLTDaak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217390; c=relaxed/simple;
	bh=+61X1gEWlsCC3/dpsReOqdY0iTcsmsfQumqoa2sk50E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IURy9I1vW0URnDEHfA90cO4HM0nJyzOcHecIATAfMDe2+OcjpxG99vdjqIdOsGbnKzqS+7OX93BVnQuNXmZSauu4x/cWU0ETh6AhvKS9hmT3rRVrJHlh7zeq/9eI19+lPtpchPbbrIaUZmxNnnMp2S5N+Ke1RmA3lAJdzkNw8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FDFrEqYz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9DE171128;
	Sun, 29 Jun 2025 19:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751217365;
	bh=+61X1gEWlsCC3/dpsReOqdY0iTcsmsfQumqoa2sk50E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDFrEqYzF2qQoGn1VWiGp2oXc9ft2eu/6wkxj+zS5B9VcqfLkg7KnBas8ZODbAAW3
	 lqSgMM+nAD87NMhZ3ob5WNbknAeeVodg6oa3Z2A+JamG5/gEoVo86FwwPwiiO/VPyN
	 g/HwvkvbgBjEwxJd5+g6lhk3gLBhObND26qwhbv4=
Date: Sun, 29 Jun 2025 20:16:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] media: i2c: imx214: Use __free(fwnode_handle)
Message-ID: <20250629171602.GK24912@pendragon.ideasonboard.com>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
 <20250629-imx214_fixes-v1-3-873eb94ad635@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629-imx214_fixes-v1-3-873eb94ad635@apitzsch.eu>

Hi André,

Thank you for the patch.

On Sun, Jun 29, 2025 at 04:49:22PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Use the __free(fwnode_handle) hook to free the endpoint when the
> function exits to simplify the error path.
> 
> While at it, simplify return if parsing endpoint node failed.

I think I'd drop this sentence, I don't see where the patch brings a
simplification beside the error path simplification mentioned in the
previous sentence.

> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index d9193bafa3cbb8fec2679200c38d30077d1b11bd..b84197ee5177d609b1395e14e1404ffa5b9a6dbf 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1326,8 +1326,8 @@ static int imx214_identify_module(struct imx214 *imx214)
>  
>  static int imx214_parse_fwnode(struct imx214 *imx214)
>  {
> +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
>  	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
> -	struct fwnode_handle *endpoint;
>  	struct device *dev = imx214->dev;
>  	unsigned int i;
>  	int ret;
> @@ -1338,11 +1338,8 @@ static int imx214_parse_fwnode(struct imx214 *imx214)
>  
>  	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
>  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> -	fwnode_handle_put(endpoint);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
> -		goto error;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "parsing endpoint node failed\n");
>  
>  	/* Check the number of MIPI CSI2 data lanes */
>  	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {

-- 
Regards,

Laurent Pinchart

