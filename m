Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCE8281D4B
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgJBVBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:01:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:45824 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBVBZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 17:01:25 -0400
IronPort-SDR: 4O3z0VQxiJZ92gck1SoIGY6SekIx0K16Q7AXJ5KqqCip4oS3VKqUQghcobNkl2EbfdU7uMSNQn
 V3eWD99JQ5HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="162318310"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="162318310"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:01:15 -0700
IronPort-SDR: aMmvmhKL8yw2fSjNOXlJ0dgtfv/qc2hNhlNk9mlLtfGDvZIt8gbYXCqtS5peJUNl85djHoWwUk
 luK/1AO/6ukw==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="515285545"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:01:13 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 79383205EA; Sat,  3 Oct 2020 00:01:11 +0300 (EEST)
Date:   Sat, 3 Oct 2020 00:01:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        jmondi@jmondi.org
Subject: Re: [PATCH 2/5] v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must
 init vep argument
Message-ID: <20201002210111.GV26842@paasikivi.fi.intel.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-3-sakari.ailus@linux.intel.com>
 <20201002155341.isgolejr5xrnshcw@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201002155341.isgolejr5xrnshcw@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 02, 2020 at 05:53:41PM +0200, Niklas Söderlund wrote:
> Hi Sakari,
> 
> Thanks for your work.
> 
> On 2020-09-30 17:48:08 +0300, Sakari Ailus wrote:
> > Document that the caller of v4l2_fwnode_endpoint_parse() must init the
> > fields of struct v4l2_fwnode_endpoint (vep argument) fields.
> > 
> > It used to be that the fields were zeroed by v4l2_fwnode_endpoint_parse
> > when bus type was set to V4L2_MBUS_UNKNOWN but with commit bb4bba9232fc
> > that no longer makes sense.
> > 
> > Fixes: bb4bba9232fc ("media: v4l2-fwnode: Make bus configuration a struct")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for the review!

-- 
Sakari Ailus
