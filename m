Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFDE7A66CB
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 16:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbjISOe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 10:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbjISOe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 10:34:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C13EC9
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695134092; x=1726670092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/uizlNnkKtS7T80EPkp39an7U9xH6Eo14bpWZsFYVro=;
  b=Vj1lD+3lH+V8ll0OXCO3bON06oze1blVBZQpcIMPvJ4FQ/HcnN5Ve1g8
   vaDA1dkI66725hC4xvkuNW7WQeGHk658xDwGiijbjPC1UHFphl2r0ZUAv
   z+HEAoXgehHf+VsCx1iLAbS9I+C1+6gs19E9Mex9T6G2vUK4oDtqWflfM
   Y1QCTbtoZOQMm6mA089QjOZgu6AnqVR+pP0VGEoMR0P3xf+o+8WJBTNmo
   l/8wtnMaM7A/ns1Gegz9yN/rYOnPHG2luLc+7SseFMKLLOi6Fd2d2Jn3D
   fj0gDufnbmryt0XhRZNOe8ZL36xzs5aECSwE8eqitKBDwcXcRx5cQOT72
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383788301"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="383788301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746262317"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="746262317"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:34:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 8700A120232;
        Tue, 19 Sep 2023 17:34:47 +0300 (EEST)
Date:   Tue, 19 Sep 2023 14:34:47 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org,
        "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: Re: [PATCH 1/4] media: ov9282: Orphan the driver
Message-ID: <ZQmxhwe5mlBWMc8p@kekkonen.localdomain>
References: <20230919111540.2344757-1-sakari.ailus@linux.intel.com>
 <20230919111540.2344757-2-sakari.ailus@linux.intel.com>
 <CAPY8ntCVWUoK6vcbRB8Pw_0_pV8tP7dXWZY=OMaBeaMMFjVVqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCVWUoK6vcbRB8Pw_0_pV8tP7dXWZY=OMaBeaMMFjVVqg@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Sep 19, 2023 at 02:16:11PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Tue, 19 Sept 2023 at 12:17, Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > The current maintainers won't be looking after this driver anymore. Mark
> > it orphan.
> 
> Seeing as a fair number of Pi users are using OV9281 (same sensor but
> different CRA), I'm prepared to step up as maintainer for this one.

I'm happy to hear that!

> Do you want me to create a patch to update MAINTAINERS, or are you
> happy to create one and me R-b or Ack it?

I'm fine with either. :-) Perhaps it's easiest if I change the current
patch?

-- 
Regards,

Sakari Ailus
