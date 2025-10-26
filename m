Return-Path: <linux-media+bounces-45578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F6C0B3AA
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 21:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A743ABB53
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 20:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1674F223DEF;
	Sun, 26 Oct 2025 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k6lQIiTP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D284CB5B
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761511909; cv=none; b=Gx5lQBHUOQGOwkxqP2Nfn+nf+8TFOvtByrXewWE+AlYxtyJwf9q9pOOGInAQnD3RjZ5EaCaig4YDgQx80Vj8x8fs5h5Adkb1BLSaHBX+kFA+rriht6fZJ5LeHrfSDmkRcackiIh3VvBLIaD9aShviL8PC9cF5FfEEEsYWKW38pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761511909; c=relaxed/simple;
	bh=+voyCMcntNWYhsWpdGq07epKdzg34zAOZ1Rl7Uc1XsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doxohBUo8SjoR8s5P6cICFfuidaBandy5LcYYv3pw4k4zywFqLf5u07LfFJ9lBQUctkCmQQa1N7/UQ0ZCZ1U3rCEx82BoggnxA5m0ynoGf4GQhtooxF5iNMn53+Z/IhYuuZDnz+9bZ1BI8UO53RRsY8zMT7zBnVDPNPueC/sIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k6lQIiTP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0C2A21F0E;
	Sun, 26 Oct 2025 21:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761511798;
	bh=+voyCMcntNWYhsWpdGq07epKdzg34zAOZ1Rl7Uc1XsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6lQIiTPQIxY5/Rf2+HtbSXhuvCXyBuGmLWri3rbAS9M2gczsVOXwHlhDbVp7pFk8
	 epNSTV6mhhcFSE43S73OB00icQVMSHn+6WQ1PIq/KlWhrvdrGrEHmH+fgGbtX+sOC3
	 HOwMu5X7R/3WZJKjo6bnT1eW77EMm2Tuc4VGCkGA=
Date: Sun, 26 Oct 2025 22:51:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx-mipi-csis: drop unused module alias
Message-ID: <20251026205131.GD13023@pendragon.ideasonboard.com>
References: <20251017060051.8204-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017060051.8204-1-johan@kernel.org>

Hi Johan,

Thank you for the patch.

On Fri, Oct 17, 2025 at 08:00:49AM +0200, Johan Hovold wrote:
> The driver does not support anything but OF probe since commit
> f0e7cfbb43f1 ("media: imx: imx7_mipi_csis: Add i.MX8MM support") so
> drop the unused platform module alias.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d5de7854f579..fd399af56e0c 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1634,4 +1634,3 @@ module_platform_driver(mipi_csis_driver);
>  
>  MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx-mipi-csi2");

-- 
Regards,

Laurent Pinchart

