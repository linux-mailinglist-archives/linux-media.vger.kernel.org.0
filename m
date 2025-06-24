Return-Path: <linux-media+bounces-35730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3DAE6016
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 421EF3A4918
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59732279DC1;
	Tue, 24 Jun 2025 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ICuYSK64"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3760D15D5B6;
	Tue, 24 Jun 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755587; cv=none; b=n3NPlzhY52lVgGHHVZR6oVwdf3Wi2NuEleADZzxzrykLvfMiqHft9bn4S/SXTvN9/vGU5t0LDrtPc6mL3ppsjkSuHrtk8k1CTAxoron4Zsl7R0jIjoxo1PAAOv4VaNtaSOjrsN4tSopBEavhM8p5uhmEm6/m732hXsx+UAQmR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755587; c=relaxed/simple;
	bh=yZFxyIAuExIajMICXIDkvYr+tk6OEv4UoehSsM1OZPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gF3495ihUmGwu4dwdeCOTqLOp6bFbolpEDmEzgExeqtc39VlfrL53ArDd/If8QoxwMCVYnpKvdh8IFFlU8JjjmZcyMzcEhJvNEXK65zsX8iQluGPYkWauQBwW+Ra/0bTGm+atkXGx8l5j73eCDxAYAwcW4rI6KSfPAruk26h3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ICuYSK64; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05FC8741;
	Tue, 24 Jun 2025 10:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750755567;
	bh=yZFxyIAuExIajMICXIDkvYr+tk6OEv4UoehSsM1OZPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICuYSK64HUNJyoSFFDeLhcYn4WpNS0iS+GCT/c9p5hmS2zgKCoW97zB/uwbH5NlmM
	 axn9kn943AvOg20bd7y1UdLHTHfihz27ABqB4nip4qpFMD2D6GJbTdDqcM70iPNmSA
	 xCN9zcXpf2vn/Bw4+N7ECeA89946dSvfLeJ87E3g=
Date: Tue, 24 Jun 2025 10:59:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: jacopo@jmondi.org, mchehab@kernel.org, u.kleine-koenig@pengutronix.de, 
	hverkuil@xs4all.nl, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: rj54n1cb0c: Fix memleak in rj54n1_probe()
Message-ID: <sg5qdszxw2jl3m7kv3aofeokks3yxajbsjmk7vnawwmyu6n55p@q4mi5jndwpsm>
References: <tencent_C32D0CB0210F2605605435098E9BFC5AD107@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_C32D0CB0210F2605605435098E9BFC5AD107@qq.com>

Hello Zhang

On Tue, Jun 24, 2025 at 04:27:24PM +0800, Zhang Shurong wrote:
> rj54n1_probe() won't clean all the allocated resources in fail
> path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
> prevent memleak.
>
> Fixes: f187352dcd45 ("media: i2c: Copy rj54n1cb0c soc_camera sensor driver")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>

Thanks for addressing my comments on the previous version

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
> Changes in v2:
> - Fixed compile error
> Changes in v3:
> - Fixed coding style warnings identified by scripts/checkpatch.pl
> Changes in v4:
> - remove empty line between signed-off message and Fixes tag
> - Moved ctrl_handler assignment after the error check
> - Used existing error label for better code flow
> ---
>  drivers/media/i2c/rj54n1cb0c.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
> index b7ca39f63dba..6dfc91216851 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -1329,10 +1329,13 @@ static int rj54n1_probe(struct i2c_client *client)
>  			V4L2_CID_GAIN, 0, 127, 1, 66);
>  	v4l2_ctrl_new_std(&rj54n1->hdl, &rj54n1_ctrl_ops,
>  			V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
> -	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;
> -	if (rj54n1->hdl.error)
> -		return rj54n1->hdl.error;
>
> +	if (rj54n1->hdl.error) {
> +		ret = rj54n1->hdl.error;
> +		goto err_free_ctrl;
> +	}
> +
> +	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;
>  	rj54n1->clk_div		= clk_div;
>  	rj54n1->rect.left	= RJ54N1_COLUMN_SKIP;
>  	rj54n1->rect.top	= RJ54N1_ROW_SKIP;
> --
> 2.39.5
>

