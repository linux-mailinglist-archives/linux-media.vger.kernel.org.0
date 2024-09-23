Return-Path: <linux-media+bounces-18474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A001D97EFF7
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 19:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13FD628248B
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 17:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F8819F412;
	Mon, 23 Sep 2024 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J/ga2qcu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8838C19C57C;
	Mon, 23 Sep 2024 17:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727113831; cv=none; b=Bgo5fnLoCuNIA1YC9y1UMYvRoRRTXbwbq4pZ92pwbeVBlKiCuKzlf7rFG4IO8W49LhWNRFD9d7YhOfic81QB9Z+ORZdNAmnnRwH0hLufHFo0T8fiVaNbuTvwuWuHxQof+4s/Y0LVjus13f2Cr17NHLpPihYKSvn78nXPraO7KA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727113831; c=relaxed/simple;
	bh=JGXfMkUiwtaq500AgOAJUQN6K7N3gE60kZZ9SY5VISg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNsqSwfNW4U5LXiVoIlEJ16x8dK0yGh2DM1aFw0EDl19hnsa++Llsef3aRNmK0zufLAoPJYT/E+wh/yW62lDC/iVkqGk6xgcZO7qWpoYXofARNkksr4rVul3EcBNHQNRV/nM++PSlMWHNf5sF2vWbX1L1nd4TofoSMduriW2STI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J/ga2qcu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90F6263D;
	Mon, 23 Sep 2024 19:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727113735;
	bh=JGXfMkUiwtaq500AgOAJUQN6K7N3gE60kZZ9SY5VISg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/ga2qcu6ElzdhGEAxGG8omnkL/3Kib7LbA5MhnhEQP+BP5OgRaZzvmT8tNaV5pNK
	 TK0XFHQgKm+PnuUkgzBRx+Pe1gGE1/8sem3JM/F7xCUvUhIprCcVMXY3fXyJxHUe1A
	 dmCl7Qgi14WWbW35Jh9YGzjra37acHiwvd8b2c6k=
Date: Mon, 23 Sep 2024 19:50:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
	Stefan Riedmueller <s.riedmueller@phytec.de>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: add m2m usage_count check in
 streamoff
Message-ID: <h74uhtfdqzhq4qgcfqonwrlvoddaspi73h2m7u6bg6akjq3ugm@vxjt5ttzfkkx>
References: <20240920142715.2246323-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920142715.2246323-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu

On Fri, Sep 20, 2024 at 05:27:15PM GMT, Laurentiu Palcu wrote:
> Currently, if streamon/streamoff calls are imbalanced we can end up
> with a negative ISI m2m usage_count. When that happens, the next
> streamon call will not enable the ISI m2m channel.
>
> So, instead of throwing a warning in streamoff when usage_count drops
> below 0, just make sure we don't get there.

Isn't the whole purpose of the WARN() to highlight something's wrong
with userspace ? I think it's expected to have the same number of
streamon and streamoff calls, do you have any idea why it might not be
happening ?

Thanks
  j

>
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 9745d6219a166..b71195a3ba256 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -575,6 +575,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>
>  	mutex_lock(&m2m->lock);
>
> +	if (m2m->usage_count == 0)
> +		goto unlock;
> +
>  	/*
>  	 * If the last context is this one, reset it to make sure the device
>  	 * will be reconfigured when streaming is restarted.
> @@ -594,8 +597,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  		mxc_isi_channel_release(m2m->pipe);
>  	}
>
> -	WARN_ON(m2m->usage_count < 0);
> -
> +unlock:
>  	mutex_unlock(&m2m->lock);
>
>  	return 0;
> --
> 2.34.1
>
>

