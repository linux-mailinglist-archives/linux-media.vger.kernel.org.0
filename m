Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54ED667233
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 13:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbjALM2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 07:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjALM2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 07:28:31 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1971150149;
        Thu, 12 Jan 2023 04:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673526490; x=1705062490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vKlg9b+f3vPRjQBcpzZxNKbPtYfKobk3idf/1bw4PuU=;
  b=fe8+vrWQNhwgsMeNblAd2M0Oglx13V8FYA1Rzn+LxrTWBLfu95Aqn3ie
   8TPWxQ+fa3m6gVokU2/IbiapHz7Xy2OvZK5PnzZsCwbZYuNECwhhHV+D7
   c/q9hkfvgk4O4vFXNnJrdPrq5pjbqfy4qyZ4IEVT9IDXR+PUFCyoblE2O
   nelR521f8p9TaX4Xx+V29IKuEnjf2rjHTwOgKULz/no2M6k9e+kfVpPh5
   GFL3RjO78rbMqj3bN32E6QHmm+DMJItGzgccBzOFwZglLoQihGgbLJCdE
   Srqd/KmQbxWlfWIW33QvioMuzfbxf0OnhQay9u1lo7CpjLHBU8tWfnbui
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="307213282"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="307213282"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 04:28:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="607766135"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="607766135"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 04:28:03 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 69D6D2010E;
        Thu, 12 Jan 2023 14:28:01 +0200 (EET)
Date:   Thu, 12 Jan 2023 12:28:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
Message-ID: <Y7/80agpEC/dsls7@paasikivi.fi.intel.com>
References: <20230111201426.947853-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111201426.947853-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 11, 2023 at 09:14:26PM +0100, Hans de Goede wrote:
> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
> specifying that the pins direction should be initialized to a specific
> value.
> 
> This means that in some cases the pins might be left in input mode, causing
> the gpiod_set() calls made to enable the clk / regulator to not work.
> 
> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
> on a Dell Latitude 9420 being left in input mode causing the clk to
> never get enabled.
> 
> Explicitly set the direction of the pins to output to fix this.
> 
> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
