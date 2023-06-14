Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CF97309F9
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 23:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbjFNVsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 17:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbjFNVsG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 17:48:06 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6E3268C
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686779285; x=1718315285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3xfmAtdrLJUZd8oydSQhiUvsTY5aUpMYNCnovtuzF0=;
  b=KFfkIcLqcAYu9ELBEd89z3L4thOqr7x6jMJiUuKK97b0CDz8WuPCD8rZ
   fA/6eog0K0nka6VmNVxKzxkmq88cA3mIngfW2LMZkDQsV9GVPA48NyQHZ
   ZPQ6op7Xs/SvW70R5Q6Y0APwCRpLLYiVlhug1c8zxid1yG8VfFs9rVGc+
   fZUY//2XbNf/NCebInbg08n7c2Wlwy3t+F/Uu6UU+O+Arj9HPqplBe8cU
   dpY4TIhyv3slZ0jP+gFF5urVArfM5lRG8txZJGhg/BY/U6RkWYebXrJMo
   GOY7wyEuDhJxwac44DwezH+yZzEsN+RzZ4Yq/YElCgUC83AQsHiXc05yf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422345418"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="422345418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 14:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836408173"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="836408173"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 14:48:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 34E1D120C62;
        Thu, 15 Jun 2023 00:48:00 +0300 (EEST)
Date:   Wed, 14 Jun 2023 21:48:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614213429.GA28757@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
> > On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
> > > The CSI2 specification specifies a standard method to access camera sensor
> > > registers called "Camera Control Interface (CCI)".
> > > 
> > > This uses either 8 or 16 bit (big-endian wire order) register addresses
> > > and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> > > 
> > > Currently a lot of Linux camera sensor drivers all have their own custom
> > > helpers for this, often copy and pasted from other drivers.
> > > 
> > > Add a set of generic helpers for this so that all sensor drivers can
> > > switch to a single common implementation.
> > > 
> > > These helpers take an extra optional "int *err" function parameter,
> > > this can be used to chain a bunch of register accesses together with
> > > only a single error check at the end, rather then needing to error
> > > check each individual register access. The first failing call will
> > > set the contents of err to a non 0 value and all other calls will
> > > then become no-ops.
> > > 
> > > Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > > Changes in v2:
> > > - Drop cci_reg_type enum
> > > - Make having an encoded reg-width mandatory rather then using 0 to encode
> > >   8 bit width making reg-addresses without an encoded width default to
> > >   a width of 8
> > > - Add support for 64 bit wide registers
> 
> I'm in two minds about this. This means that the read and write
> functions take a u64 argument, which will be less efficient on 32-bit
> platforms. I think it would be possible, with some macro magic, to
> accept different argument sizes, but maybe that's a micro-optimization
> that would actually result in worse code. 
> 
> 64-bit support could be useful, but as far as I can tell, it's not used
> in this series, so maybe we could leave this for later ?

I prefer to have it now, I just told Tommaso working on the Alvium driver
to use this, and he needs 64-bit access. :-)

You could also easily have 32-bit and 64-bit variant of the functions, with
C11 _Generic(). Introducing it now would be easier than later.

> 
> > > - Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
> > >   support and without the delay_us field
> 
> This consumes extra memory too. Is it an issue ?

Most of the registers are 8-bit, 64-bit ones are exceedingly rare and will
probably remain so for CCI (small register space and slow bus!). Maybe the
64-bit support could be separate from the rest, using C11 _Generic() as
suggested above?

-- 
Kind regards,

Sakari Ailus
