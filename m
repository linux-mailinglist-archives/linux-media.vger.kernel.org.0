Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B84F6A9C79
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 17:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbjCCQ4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 11:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjCCQ4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 11:56:10 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84459234E7
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677862536; x=1709398536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aS92hVDMGDChwaCLtd6Sq9OQ/y6aHPpAId2SpIZoOgw=;
  b=jdiGJzPf8lGav6yXsuPwmj0l9x6stmz2W60avSaBXNMH5mZDX2I2uoyk
   6v7rO4P45BkjCW8khSOhPPX6AcjRPIughEaFEj6IoWJYK1ErAA7j9kMo8
   hWSZmPpEKP9S4V5i9cdg2Pew+Snefc4WrprS7DYfyBe/I9DZqDDSc0VnX
   hpWEyBB4NsLsqdp3TXuNIL8epaBgmKqpoxsaflqDsTuRGt76CXv84vDgn
   OjI4e0D3Ic3BoCi8SFNM8z2CqGrUAo1+LPgscnauQFfqjg4/ow+LvP13I
   zj4E1Uw4j0PtDZoWmi/QD9LVwOwz5kr9unAXLrMYR2a7un5OpBFm6A5cu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="315491185"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="315491185"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 08:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="625405460"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="625405460"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 08:54:33 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id F37A6121389;
        Fri,  3 Mar 2023 18:54:29 +0200 (EET)
Date:   Fri, 3 Mar 2023 18:54:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 00/26] Media device lifetime management
Message-ID: <ZAImRQr5MKbYj8Qn@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <85f6411a-bce7-5b22-34b8-e7e1a36ec18c@xs4all.nl>
 <ZAHYyGs5kTxRhmdJ@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAHYyGs5kTxRhmdJ@kekkonen.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 03, 2023 at 01:23:52PM +0200, Sakari Ailus wrote:
> > As I mentioned in my review of patch 21, I don't think 18 and 21 belong to
> > this series.
> 
> Yes, some patches I wrote as part of this should be merged earlier. I think
> I'll just pick them to my master branch once we have rc1.

I originally thought that you meant "media: Add nop implementations of
media_device_{init,cleanup}". The omap3isp devm_request_irq() patch can be
dropped and the ipu3-cio2 requivalent changed as I discussed in the other
e-mail.

-- 
Sakari Ailus
