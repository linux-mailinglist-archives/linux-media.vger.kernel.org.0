Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08B1CC24CB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 18:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732174AbfI3QCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 12:02:07 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58002 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfI3QCH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 12:02:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UG26aY092231;
        Mon, 30 Sep 2019 11:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569859326;
        bh=L6LHDRc8VZ8Wou4KtO/agiAjH6PRrtMVtz5JQ4gVyCY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=mhk1y/q3QLRgs8GgFdjlJkG3KMJcyA39douOu9mrg4X8c73hZ8x8zQMrYHMRQNIkN
         X81iV3RtzpgQVsTNh+7RjJmS6lh2IkgVfxdqWYS+C/ma+unJvmr7eEOdBkfxqI9pw3
         zwXQNd+DIwt1h5XZUfgkaC4f1+qiqfIdKfuvNezM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UG26nf036515;
        Mon, 30 Sep 2019 11:02:06 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 11:01:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 11:01:56 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x8UG26c5110589;
        Mon, 30 Sep 2019 11:02:06 -0500
Date:   Mon, 30 Sep 2019 11:04:17 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 07/16] media: ti-vpe: vpe: fix a v4l2-compliance failure
 causing a kernel panic
Message-ID: <20190930160417.3vpefsots6i7ge2d@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
 <20190927183650.31345-8-bparrot@ti.com>
 <1a7c5929-15f1-8f04-1212-42f064654742@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1a7c5929-15f1-8f04-1212-42f064654742@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Mon [2019-Sep-30 10:35:05 +0200]:
> On 9/27/19 8:36 PM, Benoit Parrot wrote:
> > v4l2-compliance fails with this message:
> > 
> >    warn: v4l2-test-formats.cpp(717): \
> >    	TRY_FMT cannot handle an invalid pixelformat.
> >    test VIDIOC_TRY_FMT: FAIL
> > 
> > This causes the following kernel panic:
> > 
> > Unable to handle kernel paging request at virtual address 56595561
> > pgd = ecd80e00
> > *pgd=00000000
> > Internal error: Oops: 205 [#1] PREEMPT SMP ARM
> > ...
> > CPU: 0 PID: 930 Comm: v4l2-compliance Not tainted \
> > 	4.14.62-01715-gc8cd67f49a19 #1
> > Hardware name: Generic DRA72X (Flattened Device Tree)
> > task: ece44d80 task.stack: ecc6e000
> > PC is at __vpe_try_fmt+0x18c/0x2a8 [ti_vpe]
> > LR is at 0x8
> > 
> > Because the driver fails to properly check the 'num_planes' values for
> > proper ranges it ends up accessing out of bound data causing the kernel
> > panic.
> > 
> > Since this driver only handle single or dual plane pixel format, make
> > sure the provided value does not exceed 2 planes.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/vpe.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> > index bbbf11174e16..1278d457f753 100644
> > --- a/drivers/media/platform/ti-vpe/vpe.c
> > +++ b/drivers/media/platform/ti-vpe/vpe.c
> > @@ -1650,7 +1650,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
> >  			      &pix->height, MIN_H, MAX_H, H_ALIGN,
> >  			      S_ALIGN);
> >  
> > -	if (!pix->num_planes)
> > +	if (!pix->num_planes || pix->num_planes > 2)
> >  		pix->num_planes = fmt->coplanar ? 2 : 1;
> >  	else if (pix->num_planes > 1 && !fmt->coplanar)
> >  		pix->num_planes = 1;
> > 
> 
> This looks weird.
> 
> Why not just unconditionally do:
> 
> 	pix->num_planes = fmt->coplanar ? 2 : 1;

In order to not change the behavior, VPE would assume that NV12 format for
instance were always sent as 2 separate planes buffers. So for backward
compatibility this is order to handle both cases where NV12 could be
handled as both a single plane and a dual plane buffers based on what the
user space application intent on passing in/out.

Benoit

> 
> Regards,
> 
> 	Hans
