Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137303371CB
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 12:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbhCKLvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 06:51:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:40596 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232904AbhCKLvb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 06:51:31 -0500
IronPort-SDR: l6PnxQOkloR2CqaYUQa9h9HGTIoawUBnp+eXQ6Kx3GRgnKV5uSQSoUikCeX+HtDL/nfscvd1pd
 qX0xXxSTzY0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="252671196"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="252671196"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 03:51:30 -0800
IronPort-SDR: OMIFnPAwLXaU8xCWMniOJSkf4O0oOAU8mNYxMrki9aNs7ZNKAfLlMaaVKDugjhY+AtU3YjkNoZ
 reJ1F4yhC+QA==
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="438176732"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 03:51:29 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 8E54B201A2;
        Thu, 11 Mar 2021 13:51:27 +0200 (EET)
Date:   Thu, 11 Mar 2021 13:51:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-fwnode: Simplify
 v4l2_async_notifier_parse_fwnode_endpoints()
Message-ID: <20210311115127.GR3@paasikivi.fi.intel.com>
References: <20210310153743.3556385-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310153743.3556385-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Mar 10, 2021 at 04:37:43PM +0100, Niklas Söderlund wrote:
> There are only one user left of __v4l2_async_notifier_parse_fwnode_ep()
> since [1], v4l2_async_notifier_parse_fwnode_endpoints(). Merge the two
> and remove some dead code.
> 
> 1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

This and the rcar-vin patch no longer apply after my patches related to
V4L2 async. Could you rebase these on them? I've pushed them to the master
branch in my V4L2 git tree.

Thanks.

-- 
Kind regards,

Sakari Ailus
