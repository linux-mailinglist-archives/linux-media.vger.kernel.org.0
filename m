Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E5D6909B4
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 14:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjBINRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 08:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBINRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 08:17:15 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEC4CDD1
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 05:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675948621; x=1707484621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5zLOm6GF1T310sYW9NNlLoCss3co5ywOx2XhNvoeXE=;
  b=bY/KsdYTY+1GB6x29QBUQ5hViaX8TZm8aeD4/Z3tTH2Zo+G5q+mD2QMA
   5y9kO3EGfexzQkVPVVb0ZU1/lztk39/7lcXqYuPAnMgvNehPy3J3hpVPE
   HtIevz6n80ZuLVcj2QSCr927V0xxHX47Kbo/xWKhfo1hTG3+Quo1q23cd
   SsIcoOevwmrv5jhWL8TFv/EWWw55cbuyRRRIIMe7oobJSV0rof76F0krK
   tbYwBfiPfR8e3blw+l4H1FKYInjrpedWb0p7rSQujHUkdxNJiqO//3EKY
   q56bcTqsA41ST/4tr2gmlU/70xMNZyTifeWl0U5zjX9288yMbA9fEUKJX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394687415"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="394687415"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 05:15:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756398198"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="756398198"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 05:15:16 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id EE19811F9EF;
        Thu,  9 Feb 2023 15:15:13 +0200 (EET)
Date:   Thu, 9 Feb 2023 15:15:13 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, yating.wang@intel.com
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
Message-ID: <Y+Tx4Yxt3NGZ2Mw8@kekkonen.localdomain>
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <CAPY8ntBiBS+_TH2BgkBF9dCD8nnJnEyMaxSbOvDkW4g3Kgs-Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBiBS+_TH2BgkBF9dCD8nnJnEyMaxSbOvDkW4g3Kgs-Gg@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Feb 09, 2023 at 12:40:43PM +0000, Dave Stevenson wrote:
> > +static struct i2c_driver ov01a10_i2c_driver = {
> > +       .driver = {
> > +               .name = "ov01a10",
> > +               .pm = &ov01a10_pm_ops,
> > +               .acpi_match_table = ACPI_PTR(ov01a10_acpi_ids),
> 
> As you're only supporting ACPI here, make ACPI a dependency in Kconfig?

I wonder if || COMPILE_TEST should be added as there's nothing ACPI
specific in this driver, it's that only ACPI is supported.

Very few drivers have firmware type dependencies currently.

-- 
Sakari Ailus
