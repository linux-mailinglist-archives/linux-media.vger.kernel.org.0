Return-Path: <linux-media+bounces-16651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D895CC41
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 14:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE2C28471C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261D8185935;
	Fri, 23 Aug 2024 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JbescCSi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71EA9457;
	Fri, 23 Aug 2024 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724415611; cv=none; b=LDQ6I+oGwmlZNKd7sGS6cH7xxVNj422eqlnRVoWMvippwOco1uWg2B7Jr+GDCnLpYeyeNLOrfnx1EsIrpyjqXMObGkBIt6A+iwt14FG9jukZyDB9E8/ocbMq1awBKvo1dVNqPBKWUr0Nc8XMZnqizPwaWYHJSABWLlscmk+aADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724415611; c=relaxed/simple;
	bh=ZuTS7ukeYfPjZ1kjzNYzSS+Vmt2wcWpuWgPNNaf4GDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0wyW3YCGdxC14Ak6Fu1Hv5B64CHJw/K3OpZvpmWfSBM0NI56kXCP2KpgHPFSYz5TqntcuzJOXNAciH0KfR+0OaXJho3Wnashenz30LhyixgD0KRBDm7uWFue58eQ/nL675JzaDrnBLLoEwwAI5w7CCmp/1Xk2iahTL5lPaw3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JbescCSi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8C06497;
	Fri, 23 Aug 2024 14:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724415538;
	bh=ZuTS7ukeYfPjZ1kjzNYzSS+Vmt2wcWpuWgPNNaf4GDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbescCSijOlW8HS3wETJILxt7OhFJL2gonxj0JTIAMjC9cDhr06YdxtoQrT0wEDW+
	 gcbEseuU3bJqO3NN89A8M7taTsPgee8TR8aLsi91QcCtY93nMr/dofs4HMtGsWjc7E
	 owVGVNPBHB/8AUY5LaNqaYP2x5Q7kpDblr8H70d0=
Date: Fri, 23 Aug 2024 15:19:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing
 MODULE_DEVICE_TABLE
Message-ID: <20240823121959.GA26098@pendragon.ideasonboard.com>
References: <20240731164935.308994-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB113469C7FEF9FAB6394992ACF86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113469C7FEF9FAB6394992ACF86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Fri, Aug 23, 2024 at 08:58:09AM +0000, Biju Das wrote:
> Hi Media folks,
> 
> Gentle ping. Is this simple fix OK to everyone?

I've added the patch to my tree and will include it in my next pull
request.

> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Wednesday, July 31, 2024 5:50 PM
> > Subject: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing MODULE_DEVICE_TABLE
> > 
> > The rzg2l-csi2 driver can be compiled as a module, but lacks
> > MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> > Fix this.
> > 
> > Fixes: 51e8415e39a9 ("media: platform: Add Renesas RZ/G2L MIPI CSI-2 receiver driver")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index e68fcdaea207..c7fdee347ac8 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -865,6 +865,7 @@ static const struct of_device_id rzg2l_csi2_of_table[] = {
> >  	{ .compatible = "renesas,rzg2l-csi2", },
> >  	{ /* sentinel */ }
> >  };
> > +MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
> > 
> >  static struct platform_driver rzg2l_csi2_pdrv = {
> >  	.remove_new = rzg2l_csi2_remove,

-- 
Regards,

Laurent Pinchart

