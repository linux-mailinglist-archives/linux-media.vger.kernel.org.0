Return-Path: <linux-media+bounces-45640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC5C0C995
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 10:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE1019A6A7E
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B697F2F12A9;
	Mon, 27 Oct 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="u0ppOfKh"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407752E8B77;
	Mon, 27 Oct 2025 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556158; cv=pass; b=TfEx0VNylvEsxBoOpqJGFTs1F6l19bNUh/jIpfbru0quYnn2e/5JFbEGE2KwKvkZ3YsuZ4o0FQZMXsj/IVThFsauGELSkPfacweoc3az61mBWlXaba11SDOcVLwxFXgbcVILx0NlTDCdDZmODG/KSW1MtYaC7Wd2KAYun6ihWkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556158; c=relaxed/simple;
	bh=y8AutCU30+MWyY3DKkOAXv+qDkXVpQGNsmkQOmX7zFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R56BLUUpeFky8WV8QI+trN9Mn+/CQoCf85t5Aj/t/yXUF1hZ311+imBAt+uu6xJSDuXbz7C6TSrKO2+9LFmpCZQv53UqqynJscGMFE+xlAuqmgfWOZ7A8FGxkdojwYpPko04zEOtaLvhs2R9pAvmFtmV9JkroU7CVfzCzatQ0NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=u0ppOfKh; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cw73r2GJFzySG;
	Mon, 27 Oct 2025 11:09:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761556153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6j0r4WsWkcl7drnJIo9dfVk4tLcInytBpxeSXRluRoY=;
	b=u0ppOfKhIbYPDOLJpVQq8gxa3U9bimOoh0/8G/I/aVJ9CN8ZsiAuBtDPn+T1p3LrS6IlaV
	EMpn3kkU9AToKt6c2oY6U/M17Lh/6cLk3y7Enjz6oxjIC4uxwERVuhnv3l6uu/MPeJjGPT
	x4V8FFfdDKyyBilPlQZmIrUNfyRENDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761556153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6j0r4WsWkcl7drnJIo9dfVk4tLcInytBpxeSXRluRoY=;
	b=xer77ERM/L33oNcBaUBUrrwtEIo8aOGILzir2DWeF0pn/gF6pVytnRg8ovQ0abkRZQHPOc
	5CPpE6SsshcnTcIKswHIDFm+CKSDpgPy9VtD0yYBPT0PuWCFOoqvgTifLGSQTErznR/jse
	5xnfCIXCNujOc+U2BnjN6SCmdwC33dU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761556153; a=rsa-sha256; cv=none;
	b=BKYzExpAnCTnDxGHURcSgwKCnRxJzZgNVzaIT42kMEDR31xeq6HA8845LUPLw7jOHP36KN
	Hdm0+NoDsO1i9p0gt7XD06aRNuRhS6h1/Pw9kUgJSFiP3v4wR/+3ZXUGFahn5c/jQ47fd8
	3OTi7SV921Dcc+8hvNNgWGsikA6JZcM=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 12251634C5B;
	Mon, 27 Oct 2025 11:09:12 +0200 (EET)
Date: Mon, 27 Oct 2025 11:09:11 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 19/31] media: synopsys: csi2: Add phy interface support
Message-ID: <aP82tyYmkrASPNA3@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-19-c9286fbb34b9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-19-c9286fbb34b9@nxp.com>

Hi Frank,

On Thu, Aug 21, 2025 at 04:15:54PM -0400, Frank Li wrote:
> Add standard phy interface support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/mipi-csi2.c | 91 +++++++++++++++++++++++++++--
>  include/media/dw-mipi-csi2.h                |  4 ++
>  2 files changed, 90 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
> index 922b59670383db7c920625f8a149009fa4dc5f22..27d802b3c3937473c8e08defa661b55b0655f758 100644
> --- a/drivers/media/platform/synopsys/mipi-csi2.c
> +++ b/drivers/media/platform/synopsys/mipi-csi2.c
> @@ -14,6 +14,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <media/dw-mipi-csi2.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -268,7 +269,63 @@ static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *la
>  	return 0;
>  }
>  
> -static int csi2_start(struct dw_mipi_csi2_dev *csi2)
> +static int dw_csi2_get_dphy_configuration(struct dw_mipi_csi2_dev *csi2,
> +					  union phy_configure_opts *opts,
> +					  int bpp)
> +{
> +	struct phy_configure_opts_mipi_dphy *cfg = &opts->mipi_dphy;
> +	struct v4l2_subdev *source = csi2->src_sd;
> +	s64 link_freq;
> +
> +	link_freq = v4l2_get_link_freq(source->ctrl_handler,

Please rebase.

> +				       bpp,
> +				       csi2->data_lanes * 2);

Fits on fewer lines.

> +	if (link_freq < 0) {
> +		dev_err(csi2->dev, "Unable to obtain link frequency: %d\n",
> +			(int)link_freq);
> +		return link_freq;
> +	}
> +
> +	memset(cfg, 0x0, sizeof(*cfg));
> +	cfg->hs_clk_rate = link_freq * 2;
> +	cfg->lanes = csi2->data_lanes;
> +
> +	return 0;
> +}

-- 
Regards,

Sakari Ailus

