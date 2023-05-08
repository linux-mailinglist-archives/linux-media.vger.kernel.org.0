Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC176FA25A
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 10:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbjEHIed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 04:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbjEHIea (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 04:34:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27E41FAAE
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 01:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683534849; x=1715070849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lwDShBkjtYDdKVUVgn//99hSA1dkRE1vOx/jEVzLi3I=;
  b=CJeqitYH9JWpwLkQrvMQ2py2f391cacTC6SVdMmDa01RDApts/twtf7o
   QJkyswiIIQSOoNtewhks4Ok6ewgE6Wr535tCGVmU/Nvd5RJyS2f8y2U5m
   88E78u9v2Fd46/B8UjP3afqHKZr9zz5eiUg22UAFwexc5V7DRRW5h2l25
   nebBkyVFXFF+mNicfK/Kg+AUf18LvVVSO/4UxcIL5XxFKihZql+iYOGVh
   VlWGkJO6ezRv+HS7pY9N0IBdX7K6CDvrQ0mrtsvtP3KA/CQlgwg0GAF28
   H7G6nLJLqs4AusT+kxjVW2f1k9WnEtmYzQzlNYBXdyP31MyYdQAoUoJF8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="347057561"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="347057561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 01:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="648794501"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="648794501"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 01:34:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 325351203DA;
        Mon,  8 May 2023 11:34:05 +0300 (EEST)
Date:   Mon, 8 May 2023 11:34:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use unsigned int values for assigning
 bits in u32 fields
Message-ID: <ZFiz/WqSUc7bNom8@kekkonen.localdomain>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-4-sakari.ailus@linux.intel.com>
 <20230506113223.GC17474@pendragon.ideasonboard.com>
 <ZFiUbA8xRIsR6KHV@kekkonen.localdomain>
 <20230508063023.GU23514@pendragon.ideasonboard.com>
 <ZFidqGx5Kl/moD6h@kekkonen.localdomain>
 <20230508075209.GV23514@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508075209.GV23514@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 08, 2023 at 10:52:09AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, May 08, 2023 at 09:58:48AM +0300, Sakari Ailus wrote:
> > On Mon, May 08, 2023 at 09:30:23AM +0300, Laurent Pinchart wrote:
> > > On Mon, May 08, 2023 at 09:19:24AM +0300, Sakari Ailus wrote:
> > > > On Sat, May 06, 2023 at 02:32:23PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, May 05, 2023 at 11:51:01PM +0300, Sakari Ailus wrote:
> > > > > > Use unsigned int values annoted by "U" for u32 fields. While this is a
> > > > > > good practice, there doesn't appear to be a bug that this patch would fix.
> > > > > > 
> > > > > > The patch has been generated using the following command:
> > > > > > 
> > > > > > 	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h
> > > > > 
> > > > > How about using the _BITUL() macro from include/uapi/linux/const.h ?
> > > > 
> > > > These are u32 whereas _BITUL makes an unsigned long. Int (as in U) is 32
> > > > bits on all platforms where Linux is used AFAIK.
> > > 
> > > I know, but is it a problem ?
> > 
> > If we have a u32 field, unsigned int is the right type for that (from
> > non-fixed length C types), not unsigned long. In practice it would work, I
> > have no doubts about that. The compiler could still do different decisions
> > due to this, promoting values to a 64-bits for instance.
> > 
> > If we had _BITU(), I'd be happy to use that. :-)
> 
> Note how BIT() is defined in include/vdso/bits.h:
> 
> #include <vdso/const.h>
> 
> #define BIT(nr)                 (UL(1) << (nr))
> 
> And in include/vdso/const.h:
> 
> #include <uapi/linux/const.h>
> 
> #define UL(x)           (_UL(x))
> 
> BIT() is thus essentially identical to _BITUL(). As we use the former
> everywhere without any trouble, I wouldn't expect issue with the latter.

Fair enough. I'll switch to _BITUL() in v2.

-- 
Sakari Ailus
