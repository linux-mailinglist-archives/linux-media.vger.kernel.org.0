Return-Path: <linux-media+bounces-45579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C5C0B3AD
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 21:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 064BB3ABF6C
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 20:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ECF223DEF;
	Sun, 26 Oct 2025 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AroRM884"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E084CB5B
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761511937; cv=none; b=IWNnit0cQQyZo8u6jP8WagFg3fJjWKkGrRCWfMnpmUn3luSzju6+Eo3CeTFnsU+wRB/ZziD44mrTWgKI8XlrUlmLanVwbJo6JxQXaL2u+CpFIY2OtxTmCM4V1qg1Vo2eA8nDr73AcSv86NNxjItYQydYtgFDqjKVQQDw/nX/Oks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761511937; c=relaxed/simple;
	bh=6JfX55IaFxnnSQpZixkvE807vPT5KdTTqtJSUlz/L8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1kNA3ya4bxovAz2BEmgAWgNXthJyvBm6/OWN3IMMMwsqBqgL+/XMSs6fDFVczR/a4fOsDqwL64BVjPCBW+h9FdulZ+ly5dCx5xG7sdFIGtFOeV8hcWEDlAc8waMmL+Wzeg/AddYfSKwTnypNkUhYKdw3vL4QsDhFsNaYH+Jmg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AroRM884; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6386A1F0E;
	Sun, 26 Oct 2025 21:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761511827;
	bh=6JfX55IaFxnnSQpZixkvE807vPT5KdTTqtJSUlz/L8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AroRM884ngdERXx2M5n4agNjyYnPqrvtbdcNTre6Yz/nAfn+/FOWYHPh4tk1jlyn+
	 7GBXY+jGW0s86IDgyXdUnIwKuJfIw6QIWHZ2h9S3tfQB8+WzdBHqT19ldSFaM+xtwB
	 s4Mp0fyrVueAPAFqxqGov24z2jPqL3f1V/d4gBCQ=
Date: Sun, 26 Oct 2025 22:52:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: imx7-media-csi: drop unused module alias
Message-ID: <20251026205200.GE13023@pendragon.ideasonboard.com>
References: <20251017060051.8204-1-johan@kernel.org>
 <20251017060051.8204-2-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017060051.8204-2-johan@kernel.org>

On Fri, Oct 17, 2025 at 08:00:50AM +0200, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.

Thanks for helping reducing cargo-cult :-)

> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 34a92642bbfe..933a5f39f9f4 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2290,4 +2290,3 @@ module_platform_driver(imx7_csi_driver);
>  MODULE_DESCRIPTION("i.MX7 CSI subdev driver");
>  MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx7-csi");

-- 
Regards,

Laurent Pinchart

