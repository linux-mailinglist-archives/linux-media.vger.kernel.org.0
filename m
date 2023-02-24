Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D316A1D5B
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 15:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBXOUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 09:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjBXOUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 09:20:46 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929BE14EB4
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 06:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677248444; x=1708784444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CzZw8i5jMHkq7oh05Nnn7Uf+D+ZH/fXucwmBdTuIkM=;
  b=fWacIw+mu2dzhjJS/ll2J5ueDwNYeIk53yeSgANUNU5wunbpB54L7kyD
   7AXvdV+9waXgNbu5MglzFDKKXVouxmhlu8lhtpK449GT/QE0fmgDttnI2
   7CuSoAk5Gm9583DvsOt85YfHeT+ob8ZuPpErON6gSwx0rRa8/V1wfuVMd
   k/HLG/v3o2bjpHzbHun3odOMLHm0YfN23LeIexjTd5qxePxSzKIUtctnP
   30fMo2/Gk5EabPGyKkqM6HIYhKuzUmfbQwXnMbjH7AXNPuDX93kR9xODH
   s9NouQrs8zKy7RM77q1vBii1H+Sn9bcVmvbHxJe5b8Eb9DRfHgGtt+rhh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332169499"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="332169499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 06:20:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="666170679"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="666170679"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 06:20:42 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 56A221218D7;
        Fri, 24 Feb 2023 16:20:39 +0200 (EET)
Date:   Fri, 24 Feb 2023 16:20:39 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        tomi.valkeinen@ideasonboard.com
Subject: Re: IPU3 cameras not working with latest kernel code ?
Message-ID: <Y/jHt9a78xcrLzd0@kekkonen.localdomain>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <Y/hxyEd/WpRfBQaL@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/hxyEd/WpRfBQaL@kekkonen.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 24, 2023 at 10:14:00AM +0200, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Feb 23, 2023 at 11:04:12PM +0100, Hans de Goede wrote:
> > Hi All,
> > 
> > While trying to test Kate's tps68470 patches for the privacy LED
> > on the back of the Surface Go 1/2 I hit this oops when trying
> > to run qcam:
> 
> Thanks for reporting this.
> 
> There have been recent changes in how link validation works, also cc Tomi.

It seems link validation is broken in the ImgU driver --- it tries to use
the default link validator that works between two sub-devices but not
between a video node and a sub-device. I guess this somehow got ignored
before Tomi's patches.

It looks like it's calling v4l2_subdev_get_unlocked_active_state() with
NULL argument. No idea why the 32nd bit is set though.

I'll see how to address this.

-- 
Kind regards,

Sakari Ailus
