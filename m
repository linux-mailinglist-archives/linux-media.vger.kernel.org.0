Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6841FADDCF
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 19:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfIIRKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 13:10:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59168 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfIIRKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 13:10:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89HACwf045302;
        Mon, 9 Sep 2019 12:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568049012;
        bh=jaOPtnrJZSC4bXQdecoO/P4/6xRau5GoMuR2a3wmutM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=P1CsGmmmU7qjx21v7EhdOv/aOMOUWSBcXkY6WIBGovaKHu+0L/14dG2KR37gwEMN5
         4Qt6UjcsIkEUgNWHaYzSzqR+sVjB//J0RYt/sTQtdGpMHWHVMQiNoM4Lu8WdKLyKxO
         Gh3XIghJ4uIneq5dYrHwDpM2fEa8AccdHZ45DWfs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89HACuH043637;
        Mon, 9 Sep 2019 12:10:12 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 12:10:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 12:10:12 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x89HACNZ030302;
        Mon, 9 Sep 2019 12:10:12 -0500
Date:   Mon, 9 Sep 2019 12:12:15 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Joe Perches <joe@perches.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 10/13] media: am437x-vpfe: Remove print_fourcc helper
Message-ID: <20190909171215.2cyiulubzxcjqmf7@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-11-bparrot@ti.com>
 <7d870b0119afa378dc68c710670b9b550ef5bdd4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d870b0119afa378dc68c710670b9b550ef5bdd4.camel@perches.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Joe Perches <joe@perches.com> wrote on Mon [2019-Sep-09 09:39:37 -0700]:
> On Mon, 2019-09-09 at 11:27 -0500, Benoit Parrot wrote:
> > print_fourcc helper function was used for debug log the
> > convert a pixel format code into its readable form for display
> > purposes. But since it used a single static buffer to perform
> > the conversion this might lead to display format issue when more
> > than one instance was invoked simultaneously.
> > 
> > It turns out that print_fourcc can be safely replace by using
> > "%4.4s" instead and casting the pointer to the fourcc code
> > into a (char *).
> []
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> []
> > @@ -221,20 +221,6 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
> []
> > @@ -700,8 +686,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
> >  {
> >  	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
> >  
> > -	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
> > -		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
> > +	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4.4s\n",
> > +		 __func__, ccdc->ccdc_cfg.if_type, (char *)&pixfmt);
> 
> 
> To avoid any possible defect in the content of pixfmt, it's
> probably better to use vsprintf extension "%4pE", &pixfmt
> see: Documentation/core-api/printk-formats.rst
> 
> 	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4pE\n",
> 		 __func__, ccdc->ccdc_cfg.if_type, &pixfmt);
> 

Thanks Joe, I was not aware of this feature.
I'll update this patch.

Benoit

> >  
> >  	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
> >  		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
> > @@ -989,8 +975,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
> >  
> >  	vpfe_dbg(2, vpfe, "%s:\n", __func__);
> >  
> > -	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
> > -		print_fourcc(vpfe->v_fmt.fmt.pix.pixelformat));
> > +	vpfe_dbg(1, vpfe, "pixelformat: %4.4s\n",
> > +		 (char *)&vpfe->v_fmt.fmt.pix.pixelformat);
> 
> 	vpfe_dbg(1, vpfe, "pixelformat: %4pE\n",
> 		 &vpfe->v_fmt.fmt.pix.pixelformat);
> 
> etc...
> 
> 
