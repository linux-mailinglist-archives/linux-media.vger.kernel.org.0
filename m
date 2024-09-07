Return-Path: <linux-media+bounces-17878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9519970361
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 19:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC522838DB
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 17:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1528249637;
	Sat,  7 Sep 2024 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cQCkM4+L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782DB28FC;
	Sat,  7 Sep 2024 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730361; cv=none; b=lfSjIKKQg8a//8bPhOU337S1JsC495H0qteKRtD18xvY78e+DJSNtrt39++Igde49p3O/mHQCizZ+eMyHfSOgDo344xCgqSJI0jVuo8Hd5OB8Nzcp9ckNTa02GRYRRKG8h4GdedsGbK+ZLJ5ctC3s4SRWvN+6w1U9EtwoUOgcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730361; c=relaxed/simple;
	bh=vnUnh9s7HkwYRNQ1rCpFGD3Gx2eWs0ugMiU4/08C0rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV56etPrdFiG745o3MfK/eW9HBHXenteK/Y/Ld7TXZP+Y1Als/YnKIHY8VwyUIGZBSB+GlPIdtHDJEz72MtfUCNzsyONA+5H9Z1gSXnwX4XeAgQjpvExeeZsGLdK/4tdR1NDd01XT0lMkzNk+jPRXyCAY0f7/Md0l782Kq6ZLLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cQCkM4+L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 451C882E;
	Sat,  7 Sep 2024 19:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725730281;
	bh=vnUnh9s7HkwYRNQ1rCpFGD3Gx2eWs0ugMiU4/08C0rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQCkM4+L38R6p6Ha6VLJKWahOm3/uGPQ1Zui3X++jtaNpDnSk/PpelmqdzvswX79G
	 vxkVUj6aX+hY2CujLtrP7hnWUeoIGOrDSvFVcHk4Vj5I96FudP8gaC1vlwF9a2pMt3
	 t3uAJfYzliFLrc2b/DtuyxoZCg1P2FBGtWMFtbtE=
Date: Sat, 7 Sep 2024 20:32:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst
 max length
Message-ID: <20240907173232.GE15491@pendragon.ideasonboard.com>
References: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
 <20240906235948.GH27086@pendragon.ideasonboard.com>
 <TY3PR01MB113461F40823C3404EB4E61AA869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB113461F40823C3404EB4E61AA869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju,

On Sat, Sep 07, 2024 at 07:41:24AM +0000, Biju Das wrote:
> On Saturday, September 7, 2024 1:00 AM, Laurent Pinchart wrote:
> > On Thu, Sep 05, 2024 at 12:18:26PM +0100, Biju Das wrote:
> > > As per the hardware manual section 35.2.3.26 'AXI Master Transfer
> > > Setting Register for CRU Image Data;, it is mentioned that to improve
> > > the transfer
> > 
> > s/;/'/
> 
> Oops, Will fix this in next version.
> 
> > > performance of CRU, it is recommended to use AXILEN value '0xf' for
> > > AXI burst max length setting for image data.
> > >
> > > Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 374dc084717f..d17e3eac4177 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -52,6 +52,11 @@
> > >  #define AMnMBS				0x14c
> > >  #define AMnMBS_MBSTS			0x7
> > >
> > > +/* AXI Master Transfer Setting Register for CRU Image Data */
> > > +#define AMnAXIATTR			0x158
> > > +#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> > > +#define AMnAXIATTR_AXILEN		(0xf)
> > > +
> > >  /* AXI Master FIFO Pointer Register for CRU Image Data */
> > >  #define AMnFIFOPNTR			0x168
> > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > @@ -278,6 +283,7 @@ static void rzg2l_cru_fill_hw_slot(struct
> > > rzg2l_cru_dev *cru, int slot)  static void
> > > rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)  {
> > >  	unsigned int slot;
> > > +	u32 amnaxiattr;
> > >
> > >  	/*
> > >  	 * Set image data memory banks.
> > > @@ -287,6 +293,11 @@ static void rzg2l_cru_initialize_axi(struct
> > > rzg2l_cru_dev *cru)
> > >
> > >  	for (slot = 0; slot < cru->num_buf; slot++)
> > >  		rzg2l_cru_fill_hw_slot(cru, slot);
> > > +
> > > +	/* Set AXI burst max length to recommended setting */
> > > +	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
> > > +	amnaxiattr |= AMnAXIATTR_AXILEN;
> > > +	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > 
> > It would be more efficient to just write
> > 
> > 	rzg2l_cru_write(cru, AMnAXIATTR, AMnAXIATTR_AXILEN);
> 
> I thought about that. But then re-reading register description changed the mind because
> of the below bits
> 
> {9,8} — 01b R Reserved:
> When read, the initial value is read. When writing, be sure to write the initial value.
> Operation is not guaranteed if a value other than the initial value is written.
> 
> {6,4} — 101b R Reserved:
> When read, the initial value is read. When writing, be sure to write the initial value.
> Operation is not guaranteed if a value other than the initial value is written.
> 
> Also, bits {27,24}, {22,16} and {13,12} -0b :
> 
> It is mentioned that
> When read, the initial value is read. When writing, be sure to write the initial value.
> operation is not guaranteed if a value other than the initial value is written.

Let's keep the code as-is then. I'll fix the typo in (and reflow) the
commit message myself, no need to resubmit.

> > the hardware manual however doesn't make it clear if this is safe or not. The rest of the register is
> > reserved, and writes as documented as ignored, but the reset value is non-zero. If it's not safe to
> > write the reserved bits to 0,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >  }
> > >
> > >  static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool
> > > *input_is_yuv,

-- 
Regards,

Laurent Pinchart

