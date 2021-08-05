Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08963E18AC
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 17:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242702AbhHEPuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 11:50:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47500 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242577AbhHEPuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 11:50:01 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32EE8E04;
        Thu,  5 Aug 2021 17:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628178586;
        bh=hzZv4mLZOcN393uhBYHo4dAuMXo99CRWWyfK0xsnyWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqk9I2n1zKoLckxovhlnE4C9dv5QrfpSgkr7fvLZvCqGOxuP5LyW0o8dTJsCf6LQ/
         X1C2uWnkN7RjPh4hUvVLZeZY96cChFCCmtKpF1HYcxtSYxdvBCT3B3nvmR6oTOrdm2
         8Si21ToVLT2OwdfSnuso7sepv97Pk4uVbqw1u3EU=
Date:   Thu, 5 Aug 2021 18:49:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
 <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
 <20210805154042.GE3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210805154042.GE3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Aug 05, 2021 at 06:40:42PM +0300, Sakari Ailus wrote:
> On Thu, Aug 05, 2021 at 06:22:32PM +0300, Laurent Pinchart wrote:
> > On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> > > We add new controls, one for each of the four usual Bayer channels:
> > > 
> > > V4L2_CID_NOTIFY_GAIN_RED
> > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > V4L2_CID_NOTIFY_GAIN_GREENB
> > 
> > This will effectively limit the API to Bayer patterns. I wonder if we
> > should instead implement it as a single array control, with one element
> > per CFA component.
> 
> There are other raw patterns, too. Supporting them would likely require one
> or a few more controls.
> 
> That said, as the values change often it's more efficient to use a single
> control. But each colour combination (not each pattern) would require its
> own control in this case, eventually requiring more controls.

I'm not sure to follow you. My idea is to define a single control, with
a number of elements that depends on the pattern being used, and the
order specified in the native sensor pattern. I don't think each colour
combination would then require its own control.

> Given that the number of sensors using non-Bayer patterns but still produce
> Bayer output is likely to grow, these could be used by a number of devices.
> I'd hence prefer an array control as well.

-- 
Regards,

Laurent Pinchart
