Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736B8778C7C
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 12:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbjHKKza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 06:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjHKKz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 06:55:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE51BE4D
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691751328; x=1723287328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tRoq3d4KXdbrGk6g0kvNZ3i4ULlZUDYTwuC7yiyuR1s=;
  b=HyjzLwDkc7VH6Gv/umbuATAqohTJXsW72FIEk9IvTSbF8Ftvpf5qtl0t
   pUQmdmc2TeYs06WkihJjEn576exx2cJeQIV1PWWQAdqLDQzk6vxOkS3mm
   IHxbhE2nSfuc8gyWiZ1aRtIpK4lFPOBHyZ+i7GeUujI6VzAlV61eeILz6
   7VtEfiamqL0nS2rZeB0K4cjGK62BeTC+V/nDY/CF54PuCuakNMhsYRwon
   CaXzY7WqIjChY+gE3of4ljKHm+tcB5C54dJ1uskY6/dEMc9VelOzI5MZv
   v7GU7ERrcYruvrHuAJRCK9mk1/zDiUxAeQ1+gpXnPg3sXgG/lLUi/Vzem
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437988194"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="437988194"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 03:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="709495672"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="709495672"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 03:55:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C054211FAE0;
        Fri, 11 Aug 2023 13:55:23 +0300 (EEST)
Date:   Fri, 11 Aug 2023 10:55:23 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 07/10] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <ZNYTmw+pW/+scwl9@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
 <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
 <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
 <ort6xtjqgczhwxk7ffo4gjadts5jqgzb2yg5pusnt7isx36l3n@cd44xyviqzjs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ort6xtjqgczhwxk7ffo4gjadts5jqgzb2yg5pusnt7isx36l3n@cd44xyviqzjs>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Aug 11, 2023 at 11:43:26AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Aug 11, 2023 at 09:11:39AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Fri, Aug 11, 2023 at 08:31:16AM +0200, Jacopo Mondi wrote:
> > > > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > > > +-----------------------------
> > > > > +
> > > > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > > > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > > > > +
> > > > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > > > +bytes of metadata into one sample.
> > > > > +
> > > > > +This format is little endian.
> > > > > +
> > > > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > >
> > > > I think you should document whether the padding is always 0 or can be any value.
> > > > Perhaps 'X' is a better 'name' for the padding byte in the latter case.
> > > >
> > >
> > > Did I get this right that this format is supposed to work as the RAW10
> > > CSI-2 packed image format, where 4 bytes contain the higher 8 bits of
> > > the 10 bits sample and the 5th byte every 4 contains the lower 2 bits of
> > > the previous 4 sample ?
> > >
> > > If that's the case, is 'padding' the correct term here ?
> >
> > What else would you call it? It'll be zeros that exist just due to the bit
> > depth used and as such not interesting at all.
> 
> Ah, they will be 0s! They won't contain the 2 lower bits of the
> previous 4 bytes then ?
> 
> I guess this is due to the fact the number of valid bits in each
> metadata sample is always 8, regardless of the sample size on the
> media bus ?

Correct. This is also documented for the generic metadata formats.

> 
> The DMA engine will re-pack them to CSI2_10 (or CSI2_12 etc) just to match
> the image format sizes then ?

Generally yes. The receiver hardware / DMA is of course free to strip out
the padding but in practice that doesn't seem to be done.

> 
> In this case, padding is indeed correct, sorry for the noise!

No problem.

-- 
Regards,

Sakari Ailus
