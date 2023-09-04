Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0B9791497
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 11:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352636AbjIDJQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 05:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjIDJQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 05:16:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6832F0
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693819015; x=1725355015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A4PN7XeztqzC4/wtj23x3OEnn7M/EltgUmHV7ZtBYdk=;
  b=LXqqRuGqNFmdM+VHeWA/HH9t6ZQCSB0UEv4bj7KqDlJL8NheiXRjkeQ1
   /6w7EP9hLo7dfXV8sK9YN+IK7lcizybzqKsFZ2MCXPnsAF5DH+MouSIcv
   gvL9d8t8srDYsnM3G0TXZqP3eWtSW81AGXAW1qqsMsRh0gFqrq+JHUEAJ
   Ryt27ssb6f4Gus3RoS8kY7UXE5Cmt1ybfy4XVI1aduGuAt2XvCWjrWLUZ
   QwNJCfUgYVtzZZhTN8QPjWV6hqWElc65KTARrxlw/SV1o0CjEGzRmZh1e
   ljYsPv++M2WOZ0G/XFDsIQLtQY97q0apQVJOzXST4auF8T0MQLa3/V5/s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442954433"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="442954433"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690522627"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="690522627"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:16:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qd5hR-006Nod-0Z;
        Mon, 04 Sep 2023 12:16:49 +0300
Date:   Mon, 4 Sep 2023 12:16:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <ZPWggDZ0pmHiHe5O@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
 <fc63b127-d8e5-c278-d17a-3ecc90febbe3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc63b127-d8e5-c278-d17a-3ecc90febbe3@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 04, 2023 at 02:12:56PM +0800, Bingbu Cao wrote:
> On 9/3/23 10:32 PM, Hans de Goede wrote:

...

> Unfortunately, I did not reproduce this problem on my machine. The interrupt
> should not be triggered until buttress authentication if need. 
> So could you help try to move the devm_request_threaded_irq() block before

Maybe it's DEBUG_SHIRQ what is missing?
You always should use that for any of the code under development.

-- 
With Best Regards,
Andy Shevchenko


