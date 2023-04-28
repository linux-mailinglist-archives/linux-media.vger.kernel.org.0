Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 553986F15A3
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 12:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjD1KfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 06:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345839AbjD1KfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 06:35:11 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F2CCD
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682678110; x=1714214110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FAw2JvUnWPtSL3BFNGMqasb/oN1jYinP7cicasSnoOk=;
  b=RK8xQU5DwKKPrOOiaig4PygsRiwJPmeHR8du6NWr9d5S/jYyU30lkw/0
   MkB887X30Vs4JpONOoGKyQE71r8VHGtaA8rutI55D+umtAup+Gs3X11G4
   Aa2yFc20z28f5ugIMMuf9NZ6utO+u6xudm0i0fxJ5aC/ZXOKnZNZwt/jq
   S2qiOGWSvatU7RNLHG0jKlZi+lQaWMv0kdthmAnLQshM/EMfwjKSufae6
   E0SLJvLdzANg9s2c/VI1iR2OP3bAOui52eYXBNK8P5A8BFYuVapOD6Mtv
   6CC7jS3Le54p4cn3b/78O3SDcwLcjXtXS9kahMdHySDVTsWgK0b8gp7sU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410808713"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="410808713"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 03:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694759667"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="694759667"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 03:35:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6B41A11FCA0;
        Fri, 28 Apr 2023 13:35:04 +0300 (EEST)
Date:   Fri, 28 Apr 2023 13:35:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 17/18] media: v4l: async: Set v4l2_device in async
 notifier init
Message-ID: <ZEuhWJp6i5dSuSeX@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-18-sakari.ailus@linux.intel.com>
 <20230425003526.GD4921@pendragon.ideasonboard.com>
 <20230425020052.GA9443@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425020052.GA9443@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 25, 2023 at 05:00:52AM +0300, Laurent Pinchart wrote:
> On Tue, Apr 25, 2023 at 03:35:26AM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Mar 30, 2023 at 02:58:52PM +0300, Sakari Ailus wrote:
> > > Set the v4l2_device already in async notifier init, so struct device
> > > related to it will be available before the notifier is registered.
> 
> Also, please explain why this is needed.

I'll add this for v2. Basically the debug messages have NULL device before
notifier registration before this patch.

-- 
Sakari Ailus
