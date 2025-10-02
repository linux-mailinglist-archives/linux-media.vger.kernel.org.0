Return-Path: <linux-media+bounces-43632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51052BB3B4A
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10E173B59DF
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE7F30E0EA;
	Thu,  2 Oct 2025 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aZ9xGUCu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D4218B0F;
	Thu,  2 Oct 2025 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759402398; cv=none; b=LYN3zfRXUmnovXJNF8fnX3MQqvBk5PaWfKvewkv5MZXtlzbSPSKRjoosv5mKCerWm1y4aJXzKjRq8taegdAHaE8YSj+mubsww3+mC5uBTZAMvLXewGiiJBlLgU3Qa/f82e9joiZBoHaitcKAMO3NHbONizflakmFcgr2LKA2Sds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759402398; c=relaxed/simple;
	bh=pr8w6pjq+B7YHXCDSSMN84wb9GPcNjnWhJqPnL8v7YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxbZJqvFc8S26b3/AcNAahI/TXftx7vzE5gqwVzl8CDDNunZgUdGsdSFpqbckX3paO/uhfD7N/ARTfADfuHc22RkE7SabbqXvXsAebYcRWZ/0rRe1XvdcWsccMWar0noB/ZEa6BsYpjEuRMxbMs0kRP9eJLUhq26bgxIWruhkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aZ9xGUCu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0ABECF06;
	Thu,  2 Oct 2025 12:51:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759402305;
	bh=pr8w6pjq+B7YHXCDSSMN84wb9GPcNjnWhJqPnL8v7YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZ9xGUCumoZMrZoyn++nzupFaaBfKRXkMjtqFtbULCP4829w+eRvVhfuXQYkPcJOW
	 4mQ2Dx5q62GSFY3lIYnuPfVEc5xM2sDE4apCmEiUfwvDdYQhmO9w+NQ1Hnwinqjq4z
	 zJE9cbxRs7w5wwvHjUmedmwO1o6n2sjxJm8l1JYM=
Date: Thu, 2 Oct 2025 12:53:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add entry for rzv2h-ivc driver
Message-ID: <ip3ltwkq4y4vxztwud44o7dtfcslm2vvqmcwoyf4cpmdbi4t7l@zpz6xtxnu3qp>
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
 <20251002-ivc-v5-3-192c663fa70b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251002-ivc-v5-3-192c663fa70b@ideasonboard.com>

On Thu, Oct 02, 2025 at 11:37:02AM +0100, Daniel Scally wrote:
> Add an entry to the MAINTAINERS file for the rzv2h-ivc driver
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Fine as a separate patch or squashed in the previous one

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
> Changes in v6:
>
> 	- Fixed binding path to match new filename
>
> Changes in v2:
>
> 	- None
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f16808feebd979e807ce36f4bd21379b6995f70..8627190599387cda220fe6024a8c7fa79b8ce6db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21538,6 +21538,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
>
> +RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
> +M:	Daniel Scally <dan.scally@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> +F:	drivers/media/platform/renesas/rzv2h-ivc/
> +
>  RENESAS RZ/V2H(P) RSPI DRIVER
>  M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  L:	linux-spi@vger.kernel.org
>
> --
> 2.43.0
>

