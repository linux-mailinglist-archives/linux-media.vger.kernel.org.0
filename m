Return-Path: <linux-media+bounces-32114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6497AB0EB4
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 11:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8293EA03C85
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B126278773;
	Fri,  9 May 2025 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rnhXNAe4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A22750FC;
	Fri,  9 May 2025 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782162; cv=none; b=VY2+b4nulpMH2TIBt+dNe7JqCt1pQQ1QRYxJ2EodWkuJDAQ7V5lVusD6yiQLH1QFd8i502YPPDJQV+ofzG0XH2rieke2QAXMd3Ywo+okRnwA6Vbvj72fd5bBe/Rj6zPKB96mLEVoJ/GwOz/w832d3+KbGV5V+/Uwc2paJRfzjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782162; c=relaxed/simple;
	bh=Nzp7Wep8Y5IgzGQsgim/aXZAWeqc1yrcDR56R8R6neg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fN8b+yVhtAqffo78Ofcv0GogY+3DTelicuR1o5/ZOoTDVn8YMaNKX5G0BHzX/9iYUg7+vOcrImXGLOvmfJh7VxeYzTptyEEpRj1RkFTpsFvleLegg7RbUbHBB1RTAdRU/DQUbEN/WadxVi2zRr31wRHrgJtXQuSPxxSfXPzIbfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rnhXNAe4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97B469E5;
	Fri,  9 May 2025 11:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746782145;
	bh=Nzp7Wep8Y5IgzGQsgim/aXZAWeqc1yrcDR56R8R6neg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnhXNAe4+sQfEgDOYkMYiKQG10FLE2tSDxTvsnAGxsddsbfvD1Ly5Cg2/LAQG5fy6
	 mCH2GkSBchnxZ+2EpRMQyHeI11oLHccol1/E0za+t/v/tkSnMIAlLuFIN5KA4gjtuO
	 2ikPLDUA9kHtnRaptsLtts78lk6gOq4/dsUh8ZXE=
Date: Fri, 9 May 2025 11:15:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
Message-ID: <20250509091549.GD28896@pendragon.ideasonboard.com>
References: <m3plgi9pwu.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3plgi9pwu.fsf@t19.piap.pl>

Hi Krzysztof,

On Fri, May 09, 2025 at 09:58:09AM +0200, Krzysztof Hałasa wrote:
> I guess these messages were split from a single function. Or was it
> for saving memory? :-)

The goal was indeed to save memory.

> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd17..b6c7f114f9ed 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  						 sink_streams);
>  		if (ret) {
>  			dev_err(xbar->isi->dev,
> -				"failed to %s streams 0x%llx on '%s':%u: %d\n",
> -				"enable", sink_streams, remote_sd->name,
> -				remote_pad, ret);
> +				"failed to enable streams 0x%llx on '%s':%u: %d\n",
> +				sink_streams, remote_sd->name, remote_pad, ret);
>  			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
>  			return ret;
>  		}
> @@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  						  sink_streams);
>  		if (ret)
>  			dev_err(xbar->isi->dev,
> -				"failed to %s streams 0x%llx on '%s':%u: %d\n",
> -				"disable", sink_streams, remote_sd->name,
> -				remote_pad, ret);
> +				"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +				sink_streams, remote_sd->name, remote_pad, ret);
>  
>  		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
>  	}

-- 
Regards,

Laurent Pinchart

