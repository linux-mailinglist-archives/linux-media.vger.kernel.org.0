Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12EB8597E83
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 08:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241669AbiHRGRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 02:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243554AbiHRGRs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 02:17:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C6E95AE6
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 23:17:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EF284A8;
        Thu, 18 Aug 2022 08:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660803464;
        bh=goZ1R9D1iHsR8zf7gllkopZFRe5ycHMZIdobrgf6Qro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NDyyeAZaXHtiuk3tUyj/LbuTJ+cnQAuIPu6DlvhHOWZJGIjsFqwf1GDtlPQY27uXw
         IgC57WL7AFnB87bxGi59hKDBc6GjCjoIKTJx6Mn5TOsVfKqfjhJzWcGKmHCrT6VhUM
         sEQH8ZQ7YXAWt4wGpCdmLpBTbfmOLTmDRfF1DupU=
Date:   Thu, 18 Aug 2022 09:17:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 4/5] media: rkisp1: Use RKISP1_CIF_ISP_LSC_GRAD_SIZE()
 for gradient registers
Message-ID: <Yv3ZhsIqWSu4wT4m@pendragon.ideasonboard.com>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
 <20220817021850.20460-5-laurent.pinchart@ideasonboard.com>
 <20220818025029.y4jbmpzgnebla4t2@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220818025029.y4jbmpzgnebla4t2@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Aug 18, 2022 at 05:50:29AM +0300, Dafna Hirschfeld wrote:
> On 17.08.2022 05:18, Laurent Pinchart wrote:
> > The rkisp1_lsc_config() function incorrectly uses the
> > RKISP1_CIF_ISP_LSC_SECT_SIZE() macro for the gradient registers. Replace
> > it with the correct RKISP1_CIF_ISP_LSC_GRAD_SIZE() macro. This doesn't
> > cause any functional change as the two macros are defined identically
> > (the size and gradient registers store fields in the same number of bits
> > at the same positions).
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index aa6efa4c6e9e..421ade177b2d 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -334,7 +334,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> >  		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE(i), data);
> > 
> >  		/* program x grad tables */
> > -		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
> > +		data = RKISP1_CIF_ISP_LSC_GRAD_SIZE(arg->x_grad_tbl[i * 2],
> >  						    arg->x_grad_tbl[i * 2 + 1]);
> 
> maybe the GRAD macro should change to:
> 
> RKISP1_CIF_ISP_LSC_SECT_GRAD
> 
> ?

Good idea, I'll do that.

> >  		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD(i), data);
> > 
> > @@ -344,7 +344,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> >  		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE(i), data);
> > 
> >  		/* program y grad tables */
> > -		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
> > +		data = RKISP1_CIF_ISP_LSC_GRAD_SIZE(arg->y_grad_tbl[i * 2],
> >  						    arg->y_grad_tbl[i * 2 + 1]);
> >  		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD(i), data);
> >  	}

-- 
Regards,

Laurent Pinchart
