Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA088339153
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 16:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhCLPcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 10:32:12 -0500
Received: from mga17.intel.com ([192.55.52.151]:23975 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231601AbhCLPcA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 10:32:00 -0500
IronPort-SDR: EEtGnbJZqr9O098ql5giq93NqvBEgx2KWhaqeDCNA3mwPcOPm5oshqema821ZjQHF1NyzS9Uxd
 lntO8eNHB+uQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="168761337"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="168761337"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 07:32:00 -0800
IronPort-SDR: NWxG3XavAViYDzrkxGdAWJ9Ncs6TjhFmnxynmVTLK0x54zk5puA5FQE3OJyO/+hKldae0UNKRV
 /KQa2OsPRT2w==
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="372700844"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 07:31:59 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id BF0E0205FC;
        Fri, 12 Mar 2021 17:31:56 +0200 (EET)
Date:   Fri, 12 Mar 2021 17:31:56 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, ezequiel.garcia@collabora.com
Subject: Re: [PATCH v2 4/4] v4l: async, fwnode: Improve module organisation
Message-ID: <20210312153156.GH3@paasikivi.fi.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
 <20210312125657.25442-5-sakari.ailus@linux.intel.com>
 <YEuCcFZqTUMyUaLQ@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEuCcFZqTUMyUaLQ@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 12, 2021 at 04:02:08PM +0100, Niklas Söderlund wrote:
> Hi Sakari,
> 
> Thanks for your work.
> 
> On 2021-03-12 14:56:57 +0200, Sakari Ailus wrote:
> > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > also depends on the former. There is only one exception, the CAFE_CCIC
> > driver, which uses V4L2 async but does not need V4L2 fwnode.
> > 
> > At the same time there is a vast number of systems that need videodev
> > module, but have no use for v4l2-async that's now part of videodev.
> > 
> > In order to improve, build v4l2-async and v4l2-fwnode as a single module
> > called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> > Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> > 
> > This also moves the initialisation of the debufs entries for async subdevs
> > to loading of the v4l2-async module. The directory is named as
> > "v4l2-async".
> 
> I tested this patch as part of your latest master branch [1] and it 
> fails to compile for me,

Yeah, sorry; I pushed an intermediate version there, the fixed one is on
the list (and now-updated master branch).

-- 
Sakari Ailus
