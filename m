Return-Path: <linux-media+bounces-40799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBD9B3219A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 19:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9DB5C755A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6034531352C;
	Fri, 22 Aug 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OPKj+SHV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3420A5F3;
	Fri, 22 Aug 2025 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755884413; cv=none; b=EbvnrfJfpXCG74sJnAtqtDrtxftzOxmAStsnDi5gCniboT69QYIWVfvUJtwYgLZFGtyhm0ynGC+fhtiu5aAmLgqcGySX94apAI4cs5hNe9vDdLF9N+QTITdpjFTYTKW4J3CovmwdnUtIH2vXzaeAOJzGjC97m/ULBKRGNc9WXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755884413; c=relaxed/simple;
	bh=wOYlUElulsIPCYoWODQpF+Pjb0jgLY3gHhL6O/KuWuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFImfy1txKHKrI+KQzJrEyOs0FtIKYiu49UrzsYVpcQlkzFjApH+aXA0Jw76vWBmZWEBcZkD59iXfdSjySevRbvStoZgADIJNkoDRbdM61XAzJpYSqbfBgGZlCy/z9LW7DVU/xU3BbNQ4q1p6tFgLmZAzTVGKsEwesDx64TvL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OPKj+SHV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.22.192.49])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 46CB08CB;
	Fri, 22 Aug 2025 19:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755884348;
	bh=wOYlUElulsIPCYoWODQpF+Pjb0jgLY3gHhL6O/KuWuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPKj+SHVRjF13GMdYN7YsHuLVasJf20VQTKuEF6V9MpKhYPgpfPaHBeaTznU49STX
	 i0rnH0/sSfuQgJ99DC8ifD0aPGI21Ik/oYpbj0Q9XcsDCt+YgqXnrsAgtgT6Wt8Wh2
	 XizvmeVhxRs0374t1Raxw0pXM2vHda1QX/ikCTsY=
Date: Fri, 22 Aug 2025 19:39:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 12/13] media: imx-mipi-csis: Initial support for
 multiple output channels
Message-ID: <20250822144341.GB22572@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
 <aKh8NG1lHKyAEoct@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKh8NG1lHKyAEoct@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Aug 22, 2025 at 10:18:28AM -0400, Frank Li wrote:
> On Fri, Aug 22, 2025 at 03:27:32AM +0300, Laurent Pinchart wrote:
> > Some CSIS instances feature more than one output channel. Update
> > register macros accordingly, parse the number of channels from the
> > device tree, and update register dumps and event counters to log
> > per-channel data.
> >
> > Support for routing virtual channels and data types to output channels
> > through the subdev internal routing API will come later.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Update more per-channel registers
> > - Update commit message
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
> >  1 file changed, 152 insertions(+), 87 deletions(-)
> ...
> > +		return dev_err_probe(csis->dev, -EINVAL,
> > +				     "Invalid fsl,num-channels value\n");
> > +
> >  	return 0;
> >  }
> >
> > @@ -1444,10 +1511,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >
> >  	/* Parse DT properties. */
> >  	ret = mipi_csis_parse_dt(csis);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > +	if (ret < 0)
> >  		return ret;
> > -	}
> 
> I think this change is not belong to this patch.

The reason why this message is removed is because the
mipi_csis_parse_dt() function now prints error messages internally, so
this would be a duplicate.

> >
> >  	/* Acquire resources. */
> >  	csis->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
Regards,

Laurent Pinchart

