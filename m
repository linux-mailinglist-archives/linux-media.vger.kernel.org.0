Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485C93F711E
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 10:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhHYIab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 04:30:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:64761 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229780AbhHYIaa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 04:30:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217512799"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="217512799"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:29:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="597978963"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:29:40 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6BA85201ED;
        Wed, 25 Aug 2021 11:29:38 +0300 (EEST)
Date:   Wed, 25 Aug 2021 11:29:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, paul.kocialkowski@bootlin.com,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 05/12] media: i2c: Add .get_selection() support to
 ov8865
Message-ID: <20210825082938.GQ3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-6-djrscally@gmail.com>
 <20210810133821.GC3@paasikivi.fi.intel.com>
 <bf35ebbd-3c85-18c5-cbe8-43b6d5398533@gmail.com>
 <20210825071602.GL3@paasikivi.fi.intel.com>
 <YSX5cvNxTgA2Wugd@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSX5cvNxTgA2Wugd@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 25, 2021 at 11:04:02AM +0300, Laurent Pinchart wrote:
> On Wed, Aug 25, 2021 at 10:16:02AM +0300, Sakari Ailus wrote:
> > On Wed, Aug 25, 2021 at 12:17:15AM +0100, Daniel Scally wrote:
> > > Hi Sakari - sorry delayed reply
> > > 
> > > On 10/08/2021 14:38, Sakari Ailus wrote:
> > > > Hi Daniel,
> > > >
> > > > On Mon, Aug 09, 2021 at 11:58:38PM +0100, Daniel Scally wrote:
> > > >> The ov8865 driver's v4l2_subdev_pad_ops currently does not include
> > > >> .get_selection() - add support for that callback.
> > > > Could you use the same for .set_selection()? Even if it doesn't change
> > > > anything.
> > > 
> > > You mean do the same? Or use the same function?
> > 
> > The same function. If the selection isn't changeable anyway, the
> > functionality is the same for both.
> 
> Except that .s_selection() should return an error if you try to set the
> bounds or default rectangles.

That would make sense. But it's not documented. And in any case it should
be implemented in the framework. :-)

-- 
Sakari Ailus
