Return-Path: <linux-media+bounces-11117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD98BF63E
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 08:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8431F22FF7
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204C91863C;
	Wed,  8 May 2024 06:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UeGH88wy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1D17BCD;
	Wed,  8 May 2024 06:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715149734; cv=none; b=h476j1HzZ27IkZiY3hqu/hfd+M9t/7C0WPyyII9GolJPDcYEl58I4gmBKlz7Ii0OspHGscuzGA8Jc+MGaJT8ALUXAaHwNMfWFFdqywroYBj5z8YWb6TO/av2JsLUUO9D+HtESk4ZNJg2fIDtnp5BQN9bp++8UW4Hypnvs+rL3k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715149734; c=relaxed/simple;
	bh=ZkivE2M4A6Zyvz5uQplVcUGzvRnrZckW22dCP/IeN7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QobxK/cyRp9oG1/H0q/bF5A9SdUTxAMTjT3PmqYISTKzYIRlbjsoaOb56geDBMjH3qqvHPf2z17qIOqtKsvvzRErorYrcbcNaIVerWSfD2XO69f0oq8rYeiHCCpzvWakF4FyPtltCMYdT7cpNp+c5TAYEq4mpcf1RzcN45ehX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=UeGH88wy; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GRJaxWCDvD8J1e83T9v3/SNwP7m5MLl5o4fjEjGKSVI=;
  b=UeGH88wyvXZW33eDF+AHzDEjJHgunrhImmEwvB0UqK8Xy1Ek/TPp3Pq/
   RR+07i94R/ICRrIbuBvF+fdKSL6yTwGfDyszsiU9yR8v5R4etfG3gy569
   W8Bot+RhvJ1fuRGwYdS9dGvj4730BtKh/ML+2VHsnE/eqliEb2c1Sw9AT
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,144,1712613600"; 
   d="scan'208";a="164962999"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 08:28:42 +0200
Date: Wed, 8 May 2024 08:28:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
cc: akari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com, 
    jacopo@jmondi.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
    linux-kernel@vger.kernel.org, julia.lawall@inria.fr, 
    skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH] media: i2c: replacing of_node_put with
 __free(device_node)
In-Reply-To: <20240508054253.1568781-1-abdulrasaqolawani@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405080828330.3563@hadrien>
References: <20240508054253.1568781-1-abdulrasaqolawani@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 8 May 2024, Abdulrasaq Lawani wrote:

> Replaced instance of of_node_put with __free(device_node)
> and removed goto statement to protect against any memory leaks
> due to future changes in control flow.

The log message is not very understandable.  "to protect..." goes with
__free, not with "removed goto statement".  I don't think "removed goto
statement" is needed at all.

julia


>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> ---
>  drivers/media/i2c/ov5647.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 7e1ecdf2485f..d593dba092e3 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1360,23 +1360,19 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
>  	struct v4l2_fwnode_endpoint bus_cfg = {
>  		.bus_type = V4L2_MBUS_CSI2_DPHY,
>  	};
> -	struct device_node *ep;
> +	struct device_node *ep __free(device_node) = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	int ret;
>
> -	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	if (!ep)
>  		return -EINVAL;
>
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
>  	if (ret)
> -		goto out;
> +		return ret;
>
>  	sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
>  			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
> -out:
> -	of_node_put(ep);
> -
>  	return ret;
>  }
>
> --
> 2.34.1
>
>

