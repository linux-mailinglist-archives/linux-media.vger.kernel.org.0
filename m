Return-Path: <linux-media+bounces-30947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C92A9AEC9
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D8D1784B1
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FB227BF80;
	Thu, 24 Apr 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pjExi7N8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91D38382;
	Thu, 24 Apr 2025 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500725; cv=none; b=JbbQXwi6agVwe2TqQPFcSmhs7BE2iY+gFsLZl4JAE8EeXyisaL2HLby0l205BHdq/dQmeYTN6pbzCf4T4Y/pEvIpvYU10bU7pO7FwIFUXKYdW1J86X7zrur7EXKgurXo/ML5BLkZBwRyQnEmPzTuk1JyRriuW9BLXWfu2NWashg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500725; c=relaxed/simple;
	bh=2XhD6FqDd1wiqzdkb+ZgjHdldAfhS+YW3cSP47HMoSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrgCex4dpJz8yDwKB1XAlrscdPsZx8RtgaQq3jmgcx37ctXP0FRB/jfdDmzHy2BK57IfIY51B+TIAI68TH3jsQ2/f1POjH76mImm1ZvJx+OiAIpQYflRX7/BpIzeKhsjluXjHUjYK6NdhXH1o7PkGyhy7DNkT350ZTgAyTY2rgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pjExi7N8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C41F16A;
	Thu, 24 Apr 2025 15:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745500704;
	bh=2XhD6FqDd1wiqzdkb+ZgjHdldAfhS+YW3cSP47HMoSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjExi7N81OEXV0a7N+aD6ffr0TUUO5vCH4zqVtZWh/UHOqj22wyHSbn9kQ3TIMnzF
	 +i6P+W0kk+q0tbJGFIRPr/Td8KNeEvzwfzO5IRZjpqbIYB1Bq8kfxhfvUUsZS5eLe8
	 +6tmQHrRzlf4UkgDLv2r5dLhbsHapCyndLwKRMMw=
Date: Thu, 24 Apr 2025 15:18:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] media: vsp1: Add VSPX support
Message-ID: <wjdbgsasdvocglz3qbqnp3rc6tedlxuxlqsv3rhlad2u2y56ll@5irs2bu2647k>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
 <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
 <20250423211035.GA5879@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423211035.GA5879@pendragon.ideasonboard.com>

Hi Laurent

On Thu, Apr 24, 2025 at 12:10:35AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Apr 01, 2025 at 04:22:05PM +0200, Jacopo Mondi wrote:
> > Add support for VSPX, a specialized version of the VSP2 that
> > transfer data to the ISP. The VSPX is composed by two RPF units
>
> It seems you forgot to take comments from v2 into account.
>

Are you referring to the commit message alone ? Or is there anything
else ?

> > to read data from external memory and an IIF instance that performs
> > transfer towards the ISP.
> >

[snip]

>
> > + *		 buffer CPU-mapped address and the bus address
> > + *
> > + * Return: %0 on success or a negative error code on failure
> > + */
> > +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> > +			   struct vsp1_isp_buffer_desc *buffer_desc)
> > +{
> > +	struct device *bus_master = vsp1_isp_get_bus_master(dev);
> > +
> > +	if (IS_ERR_OR_NULL(bus_master))
> > +		return -ENODEV;
> > +
> > +	buffer_desc->cpu_addr = dma_alloc_coherent(bus_master, size,
> > +						   &buffer_desc->dma_addr,
> > +						   GFP_KERNEL);
> > +	if (IS_ERR_OR_NULL(buffer_desc->cpu_addr))
> > +		return -EINVAL;
>
> As commented by Alok, this should be
>
> 	if (!buffer_desc->cpu_addr)
> 		return -ENOMEM;

Done, thanks Alok for the comment

>
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(vsp1_isp_alloc_buffers);
>
> Where is the buffer freed ?
>

Right, I presume a call to dma_free_coherent() is needed in the
vb2 buf_cleanup() operation call path ?


