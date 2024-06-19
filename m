Return-Path: <linux-media+bounces-13659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3790E47A
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B017B22D90
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3519770EF;
	Wed, 19 Jun 2024 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N/xDuSg7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84B7581D;
	Wed, 19 Jun 2024 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781857; cv=none; b=PaqixZgImlVKFfCghPnn1R1e8eR+lFjM5fATtBRWem45zlA8nasbeH2S/nKOwQLMjc6ZvgdB5BJgWN5wQj0Ioqo3XYQ4J83NJKo385f9M2sOFLcBlDLqxy2XURZY9vaVTJWFc9gIwmKI01/hD6X4coK9FGQVkgurKmph3aT7WTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781857; c=relaxed/simple;
	bh=E8C+xeOUSK6QEIdrvCGVdIHxknmfDJuRDey1jnXdcwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8WRBDFJ/A5Oe5peg1Mgp8Nxhm6DDsOEpmHsw2I/l6adGFc7/IU9pQizxIUkGMDvSzInM/HHUjaBAH0Ug2kDZPDIMVSbcqSo5VOJS3DvEl6L/eVH2gbwKiyaYL9uNR2pKMOG7EaY8fWFfH6Ve+uPFimKgToBfg8zTZQxBPqbBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N/xDuSg7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7D5DC8E;
	Wed, 19 Jun 2024 09:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718781834;
	bh=E8C+xeOUSK6QEIdrvCGVdIHxknmfDJuRDey1jnXdcwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/xDuSg7Xtu5JQyAAgAE2ngGREij3AhpdVc+DB9WxlCguJ1QU/xb7xRPTcVDspRmG
	 QINfI5l+R57mM/nsl8uRnVSds4Oz254wsNBSq+e8plm2QUnoYo/YddRhCcBet2m+9D
	 4yQwnd/pbOeCXmHRHGo8pGRlxPhOKYLLWD0lnuig=
Date: Wed, 19 Jun 2024 09:24:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Print debug message to diagnose
 validation failure
Message-ID: <wbnjltcntvv2r4fv776lxcecsoihofzudikepvhkuucltf5yrl@577txugeutpe>
References: <20240618194140.26788-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240618194140.26788-1-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Tue, Jun 18, 2024 at 10:41:40PM GMT, Laurent Pinchart wrote:
> When formats don't match between a subdev and a connected video device,
> starting streaming returns an error without giving the user any
> indication as to what went wrong. To help debugging pipeline
> misconfigurations, add a debug message that indicates the cause of the
> failure.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Doesn't v4l2-subdev.c give you the same information if you enable
debug there ?

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_video.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 5a9cb0e5640e..d6f2739456bf 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -78,8 +78,14 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
>
>  	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
>  	    video->rwpf->format.height != fmt.format.height ||
> -	    video->rwpf->format.width != fmt.format.width)
> +	    video->rwpf->format.width != fmt.format.width) {
> +		dev_dbg(video->vsp1->dev,
> +			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
> +			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
> +			video->rwpf->format.height, fmt.format.code,
> +			fmt.format.width, fmt.format.height);
>  		return -EINVAL;
> +	}
>
>  	return 0;
>  }
>
> base-commit: 91798162245991e26949ef62851719bb2177a9c2
> --
> Regards,
>
> Laurent Pinchart
>

