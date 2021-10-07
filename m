Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6249A4252E1
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 14:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhJGMVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 08:21:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41898 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbhJGMVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Oct 2021 08:21:47 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 197CJnBb037285;
        Thu, 7 Oct 2021 07:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633609189;
        bh=9JwMLFdbNsLpLAiDqASjPrmPKp/VSOt/Bj/doasoH0U=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=OToP+/Mhx39NY0qtCVZ05rRs3mX4P8s1MLtO6z1vtQw3jz9sF9xxZVDk0RWx7oZ0N
         PbsM69E6kNXmbD5YfCbahZn0KGLxo25uT6KwGsrJjN5kYZpoArFC/9dTmI6NiMjiS3
         BAFUSCtzryaAaNSxc1Sw0JOWd7/Lz1YLT8U7DMKY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 197CJn2r027336
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Oct 2021 07:19:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Oct 2021 07:19:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Oct 2021 07:19:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 197CJmjA111379;
        Thu, 7 Oct 2021 07:19:49 -0500
Date:   Thu, 7 Oct 2021 17:49:48 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] media: cadence: csi2rx: Unregister v4l2 async
 notifier
Message-ID: <20211007121946.tqkpgvej7xkb7xp3@ti.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-2-p.yadav@ti.com>
 <YV4xwiUVGUi3biAT@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YV4xwiUVGUi3biAT@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/21 02:31AM, Laurent Pinchart wrote:
> Hi Pratyush,
> 
> Thank you for the patch.
> 
> On Wed, Sep 15, 2021 at 05:32:30PM +0530, Pratyush Yadav wrote:
> > The notifier is added to the global notifier list when registered. When
> > the module is removed, the struct csi2rx_priv in which the notifier is
> > embedded, is destroyed. As a result the notifier list has a reference to
> > a notifier that no longer exists. This causes invalid memory accesses
> > when the list is iterated over. Similar for when the probe fails.
> > 
> > Unregister and clean up the notifier to avoid this.
> > 
> > Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Note that there are other issues in the driver in cleanup paths, in
> particular a missing v4l2_async_notifier_cleanup() call in
> csi2rx_parse_dt() when v4l2_async_notifier_add_fwnode_remote_subdev()
> fails (moving the one from the other error path to an err label would be
> best), and missing media_entity_cleanup() calls in both the probe error
> path and the remove handler. Would you like to submit fixes for those ?

Sure, will do.

> 
> > ---
> > 
> > (no changes since v3)
> > 
> > Changes in v3:
> > - New in v3.
> > 
> >  drivers/media/platform/cadence/cdns-csi2rx.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> > index 7b44ab2b8c9a..d60975f905d6 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -469,6 +469,7 @@ static int csi2rx_probe(struct platform_device *pdev)
> >  	return 0;
> >  
> >  err_cleanup:
> > +	v4l2_async_nf_unregister(&csi2rx->notifier);
> >  	v4l2_async_nf_cleanup(&csi2rx->notifier);
> >  err_free_priv:
> >  	kfree(csi2rx);
> > @@ -479,6 +480,8 @@ static int csi2rx_remove(struct platform_device *pdev)
> >  {
> >  	struct csi2rx_priv *csi2rx = platform_get_drvdata(pdev);
> >  
> > +	v4l2_async_nf_unregister(&csi2rx->notifier);
> > +	v4l2_async_nf_cleanup(&csi2rx->notifier);
> >  	v4l2_async_unregister_subdev(&csi2rx->subdev);
> >  	kfree(csi2rx);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
