Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9238E6F04B4
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 13:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243285AbjD0LGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 07:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243264AbjD0LGy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 07:06:54 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F3510E
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682593613; x=1714129613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYdMrDZP2r9QVRXA4MQLrkKa48v95G5h0ZE77aIcDxA=;
  b=Mj3JRhwxzI+t06UGe6NMASL2ziFmIG4hTPw+X+L+33lLmshY8W0mDZDB
   U8bxW2KmjRi91AlOi+Su9FTONdm01M8zhf0nmNmBLO5c830WR3dhFXRIe
   EHQsNIbaN2gxNwDLSns3FCNlMtfGyrt0TakI6ab3hNwOQEpSyzSAtOOMP
   j5YD11K2KBS2wcf2FbKnOIoZwe98sr9lPITlh1/VZXjtZXfChxTuSMEhL
   y5BPbMzuJdCuWB0Cl31tw8OYNV+UqGvR2hjoUVK4/hkHuunf3W5IJgY1d
   rrjK1Q8KRh4QRgI1OL2lgnrl172vZU+ynK9XnSLowvLLJYJDO8HtDanqc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327725799"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="327725799"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694339162"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="694339162"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:06:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7ED2911FC9F;
        Thu, 27 Apr 2023 14:06:47 +0300 (EEST)
Date:   Thu, 27 Apr 2023 14:06:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 05/18] media: v4l: async: Clean testing for duplicated
 async subdevs
Message-ID: <ZEpXR2vNrgRS+RKU@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
 <20230425011541.GI4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425011541.GI4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 04:15:41AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Mar 30, 2023 at 02:58:40PM +0300, Sakari Ailus wrote:
> > There's a need to verify that a single async sub-device isn't being added
> > multiple times, this would be an error. This takes place at the time of
> > adding the async sub-device to the notifier's list as well as when the
> > notifier is added to the global notifier's list.
> > 
> > Use the pointer to the sub-device for testing this instead of an index to
> > an array that is long gone.
> 
> Reading the patch, I have no idea what the "long gone array" is. Could
> you please expand the commit message to make this easier to review ?

Yes... the async sub-devices were placed in an array earlier, that's what
the index was referring to. Although this could be an entry in a linked
list. Not how they are usually referred to though. This will go away
permanently later on in the set.

I'll add this to the commit message.

> v4l2-async is very difficult to follow in general, reviewing this series
> is painful :-S Let's try to improve it with better commit messages.

-- 
Regards,

Sakari Ailus
