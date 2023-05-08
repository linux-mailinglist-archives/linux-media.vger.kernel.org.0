Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390AC6FA05F
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbjEHG7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233044AbjEHG7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:59:08 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB31E19D5D
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683529139; x=1715065139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k+idV1xdNagyGqrFIDpVf/0675XR8LDA7/pGWt5Qhh8=;
  b=BHB28dmDVWFMHjx1X814l70N4B365oumMd8O6gjWqcajOzSka/5F3cbQ
   l58IW1oTiQL+DrrmDa2zS8pIInQpg0XJB6MT/HCcNbPByQseUAAhg/oG1
   M7cawHUp7JieCR1/94kbXs+wfgkviXp4WENibAGgfYPbnM/f9Th75uksV
   SIkuBf2pdrBN5fAGI5f0ZZNS6TrKjqn7DN9hiOtYUs3TqlyQlj1TItE/F
   opfLok908phWzDCuRLBCLldAl5GqpnyxjYL2PWjWrUMbc6mmKlHG8EFg+
   33Atr4fE3WzBE4b/MQXMW5u5VAiZgwrQ8zzv9pvAg2nItz3eOWZ1Z4e3R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435892062"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="435892062"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="701308864"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="701308864"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:58:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 968BF1203DA;
        Mon,  8 May 2023 09:58:48 +0300 (EEST)
Date:   Mon, 8 May 2023 09:58:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use unsigned int values for assigning
 bits in u32 fields
Message-ID: <ZFidqGx5Kl/moD6h@kekkonen.localdomain>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-4-sakari.ailus@linux.intel.com>
 <20230506113223.GC17474@pendragon.ideasonboard.com>
 <ZFiUbA8xRIsR6KHV@kekkonen.localdomain>
 <20230508063023.GU23514@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508063023.GU23514@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, May 08, 2023 at 09:30:23AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, May 08, 2023 at 09:19:24AM +0300, Sakari Ailus wrote:
> > On Sat, May 06, 2023 at 02:32:23PM +0300, Laurent Pinchart wrote:
> > > On Fri, May 05, 2023 at 11:51:01PM +0300, Sakari Ailus wrote:
> > > > Use unsigned int values annoted by "U" for u32 fields. While this is a
> > > > good practice, there doesn't appear to be a bug that this patch would fix.
> > > > 
> > > > The patch has been generated using the following command:
> > > > 
> > > > 	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h
> > > 
> > > How about using the _BITUL() macro from include/uapi/linux/const.h ?
> > 
> > These are u32 whereas _BITUL makes an unsigned long. Int (as in U) is 32
> > bits on all platforms where Linux is used AFAIK.
> 
> I know, but is it a problem ?

If we have a u32 field, unsigned int is the right type for that (from
non-fixed length C types), not unsigned long. In practice it would work, I
have no doubts about that. The compiler could still do different decisions
due to this, promoting values to a 64-bits for instance.

If we had _BITU(), I'd be happy to use that. :-)

How about this: let's merge this patch and then see how a _BITU() macro
would fare.

-- 
Kind regards,

Sakari Ailus
