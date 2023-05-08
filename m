Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564B76F9FAA
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjEHGTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbjEHGTf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:19:35 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B131BF0
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683526773; x=1715062773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YU18EssMs3b40m8TS3cuOS9PvgPSjKoI5IMIexXSjAg=;
  b=fCUFSVqnF2U0mtoRLCoBbC1waDUQ04WXo6KkgL5CHXxYjQAuL5Vwhyv8
   rgbpCknKB356PGQyZA9ZKi3DvFoVvXCW7WdNA/xikEIo/ZQfwkSf9s4NB
   vQW3pA+Ch+Zh4BZ4keWneQzXistSWzHq/8o4LwAtBxj1eTNcs+uYrdjlk
   n599ZB8tQv8yCq7LtaGpLRhNyofz16OGIL/qFNqR+UB/VByykD6gwJSFc
   qro3y3Hwhse7TNgA7BMV8onKodHDoSUq4uiUbjdk839X4qmA8j1snkLMe
   D1W2+yULMBhd635AVX2LnaBd8Yicqm2n4bGGTFkmRdaA0JpYdhMesh7JB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="334006044"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="334006044"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="944709296"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="944709296"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:19:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2C36C1203DA;
        Mon,  8 May 2023 09:19:24 +0300 (EEST)
Date:   Mon, 8 May 2023 09:19:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use unsigned int values for assigning
 bits in u32 fields
Message-ID: <ZFiUbA8xRIsR6KHV@kekkonen.localdomain>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-4-sakari.ailus@linux.intel.com>
 <20230506113223.GC17474@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506113223.GC17474@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, May 06, 2023 at 02:32:23PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, May 05, 2023 at 11:51:01PM +0300, Sakari Ailus wrote:
> > Use unsigned int values annoted by "U" for u32 fields. While this is a
> > good practice, there doesn't appear to be a bug that this patch would fix.
> > 
> > The patch has been generated using the following command:
> > 
> > 	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h
> 
> How about using the _BITUL() macro from include/uapi/linux/const.h ?

These are u32 whereas _BITUL makes an unsigned long. Int (as in U) is 32
bits on all platforms where Linux is used AFAIK.

And thanks for the review!

-- 
Kind regards,

Sakari Ailus
