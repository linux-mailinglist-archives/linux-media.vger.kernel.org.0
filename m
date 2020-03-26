Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84D91947F2
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgCZTxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:53:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37412 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgCZTxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:53:17 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ACD42DC;
        Thu, 26 Mar 2020 20:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585252395;
        bh=hD0EgZO3CzzXO8pJyOC2hRISGLSR3i/b2Yr3vuYsZAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bjyB77aQtPCtcIrfhTX+I3uk2Uh36IhN0PSJwIBl1bgQY82sg+NRVm4j2gFRb6+aZ
         dRoO21BDGqigL9tnq19e3PKE5Z9G5ZaFEun2e5EYoaq0l29bNC6p3F9btRTE7tRv4M
         iWfDVBUY/lZStW6V7GU/Qc33pl2P/0VPif7Yetuc=
Date:   Thu, 26 Mar 2020 21:53:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
Message-ID: <20200326195311.GA20581@pendragon.ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
 <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
 <20200312004735.GG1639@pendragon.ideasonboard.com>
 <1a10d9b2-3e5b-4cbd-d703-5012fa8fa6ad@gmail.com>
 <20200314223209.GC5320@pendragon.ideasonboard.com>
 <f77e8a90-f83a-1022-7e4f-571bd5df551d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f77e8a90-f83a-1022-7e4f-571bd5df551d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Thu, Mar 26, 2020 at 12:05:38PM -0700, Steve Longerbeam wrote:
> On 3/14/20 3:32 PM, Laurent Pinchart wrote:
> > On Sat, Mar 14, 2020 at 03:30:53PM -0700, Steve Longerbeam wrote:
> >> On 3/11/20 5:47 PM, Laurent Pinchart wrote:
> >>> On Wed, Mar 11, 2020 at 05:16:49PM -0700, Steve Longerbeam wrote:
> >>>> Hi Laurent,
> >>>>
> >>>> I agree that the find/enum format code in imx-utils needs cleanup, it's
> >>>> too confusing. I will be ready to give my ack to the imx-utils patches
> >>>> once I do some smoke testing on a sabre target when I return from vacation.
> >>>>
> >>>> Note that Phillip also submitted a fixup patch to the find/enum format
> >>>> code, IIRC it did more consolidating of the imx_media_pixfmt tables. I
> >>>> can't find it and it has gotten lost, but I tested and provided a
> >>>> reviewed-by at the time.
> >>>
> >>> I've found them in the mail archive. There were 3 patches, Hans said he
> >>> would take the first two, but only the first one got merged. I'll take
> >>> the two others and build on top of them, fixing the issues pointed out
> >>> by the kbuild robot and addressing Hans concerns.
> >>
> >> I found the thread finally. In fact I did some work on this set already,
> >> I fixed the kbuild warnings as well as added some function headers
> >> describing all the format search criteria arguments. Also changed a
> >> local var in enum_formats() to better document the enum algorithm.
> >>
> >> Unless you've started on this work already, I will be returning from
> >> vaca tomorrow and can pick this up again, merging in your patches, as
> >> well as splitting up find|enum_formats() into find|enum_formats() and
> >> find|enum_codes(), which is the remaining suggestion from Hans.
> > I've done this already, I'll try to send the patches on Monday.
> 
> If you don't mind, I've done this work and tested on an imx6 target. So 
> I will post a series.

No worries. I've been a bit delayed indeed. I'll still post my cleanups,
in case they contain anything useful in addition to yours.

> >>>> On 3/10/20 9:18 AM, Laurent Pinchart wrote:
> >>>>> Hello,
> >>>>>
> >>>>> This patch series started as an attempt to fix the format get and set
> >>>>> subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
> >>>>> patch 1/8. Patch 2/8 further cleans up the format-related code in that
> >>>>> subdev.
> >>>>>
> >>>>> Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
> >>>>> fix the format enumeration on the video node at the end of the pipeline.
> >>>>> I realized as part of that effort that there's more work than I
> >>>>> anticipated, and I'm currently evaluating the possible options.
> >>>>> Nonetheless, I think the cleanups make sense even without what I wanted
> >>>>> to build on top of them, so I'm sending them out already.
> >>>>>
> >>>>> Laurent Pinchart (8):
> >>>>>      media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
> >>>>>      media: imx: imx7-mipi-csis: Centralize initialization of pad formats
> >>>>>      media: imx: utils: Inline init_mbus_colorimetry() in its caller
> >>>>>      media: imx: utils: Handle Bayer format lookup through a selection flag
> >>>>>      media: imx: utils: Simplify IPU format lookup and enumeration
> >>>>>      media: imx: utils: Make imx_media_pixfmt handle variable number of
> >>>>>        codes
> >>>>>      media: imx: utils: Remove unneeded argument to (find|enum)_format()
> >>>>>      media: imx: utils: Rename format lookup and enumeration functions
> >>>>>
> >>>>>     drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
> >>>>>     drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
> >>>>>     drivers/staging/media/imx/imx-media-capture.c |  22 +-
> >>>>>     .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
> >>>>>     drivers/staging/media/imx/imx-media-csi.c     |  26 +-
> >>>>>     drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
> >>>>>     drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
> >>>>>     drivers/staging/media/imx/imx-media.h         |  24 +-
> >>>>>     drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
> >>>>>     drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
> >>>>>     10 files changed, 271 insertions(+), 289 deletions(-)

-- 
Regards,

Laurent Pinchart
