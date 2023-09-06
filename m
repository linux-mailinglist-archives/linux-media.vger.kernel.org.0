Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1377793D9C
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 15:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjIFN0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 09:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjIFN0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 09:26:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD9C10E2
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694006761; x=1725542761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nRIPJQ9tcAvEA3ubKQgSRLsla6xrdilEzbC7tu32/Ek=;
  b=EhrSZ4oh0E7tTSNjZji/f3ySY7k8JVmZxrjdUo0tw2P0d3FpLElxEGq8
   xG1ElMjHZyOCi2ct3MW5xvw8CmVWPcbA5XM2j5ZoBQYqSTYtYbtFnS20v
   YLSESex2c1VYVEUkRQywFyKfo/W5Pgbiqmvs1rX7WyqQkXWlRlwESR2tZ
   69O9L8SHkpsVkgMfTIEzsnSEblSV1s/w/rB0DbrqNnVoWSJgkEnfTskfg
   cFAZb8aVuiQAA2d62cL0/3EmgcudUtTtYKGXaSD3XMyMYlSyn1wrJVvSZ
   80ipPEd/lufMpAuCuFa0TWdlzbbMTdxpyBlmVQAx6zq5N4X3wyvQBrfPt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357375709"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="357375709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741551738"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741551738"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:25:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id CCAFE11FC2C;
        Wed,  6 Sep 2023 16:25:53 +0300 (EEST)
Date:   Wed, 6 Sep 2023 13:25:53 +0000
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
Message-ID: <ZPh94dy2UA9MRSSU@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
 <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
 <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
 <20230905164720.GC7971@pendragon.ideasonboard.com>
 <ZPhkTZSGMzGIPgrm@kekkonen.localdomain>
 <20230906123658.GF17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906123658.GF17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Sep 06, 2023 at 03:36:58PM +0300, Laurent Pinchart wrote:
> CC'ing Naush and David
> 
> On Wed, Sep 06, 2023 at 11:36:45AM +0000, Sakari Ailus wrote:
> > On Tue, Sep 05, 2023 at 07:47:20PM +0300, Laurent Pinchart wrote:
> > > On Fri, Aug 11, 2023 at 09:11:39AM +0000, Sakari Ailus wrote:
> > > > On Fri, Aug 11, 2023 at 08:31:16AM +0200, Jacopo Mondi wrote:
> > > > > > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > > > > > +-----------------------------
> > > > > > > +
> > > > > > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > > > > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > > > > > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > > > > > > +
> > > > > > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > > > > > +bytes of metadata into one sample.
> > > > > > > +
> > > > > > > +This format is little endian.
> > > > > > > +
> > > > > > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > > > > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > > > >
> > > > > > I think you should document whether the padding is always 0 or can be any value.
> > > > > > Perhaps 'X' is a better 'name' for the padding byte in the latter case.
> > > > > 
> > > > > Did I get this right that this format is supposed to work as the RAW10
> > > > > CSI-2 packed image format, where 4 bytes contain the higher 8 bits of
> > > > > the 10 bits sample and the 5th byte every 4 contains the lower 2 bits of
> > > > > the previous 4 sample ?
> > > > > 
> > > > > If that's the case, is 'padding' the correct term here ?
> > > > 
> > > > What else would you call it? It'll be zeros that exist just due to the bit
> > > > depth used and as such not interesting at all.
> > > 
> > > It's actually not 0, CCS requires the padding bytes to be 0x55.
> > > 
> > > I wonder if the conformance test suite tests the contents of the padding
> > > bytes.
> > 
> > I don't know. I could add the value is unspecified but as it has not been
> > specified, there's no change in meaning (just size).
> 
> I started writing that I don't see how it could help applications to
> know that the padding byte is 0x55, but the SMIA++ embedded data parser
> in libcamera actually checks for it, and considers the embedded data to
> be erroneous if it has a different value.

I think it's fine to check for it if you know it's CCS/SMIA++/SMIA embedded
data. But documenting it here isn't a great idea as then other uses of this
format definition would be excluded.

-- 
Regards,

Sakari Ailus
