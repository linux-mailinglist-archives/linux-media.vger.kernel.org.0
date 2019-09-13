Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 861E9B207B
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391008AbfIMNWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:22:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47002 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390403AbfIMNWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:22:21 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDMJcm046056;
        Fri, 13 Sep 2019 08:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568380939;
        bh=rsDldiqxI+qAKB253v0WE/WupzEMG3LHNxO/kOjG69k=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=i/ZEF9ECC8GNViOjIGkN+nKyX6Q6q3KwxPMjrAHem/iK0MlDBSGvj8WjM658PpIgt
         ag2qMJkbjicTR4cntq06Aq13/pFUQBWH4xZPjrvwv9ixohQ/bsofsSMbWtH4mPBlMY
         zqcM4qP7wmutSYPkhHyzhkq/pLj9xk1isGzJpBYc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDMJ8b115800
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:22:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:22:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:22:19 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x8DDMJLQ094986;
        Fri, 13 Sep 2019 08:22:19 -0500
Date:   Fri, 13 Sep 2019 08:24:24 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [Patch 01/13] media: am437x-vpfe: Fix suspend path to always
 handle pinctrl config
Message-ID: <20190913132424.abjlxpu7f7rtx7rc@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-2-bparrot@ti.com>
 <9250638e-52a4-c7bc-e969-763d45528780@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9250638e-52a4-c7bc-e969-763d45528780@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the reviews.

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 14:59:28 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > From: Dave Gerlach <d-gerlach@ti.com>
> > 
> > Currently if vpfe is not active then it returns immediately in the
> > suspend and resume handlers. Change this so that it always performs the
> > pinctrl config so that we can still get proper sleep state configuration
> > on the pins even if we do not need to worry about fully saving and
> > restoring context.
> > 
> > Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 44 ++++++++++-----------
> >  1 file changed, 22 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index 2b42ba1f5949..ab959d61f9c9 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -2653,22 +2653,22 @@ static int vpfe_suspend(struct device *dev)
> >  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
> >  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
> >  
> > -	/* if streaming has not started we don't care */
> > -	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
> > -		return 0;
> > +	/* only do full suspend if streaming has started */
> > +	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
> >  
> 
> It's a bit ugly to start a block with an empty line. Can you remove it?

Yep no problem.

> 
> > -	pm_runtime_get_sync(dev);
> > -	vpfe_config_enable(ccdc, 1);
> > +		pm_runtime_get_sync(dev);
> > +		vpfe_config_enable(ccdc, 1);
> >  
> > -	/* Save VPFE context */
> > -	vpfe_save_context(ccdc);
> > +		/* Save VPFE context */
> > +		vpfe_save_context(ccdc);
> >  
> > -	/* Disable CCDC */
> > -	vpfe_pcr_enable(ccdc, 0);
> > -	vpfe_config_enable(ccdc, 0);
> > +		/* Disable CCDC */
> > +		vpfe_pcr_enable(ccdc, 0);
> > +		vpfe_config_enable(ccdc, 0);
> >  
> > -	/* Disable both master and slave clock */
> > -	pm_runtime_put_sync(dev);
> > +		/* Disable both master and slave clock */
> > +		pm_runtime_put_sync(dev);
> > +	}
> >  
> >  	/* Select sleep pin state */
> >  	pinctrl_pm_select_sleep_state(dev);
> > @@ -2710,19 +2710,19 @@ static int vpfe_resume(struct device *dev)
> >  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
> >  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
> >  
> > -	/* if streaming has not started we don't care */
> > -	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
> > -		return 0;
> > +	/* only do full resume if streaming has started */
> > +	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
> >  
> 
> Ditto.

Yep no problem.

> 
> > -	/* Enable both master and slave clock */
> > -	pm_runtime_get_sync(dev);
> > -	vpfe_config_enable(ccdc, 1);
> > +		/* Enable both master and slave clock */
> > +		pm_runtime_get_sync(dev);
> > +		vpfe_config_enable(ccdc, 1);
> >  
> > -	/* Restore VPFE context */
> > -	vpfe_restore_context(ccdc);
> > +		/* Restore VPFE context */
> > +		vpfe_restore_context(ccdc);
> >  
> > -	vpfe_config_enable(ccdc, 0);
> > -	pm_runtime_put_sync(dev);
> > +		vpfe_config_enable(ccdc, 0);
> > +		pm_runtime_put_sync(dev);
> > +	}
> >  
> >  	/* Select default pin state */
> >  	pinctrl_pm_select_default_state(dev);
> > 
> 
> Regards,
> 
> 	Hans
