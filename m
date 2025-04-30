Return-Path: <linux-media+bounces-31462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BFAA4D39
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8C603B28F8
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD4525A632;
	Wed, 30 Apr 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GBd/rYbS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07D259C9D;
	Wed, 30 Apr 2025 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019040; cv=none; b=Rn5h9b2PBc+GIYN44GOcOF2rDiIQpbXKZl9OYMV87xpVHjQVBJql43DnVjQU26eivdtx/0zIMzihsylqkT+Ss84b+vK4uYWw6KcnygnC/iTY+7igfFSNryM+4ldXwqjWBqxQIua9CUhkCyrAxH2g5Q3rWPBTUz1bueknAKLFk5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019040; c=relaxed/simple;
	bh=gUxFERNFiI8Fti0Ax2R+rmqI6Qrh+qBwEPYn2etkdf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5yHJRo2vxa++2OG3ddVNg7NyJ55iaLvalojvgHf3CbcEJdBriKZOna2anveXk9XukdtOzhGVOC8pVllySU359M9FK1j06NKe3yGev3n5D8gA+hRDiixD74zEyPEZTas+S0NoTJDqSku0GdEkN9vIoJRfnSwU9rpvtd811+SwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GBd/rYbS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D23A5725;
	Wed, 30 Apr 2025 15:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746019029;
	bh=gUxFERNFiI8Fti0Ax2R+rmqI6Qrh+qBwEPYn2etkdf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBd/rYbSg20QCw/0EwavmiKXQtw3vQlPHdqZzwD9mrtld2/hrPn/nB3Q1oU2/Ybag
	 zNZ1++QaKWcnvbMpMLWhqhp0BdevlHUyCmFl/mDiAVuMNUKFTm4SCZgKGVb2ptrF9z
	 H3eA7KcvL9Wn3n0ahYev0FZp2sRvK8ToeaN8XPIA=
Date: Wed, 30 Apr 2025 16:17:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430131706.GA25516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, Apr 30, 2025 at 02:53:22PM +0200, Niklas Söderlund wrote:
> Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> frequency and pixel rate") the driver expects two specific
> link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> (222750000, 148500000) operation. The driver fails to probe without
> these exact settings.
> 
> Update the example in the bindings to match this to make it easier for
> users to incorporate this sensor in their device tree descriptions
> without having to read the driver sources when the driver fails to
> probe.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The new values match the frequencies that the device expects for 4 lanes
operation, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index fa69bd21c8da..990acf89af8f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -136,7 +136,7 @@ examples:
>              port {
>                  imx290_ep: endpoint {
>                      data-lanes = <1 2 3 4>;
> -                    link-frequencies = /bits/ 64 <445500000>;
> +                    link-frequencies = /bits/ 64 <222750000 148500000>;
>                      remote-endpoint = <&csiphy0_ep>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart

