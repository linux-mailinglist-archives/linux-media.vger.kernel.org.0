Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF8149FE12
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 17:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245390AbiA1Qa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 11:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbiA1Qa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 11:30:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5516EC061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 08:30:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8866E471;
        Fri, 28 Jan 2022 17:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643387454;
        bh=XBP4fqVDIshW/0zv717gGdS9TkWCbpnwDkqFFkXpttw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fSrs5zbwPI7c1uVAw2PqQJ4Q/6bDw5K37n/yLM6Dhv3cQ0JIEdK2txAuAucrT7UnK
         JCSl6JN/fSWG3z3niloN1rsFeo8x0moYFmE8LEppcXaR4APC5mehjUmBijq+w5ZQmJ
         3uATVMucxbUZx3sdYrNcHE6X5obA3Us6bNp5oXDY=
Date:   Fri, 28 Jan 2022 18:30:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 4/4] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <YfQaKV0OVe43ZZvD@pendragon.ideasonboard.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-5-sakari.ailus@linux.intel.com>
 <YfQEoJIA9Tm5wRbF@pendragon.ideasonboard.com>
 <YfQUyEq8yGtBx9jB@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfQUyEq8yGtBx9jB@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jan 28, 2022 at 06:07:36PM +0200, Sakari Ailus wrote:
> On Fri, Jan 28, 2022 at 04:58:40PM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> 
> And thanks for the review!
> 
> > On Fri, Jan 28, 2022 at 10:33:09AM +0200, Sakari Ailus wrote:
> > > The bus_info field is set by most drivers based on the type of the device
> > > bus as well as the name of the device. Do this in v4l_querycap() so
> > > drivers don't need to. This keeps compatibility with non-default and silly
> > > bus_info.
> > 
> > Do we have many PCI or platform drivers with non-default bus_info ?
> 
> Quite a few actually. Most have something static in bus_info and there are
> also PCI Express devices that use "PCIe:" prefix. These are mostly old
> drivers though. I've left them as-is.
> 
> New drivers shouldn't bother changing the default unless there's a good
> reason to do that.

Let's make it very clear in the documentation then.

> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> I'll address the other comments and send v3.

-- 
Regards,

Laurent Pinchart
