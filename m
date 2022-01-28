Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A9E49FE47
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 17:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349979AbiA1Qos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 11:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349936AbiA1Qor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 11:44:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EC4C061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 08:44:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEC76471;
        Fri, 28 Jan 2022 17:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643388285;
        bh=1BP+xM3NmwJuDPbSDyg66dXpCLJ8Rv9fowjr6lUWXtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M+czletftaff4a4aIigLQ9sTxIvx7Q+dFzey5mTJ8Ae6GMlvOOWCqjLLvCUlR8KFl
         /3sElbJIx/H5Hqb6O0Cvz5nZ6kRqTqqmQkdauw3ilHsAJJjxwlP+87lQOV3ViT81Lw
         pNrtxeOtHiMTlMRgKid76qh5LIwu7rlkCMFhlacs=
Date:   Fri, 28 Jan 2022 18:44:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 4/4] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <YfQdaAQgWTRTtNgq@pendragon.ideasonboard.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-5-sakari.ailus@linux.intel.com>
 <YfQEoJIA9Tm5wRbF@pendragon.ideasonboard.com>
 <YfQUyEq8yGtBx9jB@paasikivi.fi.intel.com>
 <YfQaKV0OVe43ZZvD@pendragon.ideasonboard.com>
 <YfQbb94fKQG4ycDs@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfQbb94fKQG4ycDs@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jan 28, 2022 at 06:35:59PM +0200, Sakari Ailus wrote:
> On Fri, Jan 28, 2022 at 06:30:33PM +0200, Laurent Pinchart wrote:
> > On Fri, Jan 28, 2022 at 06:07:36PM +0200, Sakari Ailus wrote:
> > > On Fri, Jan 28, 2022 at 04:58:40PM +0200, Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > > 
> > > > Thank you for the patch.
> > > 
> > > And thanks for the review!
> > > 
> > > > On Fri, Jan 28, 2022 at 10:33:09AM +0200, Sakari Ailus wrote:
> > > > > The bus_info field is set by most drivers based on the type of the device
> > > > > bus as well as the name of the device. Do this in v4l_querycap() so
> > > > > drivers don't need to. This keeps compatibility with non-default and silly
> > > > > bus_info.
> > > > 
> > > > Do we have many PCI or platform drivers with non-default bus_info ?
> > > 
> > > Quite a few actually. Most have something static in bus_info and there are
> > > also PCI Express devices that use "PCIe:" prefix. These are mostly old
> > > drivers though. I've left them as-is.
> > > 
> > > New drivers shouldn't bother changing the default unless there's a good
> > > reason to do that.
> > 
> > Let's make it very clear in the documentation then.
> 
> Right now there's no place for documenting this. Basically this is about
> what IOCTL argument struct fields are set in the framework and which ones
> the driver is responsible for. I don't think addressing that belongs to
> this set.

As this sets tries to fix the mess caused by drivers using semi-random
bus_info, I'd like to disagree :-) It can be done in a patch on top.

-- 
Regards,

Laurent Pinchart
