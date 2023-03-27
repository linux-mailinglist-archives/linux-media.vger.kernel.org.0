Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731816C9BA0
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbjC0HHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjC0HHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:07:20 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1483D26B1
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679900838; x=1711436838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GsHx+oTBjWEttw7JPCduNG7URU+sDjS215M7IzcZ+FI=;
  b=mwvplt6O4QnPLjeSqsNflBiNp+7shxQA6Egj5f9SsYa5nQMDaDEwOar9
   YdR3Tf+cQjUBNSyfz7VptJPi+BNAKaORIyaaQPxX+3uhGXjlQqctJyDy8
   VY7uQz2gOGY0MYVIflf/mwS+p32BpjU8LLTx0aFGbbL81VWZljFvgXl4u
   suoJp64YSqeCzKXUdmNC3tHQZ9DV2twPipvtjzcWPx3zHdtkUiw1IZFpU
   pZVYdLTNZfeRdCTpRRGavV4xDcA95wFtx44rILDVcsLglSGJFZ2f6mFQN
   EnNzk1mZt4h64/DMVFIT6YoTMhbyHIQzCmUNTdXhuIvMMj5StxG8Y7JKD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="342598126"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="342598126"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="683362726"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="683362726"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:06:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C60E61218A3;
        Mon, 27 Mar 2023 10:06:54 +0300 (EEST)
Date:   Mon, 27 Mar 2023 10:06:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     hdegoede@redhat.com, djrscally@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to INTC1059 device
Message-ID: <ZCFAjoaIG2VxtLJr@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-4-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679898188-14426-4-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Mon, Mar 27, 2023 at 02:23:08PM +0800, Wentong Wu wrote:
> Inside IVSC, switching ownership requires an interface with two different
> hardware modules, ACE and CSI. The software interface to these modules is
> based on Intel MEI framework. Usually mei client devices are dynamically
> created, so the info of consumers depending on mei client devices is not
> present in the firmware tables.

Ouch.

> 
> This causes problems with the probe ordering with respect to drivers for
> consumers of these mei client devices. But on these camera sensor devices,
> the ACPI nodes describing the sensors all have a _DEP dependency on the
> matching INTC1059 ACPI device, so adding INTC1059 to acpi_honor_dep_ids
> allows solving the probe-ordering problem by delaying the enumeration of
> ACPI-devices which have a _DEP dependency on an INTC1059 device.

What does the INTC1059 device represent?

-- 
Sakari Ailus
