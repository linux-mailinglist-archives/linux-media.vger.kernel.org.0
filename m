Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C36A96CD372
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 09:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjC2HkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 03:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjC2HkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 03:40:23 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FD9B1
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680075622; x=1711611622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n6+ByagvBnHjWLxN/dRdWnYrtXRVukugcdoCCLXLmkw=;
  b=K4yHO6sF3Bdp9XGQRpuYFos0E45b/KIgoFzT7IxswygrRQquKpqrbcpj
   kC8SPaNPLN7EefYvRMKpzKa+EmBnmsCh2K3c4fzgZDgBhBRk1h6R4oxHu
   AjDMUnqzKvqgUZ/J66ZVPNAfwokn/Lu+7GMs+kzsNZNb0kObney2WEeU6
   QFd+ojJPv2h+7msv5c4vFcjy2kHPjrpmqd+1g+4zz/kpdGrERq8YJnzMa
   5iWr/1GA6k7ObQvrV3ni6z3KEoSrVQzC7rqqyS8aVcFTegxcLvhE//C1K
   gCyYtOr1UGEHU79cgZYIDNr1PyetYOTjIfryhgYlE68IT80AOnSiremBR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="340826190"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="340826190"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 00:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930201554"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="930201554"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 00:39:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 158DE1224D2;
        Wed, 29 Mar 2023 10:39:56 +0300 (EEST)
Date:   Wed, 29 Mar 2023 10:39:56 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Message-ID: <ZCPrTJ9Xg2dkxbu2@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
 <MN2PR11MB43184340CB813FFCE47AA68B8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFKmNKZAPwsIq/j@kekkonen.localdomain>
 <MN2PR11MB431892069628328E614F03498D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFjqu4P9AcNbMoZ@kekkonen.localdomain>
 <DM6PR11MB4316138CF6D8D300C007B4DE8D889@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZCNEp6NmeDElNMRs@kekkonen.localdomain>
 <MN2PR11MB43182A9175011A4C8E3A31068D899@MN2PR11MB4318.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB43182A9175011A4C8E3A31068D899@MN2PR11MB4318.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Wed, Mar 29, 2023 at 12:42:06AM +0000, Wu, Wentong wrote:
> > > > > > > I have no idea what the ipu bridge would be like, but IVSC csi
> > > > > > > bridge can be configured via kconfig to enable/disable.
> > > > > >
> > > > > > Please work out the details with Bingbu.
> > > > >
> > > > > @bingbu.cao@linux.intel.com @Sakari Ailus Please share your design
> > > > > idea
> > > > here.
> > > > > What the ipu bridge would be like?  What's the responsibility of ipu bridge?
> > > >
> > > > I'd expect Bingbu to have patches to turn the current cio2_bridge to
> > > > an ipu_bridge at some point. These should come on top of those patches.
> > >
> > > When will this be ready if you already make the plan? But could you
> > > please help review my other patches except bridge?
> > 
> > Please configure your e-mail client to wrap your lines at most at 74 characters
> > or so.
> > 
> > I think it's binding this all together that is the concern, the individual drivers
> > much less so.
> 
> Thanks, I would remove the csi bridge in next version.
> 
> Ok, the IPU bridge will also cover the bridge between IVSC and sensor.
> 
> BTW, please hans and laurent help take a look the mei_csi and mei_ace
> patch.

I can review them. However they can't be tested without the bridge code in
place. I'm therefore leaning towards merging them all at the same time,
when we know how this looks like in the end and can actually test the
patches.

-- 
Regards,

Sakari Ailus
