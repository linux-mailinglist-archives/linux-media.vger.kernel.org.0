Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62DCD6A95B6
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 11:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjCCK7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 05:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjCCK7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 05:59:10 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B342166F0
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 02:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677841147; x=1709377147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wAqnfqPKS+48InwH/grVfi8TJeITJsLeey8nazHRdbc=;
  b=iSgjsqxiHdHjVrt04EdWjNchQi1zyMfRCOFOSrvVn6HYNBX7PP02hyat
   Kpix7k5A+uxxxgVcAOhnKc34H3Scyvzxpi4jldqai5B7zBOo9PLI9n1Vj
   s7t79rNQcIpOSIAhuy5pnajczTzkbL/OJfxBumV2PXODgC24+ReWie4v8
   XkrfFz77hN0jqPTVFd+0mJE0AFib6rHrmLDwSsQ8v4gGXoD/mZzl4Uq3P
   wl/959LG6o91qMQW81bBiPJsiVGXhtuOy8Kas6S4DQllUB3XSwT4cAlOb
   nFlbTlKKLaopeRpgkwyH4/7W5DWic03KVlRyKTrS8K8+hPdgyjhP1qp9o
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314673889"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="314673889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 02:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849424183"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="849424183"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 02:58:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 507941207E1;
        Fri,  3 Mar 2023 12:58:52 +0200 (EET)
Date:   Fri, 3 Mar 2023 12:58:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 21/26] media: ipu3-cio2: Don't use devm_request_irq()
Message-ID: <ZAHS7NOCJyhb7RtN@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-22-sakari.ailus@linux.intel.com>
 <c180080e-c4b9-3cbe-558d-ca97b1d2456d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c180080e-c4b9-3cbe-558d-ca97b1d2456d@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review!

On Fri, Mar 03, 2023 at 09:21:03AM +0100, Hans Verkuil wrote:
> On 01/02/2023 22:45, Sakari Ailus wrote:
> > Use request_irq() instead of devm_request_irq(), as a handler set using
> > devm_request_irq() may still be called once the driver's remove() callback
> > has been called.
> > 
> > Also register the IRQ earlier on.
> 
> Why register it earlier? You do not explain the reason.

The device nodes are created before the interrupt handler is registered. It
should happen in the other way around. I'll change tha patch description.

> 
> Also, does this patch (and also 18/26) belong in this patch series?
> It seems more like a normal bug fix and not related to life-time management.
> 
> And isn't it the responsibility of the driver to ensure that the irqs are
> masked in the remove() callback to prevent the irq from being called?
> 
> devm_request_irq() is used a lot in the kernel, so if this is a
> common issue, then just fixing it in two drivers isn't going to make
> much of a difference.

I came to think of this after sending the patch as well. It's memory that
is the problem, any hardware access needs to end before remove is called.

I'll drop the devm removal.

-- 
Kind regrads,

Sakari Ailus
