Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF437974A8
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjIGPk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 11:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245239AbjIGP2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 11:28:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9501BF4
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694100469; x=1725636469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4FUhumchq8hxl90i+w8+h8PxzaUfLJQu9V287AomMVc=;
  b=NHxgWOMAJMu1utAHomyAXx3zlhdr2WIrsMPykmFcd/u8Qkujx2FSSm5M
   8CR2Xh6INdPe15FWB/Y87hLzG+WxMI3wEZkN93QqHwTEnY/gm50TBeesA
   0C9LS04bNOHoTmN11SC/C7/CTFNlp4VRUkXwQzKy05qHzm7TEdzEUAzRY
   OsLN6D522GSKxH1k+yaMly59h33yrFa/yj/t4d1MDauyvg/d/qmwSejc0
   FDQTIrrCoNeEJJiDUudw6QcBV3jyQAqIkk4kTlIcaHhut7UPGi4FJCvTU
   PdSfjqLZHxCS29jdvYORec3ribnlerxmMez8K5yrBgAbM84kWIf6q4aht
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="381077323"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="381077323"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865540349"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="865540349"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:13:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 9CDB011FAE0;
        Thu,  7 Sep 2023 11:06:10 +0300 (EEST)
Date:   Thu, 7 Sep 2023 08:06:10 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        Naushir Patuck <naush@raspberrypi.com>,
        David Plowman <david.plowman@raspberrypi.com>
Subject: Re: [PATCH v3 07/10] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <ZPmEcqvw5Gh3h+bx@kekkonen.localdomain>
References: <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
 <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
 <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
 <20230905164720.GC7971@pendragon.ideasonboard.com>
 <ZPhkTZSGMzGIPgrm@kekkonen.localdomain>
 <20230906123658.GF17308@pendragon.ideasonboard.com>
 <ZPh94dy2UA9MRSSU@kekkonen.localdomain>
 <20230906133057.GN17308@pendragon.ideasonboard.com>
 <ZPiBL4gK6FP4Tp/v@kekkonen.localdomain>
 <20230906134737.GA25420@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906134737.GA25420@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Sep 06, 2023 at 04:47:37PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 01:39:59PM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Wed, Sep 06, 2023 at 04:30:57PM +0300, Laurent Pinchart wrote:
> > > On Wed, Sep 06, 2023 at 01:25:53PM +0000, Sakari Ailus wrote:
> > > > On Wed, Sep 06, 2023 at 03:36:58PM +0300, Laurent Pinchart wrote:
> > > > > On Wed, Sep 06, 2023 at 11:36:45AM +0000, Sakari Ailus wrote:
> > > > > > On Tue, Sep 05, 2023 at 07:47:20PM +0300, Laurent Pinchart wrote:
> > > > > > > On Fri, Aug 11, 2023 at 09:11:39AM +0000, Sakari Ailus wrote:
> > > > > > > > On Fri, Aug 11, 2023 at 08:31:16AM +0200, Jacopo Mondi wrote:
> > > > > > > > > > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > > > > > > > > > +-----------------------------
> > > > > > > > > > > +
> > > > > > > > > > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > > > > > > > > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > > > > > > > > > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > > > > > > > > > > +
> > > > > > > > > > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > > > > > > > > > +bytes of metadata into one sample.
> > > > > > > > > > > +
> > > > > > > > > > > +This format is little endian.
> > > > > > > > > > > +
> > > > > > > > > > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > > > > > > > > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > > > > > > > >
> > > > > > > > > > I think you should document whether the padding is always 0 or can be any value.
> > > > > > > > > > Perhaps 'X' is a better 'name' for the padding byte in the latter case.
> > > > > > > > > 
> > > > > > > > > Did I get this right that this format is supposed to work as the RAW10
> > > > > > > > > CSI-2 packed image format, where 4 bytes contain the higher 8 bits of
> > > > > > > > > the 10 bits sample and the 5th byte every 4 contains the lower 2 bits of
> > > > > > > > > the previous 4 sample ?
> > > > > > > > > 
> > > > > > > > > If that's the case, is 'padding' the correct term here ?
> > > > > > > > 
> > > > > > > > What else would you call it? It'll be zeros that exist just due to the bit
> > > > > > > > depth used and as such not interesting at all.
> > > > > > > 
> > > > > > > It's actually not 0, CCS requires the padding bytes to be 0x55.
> > > > > > > 
> > > > > > > I wonder if the conformance test suite tests the contents of the padding
> > > > > > > bytes.
> > > > > > 
> > > > > > I don't know. I could add the value is unspecified but as it has not been
> > > > > > specified, there's no change in meaning (just size).
> > > > > 
> > > > > I started writing that I don't see how it could help applications to
> > > > > know that the padding byte is 0x55, but the SMIA++ embedded data parser
> > > > > in libcamera actually checks for it, and considers the embedded data to
> > > > > be erroneous if it has a different value.
> > > > 
> > > > I think it's fine to check for it if you know it's CCS/SMIA++/SMIA embedded
> > > > data. But documenting it here isn't a great idea as then other uses of this
> > > > format definition would be excluded.
> > > 
> > > I'm OK with that, but note that you've mentioned in a different patch in
> > > the same series that you wouldn't use the CCS media bus code for sensors
> > > that are compliant with the CCS packing and encoding but not the CCS
> > > register set. That's not very consistent :-)
> > 
> > Which specific patch are you referring to?
> 
> "[PATCH v3 09/10] media: Add media bus codes for MIPI CCS embedded data"
> 
> You wrote
> 
> "There are sensors that aren't fully compatible with CCS (including
> those compatible with SMIA and SMIA++) but I wouldn't expect the format
> to be used by devices that are entirely incompatible with CCS."

Ah, right.

I meant that if a sensor implementation isn't related to any of these
standards, it's highly unlikely to use the same embedded data format. Of
course, if it does, then I think we should use the mbus code, too. But I'm
not holding my breath.

-- 
Regards,

Sakari Ailus
