Return-Path: <linux-media+bounces-45580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB952C0B3B0
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 21:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3EC37349F6A
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 20:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D92C22AE7F;
	Sun, 26 Oct 2025 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8OoN83r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387B4CB5B
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761511957; cv=none; b=BzMI2bRJ86StAEQcvK8J8ElBTeqSrvE743SCtNFjQaOORw06mpAF2/2TDdYAlgROhfkLMXWTRifFyv8UeHOga6HoXwJXZe37iw7G3VUQc6AeEYCkYntcyzLK9FpqQgNuVDX/1oaBC3yZPGikckG/4sTUAi8msQIzqq7dqhaV34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761511957; c=relaxed/simple;
	bh=CM3ifg4LQIoDp06KUtH3oWj/by6VavnVYtr2J+ZoRuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlFTODWN4aegMKclz8P+GuQDyRp3cVu3a0zd6tP2qiwBkDVYFXOPrJqnVymNznwzvQ5k+OUcDZ0h8T5Ba6Iyi5VwtPMYKiUvzF8yKntzViG02jfrxrMJi/Rqg8TlsMlbEdZYu3vIttn1+uEHTYVWCfZf2wIxNRa5MyWKbHT0cNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8OoN83r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BAE461F0E;
	Sun, 26 Oct 2025 21:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761511845;
	bh=CM3ifg4LQIoDp06KUtH3oWj/by6VavnVYtr2J+ZoRuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8OoN83r1RtOlKyxniifvMZzfmG9UvPKo3u+3oWY0xTOqLCOIlaZy2CGznTwByfiD
	 7ojAvcuD29BO0WeXPFZHHFG8z+dFhvAg7pcaTDehEu8UaKUjQoorYdsoj+xXASMUdc
	 BIwVxaDVCZgaDc4jl6F82t686luh/sNvTC1WQAsk=
Date: Sun, 26 Oct 2025 22:52:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: imx8mq-mipi-csi2: drop unused module alias
Message-ID: <20251026205218.GF13023@pendragon.ideasonboard.com>
References: <20251017060051.8204-1-johan@kernel.org>
 <20251017060051.8204-3-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017060051.8204-3-johan@kernel.org>

On Fri, Oct 17, 2025 at 08:00:51AM +0200, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 3a4645f59a44..5a5934ce1f84 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1114,4 +1114,3 @@ module_platform_driver(imx8mq_mipi_csi_driver);
>  MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
>  MODULE_AUTHOR("Martin Kepplinger <martin.kepplinger@puri.sm>");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx8mq-mipi-csi2");

-- 
Regards,

Laurent Pinchart

