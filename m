Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775E67D4449
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 02:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbjJXAtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 20:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbjJXAtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 20:49:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44A69B
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 17:49:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 643FB3D6;
        Tue, 24 Oct 2023 02:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698108543;
        bh=cF4j9NB71+H6fXGAGC0jEYF4tveP4TEppqHjCpnZA1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kWRBlen2RLz6b6PIbdGTlJwFjMdCXw5q9YF2j+JO4ScP3M/g76/BlxQ+jlL61/lMm
         h8we8JKAkYq/c7EFXKBiLv6jT8K69WRXwBNsCmyqvCILiR5OG/QNkkRBjRRV3TtJkX
         OxzoOPBNNduAOErhotvXFVVTaFce6Tp3LdEoj+dc=
Date:   Tue, 24 Oct 2023 03:49:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     "Chen, Jason Z" <jason.z.chen@intel.com>, andy.yeh@intel.com,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: Re: [PATCH v1] media: ov08x40: Add Signal Integration Adjustments
 for specific project
Message-ID: <20231024004921.GA27390@pendragon.ideasonboard.com>
References: <20231020040908.2706654-1-jason.z.chen@intel.com>
 <169780733955.3350128.8191848389476305605@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169780733955.3350128.8191848389476305605@ping.linuxembedded.co.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 20, 2023 at 02:08:59PM +0100, Kieran Bingham wrote:
> Quoting Chen, Jason Z (2023-10-20 05:09:08)
> > From: Jason Chen <jason.z.chen@intel.com>
> > 
> > Due to certain MIPI hardware designs using overly long cables, there
> > is a loss of signal strength, resulting in failed signal integration.
> > The patch includes changes to adjust the driving strength in the register
> > settings for a specific project.
> 
> For a specific project? Will this now affect 'all' projects using this
> sensor? Will that be adverse in anyway?
> 
> Do 'short' cables still function with this patch?
> 
> > Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> > ---
> >  drivers/media/i2c/ov08x40.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> > index 0b3b906ebef..4f13e23b325 100644
> > --- a/drivers/media/i2c/ov08x40.c
> > +++ b/drivers/media/i2c/ov08x40.c
> > @@ -160,6 +160,18 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
> >         {0x6002, 0x2e},
> >  };
> >  
> > +static const struct ov08x40_reg mipi_si_changed_regs[] = {
> > +       {0x481b, 0x2c}, /* HS Exit: Data Tx TEOT - reducing 8ns */
> > +       {0x4826, 0x42}, /* HS Entry: Data Tx TREOT - raising 8ns */
> > +       {0x4829, 0x54}, /* HS Exit: Data Tx TREOT - reducing 8ns */
> > +       {0x4885, 0x1f}, /* driving strength change */
> 
> Are these changes 'relative' to already written values?

Looks like it's time to address MIPI PHY timings properly, by
standardizing DT/ACPI device properties to convey timing information,
and implementing helpers to parse those properties and calculate timing
parameters for drivers.

> > +};
> > +
> > +struct ov08x40_reg_list si_regs = {
> > +       .regs = mipi_si_changed_regs,
> > +       .num_of_regs = ARRAY_SIZE(mipi_si_changed_regs),
> > +};
> > +
> >  static const struct ov08x40_reg mode_3856x2416_regs[] = {
> >         {0x5000, 0x5d},
> >         {0x5001, 0x20},
> > @@ -2917,6 +2929,11 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
> >                 return ret;
> >         }
> >  
> > +       /* Apply SI change to current project */
> > +       reg_list = &si_regs;
> > +
> > +       ov08x40_write_reg_list(ov08x, reg_list);
> > +
> 
> This looks odd. Why isn't this just:
> 
> 	ov08x40_write_reg_list(0v08x, &si_regs);
> 
> >         /* Apply default values of current mode */
> >         reg_list = &ov08x->cur_mode->reg_list;
> >         ret = ov08x40_write_reg_list(ov08x, reg_list);

-- 
Regards,

Laurent Pinchart
