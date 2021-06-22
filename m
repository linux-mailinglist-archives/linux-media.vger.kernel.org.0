Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E923B0180
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 12:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhFVKi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 06:38:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:44151 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhFVKi5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 06:38:57 -0400
IronPort-SDR: Bk7pH/l3OlbDmH1LE4x1a0M5qVOuQuurgn6LYI5fnB6hlqyMWQ3EOLCJkfolVHlWTKRQiBoZpI
 R0CDFEVvrcXA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206848129"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="206848129"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 03:36:41 -0700
IronPort-SDR: 564DGZ3w3fbGzzXjziCPY2/clj0HIMH2hgavCU/DHF3sPeBS9UYQHVYH3UDhgHen15pko6sV/w
 Qk25bne3Emzw==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="473729433"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 03:36:39 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C25382036A;
        Tue, 22 Jun 2021 13:36:37 +0300 (EEST)
Date:   Tue, 22 Jun 2021 13:36:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: v4l2-fwnode: Simplify
 v4l2_async_nf_parse_fwnode_endpoints()
Message-ID: <20210622103637.GH3@paasikivi.fi.intel.com>
References: <20210613150847.774978-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210613150847.774978-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sun, Jun 13, 2021 at 05:08:47PM +0200, Niklas Söderlund wrote:
> There are only one user left of __v4l2_async_notifier_parse_fwnode_ep()
> since [1], v4l2_async_notifier_parse_fwnode_endpoints(). The two
> functions can be merged.
> 
> The merge of the two highlights a dead code block conditioned by the
> argument 'has_port' that always is false and can therefor be removed.
> 
> 1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Extend commit message to describe that the dead code removed is created
>   by the merge of the two functions.
> - The rename of the effected function never made it upstream, rebase
>   this patch to latest media-tree so it can be picked-up without the
>   rename.

I've continued work on the rename, and I'm about to send a new version.

So I'll take the commit message changes from this one if that's fine for
you.

-- 
Kind regards,

Sakari Ailus
