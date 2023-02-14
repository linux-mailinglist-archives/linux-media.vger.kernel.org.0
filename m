Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DACC696771
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 15:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjBNO4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 09:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbjBNO4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 09:56:14 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D58E2A141
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676386574; x=1707922574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rAAx3W+qYQCNzhxl8f8AAYEgB8g62gHz+ccHtJk+f88=;
  b=DO3gFuKPiR+SABCtdhYxHY2+zKA4Sn6Ci33bJNpmd/r5uv4LnZ0ivjiz
   +jV6hP8+owqKLvdJDZCn/BxKML0aNcHV71ofCp5s+DGt3FytyviD0hdQy
   vqIlvFiTdfKlrkySMMqlq514QF23VjTEzib0WEAqFdSdD0ptVmemBt6r4
   6Zt1Sq7AWceZqA6kBe6TloEEuYfQTgEj0JRW269UDVkrQ0sHTtUrye5bO
   pk4awcu3ZPYYs326GX8pmxpf+r3oPJD03HZ5DmWDfkRxBDuB4bpBd4lZN
   aMFYYVCWmsiEHULlfG0uj3VDrB73Xbfjfm+P4YZ0Vt19DsBiatEZmCnyU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="332486090"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="332486090"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 06:56:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="646790858"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="646790858"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 06:56:11 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7E9061222A8;
        Tue, 14 Feb 2023 16:56:08 +0200 (EET)
Date:   Tue, 14 Feb 2023 16:56:08 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <Y+uhCB9quKQSHcu+@kekkonen.localdomain>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
 <858be7fd-18b2-a4a1-341f-06920e437ce5@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <858be7fd-18b2-a4a1-341f-06920e437ce5@kontron.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 14, 2023 at 11:25:20AM +0100, Frieder Schrempf wrote:
> Hi Sakari,
> 
> On 09.02.23 23:16, Sakari Ailus wrote:
> > Just add some debug prints for V4L2 async sub-device matching process. These
> > might come useful in figuring out why things don't work as expected.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Frieder,
> > 
> > Can you try this? It prints what is being matched with what. Perhaps this
> > could be merged in a bit more refined form if it proves useful.
> > 
> > Not tested in any way.
> > 
> 
> Thanks for the patch!
> 
> I fixed a few issues (see below) and gave this patch a try. Though in my
> case it doesn't seem to help much as the problem is somewhere before the
> matching actually happens. The only output from this patch I get is:
> 
> [    1.536479] imx219 1-0010: trying to complete
> [    1.540856] imx219 1-0010: V4L2 device not available

Yeah, the problem, as I understand, is a driver bug combined with a DTS
bug... oh well.

So not a V4L2 async problem at all. :-)

-- 
Sakari Ailus
