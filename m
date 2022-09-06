Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9625AE635
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 13:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiIFLKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 07:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbiIFLKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 07:10:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F66558E0;
        Tue,  6 Sep 2022 04:10:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32E5EB815F8;
        Tue,  6 Sep 2022 11:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C3FC433D6;
        Tue,  6 Sep 2022 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662462634;
        bh=5hwsIcCArrIqKc80JHIWB4BRQUJG6NcbLTvjwDcxMx4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AVxPYbBmI/qTTBOJlM25iIBqzc6HH97P0edz4WPoObhG9pypKaDcLvBky3UCGTnmR
         maBMExGCojfD1RcsVUleEfy3Trb+hBAmVyYdvi/EraQgmxPi4t+f9J01U3Y3KYqoqT
         ZtXual5z841N5206niujXKFq4h9qqLHrue5gTtF2IZ0B5A5g+PsmHJBAsfUk48kyf3
         HysgnmZwbtPzHZ3bQRh6K4GPOXpcxHhROKj1n1bZsTYD3+tWXVskXcps0rObj/8f8l
         b4VoHwhH7Y+mElVp0/5WBd2xNSpKd7DZlBsXRvpBmpFKiaF7B+qGIL/2GWrbrTvu2C
         NUf0Fw5sr+vyQ==
Date:   Tue, 6 Sep 2022 13:10:30 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Takanari Hayama <taki@igel.co.jp>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Message-ID: <20220906131030.336aebcc@coco.lan>
In-Reply-To: <Yv73pNxr62j+hYd5@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
        <20220810083711.219642-2-taki@igel.co.jp>
        <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
        <Yv73pNxr62j+hYd5@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 19 Aug 2022 05:38:28 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Mauro, would you be fine with this patch going through the DRM tree for
> v6.1 ? I don't foresee any risk of conflict with other changes to the
> VSP driver scheduled for the next kernel version. If that's fine with
> you, could you give an Acked-by ? Otherwise I can send you a pull
> request to create an immutable branch and base the rest on it in my pull
> request for DRM, but given how small this change is, it seems a bit
> overkill.

Please, don't top-post.
> 
> On Fri, Aug 19, 2022 at 05:01:10AM +0300, Laurent Pinchart wrote:
> > Hi Hayama-san,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Aug 10, 2022 at 05:37:09PM +0900, Takanari Hayama wrote:  
> > > To support DRM blend mode in R-Car DU driver, we must be able to pass
> > > a plane with the premultiplied alpha. Adding a new property to
> > > vsp1_du_atomic_config allows the R-Car DU driver to pass the
> > > premultiplied alpha plane.
> > > 
> > > Signed-off-by: Takanari Hayama <taki@igel.co.jp>

Sure, this can be merged via DRM tree.


> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
> > >  include/media/vsp1.h                           | 2 ++
> > >  2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > index 0c2507dc03d6..019e18976bd8 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
> > >  	rpf->mem.addr[1] = cfg->mem[1];
> > >  	rpf->mem.addr[2] = cfg->mem[2];
> > >  
> > > +	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;  
> > 
> > I'll drop the parentheses when applying.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

With this change:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro
