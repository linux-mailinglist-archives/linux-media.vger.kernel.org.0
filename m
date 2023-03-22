Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84376C4A97
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 13:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjCVMa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 08:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjCVMas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 08:30:48 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B765614F
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679488243; x=1711024243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAxaXnb/DS1ssWtN1ggZ5pPDTbvcMWCgscq9jlmJkX8=;
  b=L6dx6Ucxn8r5fAkPfA5/OVNeMHG6Ieg6Vl19NWkzG8HDVIBwloyjdm/d
   M5o/ylXjOQSFlara1Xi8vg5/LeD/A7qkUc9UtWsl7/cDLasVqlAUpITk4
   81EQcoWTXp5dS3s3uZxQqxp97+Qrs42/7LzkyIOJrPPfgYDFDNOTW89lS
   1TYWQQ0j4FmZvVZGQF5V8WOz/9Ro6VXTWzZuu+kS/8sCNE5BQpKYGiyiN
   WnR6XBOljuZ/7/y8Wpj0ECa2SVOMfwX3anLkLHtxuxErc4SaBGfTfFTbh
   AMhWZPTw6etPl71Wcxm5LC9qQPA29lX7QYGRbqzdrXLlP0vz/dYIeQCLY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337919910"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="337919910"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 05:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="751016882"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="751016882"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 05:30:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 36A8912233C;
        Wed, 22 Mar 2023 14:30:39 +0200 (EET)
Date:   Wed, 22 Mar 2023 14:30:39 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <ZBr074jSExZfufDa@kekkonen.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
 <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
 <20230322122730.7upptgfrwpwlqoi5@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322122730.7upptgfrwpwlqoi5@uno.localdomain>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Mar 22, 2023 at 01:27:30PM +0100, Jacopo Mondi wrote:
> Hi Sakari,
>   as Robert noted, this doesn't seem to be part of the pull request
> for 6.4 ? Is it intentional ?

Uh, yes and no. These definitely should go to 6.4 but I wanted to address
the CCS driver at the same time. I'll try to post CCS patches next week but
if these don't make it, I'll just merge these nonetheless.

-- 
Kind regards,

Sakari Ailus
