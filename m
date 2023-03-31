Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972666D210E
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 15:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbjCaND0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 09:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCaNDZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 09:03:25 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770A15B9D
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680267802; x=1711803802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gY7fh4ScwGUXeTx5sb4qgSnuQjLzyKyF4DuSa/W1LzQ=;
  b=adStYNFul0HDaybOYrDM5uuqk4xgUcqWpsTRgQbGj8tXsOCTT7EOXxWb
   ftY8DhcYP5s9OITKYS/D6qVGfxE9e2i3ANXeMrysOSpEAoxbLCvHCz71P
   R6MXHrSXpp16hkv7jVeSNZi9HkP4FKlkiP4+RLuzBcO+cnvSppoBSHCiR
   6V6nR0V3CJxPXNAYaXlAWIg4LJGh2MGiplBN+3xsIgyV++7cNOypDH4uL
   yuGaFtmzw/QxSxCbr+MynAxBSZSysZR0k3C0i6yC7jAWjakMEBT/Ss+CU
   SSXGWkMK4kElZo9HHDJBwLSHDWcBAbi1TRPg0b8bTV8lPdOzkM6cBBfoX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343963809"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="343963809"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 06:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="796112597"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="796112597"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 06:03:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4F36F11F931;
        Fri, 31 Mar 2023 16:03:01 +0300 (EEST)
Date:   Fri, 31 Mar 2023 16:03:01 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        djrscally@gmail.com
Subject: Re: [PATCH v2] media: ipu3-cio2: support more camera sensors in
 cio2-bridge
Message-ID: <ZCbaBUFdYgN5QuU4@kekkonen.localdomain>
References: <20230303181504.1813469-1-bingbu.cao@intel.com>
 <f5ce2815-a875-25a4-269d-69b30ce534b7@ideasonboard.com>
 <06f27826-356d-2ed1-2b28-2de59cfae14b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06f27826-356d-2ed1-2b28-2de59cfae14b@linux.intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Fri, Mar 31, 2023 at 09:00:09PM +0800, Bingbu Cao wrote:
> 
> On 3/6/23 5:34 PM, Dan Scally wrote:
> > Good morning Bingbu
> > 
> > On 03/03/2023 18:15, bingbu.cao@intel.com wrote:
> >> From: Bingbu Cao <bingbu.cao@intel.com>
> >>
> >> Add more camera sensors into the supported camera sensors list
> >> to make cio2-bridge to support more camera sensors.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Thanks; this looks ok to me now:
> > 
> > 
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > 
> Sakari, 
> 
> Will you pick this change?

Thanks for the ping. I must have mistakenly mark this as "under review" in
patchwork earlier. It's in my tree now.

-- 
Kind regards,

Sakari Ailus
