Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEBD4DD7A3
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 11:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbiCRKJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 06:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiCRKJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 06:09:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D01E2EBFB3;
        Fri, 18 Mar 2022 03:07:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D7928DB;
        Fri, 18 Mar 2022 11:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647598066;
        bh=XWVI4yjuu/sVZK3w+QHp2oEQXCNC9C0Caux/JZ2CpcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RF9OGsxlD6pkttawBvGCjKtKbqrSFoHs5bsnC56S8P5s4fbUmtc7cVFdqta5mvEhJ
         2onnVAcQze2nQAUGUgVkWVC9l/4n0GsNmDYWOpS4sbR/C7vOT4zskf0gDqhzZuRbRC
         N2w6OCSAM3riXQMzgNGSl/6I7mZ6JmjALVc1p/SE=
Date:   Fri, 18 Mar 2022 12:07:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] media: platform: renesas-ceu: Fix unused variable warning
Message-ID: <YjRZ4NGbw/wwHRWk@pendragon.ideasonboard.com>
References: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
 <164759787353.1484799.5883759969984812837@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164759787353.1484799.5883759969984812837@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 18, 2022 at 10:04:33AM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-03-17 20:49:03)
> > The ceu_data_rz variable is unused when CONFIG_OF isn't set. This
> > generates a compiler warning. Fix it.
> 
> Reported-by: kernel test robot <lkp@intel.com> ?

Good point, I forgot that. Thanks.

> but either way: 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/renesas-ceu.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> > index 2e8dbacc414e..f70f91b006b7 100644
> > --- a/drivers/media/platform/renesas/renesas-ceu.c
> > +++ b/drivers/media/platform/renesas/renesas-ceu.c
> > @@ -1606,15 +1606,15 @@ struct ceu_data {
> >         u32 irq_mask;
> >  };
> >  
> > -static const struct ceu_data ceu_data_rz = {
> > -       .irq_mask = CEU_CETCR_ALL_IRQS_RZ,
> > -};
> > -
> >  static const struct ceu_data ceu_data_sh4 = {
> >         .irq_mask = CEU_CETCR_ALL_IRQS_SH4,
> >  };
> >  
> >  #if IS_ENABLED(CONFIG_OF)
> > +static const struct ceu_data ceu_data_rz = {
> > +       .irq_mask = CEU_CETCR_ALL_IRQS_RZ,
> > +};
> > +
> >  static const struct of_device_id ceu_of_match[] = {
> >         { .compatible = "renesas,r7s72100-ceu", .data = &ceu_data_rz },
> >         { .compatible = "renesas,r8a7740-ceu", .data = &ceu_data_rz },
> > 
> > base-commit: 10ed1ec9c9cab63310038579c2e1303324bfa44a

-- 
Regards,

Laurent Pinchart
