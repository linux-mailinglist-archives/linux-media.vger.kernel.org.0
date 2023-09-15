Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8F37A280F
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 22:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbjIOU0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 16:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbjIOU0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 16:26:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C2FC6
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694809563; x=1726345563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8dyjdiV3Ahx6W5DXv+U1LHgGPuBEIG72r6BeNGFU7ic=;
  b=LnX/OvrIae7b2i2V+Wj81doON2Sf77mqb2pdnL2kylnoC0hFgEmvI+Xh
   FaPcZvHlbVp8RR5bekQbCliD5jrHLSZde6r0pPPhut/sHejNRM69HnPUN
   967LBHChqgFQtoACHbCTWPSeli67tIYKd1GiqZk5mXFr3DhTWP6KT4xJX
   RXTpRpDV867/vUXWStHZEpuohxqgosA6/k4MAHYMGzEpi+hzFDN6L4d2H
   RVbA4ajqMabkS2l4RucnbG4v5pLc/DEI3Tk3ANvNIEr5IdAqtxghjIENP
   MrGbbjWfuMev7QJ7cZ2+eCz+XB81LxUhlClyVAYkTHHZSQRSWHqaKXF7w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369654897"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="369654897"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 13:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888336657"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="888336657"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 13:25:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 646011202BB;
        Fri, 15 Sep 2023 23:25:57 +0300 (EEST)
Date:   Fri, 15 Sep 2023 20:25:57 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 7/7] media: ov2740: Return -EPROBE_DEFER if no endpoint
 is found
Message-ID: <ZQS91eeR4dYDTXTA@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-8-sakari.ailus@linux.intel.com>
 <20230915095027.GH14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915095027.GH14641@pendragon.ideasonboard.com>
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

On Fri, Sep 15, 2023 at 12:50:27PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 15, 2023 at 10:28:09AM +0300, Sakari Ailus wrote:
> > With ipu bridge, endpoints may only be created when ipu bridge has
> > initialised. This may happen after the sensor driver has first probed.
> 
> That's hard to understand for someone not familiar with the ipu-bridge
> driver. Could you please expand the commit message ?
> 
> Also, is there a way to avoid the ov2740 probing before the required
> initialization is complete ?

As of now, nothing else than, well, not having any endpoints as they are
created by the ipu bridge.

The ACPI device node does have a couple of custom objects but I'd rather
not add checks for those in the ACPI framework itself.

The proper solution (from device driver point of view at least) would be to
squash the ipu bridge to the ACPI framework itself so all this could be
initialised before any drivers get probed. I'm not sure how that would be
received, and in any case, as I wrote in a reply to another patch in this
series, I'd like to have DisCo for Imaging support merged first.

-- 
Regards,

Sakari Ailus
