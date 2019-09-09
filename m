Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E872CADDDC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 19:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391393AbfIIRM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 13:12:57 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40692 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391274AbfIIRM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 13:12:57 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89HCsgj003069;
        Mon, 9 Sep 2019 12:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568049174;
        bh=Qo7EHdIh7ZQkhD2ozFDd6uAbRhKY0yNrS7eb0wqVc2o=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=PR+Ffa7ASiwL02DtHXnWGBpKjzdQnFkiEc18lv8XLKf+a5k3tSbnAZ4ABYlSyOPvV
         A0q842KiyYzfW6Oia1K6pXMm5pFj3AS2hOXTxhLi6IVyHfgOYamA6cWqVKOHI4P4U+
         BlESWLgtPdh4LhqBJo1QRw3yA1f3BjU7lTspVQYQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89HCsNS086186
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 12:12:54 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 12:12:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 12:12:53 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x89HCsqq033234;
        Mon, 9 Sep 2019 12:12:54 -0500
Date:   Mon, 9 Sep 2019 12:14:57 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Joe Perches <joe@perches.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 09/13] media: am437x-vpfe: fix function trace debug log
Message-ID: <20190909171457.louslicqvyv4vpde@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-10-bparrot@ti.com>
 <ec66e477095bcddb86ffcc7ca10d3e0bbe72f943.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec66e477095bcddb86ffcc7ca10d3e0bbe72f943.camel@perches.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Joe Perches <joe@perches.com> wrote on Mon [2019-Sep-09 09:54:56 -0700]:
> On Mon, 2019-09-09 at 11:27 -0500, Benoit Parrot wrote:
> > checkpatch.pl nows reports several:
> > WARNING: Prefer using '"%s...", __func__' to using '<function name>',
> > this function's name, in a string
> > 
> > So fix these for the whole driver.
> 
> Most of these seem to be function tracing comments
> that should probably be removed instead.
> 
> The generic kernel facility ftrace works well.

Yeah you are probably right, I should just remove them.
My own laziness prevented me earlier... it's always easier to just enable
debug dynamically in the driver then trying to remember how to use ftrace :)
I obviously don't use often enough.

Benoit

> 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> []
> > @@ -466,7 +466,7 @@ static void vpfe_ccdc_config_ycbcr(struct vpfe_ccdc *ccdc)
> >  	struct ccdc_params_ycbcr *params = &ccdc->ccdc_cfg.ycbcr;
> >  	u32 syn_mode;
> >  
> > -	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_ycbcr:\n");
> > +	vpfe_dbg(3, vpfe, "%s:\n", __func__);
> 
> Remove this instead
> 
> >  	/*
> >  	 * first restore the CCDC registers to default values
> >  	 * This is important since we assume default values to be set in
> > @@ -598,7 +598,7 @@ static void vpfe_ccdc_config_raw(struct vpfe_ccdc *ccdc)
> >  	unsigned int syn_mode;
> >  	unsigned int val;
> >  
> > -	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_raw:\n");
> > +	vpfe_dbg(3, vpfe, "%s:\n", __func__);
> 
> here too, etc...
> 
> 
