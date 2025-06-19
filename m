Return-Path: <linux-media+bounces-35359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11588AE0A11
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927C616F5D9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F6D22D7A1;
	Thu, 19 Jun 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kelXxDEN"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946C21CA0C;
	Thu, 19 Jun 2025 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346184; cv=none; b=Mym0yARWnnWIuKrESoAHeqY8TDCJ85Ll1hphPXUpGnQevqbxPpiUvQIxKYua/s2fdlwbpsNKz27ea3+Zuig4ae3jyJebCtCSy1P3yZeMY6lepmJvdwGuulEWfdmL2OschlqMW6Jk4f4yFDhn/4OOdaJVbXFeF8hhlqF17pb63Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346184; c=relaxed/simple;
	bh=XqbG1XOiL6qsyT/mbeOSE4rpnh2l2DOkWH/Yqj+Cv9o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctMWdbjKAH3F+Hi2l3lxK0C26aH1tiPBQEqsYduT3bP/TABEepgfXqK1Hcab9NRQXeWIQwTR0a2Dud+HMZpnc7YA8bQpBc+xYcAuvU4qGpJQX5OFgvnqC51ZnpIz4qPPgNXT6N/8QpRZ0joYxRMz84GmOZHaY9Jq6lO0n3V+Hhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kelXxDEN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750346180;
	bh=XqbG1XOiL6qsyT/mbeOSE4rpnh2l2DOkWH/Yqj+Cv9o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kelXxDEN/QdNHQKOrU58SnIzr+lEWmj8NR0M3TjYD6c4pwh5GIDWFI6zPOOZq6hYe
	 w0olGxtPwgdjA2DGyxuRYVsrbZea59M+zKjKQ9X68Iwwp7UUE90klv8B8zWX4Uaq0f
	 YWPngXinkEPdoYEw5W0qp+lpTYMIE1P4beue8AMetujUtz74DwMlVzV7A7WRKDBZyw
	 NB+ZWX/7jK2YuH4+hIDKk8uDDFLgl/HrabTZeSbqPRwAu/7HbSI8CSQWcpmbsA5YVb
	 Ln1wJXr5BuZlzx+PjI38u8eaO87Ub10ebGV5WC3CdovpObP+75yuTB8+J/GtACu/BP
	 KGwyjN9daMBqg==
Received: from [IPv6:2606:6d00:17:b699::5ac] (unknown [IPv6:2606:6d00:17:b699::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D137217E09F0;
	Thu, 19 Jun 2025 17:16:16 +0200 (CEST)
Message-ID: <a66e3d27ee427710ed3de8ce89fa3aca40dced03.camel@collabora.com>
Subject: Re: [PATCH v4 4/6] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	20250325213303.826925-5-detlev.casanova@collabora.com
Cc: alchark@gmail.com, andrzej.p@collabora.com, cassel@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.perchanov@intel.com, 	dsimic@manjaro.org,
 ezequiel@vanguardiasur.com.ar, gregkh@linuxfoundation.org, 
	heiko@sntech.de, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, 
	jeanmichel.hautbois@ideasonboard.com, jonas@kwiboo.se,
 kernel@collabora.com, 	kieran.bingham@ideasonboard.com, krzk+dt@kernel.org,
 	laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, Jianfeng
 Liu	 <liujianfeng1994@gmail.com>, mchehab@kernel.org,
 naush@raspberrypi.com, 	robh@kernel.org, sakari.ailus@linux.intel.com,
 sebastian.reichel@collabora.com, 	tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com
Date: Thu, 19 Jun 2025 11:16:15 -0400
In-Reply-To: <5900973.DvuYhMxLoT@trenzalore>
References: <9f098eab-7b98-4827-8538-3cab0e8d7c63@gmail.com>
	 <5900973.DvuYhMxLoT@trenzalore>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 19 juin 2025 à 10:39 -0400, Detlev Casanova a écrit :
> Hi Jianfeng,
> 
> This patch set is now a  bit outdated. I will soon send a new version that you 
> can find at [1].
> That being said, you may be right. without an iommu, it would panic here 
> (although the iommu should really be used).

Let's make sure to test it in the next series. One should be able to comment out
the mmu node in the DT, and then it should work with CMA transparently.

thanks,
Nicolas

> 
> [1]: https://gitlab.collabora.com/detlev/linux/-/tree/add-vdpu381-and-383-to-rkvdec
> 
> Regards,
> Detlev
> 
> On Thursday, 19 June 2025 05:19:32 EDT Jianfeng Liu wrote:
> > Hi Detlev,
> > 
> > On Tue, 25 Mar 2025 17:22:20 -0400, Detlev Casanova wrote:
> >  >+        case RKVDEC2_ALLOC_SRAM:
> >  >+            virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
> >  >+
> >  >+            iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size)
> > 
> > I'm testing your patch with ffmpeg patched with v4l2-request patches[1],
> > and I usually
> > 
> > get kernel panic here. After checking rkvdec->iommu_domain before
> > running iommu_unmap,
> > 
> > I can pass fluster ffmpeg v4l2-request test. Here is my patch based on
> > your commit:
> > 
> > 
> > diff --git a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > index 75768561399..122bcdcebd4 100644
> > --- a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > +++ b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > @@ -681,8 +681,8 @@ static void rkvdec2_free_rcb(struct rkvdec2_ctx *ctx)
> >                  switch (ctx->rcb_bufs[i].type) {
> >                  case RKVDEC2_ALLOC_SRAM:
> >                          virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
> > -
> > -                       iommu_unmap(rkvdec->iommu_domain, virt_addr,
> > rcb_size);
> > +                       if (rkvdec->iommu_domain)
> > + iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);
> >                          gen_pool_free(ctx->dev->sram_pool, virt_addr,
> > rcb_size);
> >                          break;
> >                  case RKVDEC2_ALLOC_DMA:
> > 
> > 
> > [1] https://github.com/amazingfate/FFmpeg/commits/n6.1.1-new-patches/
> > 
> > 
> > Best regards,
> > 
> > Jianfeng
> 
> 
> 

