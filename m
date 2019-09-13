Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0989FB208A
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391069AbfIMNXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:23:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55284 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390909AbfIMNXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:23:01 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDMxhg074712;
        Fri, 13 Sep 2019 08:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568380980;
        bh=vnhD3PZ0mNE2hDulxxExCWGhochou6IDX6JVjee4zZo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Y9dbMQc0aE9/gKp7o4aKT4yxFvuv2bv5RTsbZG6T4voAXupV97yHdiktLJMPeHnCS
         u5W5jOcO2C3h8b44NbwSPPTu+dAkEvtzrFtoCCbfhtuWojinwtmbkehD+/w2QkIol1
         6J1Sc7IRV3IiYzDV7D6vH0U90p69qO9Y4xOrAvpA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDMxnS116313
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:22:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:22:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:22:59 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x8DDMxCB116905;
        Fri, 13 Sep 2019 08:22:59 -0500
Date:   Fri, 13 Sep 2019 08:25:04 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 02/13] media: am437x-vpfe: Fix missing first line
Message-ID: <20190913132504.sh5fpb4hrv5wqorp@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-3-bparrot@ti.com>
 <018a5f55-a750-c86d-da82-2b7c586cb33e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <018a5f55-a750-c86d-da82-2b7c586cb33e@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:00:08 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > Previous generation of this driver were hard coded to handle
> > encoder/decoder were the first line never contains any data and
> 
> were -> where
> 
> > was therefore always skipped, however when dealing with actual
> > camera sensor the first line is always present.
> 
> sensor -> sensors

I'll fix those.

Thanks

Benoit

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index ab959d61f9c9..0ecb75bf5abd 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -345,13 +345,9 @@ static void vpfe_ccdc_setwin(struct vpfe_ccdc *ccdc,
> >  	if (frm_fmt == CCDC_FRMFMT_INTERLACED) {
> >  		vert_nr_lines = (image_win->height >> 1) - 1;
> >  		vert_start >>= 1;
> > -		/* Since first line doesn't have any data */
> > -		vert_start += 1;
> >  		/* configure VDINT0 */
> >  		val = (vert_start << VPFE_VDINT_VDINT0_SHIFT);
> >  	} else {
> > -		/* Since first line doesn't have any data */
> > -		vert_start += 1;
> >  		vert_nr_lines = image_win->height - 1;
> >  		/*
> >  		 * configure VDINT0 and VDINT1. VDINT1 will be at half
> > 
> 
