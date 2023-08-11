Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C456F77897D
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 11:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjHKJLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 05:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbjHKJLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 05:11:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBA630C1
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691745104; x=1723281104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WGIM6u4NRNm69mUeOMP8QcvJiSHRRCXEP/InvFQEczc=;
  b=kvT7me6tvQktOIZIR7jncyDi4Yht38vcgoHEtwXklBsJ5yQCfYnUpGYg
   IueGjiMyHKDHcSW0hzk+kPlGklCHNjMkTyQwn/aBGB+aTjsiehTpr/GtU
   s83q+NfPI/u48jzm60oc/hcCV0KpLSsUFVth9ZJbGzVZc7ISi8U75d+dV
   QQGOP4STr4XmvMQKBmIeysdNVGBMEOVW2b7ZbpQydqsMiiR+ppmAOKM9x
   11NrwQQLxzemFMLKHamkbRiI54oIDSZhZoSz1IZVMIgdfU3kEX0/4Z6Cd
   fuPGHrfaTIAuemiiiBRjXB93XBtK/DhvgdxN5/BeGFRcZ24k4YrUyieNU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="435531138"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="435531138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767607914"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="767607914"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:11:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1334111FAE0;
        Fri, 11 Aug 2023 12:11:39 +0300 (EEST)
Date:   Fri, 11 Aug 2023 09:11:39 +0000
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
Message-ID: <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
 <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Aug 11, 2023 at 08:31:16AM +0200, Jacopo Mondi wrote:
> > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > > +
> > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > +bytes of metadata into one sample.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> >
> > I think you should document whether the padding is always 0 or can be any value.
> > Perhaps 'X' is a better 'name' for the padding byte in the latter case.
> >
> 
> Did I get this right that this format is supposed to work as the RAW10
> CSI-2 packed image format, where 4 bytes contain the higher 8 bits of
> the 10 bits sample and the 5th byte every 4 contains the lower 2 bits of
> the previous 4 sample ?
> 
> If that's the case, is 'padding' the correct term here ?

What else would you call it? It'll be zeros that exist just due to the bit
depth used and as such not interesting at all.

-- 
Regards,

Sakari Ailus
