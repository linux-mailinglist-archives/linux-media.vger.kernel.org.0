Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFBB3F7032
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 09:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239113AbhHYHQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 03:16:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:26714 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238606AbhHYHQx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 03:16:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="215623578"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="215623578"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 00:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="536177254"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 00:16:04 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AC6E52047C;
        Wed, 25 Aug 2021 10:16:02 +0300 (EEST)
Date:   Wed, 25 Aug 2021 10:16:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 05/12] media: i2c: Add .get_selection() support to
 ov8865
Message-ID: <20210825071602.GL3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-6-djrscally@gmail.com>
 <20210810133821.GC3@paasikivi.fi.intel.com>
 <bf35ebbd-3c85-18c5-cbe8-43b6d5398533@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf35ebbd-3c85-18c5-cbe8-43b6d5398533@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 25, 2021 at 12:17:15AM +0100, Daniel Scally wrote:
> Hi Sakari - sorry delayed reply
> 
> On 10/08/2021 14:38, Sakari Ailus wrote:
> > Hi Daniel,
> >
> > On Mon, Aug 09, 2021 at 11:58:38PM +0100, Daniel Scally wrote:
> >> The ov8865 driver's v4l2_subdev_pad_ops currently does not include
> >> .get_selection() - add support for that callback.
> > Could you use the same for .set_selection()? Even if it doesn't change
> > anything.
> 
> 
> You mean do the same? Or use the same function?

The same function. If the selection isn't changeable anyway, the
functionality is the same for both.

-- 
Sakari Ailus
