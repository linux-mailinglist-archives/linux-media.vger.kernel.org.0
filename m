Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BC37063C6
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 11:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjEQJPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 05:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjEQJPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 05:15:22 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3783B421E
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684314921; x=1715850921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kGE7ZRbJzVpizDNGn70/uCxjIzhYxMOxxl9F1PmV6YM=;
  b=hmTReD4oOhvyC+glNSULG44j5jrVADmizr8DuR0SvoWrkoWXTuFmUADC
   /b5CvblxECnWTJmQGys7aumn2D2hyYRNzyRcYQvyzm4n78OI0Q0fAHiLQ
   +hdQSJJNi2CTyC5MeeIIrgQp8TEGXEURlRChNMZGxthOldJ73Tuhn1rRe
   sjmV0nGNxSoaqHJpGzUD/TFKYAQkE7K4m0uvOCY44QKwvhkwZMolSOBwT
   7SWKM/CYOdIXph4s9kvqosB4dajdSc692WjmReVYTN9t4ulv7KUVJ+Zir
   jrkLoEq6c5kRDHHS3aNS7PsgIhOg0FEfkCwMQDHXUiXQ5WT3LSBrMMDs4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="349210921"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="349210921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 02:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="679193201"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="679193201"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 02:15:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 73B4D120279;
        Wed, 17 May 2023 12:15:14 +0300 (EEST)
Date:   Wed, 17 May 2023 09:15:14 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.de
Subject: Re: [PATCH v2 00/31] Separate links and async sub-devices
Message-ID: <ZGSbIkkOV/03lria@kekkonen.localdomain>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
 <3501011.QJadu78ljV@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3501011.QJadu78ljV@steina-w>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Wed, May 17, 2023 at 09:57:59AM +0200, Alexander Stein wrote:
> Hi Sakari,
> 
> thanks for the update. That's awesome, device setup on media-ctl works again 
> on TQMa6x (i.MX6).
> For the record, below is what the media-ctl dot looks like. I was able to 
> capture data on ipu1_csi0_capture device.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #imx6q

Thanks for testing!

I'll wait for Niklas to test them, too. V1 inadvertly broke the adv748x
driver, that should be now fixed.

(But please avoid top posting.)

-- 
Kind regards,

Sakari Ailus
