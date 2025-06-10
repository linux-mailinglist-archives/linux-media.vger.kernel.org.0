Return-Path: <linux-media+bounces-34389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A7AD2F21
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12C2B18875B5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC8225DCEC;
	Tue, 10 Jun 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="at/McZg3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17061917CD;
	Tue, 10 Jun 2025 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541681; cv=none; b=VMWgRxijYnCWwRzzPDYCwUPh/aa11HoXshjXa7kvrjEdARvBP9cHk7KBn53PE6nwapqpIXdRID1Rn8fFf6Y1q38qNiXqnQsJgn0/5VQAtCxZhsQujWnzTnYxMIziknn7rP7FVs05wmVSyaA2RvLnZrWpCqu4O13EZuHj9CQ/sys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541681; c=relaxed/simple;
	bh=b51keoelKKzth1odgCRNUV1Z6FySj2LHiGzcMDL7AiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv5wuwQ2RDWh58tmp8RxEu7Q63CDsHhMXXFhP2qRYrlOxZonuZHf/2cjbsSMjK3voGU4Vp4uWOQQqrUZ6XcKbwyFiWA0vJM4i7GIXWnY/3NlxwfjpSuJCKJ0KDdfViGNnUUVlClyyUyj0/6LJyPHrHQpRvSsqo4bvvKloYIHzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=at/McZg3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 574032EC;
	Tue, 10 Jun 2025 09:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749541664;
	bh=b51keoelKKzth1odgCRNUV1Z6FySj2LHiGzcMDL7AiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=at/McZg3E4l7ZhmPDrIOKzUL3dOSMjSSjFr0m9sVsPl/DGEJhD/sffQ1JzfSXaHNi
	 teOAt95GmnZiIMfTwQ9EAu0GO/ldTrYBv5PsItaK+l/bXKx9EssMnx+e1j8lVqV4aK
	 5LYLpgkWkCR7V/xTnk8CNRW3zbTbtPr4wq9mQewo=
Date: Tue, 10 Jun 2025 10:47:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] media: imx-mipi-csis: Fix field alignment in
 register dump
Message-ID: <20250610074739.GC24465@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
 <12685072.O9o76ZdvQC@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12685072.O9o76ZdvQC@steina-w>

On Tue, Jun 10, 2025 at 09:12:26AM +0200, Alexander Stein wrote:
> Am Montag, 9. Juni 2025, 01:58:34 CEST schrieb Laurent Pinchart:
> > Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
> > MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
> > register name length, resulting in misalignment of names printed in the
> > kernel log. Fix it.
> 
> Does this warrant a Fixes tag? Anyway

I would then have to Cc stable as per the media subsystem rules, and I
really don't think this patch warrants being backported to stable
kernels.

> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index d59666ef7545..b652d59851c2 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -895,7 +895,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> >  
> >  	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> >  		cfg = mipi_csis_read(csis, registers[i].offset);
> > -		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
> > +		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
> >  	}
> >  
> >  	pm_runtime_put(csis->dev);

-- 
Regards,

Laurent Pinchart

