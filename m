Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC0E7314EF
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 12:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343718AbjFOKJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 06:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343750AbjFOKJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 06:09:11 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383DD30C1
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686823731; x=1718359731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4GQ3YGO1r0rkbPaNJvrO9T3j4Zn79dspuv38aE9XzJU=;
  b=O7UqO8QkXDSzxa8fm4Chg5A68d6+hm4tyheiTAdS//oNhNXusM+J205f
   5sfvPI1w6f69p7BORvBoCCQgA5KEc6ojIJXz5FdyY/P0/xaNFPcyk888R
   wZwheYkdbWoYUMiVZl5qSzmzE/ZBBvFXGV9nkJL7EEpxbP8xEnsnuY2kG
   fdJpeDOZ4c0VIHHJtvFJwi7JGQPU9qMuZp4VrKN/jG9WK1fOaPZ5xDDMO
   5G9cBwZwU1FQaja5K16lm6L06yEZWdVLpmKTRP16+wsZkS3M6BkzR8Yrl
   eQdxiIlx4YOc2JcWDVOCHITPF+KrbLztGHqCCtkJlTDLIPlFwPIbJWr5H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387309024"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="387309024"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777602931"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="777602931"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:08:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5521E1202B5;
        Thu, 15 Jun 2023 13:08:07 +0300 (EEST)
Date:   Thu, 15 Jun 2023 10:08:07 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIrjB0LiB3Y/BLzd@kekkonen.localdomain>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
 <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
 <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 15, 2023 at 11:11:20AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 6/14/23 23:48, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
> >> Hello,
> >>
> >> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
> >>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
> >>>> The CSI2 specification specifies a standard method to access camera sensor
> >>>> registers called "Camera Control Interface (CCI)".
> >>>>
> >>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
> >>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> >>>>
> >>>> Currently a lot of Linux camera sensor drivers all have their own custom
> >>>> helpers for this, often copy and pasted from other drivers.
> >>>>
> >>>> Add a set of generic helpers for this so that all sensor drivers can
> >>>> switch to a single common implementation.
> >>>>
> >>>> These helpers take an extra optional "int *err" function parameter,
> >>>> this can be used to chain a bunch of register accesses together with
> >>>> only a single error check at the end, rather then needing to error
> >>>> check each individual register access. The first failing call will
> >>>> set the contents of err to a non 0 value and all other calls will
> >>>> then become no-ops.
> >>>>
> >>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>> ---
> >>>> Changes in v2:
> >>>> - Drop cci_reg_type enum
> >>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
> >>>>   8 bit width making reg-addresses without an encoded width default to
> >>>>   a width of 8
> >>>> - Add support for 64 bit wide registers
> >>
> >> I'm in two minds about this. This means that the read and write
> >> functions take a u64 argument, which will be less efficient on 32-bit
> >> platforms. I think it would be possible, with some macro magic, to
> >> accept different argument sizes, but maybe that's a micro-optimization
> >> that would actually result in worse code. 
> >>
> >> 64-bit support could be useful, but as far as I can tell, it's not used
> >> in this series, so maybe we could leave this for later ?
> > 
> > I prefer to have it now, I just told Tommaso working on the Alvium driver
> > to use this, and he needs 64-bit access. :-)
> > 
> > You could also easily have 32-bit and 64-bit variant of the functions, with
> > C11 _Generic(). Introducing it now would be easier than later.
> 
> I took a quick look at C11 _Generic() and that looks at the type
> of "things" so in this case it would look at type of the val argument.
> 
> Problem is that that can still be e.g. an int when doing a
> read/write from a 64 bit registers.

I suppose the compiler would warn you in that case, the same way it would
without _Generic().

> 
> So we would then need to handle the 64 bit width case in the 32
> bit versions of the functions too.

I'd feel annoyed having to have a u64 to read an 8-bit register. But
maybe that's not an issue in practice after all. Just extra memory used for
no reason (register lists).

> 
> And likewise I can see someone passing a long on a 64 bit
> arch while doing a cci_write() to a non 64 bit register.
> 
> So this would basically mean copy and pasting cci_read()
> + cci_write() 2x with the only difference being one
> variant taking a 32 bit val argument and the other a
> 64 bit val argument.
> 
> This seems like premature optimization to me.

Perhaps so, but it's difficult to do that later. Or, well, you can
introduce the 32-bit variant but you'd have to change users in order to use
it in existing code. That's unlikely to happen.

> 
> As mentioned in my reply to Laurent if we want to
> optimize things we really should look at avoiding
> unnecessary i2c transfers, or packing multiple
> writes into a single i2c transfer for writes to
> subsequent registers. That is where significant
> speedups can be made.

In the latter case, yes, there's something that can be done in the CCI
code. Then there are also devices that aren't fully compatible but require
e.g. 8-bit read and/or write access. We need e.g. flags so the driver can
tell not to merge writes. I haven't checked if there's already something in
regmap flags we could use in that case.

-- 
Kind regards,

Sakari Ailus
