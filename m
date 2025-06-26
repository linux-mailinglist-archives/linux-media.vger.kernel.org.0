Return-Path: <linux-media+bounces-35929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8932AE9855
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 10:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE8D2189EEE8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 08:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BFF28FFDE;
	Thu, 26 Jun 2025 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JnZNiqDI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828528F95E;
	Thu, 26 Jun 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926644; cv=none; b=lyyTtaYt87J6I5UQCLFl3OKyrDgqNi+/ON1P89aVFcp5WFEUECXAPSg/yYFW7h3qSwTfC+Vqgc2Nd2HxJhm61S55JIsccR2Z+6bwwRHjrF/nL/Y490QHb+KvzxhEYSC2/NAlYB5rQ7sWMMoc2kEmZgQDHqZD6Wo9jwkSe6vXdRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926644; c=relaxed/simple;
	bh=RVnpBzh8Pk5p+vp6PHEE6etS4VhqUXMMyitmtLtuxXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdPDa8amn2Wu/TdT2nk8NrvccPl2RRxlxG6XON4+5WNrKY9NNHStohWezGtIKVNPc+KnnVM37+BJtpG7D8z6Ix1r2wItifiGOEgtzQi7jkTPWJOE4CsBvl1HnDFuuy+sXaO+pmJGj1rmYqJ9Z/z8P6SRkbNt8NwGRqjNRmwYTaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JnZNiqDI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-34-12-nat.elisa-mobile.fi [85.76.34.12])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 239736BE;
	Thu, 26 Jun 2025 10:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750926622;
	bh=RVnpBzh8Pk5p+vp6PHEE6etS4VhqUXMMyitmtLtuxXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnZNiqDIFGYXfGGL7aQWAxeqFgx9ZF9/ernbTltasxc6pNHH5rZWWn+9JbL7NaGuY
	 5v5mc2tL3AKzjxAbtoVi+/CUOnZW3CMFstArDIP+baStQOkQHcXBpNGF36M0V/u5yC
	 c21JZlXODDVrhJreiowp64kWXjd+/SQSo3huKuUw=
Date: Thu, 26 Jun 2025 11:30:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <20250626083018.GB8738@pendragon.ideasonboard.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
 <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>

On Thu, Jun 26, 2025 at 03:32:50AM +0300, Dan Carpenter wrote:
> On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > > This was returning IS_ERR() where PTR_ERR() was intended.
> > > 
> > > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> > 
> > I'll add a
> > 
> > Cc: stable@vger.kernel.org
> > 
> > to obey the media subsystem CI rules.
> 
> Wait, what?  The original commit hasn't hit Linus's tree and it's
> not marked for stable either.

I'm personally not in favour of adding Cc: stable on all patches that
have a Fixes: line. I'll let Mauro defend the rule, and I'm happy to
drop the Cc line and fix the CI.

-- 
Regards,

Laurent Pinchart

