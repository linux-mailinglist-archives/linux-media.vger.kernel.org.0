Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E1C730A6F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 00:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbjFNWLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 18:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjFNWLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 18:11:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F114F1A1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 15:11:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFE56E4;
        Thu, 15 Jun 2023 00:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686780659;
        bh=y8/JPP66QmqRXfoJTVFC0Ro6OFH+LZpQGAEODkAhY1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FQ+DTvopxxgCpKr4VIAdCuNUdDRAHDtwgRG2jY/N/ThQbBQfHEBuCC4OvQCz6+IIQ
         tJg/6SHzLbOK/BRWdhbn7Mv/ZEtP1wM5npElF54zsfP1U8bmxSI+Ee6+vdGVhGKJ8a
         ulL+uUrik0AwjIh+0EiMaoJZBm04XYwKB4DD/btQ=
Date:   Thu, 15 Jun 2023 01:11:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <20230614221129.GD28757@pendragon.ideasonboard.com>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
 <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Jun 14, 2023 at 09:48:00PM +0000, Sakari Ailus wrote:
> On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
> > > On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
> > > > The CSI2 specification specifies a standard method to access camera sensor
> > > > registers called "Camera Control Interface (CCI)".
> > > > 
> > > > This uses either 8 or 16 bit (big-endian wire order) register addresses
> > > > and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> > > > 
> > > > Currently a lot of Linux camera sensor drivers all have their own custom
> > > > helpers for this, often copy and pasted from other drivers.
> > > > 
> > > > Add a set of generic helpers for this so that all sensor drivers can
> > > > switch to a single common implementation.
> > > > 
> > > > These helpers take an extra optional "int *err" function parameter,
> > > > this can be used to chain a bunch of register accesses together with
> > > > only a single error check at the end, rather then needing to error
> > > > check each individual register access. The first failing call will
> > > > set the contents of err to a non 0 value and all other calls will
> > > > then become no-ops.
> > > > 
> > > > Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > ---
> > > > Changes in v2:
> > > > - Drop cci_reg_type enum
> > > > - Make having an encoded reg-width mandatory rather then using 0 to encode
> > > >   8 bit width making reg-addresses without an encoded width default to
> > > >   a width of 8
> > > > - Add support for 64 bit wide registers
> > 
> > I'm in two minds about this. This means that the read and write
> > functions take a u64 argument, which will be less efficient on 32-bit
> > platforms. I think it would be possible, with some macro magic, to
> > accept different argument sizes, but maybe that's a micro-optimization
> > that would actually result in worse code. 
> > 
> > 64-bit support could be useful, but as far as I can tell, it's not used
> > in this series, so maybe we could leave this for later ?
> 
> I prefer to have it now, I just told Tommaso working on the Alvium driver
> to use this, and he needs 64-bit access. :-)
> 
> You could also easily have 32-bit and 64-bit variant of the functions, with
> C11 _Generic(). Introducing it now would be easier than later.
> 
> > 
> > > > - Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
> > > >   support and without the delay_us field
> > 
> > This consumes extra memory too. Is it an issue ?
> 
> Most of the registers are 8-bit, 64-bit ones are exceedingly rare and will
> probably remain so for CCI (small register space and slow bus!). Maybe the
> 64-bit support could be separate from the rest, using C11 _Generic() as
> suggested above?

For the read and write functions, that's an interesting idea, but I'm
not sure if it will be a useful optimization. I suppose we could try and
see.

For register sequences, I think it would become cumbersome and error
prone to have to call different functions because a 64-bit register is
present in the list. I wonder if we could somehow pack the array
instead, turning the array of cci_reg_sequence into a u8 array, with
32-bit register addresses followed by a number of bytes corresponding to
the register width. It should be doable with macros I think.

I'm not asking for this to be implemented right now, but I agree that
it's likely best to do so earlier than later.

-- 
Regards,

Laurent Pinchart
