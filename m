Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE90E7C8407
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjJMLGQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjJMLGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:06:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C75B7
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697195173; x=1728731173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ljHBS7O65zjR3XgooSEkTlWyj2UtHI406G53VODNYFY=;
  b=Y9JzvlmyehrkPfUY9OFNxt7sITnnv8vUFdWNEopusZfA9pA0SyIRPT9s
   t/tk38xkzL0Q+93LePRNvQN0pVLtQoGYOK9Xkmj5jC5QtbBZbh5K7PbCR
   Ogm24n9Oj/4LY2G40JcaxzMBg5slEfV7KmWOYN3O5MXnbPpBf7JCt6SjE
   4ps5VSpA8ZteGJhKHbaNOZINmEJnmz8mxQUNdnAlZIHpq71rtvsYQyNbN
   Hq6EnhZQvezxtyyHWFu5t0RdIFnXLKqAQV8mSyqU+J8iLsbSKu70uqOoT
   s7Q5OEr3D6564gNkdbKPsPBT4ksL9e7UArgFkWVxyYfQgPsZhlikVKEu8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388008378"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="388008378"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825020629"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="825020629"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:06:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 41A81120A2E;
        Fri, 13 Oct 2023 14:06:08 +0300 (EEST)
Date:   Fri, 13 Oct 2023 11:06:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 1/6] media: v4l: subdev: Store the number of pads in
 sub-device state
Message-ID: <ZSkkoG7vjzMUXeOI@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-2-sakari.ailus@linux.intel.com>
 <20231013105749.GA11101@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013105749.GA11101@pendragon.ideasonboard.com>
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

Thanks for the review.

On Fri, Oct 13, 2023 at 01:57:49PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Oct 13, 2023 at 01:44:19PM +0300, Sakari Ailus wrote:
> > Store the number of pads in the sub-device state. This will be needed to
> > validate pad when retrieving information for non-stream-aware users.
> 
> I'd rather store a pointer to the subdev. You can get the number of pads
> from there.

The value is initialised after the array is allocated so this won't change.

I don't have a strong opinion either way. It's still more efficient to
store just the value.

-- 
Regards,

Sakari Ailus
