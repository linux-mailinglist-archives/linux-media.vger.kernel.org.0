Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5712772E8FE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 19:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbjFMRGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 13:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjFMRGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 13:06:37 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE131184
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686675995; x=1718211995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ml+VKpRAfIdkP/V5ZkQOwzZe1UiuYU+CxXEYg/64gdk=;
  b=FbwFd7oqkOsOHigQOeKydoH85v11o25pyOsggEuyNjOJMVUyRb89iz/D
   gkbqj+zsysm9s7MsNN9RvLiz7aBW/V34KcqXfqxQklca1maS2T0HJXgpX
   Ns3fU+BCDt4VVPD4m5jKA08Xid/yTWi5sZ23c2yCUcJvJC2kaVuk8zANs
   mIHYYRb2qlcm84zDvfOfIa7N5liHm2V5g+yxepI72ZO+skgWjweLOlIe1
   9SU+1axd2YHYE6uLtT5IYRyWsNBRekdWyQKQAWh+Akuti00gs0AYcn02z
   GnvslJJDrwWOMFga9KSSGiTwLRE0z8HrQpeJQYMTbdvaFBvylRCCsOGkY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357279006"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="357279006"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711729511"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="711729511"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:06:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 05CAF120C1C;
        Tue, 13 Jun 2023 20:06:31 +0300 (EEST)
Date:   Tue, 13 Jun 2023 17:06:31 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] media: staging: atomisp: select V4L2_FWNODE
Message-ID: <ZIiiF817qIhRb3fP@kekkonen.localdomain>
References: <20230613165109.111837-1-sakari.ailus@linux.intel.com>
 <ZIig2sPWRnLvI+iH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIig2sPWRnLvI+iH@smile.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Jun 13, 2023 at 08:01:14PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 13, 2023 at 07:51:09PM +0300, Sakari Ailus wrote:
> > Select V4L2_FWNODE as the driver depends on it.
> 
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> > Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> I believe this should be @linux.intel.com, but it doesn't matter.

I can change that before sending the PR. You used you @intel.com e-mail for
sending it, just FYI.

-- 
Kind regards,

Sakari Ailus
