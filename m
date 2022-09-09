Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1EB5B3AC2
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 16:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbiIIOg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 10:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiIIOg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 10:36:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4031203DB
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662734186; x=1694270186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NMlHjTamCgzgWiuFleVaSOi0my5HUjwAw3jdyYFpVSA=;
  b=bJp7p+8VKgdfCaKUk0ko8rbHSgeDHCpW6xiAdO9BVlkehSWE2kLSUfIa
   LXu6RzCKW8c9o8f3GFuZ4QpXmgrQ1QNHQqyrypZ8saUY1thQF0XW0gQ1A
   shv3770bLrBBl1cWLqkbdsRh0aniFvepck8xcQxK95f+x9fy26UKtbbJ2
   ew1gMZ4v+lJllYuwr9tDmA85wHiWnf7aP+rEXyprnLtdhrOaSSOc/ULHj
   Hz2/xrgsS2bTTwqOpT1egAK/bOBRqx2M7xlkP3iuK0qBHQHwXGbKX8g2j
   3zHZ4NwY90P9pSuxYd7P4fKPkvDKKeJTjVeYl9QileqPj5rQmUYBg7MDt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="383781745"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="383781745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 07:36:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="615287416"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 07:36:25 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E997C20127;
        Fri,  9 Sep 2022 17:36:22 +0300 (EEST)
Date:   Fri, 9 Sep 2022 14:36:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/1] sun6i-mipi-csi2: Depend on PHY_SUN6I_MIPI_DPHY
Message-ID: <YxtPZpA1YBRgjBA3@paasikivi.fi.intel.com>
References: <20220905100054.3259357-1-sakari.ailus@linux.intel.com>
 <YxtHBbvZ2sq6KIyp@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxtHBbvZ2sq6KIyp@aptenodytes>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Sep 09, 2022 at 04:00:37PM +0200, Paul Kocialkowski wrote:
> Hi Sakari,
> 
> On Mon 05 Sep 22, 13:00, Sakari Ailus wrote:
> > PHY_SUN6I_MIPI_DPHY is not a freely selectable option and so may not
> > always be available. Depend on it instead.
> 
> I don't get what you mean by "not a freely selectable option".
> It's definitely a tristate. Also no build issue will occur if it's
> unselected (but I guess that's not the point here).

It depends on a number of other configuration options. You can force the
value of the option itself but not its dependencies. This can lead to build
errors dependin on the values of the options PHY_SUN6I_MIPI_DPHY needs.

-- 
Sakari Ailus
