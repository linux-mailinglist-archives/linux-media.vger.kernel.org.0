Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43E37CD7F1
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 11:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjJRJ2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 05:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjJRJ2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 05:28:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E26F7
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697621283; x=1729157283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=frHzOlu2lpeV4Dk0t7HuxkGATkFvu1ABYFoCI6SXWjw=;
  b=aaPgBcgg6M8Vzh3ohIa59lrKsNNe5cdVM1zZ/YmkHkT5XFCKIjUdPiTW
   SWkmgDMgjKveoFrBYAEDfEY0KIJDZ8awl+9RHfvNMFdWUXmMwcxPvG59w
   +aJkkr2VD7RPY6nt/2v7Tk5zxGZ89txo6EG/95kW3SIRyPrThgCPnPuWY
   AqusrRPTCA+YZKh6WgGOxjZOiXZIvbsidY6JoVcKOqpf8xWc0WhwRfALB
   FzIuIgWASHyfzV2UT33IITNu7+cUqXmbNtUIX1Zc7gp+1ksNe5WwtqH0s
   tDsKdu0T8KpAalyM3N/YgrXYy6QV/YeKsIIoWJQumeRb8SHtrwu0Uhrab
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366234935"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="366234935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 02:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756519575"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="756519575"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 02:28:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 541A61206B6;
        Wed, 18 Oct 2023 12:27:59 +0300 (EEST)
Date:   Wed, 18 Oct 2023 09:27:59 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Sensor driver support with CCS
Message-ID: <ZS+lH9G/SR2L2lGX@kekkonen.localdomain>
References: <54ntzswkt2eyhjdrrr4yk5fnru4msoc2fn6esuxffa6obp3met@mw2jqxtivbtp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ntzswkt2eyhjdrrr4yk5fnru4msoc2fn6esuxffa6obp3met@mw2jqxtivbtp>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

On Wed, Oct 18, 2023 at 12:04:46PM +0530, Umang Jain wrote:
> Hello everyone,
> 
> Past few weeks I have been working to support IMX519 sensor with CCS
> driver. The highlight is that I can capture frames with CCS driver now,
> with a few workarounds. This thread summarises the issues that we faced
> and act as placeholder for more open and structured discussion.
> 
> - First open question is regarding the upstream support of a sensor
>   driver with CCS. How should we term that a sensor is 'mainline-supported'
>   if it is getting supported by CCS. How can one use a sensor out of the box
>   with mainline kernel, when supported by CCS?

If the sensor is fully compliant, it should "just work", but then there's
the question of CCS static data if the sensor needs it.

For devices that aren't fully compliant this is a more complicated
question. Some devices might work with some parameters only, in particular
horizontal blanking is a sensitive value. The approach here should be to
set minimum and maximum to the same value to force horizontal blanking
value that is known to work. The if rules could be used for this as well.

> 
> - Continued from the previous discusion point, the more specific question is
>   about the sensor-specific static data that is composed of
>   manfacturer-specific-registers (MSRs) and (maybe) overridden
>   sensor-read-only-regs which are created as part of ccs-tools [1].
>   This becomes part of firmware? which needs to live /lib/firmware and
>   then picked up by CCS driver.
> 
>   Where can they be centralized ? is linux-firmware an option? [2].

I'd favour this.

> 
> - It was noticed that with current version of CCS - I was only able to
>   get 1/3 buffer filled. This was due to the fact that LINE_LENGTH_PCK
>   and FRAME_LENGTH_LINES registers are not getting updated to permissible
>   values in / before ccs_start_streaming() starts. Hence they are stuck
>   with values from probe time.

If you're not changing vertical or horizontal blanking, these are likely
the correct values from driver perspective. If these values do not work
however, then you most likely have an issue with sensor provided limit and
capability information. This should be fixed using CCS static data.

> These are top issues we faced while trying to support IMX519. This thread
> will act as placeholder to have more discussions in the open and/or help
> other sensors that can be supported with CCS.

I'm happy to see you using the CCS driver on a sensor I haven't used
before. The above issues, while they prevent meaningfully using the sensor
right now, they also seem easy to resolve.

Additionally --- if the sensor does not provide meaningful values for its
vendor and model, we could use the device's compatible string as the basis
for the firmware file name. I can post a patch for this.

-- 
Kind regards,

Sakari Ailus
