Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D9E793DE0
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 15:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbjIFNkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 09:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjIFNkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 09:40:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FCB10D3
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694007605; x=1725543605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kd2fHJw/nWhfUQHGowHi/cXBMmDs1hNMCMrorro8aIc=;
  b=d/re2DDO+UkIAip8g0rdEXMdMt+L/rtUNH/ti/uwKFLYqSH1iY0Cp0Jj
   R9+svdedb1bsuB6Ulz2HoQKApNQox1XeWc7l+e2T4ZfMGaq4Dml4Q2FyD
   47MGz86jK6qq/pjDEBrH75x3XsM+UyyQqC4Gy7Pr2gxl9/xXVDq2rg6wx
   gUBmqoU+1ixmuSXJk2yU8CgQPqXS3DhNZRT+J6GqhR4BceQ7V+1ltr+50
   SXDoG6TeE5mQk3ACK19CHawvHmMGTAjzyg6+5MTa/DOwRvXBfdD2h0/B+
   POdrFjTizyx1DTU9FOtFNvnTNGPoY4k11/kYB4qqiv/kZu4JLAOt1S1aF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367293193"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="367293193"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915275604"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="915275604"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:40:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 46D6E11FC2C;
        Wed,  6 Sep 2023 16:39:59 +0300 (EEST)
Date:   Wed, 6 Sep 2023 13:39:59 +0000
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
Message-ID: <ZPiBL4gK6FP4Tp/v@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
 <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
 <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
 <20230905164720.GC7971@pendragon.ideasonboard.com>
 <ZPhkTZSGMzGIPgrm@kekkonen.localdomain>
 <20230906123658.GF17308@pendragon.ideasonboard.com>
 <ZPh94dy2UA9MRSSU@kekkonen.localdomain>
 <20230906133057.GN17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906133057.GN17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Sep 06, 2023 at 04:30:57PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 01:25:53PM +0000, Sakari Ailus wrote:
> > On Wed, Sep 06, 2023 at 03:36:58PM +0300, Laurent Pinchart wrote:
> > > On Wed, Sep 06, 2023 at 11:36:45AM +0000, Sakari Ailus wrote:
> > > > On Tue, Sep 05, 2023 at 07:47:20PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Aug 11, 2023 at 09:11:39AM +0000, Sakari Ailus wrote:
> > > > > > On Fri, Aug 11, 2023 at 08:31:16AM +0200, Jacopo Mondi wrote:
> > > > > > > > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > > > > > > > +-----------------------------
> > > > > > > > > +
> > > > > > > > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > > > > > > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > > > > > > > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > > > > > > > > +
> > > > > > > > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > > > > > > > +bytes of metadata into one sample.
> > > > > > > > > +
> > > > > > > > > +This format is little endian.
> > > > > > > > > +
> > > > > > > > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > > > > > > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > > > > > >
> > > > > > > > I think you should document whether the padding is always 0 or can be any value.
> > > > > > > > Perhaps 'X' is a better 'name' for the padding byte in the latter case.
> > > > > > > 
> > > > > > > Did I get this right that this format is supposed to work as the RAW10
> > > > > > > CSI-2 packed image format, where 4 bytes contain the higher 8 bits of
> > > > > > > the 10 bits sample and the 5th byte every 4 contains the lower 2 bits of
> > > > > > > the previous 4 sample ?
> > > > > > > 
> > > > > > > If that's the case, is 'padding' the correct term here ?
> > > > > > 
> > > > > > What else would you call it? It'll be zeros that exist just due to the bit
> > > > > > depth used and as such not interesting at all.
> > > > > 
> > > > > It's actually not 0, CCS requires the padding bytes to be 0x55.
> > > > > 
> > > > > I wonder if the conformance test suite tests the contents of the padding
> > > > > bytes.
> > > > 
> > > > I don't know. I could add the value is unspecified but as it has not been
> > > > specified, there's no change in meaning (just size).
> > > 
> > > I started writing that I don't see how it could help applications to
> > > know that the padding byte is 0x55, but the SMIA++ embedded data parser
> > > in libcamera actually checks for it, and considers the embedded data to
> > > be erroneous if it has a different value.
> > 
> > I think it's fine to check for it if you know it's CCS/SMIA++/SMIA embedded
> > data. But documenting it here isn't a great idea as then other uses of this
> > format definition would be excluded.
> 
> I'm OK with that, but note that you've mentioned in a different patch in
> the same series that you wouldn't use the CCS media bus code for sensors
> that are compliant with the CCS packing and encoding but not the CCS
> register set. That's not very consistent :-)

Which specific patch are you referring to?

-- 
Regards,

Sakari Ailus
