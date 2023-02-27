Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06416A4DC2
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 23:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjB0WJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 17:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjB0WJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 17:09:29 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D593134
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 14:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677535769; x=1709071769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VbBQCOVmZAa6p2ZW4jgMpvc0ujiyQrZG5rUdSASwGPU=;
  b=ll72SEbiFRmpk6P5WDJw3vpqqSHrlXFUPFUiD67SjYLh/S/2xlgIwFGU
   jpJFMVL/rkO7YIYziqHR41kHyBBpyK8h0KSKE3FEdkad+aCvY/TqWzChw
   Uk+1gygGJnRUjgCvHLW24aymGooatIRRwTtuKywfmIKBiQhXYJZUGqywE
   SocDNu36NJMvrCd/a9vo8PTv2WY/AkB8DWHNAO2OABIXIaCjRgjMm8Ybd
   qki0iZc7C52qq98IefkGbTBMAYMbT/n9v5MzVac5fAUUFbfOoVAWA5Slm
   ZGeB+QPIL7E29uxNx6h3S2n0XZBmblvGSDWnCMvIdTgjUUCoaZFzKeKFH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336263630"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="336263630"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 14:09:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919524159"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="919524159"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 14:09:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B66D911F915;
        Tue, 28 Feb 2023 00:09:24 +0200 (EET)
Date:   Tue, 28 Feb 2023 00:09:24 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 27, 2023 at 06:11:47PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
>    I don't see this patch being collected for 6.3 while I recall that
> based on the discussion we concluded we can have these in and the
> iterate on top ?

I know... I'll take it to my tree early in the next cycle (once we have
rc1).

-- 
Kind regards,

Sakari Ailus
