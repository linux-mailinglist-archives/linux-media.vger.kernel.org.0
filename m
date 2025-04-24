Return-Path: <linux-media+bounces-30949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BDA9AEF3
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A81197AF5DA
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357BA27CB21;
	Thu, 24 Apr 2025 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8zNSEeG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FB27C17E;
	Thu, 24 Apr 2025 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501241; cv=none; b=Uk9xAu/9PG3CuNLycS8aj6nGb8uquW7kqK1KJvjwbbLWaoYXps3UBzKQP9GfcRhHF7qgrrEcUcWVH+qm+Z+hspp9iU9Ay2X5p+09SrQeWtmou8lgehbYaQ6VYSAPz1ZMxY+Gly0lBbEmjYZjuBnC4AjFj7pyv8TkB5H3iw/MInE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501241; c=relaxed/simple;
	bh=juWmB2wmoWUAzGpKtaJZ1G98dF7aTBqWou/BTuHXsnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg695ahXtqACTiCoqpd7qGQvCNzY+S4iFZcfXPqrlfUzXBJctUYOM7XqpKCNebPazTv7TIVwT2WAVSSxiIQlCLrwlpb2MAeLsRsLJOg76weUmPbRifbrvVFCQ/Y10YVD9reVzbaFaJoQPx31XizdjNkdrit9o2PCrvZtx4ugdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8zNSEeG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18E0B63;
	Thu, 24 Apr 2025 15:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745501235;
	bh=juWmB2wmoWUAzGpKtaJZ1G98dF7aTBqWou/BTuHXsnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8zNSEeGRaL4wZwBdDD+rdpi+kXykqaAROIdbMs/VYBeITeb8Jm0r64BhLwGVCwAf
	 W6WWQmc0d8SmZyk65RLVprvrRBZs2DXANRtWdo3OcDLntBvQQO0Uf0XNMEp5bwnPW/
	 eOA8lLDOgAk/z9uyfe3r+Lx+u3X0gRXBBAlLLL20=
Date: Thu, 24 Apr 2025 16:27:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] media: vsp1: Add VSPX support
Message-ID: <20250424132712.GC18085@pendragon.ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
 <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
 <20250423211035.GA5879@pendragon.ideasonboard.com>
 <wjdbgsasdvocglz3qbqnp3rc6tedlxuxlqsv3rhlad2u2y56ll@5irs2bu2647k>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <wjdbgsasdvocglz3qbqnp3rc6tedlxuxlqsv3rhlad2u2y56ll@5irs2bu2647k>

On Thu, Apr 24, 2025 at 03:18:23PM +0200, Jacopo Mondi wrote:
> On Thu, Apr 24, 2025 at 12:10:35AM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 01, 2025 at 04:22:05PM +0200, Jacopo Mondi wrote:
> > > Add support for VSPX, a specialized version of the VSP2 that
> > > transfer data to the ISP. The VSPX is composed by two RPF units
> >
> > It seems you forgot to take comments from v2 into account.
> >
> 
> Are you referring to the commit message alone ? Or is there anything
> else ?

Yes, just the commit message.

> > > to read data from external memory and an IIF instance that performs
> > > transfer towards the ISP.
> > >
> 
> [snip]
> 
> > > + *		 buffer CPU-mapped address and the bus address
> > > + *
> > > + * Return: %0 on success or a negative error code on failure
> > > + */
> > > +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> > > +			   struct vsp1_isp_buffer_desc *buffer_desc)
> > > +{
> > > +	struct device *bus_master = vsp1_isp_get_bus_master(dev);
> > > +
> > > +	if (IS_ERR_OR_NULL(bus_master))
> > > +		return -ENODEV;
> > > +
> > > +	buffer_desc->cpu_addr = dma_alloc_coherent(bus_master, size,
> > > +						   &buffer_desc->dma_addr,
> > > +						   GFP_KERNEL);
> > > +	if (IS_ERR_OR_NULL(buffer_desc->cpu_addr))
> > > +		return -EINVAL;
> >
> > As commented by Alok, this should be
> >
> > 	if (!buffer_desc->cpu_addr)
> > 		return -ENOMEM;
> 
> Done, thanks Alok for the comment
> 
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vsp1_isp_alloc_buffers);
> >
> > Where is the buffer freed ?
> >
> 
> Right, I presume a call to dma_free_coherent() is needed in the
> vb2 buf_cleanup() operation call path ?

It can be done by the ISP driver (directly, or through a function
exported by the VSP driver, to match vsp1_isp_alloc_buffers()), or be
done by the VSP driver. The important part is to document the design
properly.

-- 
Regards,

Laurent Pinchart

