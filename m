Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA09A7DEE22
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 09:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbjKBIYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 04:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbjKBIYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 04:24:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72C0136;
        Thu,  2 Nov 2023 01:24:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6F4B7E2;
        Thu,  2 Nov 2023 09:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698913447;
        bh=ISCCxqUPJxp8ut7G8u3yVs6410ueQ1ozn9HXR2QF37k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nil0g19VEM4tgHe4NOIMOfEXhB7QGeZrCs6F3PtlY+7yuQD2rNOg6siSoNKViGMAA
         oH7rlehGWyyBY522kJBGu0/xQsAbLDg8NPTBKkHglzBRtGgRzGtqZGNfAgg50k6oNI
         8E97/xrpwc246umpeN2NbUb6shcKZSsa7wAKoHnw=
Date:   Thu, 2 Nov 2023 10:24:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Message-ID: <20231102082430.GE5933@pendragon.ideasonboard.com>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
 <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
 <20231102012217.GC5933@pendragon.ideasonboard.com>
 <1977009.tdWV9SEqCh@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1977009.tdWV9SEqCh@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Nov 02, 2023 at 08:55:01AM +0100, Alexander Stein wrote:
> Am Donnerstag, 2. November 2023, 02:22:17 CET schrieb Laurent Pinchart:
> > On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> > > Some sensors, e.g. Sony, are using little-endian registers. Add support
> > > for
> > 
> > I would write Sony IMX290 here, as there are Sony sensors that use big
> > endian.
> > 
> > > those by encoding the endianess into Bit 20 of the register address.
> > > 
> > > Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access
> > > helpers") Cc: stable@vger.kernel.org
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > 
> > >  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
> > >  include/media/v4l2-cci.h           |  5 ++++
> > >  2 files changed, 41 insertions(+), 8 deletions(-)

[snip]

> > > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > > index 0f6803e4b17e9..ef3faf0c9d44d 100644
> > > --- a/include/media/v4l2-cci.h
> > > +++ b/include/media/v4l2-cci.h
> > > @@ -32,12 +32,17 @@ struct cci_reg_sequence {
> > >  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> > >  #define CCI_REG_WIDTH_SHIFT		16
> > >  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> > > +#define CCI_REG_LE			BIT(20)
> > > 
> > >  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
> > >  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
> > >  #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
> > >  #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
> > >  #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
> > > +#define CCI_REG16_LE(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > +#define CCI_REG24_LE(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > +#define CCI_REG32_LE(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > +#define CCI_REG64_LE(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > 
> > I would put CCI_REG_LE first, to match the bits order.
> 
> You mean this order?
> 
> CCI_REG8(x)
> CCI_REG16_LE(x)
> CCI_REG16(x)
> CCI_REG24_LE(x)
> CCI_REG24(x)
> CCI_REG32_LE(x)
> CCI_REG32(x)
> CCI_REG64_LE(x)
> CCI_REG64(x)
> 
> I would either keep the _LE variants at the bottom or below to their big-
> endian counterpart. I prefer readability thus I would put the _LE at the 
> bottom, also it aligns nicely with the additional bit set.

No, I meant

#define CCI_REG16_LE(x)			(CCI_REG_LE | (2 << CCI_REG_WIDTH_SHIFT) | (x))
#define CCI_REG24_LE(x)			(CCI_REG_LE | (3 << CCI_REG_WIDTH_SHIFT) | (x))
#define CCI_REG32_LE(x)			(CCI_REG_LE | (4 << CCI_REG_WIDTH_SHIFT) | (x))
#define CCI_REG64_LE(x)			(CCI_REG_LE | (8 << CCI_REG_WIDTH_SHIFT) | (x))

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >  /**
> > >  
> > >   * cci_read() - Read a value from a single CCI register

-- 
Regards,

Laurent Pinchart
