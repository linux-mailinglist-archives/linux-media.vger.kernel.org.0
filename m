Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263F13F70D9
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 10:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbhHYIFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 04:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhHYIFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 04:05:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B40DC061757
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 01:04:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58E306EE;
        Wed, 25 Aug 2021 10:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629878654;
        bh=KFXROVBEOOlJgIb6lW7yZEOcoS40FPEBKbK/Zo5Yjh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFaTvhF9vvY68mXVqJc/CD52gwQkpPwR11d3KMSeF4+P3OjmaT6m+gKHqonJNDsGy
         ESlaQ7JOKtNUAxQz/sb76lIEA2qMfnuJCPt/09UIfV2ZUXElVWfK8HpkCnWB+jRTjM
         nb531T7kgB37GCMAjywmwrICtBed8XOy8/utzxRk=
Date:   Wed, 25 Aug 2021 11:04:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, paul.kocialkowski@bootlin.com,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 05/12] media: i2c: Add .get_selection() support to
 ov8865
Message-ID: <YSX5cvNxTgA2Wugd@pendragon.ideasonboard.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-6-djrscally@gmail.com>
 <20210810133821.GC3@paasikivi.fi.intel.com>
 <bf35ebbd-3c85-18c5-cbe8-43b6d5398533@gmail.com>
 <20210825071602.GL3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210825071602.GL3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 25, 2021 at 10:16:02AM +0300, Sakari Ailus wrote:
> On Wed, Aug 25, 2021 at 12:17:15AM +0100, Daniel Scally wrote:
> > Hi Sakari - sorry delayed reply
> > 
> > On 10/08/2021 14:38, Sakari Ailus wrote:
> > > Hi Daniel,
> > >
> > > On Mon, Aug 09, 2021 at 11:58:38PM +0100, Daniel Scally wrote:
> > >> The ov8865 driver's v4l2_subdev_pad_ops currently does not include
> > >> .get_selection() - add support for that callback.
> > > Could you use the same for .set_selection()? Even if it doesn't change
> > > anything.
> > 
> > You mean do the same? Or use the same function?
> 
> The same function. If the selection isn't changeable anyway, the
> functionality is the same for both.

Except that .s_selection() should return an error if you try to set the
bounds or default rectangles.

-- 
Regards,

Laurent Pinchart
