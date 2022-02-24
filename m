Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225BC4C2E4A
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 15:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbiBXOXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 09:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235521AbiBXOXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 09:23:32 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE441637F7;
        Thu, 24 Feb 2022 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645712574; x=1677248574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l5OF1IXQhbqMjYq2WY0GUytXWnUBqArVIXwdMsC7n4w=;
  b=RoUPmzczCDXdBcG7a8NjQe0zSOvE3qqqJ1n1vkierN4hjQOryFs0vWF8
   qFRMJOgYD3JxemsJXHQM+ZsRC6fS9i+OQdC2uiLNDF6oz6QtaLTwLNbnn
   rBBQIcH1aLqCflbGuCKhbnNvUqbH6r5LL4V6praLO6T/jqHsD189uixM0
   aDS8lvD0hZcm5sJcA4rDRta2BwxHgjotRzWor8e3kR1VDyGJ6cMN5G/E0
   /Xf7Gq9OJuBfVRFJMr+FgKCALBFVuL41ULOpuBrzgvrTCB6hICwu3UnNx
   QA4V9B43cGM7ZzyNq3eQf1Ob/QFNWdsikKkhGKd40v+aSwBS0+WH2hJFL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="252436831"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="252436831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 06:22:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="684289193"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 06:22:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 3933220212;
        Thu, 24 Feb 2022 16:22:48 +0200 (EET)
Date:   Thu, 24 Feb 2022 16:22:48 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v10 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <YheUuCShBA6jvn8a@paasikivi.fi.intel.com>
References: <20220217154407.2892822-1-m.tretter@pengutronix.de>
 <20220217154407.2892822-3-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217154407.2892822-3-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Thu, Feb 17, 2022 at 04:44:07PM +0100, Michael Tretter wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add driver for the Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder.
> This chip supports 1/2/4 analog video inputs and converts them into
> 1/2/4 VCs in MIPI CSI2 stream.
> 
> This driver currently supports ISL79987 and both 720x480 and 720x576
> resolutions, however as per specification, all inputs must use the
> same resolution and standard. The only supported pixel format is now
> YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but
> this is currently unsupported.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-media@vger.kernel.org
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

This gives (sparse or smatch presumably?):

        ../drivers/media/i2c/isl7998x.c: ../drivers/media/i2c/isl7998x.c:561    
isl7998x_norm_to_val() error: buffer overflow 'isl7998x_std_res' 9 <= 9         
(assuming for loop doesn't break)                                               
        ../drivers/media/i2c/isl7998x.c: ../drivers/media/i2c/isl7998x.c:576    
isl7998x_norm_to_mode() error: buffer overflow 'isl7998x_std_res' 9 <= 9        
(assuming for loop doesn't break)                                               

Could you address that? I'll squash that to this patch.

-- 
Sakari Ailus
