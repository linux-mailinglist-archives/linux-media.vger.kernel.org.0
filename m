Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5581C5082F5
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 09:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376579AbiDTH57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 03:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376576AbiDTH55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 03:57:57 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DE026FA
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650441312; x=1681977312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAPqXkrsUGPDb8IL8qK6eSoYio0dg73/vgFPIwZt4hc=;
  b=ausvjBukFFWZSfMh005BoBLGkQumcVCQD6AXCJNaiLpzCxK5xd/wIp7o
   OFF9dOO69dQre8gGBJ7A/wKy5yHg5DkMQcRZRQBMzyDlfBKKapD0LmsGa
   4nIe163pcEci3Zig6ZT9Pizfun3uUzY4LqHXuTBSZdnMUyK1Zam+HQq/r
   1ddVLwoYrT+Lb6vYcAhyt8eJpXHsBS8nf1h+NyR72dkR94kWzN/W5gXPC
   xNrBCJWCge+hoAmJrX6kZmAqAlCE53JxlwNijeLL1S1iqmWqu0Bsc2LlO
   XlH0rWpDJPGrMPOB1m52Ch9mEsrLCeYD9gnoC4wch+7ETZUFYSexEg/xA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="324408578"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="324408578"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 00:55:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="576471821"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 00:55:10 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 717092016F;
        Wed, 20 Apr 2022 10:55:08 +0300 (EEST)
Date:   Wed, 20 Apr 2022 10:55:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Request specific firmware
 binary
Message-ID: <Yl+8XAD3WS0LKIEc@paasikivi.fi.intel.com>
References: <20220413103739.622349-1-sakari.ailus@linux.intel.com>
 <Yl8e8Pw3rfJ+lhDZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl8e8Pw3rfJ+lhDZ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 19, 2022 at 11:43:28PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Apr 13, 2022 at 01:37:39PM +0300, Sakari Ailus wrote:
> > Primarily request a specific revision of the IPU3 firmware that the driver
> > is known to work with,
> > irci_irci_ecr-master_20161208_0213_20170112_1500.bin. Some distros only
> > ship this while others provide a symlink called ipu3-fw.bin, which the
> > driver only requested previously.
> 
> Are there distros that ship ipu3-fw.bin but not
> irci_irci_ecr-master_20161208_0213_20170112_1500.bin ? If not, w could
> avoid the fallback to IMGU_FW_NAME.

At least some systems will break if I remove the old name altogether. Some
instructions (for MS Surface AFAIR) only include the shorter symlink name.

-- 
Sakari Ailus
