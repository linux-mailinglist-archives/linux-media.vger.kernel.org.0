Return-Path: <linux-media+bounces-15122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F779934F73
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338581F21AC3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 14:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B30E14374C;
	Thu, 18 Jul 2024 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VcxCg2d2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A36142E88;
	Thu, 18 Jul 2024 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314563; cv=none; b=OWv1dXPcXXvePMpb/GHnmYMtln6fokwg/Z/KRxZZvEub4PbRAc+KbW7kMvwoBv2FL+5278IWChP9ttzGss4Q1eg44yOYTfCVflqTkQR7Dj7XoswBK59iXEKQVXj2B77X0ABl/uJAw2jLVEZ+vJKTxS3QBaEV8BnIjytdAOSz3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314563; c=relaxed/simple;
	bh=b+DPYnAyLd2l+bTWEroW4xnzoEtM0RN2QEABXFfaZ6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE2JPCajijQmtZ5hKmLaPg8hb0gZOM/Ioqh69kq15Z2FUGcJ45rH73a8x6MCpALaL9srXcOBhMDzoEgDLceGYvxfldiST1kFYXn7svJlmhSg0nNmsbf7/gSOyd5M1zOGBYYX1OzYhFV6lazA1E7RcNb60wrYhmAXKwnIjfK/NUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VcxCg2d2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-158-41.net.vodafone.it [5.91.158.41])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D116766;
	Thu, 18 Jul 2024 16:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721314521;
	bh=b+DPYnAyLd2l+bTWEroW4xnzoEtM0RN2QEABXFfaZ6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcxCg2d2U7OjquGTnkKWTPPbJHVZh7X4a1TFhEjPY7UJneVRVj8d13NR1S69WW8kx
	 HKOQMFku66tBq9p2AJ1H0SCON1mCERrc2luyv20fPZrChflNJMf+KPP934NlEq7KhD
	 D0n2eBbPFhDwS9NA0SdzAZBE5sXMuBQf61rTYvDs=
Date: Thu, 18 Jul 2024 16:55:56 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 5/5] staging: media: starfive: Add system PM support
Message-ID: <ecqbazcjtzat7yxwh7uuerjrrh3umpwutiwha2zo5njmwnj25g@ocpntbuecb3z>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240718032834.53876-6-changhuang.liang@starfivetech.com>

Hi Changhuang

On Wed, Jul 17, 2024 at 08:28:34PM GMT, Changhuang Liang wrote:
> This patch implements system suspend and system resume operation for
> StarFive Camera Subsystem. It supports hibernation during streaming
> and restarts streaming at system resume time.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-camss.c  | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
> index fecd3e67c7a1..8dcd35aef69d 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -416,10 +416,59 @@ static int __maybe_unused stfcamss_runtime_resume(struct device *dev)
>  	return 0;
>  }
>
> +static int __maybe_unused stfcamss_suspend(struct device *dev)
> +{
> +	struct stfcamss *stfcamss = dev_get_drvdata(dev);
> +	struct stfcamss_video *video;

Can be declared inside the for loop

> +	unsigned int i;
> +
> +	for (i = 0; i < STF_CAPTURE_NUM; ++i) {

Likewise, if you like it, you can

        for (unsigned int i...

> +		video = &stfcamss->captures[i].video;
> +		if (video->vb2_q.streaming) {
> +			video->ops->stop_streaming(video);
> +			video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
> +		}
> +	}
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int __maybe_unused stfcamss_resume(struct device *dev)
> +{
> +	struct stfcamss *stfcamss = dev_get_drvdata(dev);
> +	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
> +	struct v4l2_subdev_state *sd_state;
> +	struct stfcamss_video *video;
> +	unsigned int i;

same here

> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to resume\n");
> +		return ret;
> +	}
> +
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&isp_dev->subdev);
> +
> +	if (isp_dev->streaming)
> +		stf_isp_stream_on(isp_dev, sd_state);

I was wondering if you shouldn't propagate start_streaming along the
whole pipline, but I presume the connected subdevs have to handle
resuming streaming after a system resume themselves ?


> +
> +	v4l2_subdev_unlock_state(sd_state);
> +
> +	for (i = 0; i < STF_CAPTURE_NUM; ++i) {
> +		video = &stfcamss->captures[i].video;
> +		if (video->vb2_q.streaming)
> +			video->ops->start_streaming(video);

You can use vb2_is_streaming() maybe.
If the queue is streaming, do you need to keep a 'streaming' flag for
the isp ? Probably yes, as the ISP subdev is used by several video
nodes ?

> +	}
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops stfcamss_pm_ops = {
>  	SET_RUNTIME_PM_OPS(stfcamss_runtime_suspend,
>  			   stfcamss_runtime_resume,
>  			   NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(stfcamss_suspend, stfcamss_resume)
>  };
>
>  static struct platform_driver stfcamss_driver = {
> --
> 2.25.1
>

