Return-Path: <linux-media+bounces-19987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3C9A62CD
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 12:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B7BDB25809
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9AA1E47A2;
	Mon, 21 Oct 2024 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v6extO5t"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2091E5037;
	Mon, 21 Oct 2024 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506362; cv=none; b=ont77Cw5qYZprGVinImlhyR8t4Iqax9V7IWkvo2hm3EaAooWSUREtcBTu53kLFTp7iFdCk9rM571Dn+WKydw2XaeZm72XsDqGCX1+k4RyNWzpJl9jTROffNE2Ke6Cbb/3o5DLx7z6lODTzBhTu3kXA/cTwtSIG/iqW9KJPbZBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506362; c=relaxed/simple;
	bh=vJJIyv3du6uqXZuTonm8yPv8JZERNWLTf1QmoDfjkz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F50X1Fp4MRVAWaYJoZANAsPw1VWoD1iwOpxDsG7yyRCcEa8Wi2sQcrNR7Hb8JFv8DuH9EMW1Mchy19MYaGOUo21AaeZWkqO2Hs7j+8E6+sWxk02pmy8+ca1Ri8JoEoPREs+44re8UAOBJAZLAl4hPsQFkO5ybKG85TYtP0v1rQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v6extO5t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C30111779;
	Mon, 21 Oct 2024 12:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729506253;
	bh=vJJIyv3du6uqXZuTonm8yPv8JZERNWLTf1QmoDfjkz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v6extO5t9XutNgmJA126M6VuZlNn3tpK4fNt2T0K8gaE/ASsPtM3RiZtdNhHKLyom
	 ZHBej9sTht4sAV0N2WW+LVNL0ZnG/i6sNWff+EZNbqttBwWL5rXl6hlZgVhzTW15A0
	 d3/4qHFl+uu0eN1b5NaAcAtdJjlwyN7dWeSMKo6k=
Date: Mon, 21 Oct 2024 13:25:53 +0300
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
Message-ID: <20241021102553.GD31131@pendragon.ideasonboard.com>
References: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
 <20240906235948.GH27086@pendragon.ideasonboard.com>
 <TY3PR01MB113461F40823C3404EB4E61AA869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240907173232.GE15491@pendragon.ideasonboard.com>
 <TY3PR01MB113462B9B0092FCD5238A1CB286432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB113462B9B0092FCD5238A1CB286432@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Mon, Oct 21, 2024 at 09:24:14AM +0000, Biju Das wrote:
> Hi Laurent,
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Saturday, September 7, 2024 6:33 PM
> > Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst max length
> > 
> > Hi Biju,
> > 
> > On Sat, Sep 07, 2024 at 07:41:24AM +0000, Biju Das wrote:
> > > On Saturday, September 7, 2024 1:00 AM, Laurent Pinchart wrote:
> > > > On Thu, Sep 05, 2024 at 12:18:26PM +0100, Biju Das wrote:
> > > > > As per the hardware manual section 35.2.3.26 'AXI Master Transfer
> > > > > Setting Register for CRU Image Data;, it is mentioned that to
> > > > > improve the transfer
> > > >
> > > > s/;/'/
> > >
> > > Oops, Will fix this in next version.
> > >
> > > > > performance of CRU, it is recommended to use AXILEN value '0xf'
> > > > > for AXI burst max length setting for image data.
> > > > >
> > > > > Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 11 +++++++++++
> > > > >  1 file changed, 11 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > index 374dc084717f..d17e3eac4177 100644
> > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > @@ -52,6 +52,11 @@
> > > > >  #define AMnMBS				0x14c
> > > > >  #define AMnMBS_MBSTS			0x7
> > > > >
> > > > > +/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > > +#define AMnAXIATTR			0x158
> > > > > +#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> > > > > +#define AMnAXIATTR_AXILEN		(0xf)
> > > > > +
> > > > >  /* AXI Master FIFO Pointer Register for CRU Image Data */
> > > > >  #define AMnFIFOPNTR			0x168
> > > > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > > > @@ -278,6 +283,7 @@ static void rzg2l_cru_fill_hw_slot(struct
> > > > > rzg2l_cru_dev *cru, int slot)  static void
> > > > > rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)  {
> > > > >  	unsigned int slot;
> > > > > +	u32 amnaxiattr;
> > > > >
> > > > >  	/*
> > > > >  	 * Set image data memory banks.
> > > > > @@ -287,6 +293,11 @@ static void rzg2l_cru_initialize_axi(struct
> > > > > rzg2l_cru_dev *cru)
> > > > >
> > > > >  	for (slot = 0; slot < cru->num_buf; slot++)
> > > > >  		rzg2l_cru_fill_hw_slot(cru, slot);
> > > > > +
> > > > > +	/* Set AXI burst max length to recommended setting */
> > > > > +	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
> > > > > +	amnaxiattr |= AMnAXIATTR_AXILEN;
> > > > > +	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > > >
> > > > It would be more efficient to just write
> > > >
> > > > 	rzg2l_cru_write(cru, AMnAXIATTR, AMnAXIATTR_AXILEN);
> > >
> > > I thought about that. But then re-reading register description changed
> > > the mind because of the below bits
> > >
> > > {9,8} — 01b R Reserved:
> > > When read, the initial value is read. When writing, be sure to write the initial value.
> > > Operation is not guaranteed if a value other than the initial value is written.
> > >
> > > {6,4} — 101b R Reserved:
> > > When read, the initial value is read. When writing, be sure to write the initial value.
> > > Operation is not guaranteed if a value other than the initial value is written.
> > >
> > > Also, bits {27,24}, {22,16} and {13,12} -0b :
> > >
> > > It is mentioned that
> > > When read, the initial value is read. When writing, be sure to write the initial value.
> > > operation is not guaranteed if a value other than the initial value is written.
> > 
> > Let's keep the code as-is then. I'll fix the typo in (and reflow) the commit message myself, no need
> > to resubmit.
> 
> Gentle ping. Not sure You missed this??

I've sent a pull request yesterday :-)

> > > > the hardware manual however doesn't make it clear if this is safe or
> > > > not. The rest of the register is reserved, and writes as documented
> > > > as ignored, but the reset value is non-zero. If it's not safe to
> > > > write the reserved bits to 0,
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > >  }
> > > > >
> > > > >  static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool
> > > > > *input_is_yuv,

-- 
Regards,

Laurent Pinchart

