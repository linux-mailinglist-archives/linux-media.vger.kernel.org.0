Return-Path: <linux-media+bounces-17875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8DF970211
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 13:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A6E280FBB
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 11:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3520415B552;
	Sat,  7 Sep 2024 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HHc8+LeH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAD7159583;
	Sat,  7 Sep 2024 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709745; cv=none; b=REdTgF0nwZFX3YrADp+tAg59xipvAqmxQRBhZDDdri0IE/f+TOW4Qgnu+DDie0j4Zf+nMbxrkdIRG9lnIMUBJbfUL7BNmEx0Es5DbvtujiBsKtLFyR6UrPb4+IKTNvYBRYvMNPydPLBjNf7jtugLNlQ9DFV3G9tjGWXKJ+TFvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709745; c=relaxed/simple;
	bh=eLBXJetdD5j03P1c9yViblj7mq5YY1zzUGq/BpZWIbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djOgQsVeD5K54F5y8NGbg8gf4Wr1Bt34tphlWhx7tbuXDV3J9Lsi/E8dZnR9nTRYatJWBOxaQYMlq+6K2aRSGR5APLX8RSGQP/gT+69vmmFLh+nyaU0UA+EjSkeTWN1XwpSOEJRjhRjGgO3fq5zMVG8fMuILsYWwxoZTbVq0L0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HHc8+LeH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59B603EA;
	Sat,  7 Sep 2024 13:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725709667;
	bh=eLBXJetdD5j03P1c9yViblj7mq5YY1zzUGq/BpZWIbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHc8+LeHnN1GjD5AW+5YrUbbXz91AVcVT7rKrVoodmNvGwXRvBdXGf0cDmWQHjQxH
	 664OGRRbcK5ZY8EPfBqZU01iTxu4PDFzfApqPRXPR/fUM870CXBFH44SvJukwrXbY1
	 58R0NwdANEBE+vipj/slN5cuL7qtCZcVKKWuC13Q=
Date: Sat, 7 Sep 2024 14:48:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Fix the comment
 in rzg2l_cru_start_streaming_vq()
Message-ID: <20240907114858.GC15491@pendragon.ideasonboard.com>
References: <20240905112508.160560-1-biju.das.jz@bp.renesas.com>
 <20240907000434.GI27086@pendragon.ideasonboard.com>
 <TY3PR01MB1134601C75125427794EB493D869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134601C75125427794EB493D869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Sat, Sep 07, 2024 at 07:28:13AM +0000, Biju Das wrote:
> Hi Laurent,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Saturday, September 7, 2024 1:05 AM
> > Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Fix the comment in
> > rzg2l_cru_start_streaming_vq()
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Sep 05, 2024 at 12:25:05PM +0100, Biju Das wrote:
> > > Replace "buffer." -> "buffer", for consistency with rest of the
> > > comment blocks in rzg2l_cru_start_streaming_vq().
> > 
> > I usually go the other way around, sentences should end with a period.
> > You can go either way as it's your driver.
> 
> Ok, I will send next version with sentences end with a period.

It's really up to you, and I mean it :-) What I favour the most is
consistency. I personally think sentences are better with a trailing
period, but if you prefer considering all those comments as titles and
drop the period, I'm OK with it too. As long as it doesn't conflict with
subsystem-wide rules, your driver, your preferences.

> > > Reported-by: Pavel Machek <pavel@denx.de>
> > > Closes: https://lore.kernel.org/all/ZtWNFuw70nkB37EK@duo.ucw.cz/
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > This patch have merge dependency on [1] [1]
> > > https://lore.kernel.org/all/20240826110740.271212-1-biju.das.jz@bp.ren
> > > esas.com/
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index bbf4674f888d..d17e3eac4177 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -648,7 +648,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> > >  		goto assert_aresetn;
> > >  	}
> > >
> > > -	/* Allocate scratch buffer. */
> > > +	/* Allocate scratch buffer */
> > >  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
> > >  					  &cru->scratch_phys, GFP_KERNEL);
> > >  	if (!cru->scratch) {

-- 
Regards,

Laurent Pinchart

