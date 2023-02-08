Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF57368EDBD
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 12:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjBHLT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 06:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbjBHLS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 06:18:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2149D4940C
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 03:18:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 505C5B81BA8
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 11:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CA9C4339B;
        Wed,  8 Feb 2023 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675855075;
        bh=W+jHaO0cROq4vVeNZVaXt3Zy0zJwl6B2g61Uhefsx0o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pUAfyq0fRC9eQoEh2Lk4HVmMRTIhpTXi9SbIVBV5VFJPPTN8aZZlOow1TUxapGS+m
         aqLst5ascTzTpXp+1smXpzfpjACcovSRh3U2tlw3Tu9SUtL/qNTuwzO2h0BUB8OTMI
         LGJB5nLozVcVHqrbsZVU51BLpv8WT9GTgZ0qodpvqs88+QqHFiMv3YYME4F8EeAA/L
         om9hhTH+Ot7pYkRqAvgVXtAESqSP3A2I49vtsmi0lWAGd2fdAE8vP8QigwHQ/KUR2R
         cbJ5vVglgOd2Srm5MpdFp76hyA52jYO++AYVD1JkBYA6Gp/l3wKN+8gzMeQd+wg917
         J85D9U5kVkJ5Q==
Date:   Wed, 8 Feb 2023 12:17:50 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] media: Fix building pdfdocs
Message-ID: <20230208121750.1b4ac5cd@coco.lan>
In-Reply-To: <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
        <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 8 Feb 2023 11:11:34 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Feb 08, 2023 at 10:29:16AM +0200, Tomi Valkeinen wrote:
> > Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> > documatation for a few new RGB formats. For some reason these break the  
> 
> s/documatation/documentation/
> 
> > pdfdocs build, even if the same style seems to work elsewhere in the
> > file.
> > 
> > Remove the trailing empty dash lines, which seems to fix the issue.
> > 
> > Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> > Reported-by: Akira Yokosawa <akiyks@gmail.com>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>  
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > ---
> > 
> > Note: the offending patch was merged via drm tree, so we may want to
> > apply the fix to the drm tree also.  
> 
> Sounds good to me. Mauro, could you ack this patch ?

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> >  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > index d330aeb4d3eb..ea545ed1aeaa 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > @@ -868,7 +868,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-RGBA1010102:
> >  
> >        - ``V4L2_PIX_FMT_RGBA1010102``
> > @@ -909,7 +908,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-ARGB2101010:
> >  
> >        - ``V4L2_PIX_FMT_ARGB2101010``
> > @@ -950,7 +948,6 @@ number of bits for each component.
> >        - r\ :sub:`6`
> >        - r\ :sub:`5`
> >        - r\ :sub:`4`
> > -      -
> >  
> >  .. raw:: latex
> >    
> 



Thanks,
Mauro
