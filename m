Return-Path: <linux-media+bounces-21519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99D9D0E56
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 11:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1333A282CB5
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 10:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9F1194AD9;
	Mon, 18 Nov 2024 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ij2bzZwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875D15B0F2;
	Mon, 18 Nov 2024 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731925127; cv=none; b=QSn0D1WjcwGqna3YeiEaonWkhniIcviY/FME3ZdNRkYqAjr4f6vb30+S7Tr3Oi9E7VF3/gnFdLbrJUfqpKdlimZm4OCTKj/9u0HE55/aCKiRnh2SmHFjVzXFbV6Ch0/0lIl6V8yrSbHecSsVhA4unLQEOBIwyvqYj6pwU4ry8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731925127; c=relaxed/simple;
	bh=IT22R0CGEdHu/u1Hhsz/PwFkorUmlTbDsfnhTMv07Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ey762SAmrTE3YAGJmfnaOqiNc+wLHt8/zdaV9S3xve2066OkmX1bzDnLHLpQnSBPnMPP4SBiCs2MjVANge7OvU86lzRX5rCNUexJ3cRHnB2tE085LYLlrVXbJZrf3POqrY3YpXiUpPSXOJp6MmgEv30guJVUzqcpFFZbE2J5FTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ij2bzZwZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-150-224-74.cust.dsl.teletu.it [93.150.224.74])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24B058FA;
	Mon, 18 Nov 2024 11:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731925107;
	bh=IT22R0CGEdHu/u1Hhsz/PwFkorUmlTbDsfnhTMv07Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ij2bzZwZUD2nInjP708QqKUk36/I/PUsGVnk+AhErh3b50lWTbeUITDzc0Dn4BtQy
	 cQ6jD+issSReS/corYwZs1Q2rLzLjind3kRZPqd9F6Q+DCnbJVxGDk+X19FIVw6R4L
	 ck+r3Vy/eKxSXvIOjQUTWrfzft+8OlLpG6aAHw+A=
Date: Mon, 18 Nov 2024 11:18:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com, 
	linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Message-ID: <3obha26vg2agtmrxjft325ifiwyaftqchgpdgmm7aok7vt7e5c@jfknj6opiudo>
References: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>

Hi Dheeraj

On Mon, Nov 18, 2024 at 03:07:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). If ret is set to an error value in the switch statement, it is
> not handled before being overwritten later.
>
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Indeed there's something fishy here, however the issue is not very
much about ret being overritten but rather the error condition

	fwnode_graph_for_each_endpoint(fwnode, ep) {
		switch (reg) {
		case 0:
        HERE   ---->   (!rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
				ret = -EINVAL;
				break;
			}

			break;

		case 1:
			vep.bus_type = V4L2_MBUS_UNKNOWN;
			break;
		}
        }

breaks the inner switch and not the for loop.

I would
1) Slight reword the commit message to make it about missing an error
condition
2) Add a Fixes tag
   Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
   so that this is collected in the stable trees

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index dd114ab77800..9ad5026ab10a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  			break;
>  		}
>
> +		if (ret)
> +			break;
> +

The change is correct
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  		/* Parse the endpoint and validate the bus type. */
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  		if (ret) {
> --
> 2.34.1
>
>

