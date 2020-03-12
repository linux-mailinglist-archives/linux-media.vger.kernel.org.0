Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45100182652
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 01:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731525AbgCLArm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 20:47:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57744 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731423AbgCLArl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 20:47:41 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F1515F;
        Thu, 12 Mar 2020 01:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583974059;
        bh=Goun7tXp0JsuAKuQG6h96FX+APAXp5tjghZfsepIfGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MmcG3dRXG6OrXKYUaTP+l9L/9IX5L3yv7TmI2k2EXEXx0uQO1UrjbkBcvxt40pKHh
         4eHchXpY+B67CxokbeStz1oqKWNHi7+yIGfZR8P/K5Z8uLJOursR2BmYS3ym1Vz5/D
         6PwWjFGNJp2URHA1euFQ+aUIDSuz3rjVf2Jq5SVk=
Date:   Thu, 12 Mar 2020 02:47:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
Message-ID: <20200312004735.GG1639@pendragon.ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
 <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Mar 11, 2020 at 05:16:49PM -0700, Steve Longerbeam wrote:
> Hi Laurent,
> 
> I agree that the find/enum format code in imx-utils needs cleanup, it's 
> too confusing. I will be ready to give my ack to the imx-utils patches 
> once I do some smoke testing on a sabre target when I return from vacation.
> 
> Note that Phillip also submitted a fixup patch to the find/enum format 
> code, IIRC it did more consolidating of the imx_media_pixfmt tables. I 
> can't find it and it has gotten lost, but I tested and provided a 
> reviewed-by at the time.

I've found them in the mail archive. There were 3 patches, Hans said he
would take the first two, but only the first one got merged. I'll take
the two others and build on top of them, fixing the issues pointed out
by the kbuild robot and addressing Hans concerns.

> On 3/10/20 9:18 AM, Laurent Pinchart wrote:
> > Hello,
> >
> > This patch series started as an attempt to fix the format get and set
> > subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
> > patch 1/8. Patch 2/8 further cleans up the format-related code in that
> > subdev.
> >
> > Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
> > fix the format enumeration on the video node at the end of the pipeline.
> > I realized as part of that effort that there's more work than I
> > anticipated, and I'm currently evaluating the possible options.
> > Nonetheless, I think the cleanups make sense even without what I wanted
> > to build on top of them, so I'm sending them out already.
> >
> > Laurent Pinchart (8):
> >    media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
> >    media: imx: imx7-mipi-csis: Centralize initialization of pad formats
> >    media: imx: utils: Inline init_mbus_colorimetry() in its caller
> >    media: imx: utils: Handle Bayer format lookup through a selection flag
> >    media: imx: utils: Simplify IPU format lookup and enumeration
> >    media: imx: utils: Make imx_media_pixfmt handle variable number of
> >      codes
> >    media: imx: utils: Remove unneeded argument to (find|enum)_format()
> >    media: imx: utils: Rename format lookup and enumeration functions
> >
> >   drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
> >   drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
> >   drivers/staging/media/imx/imx-media-capture.c |  22 +-
> >   .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
> >   drivers/staging/media/imx/imx-media-csi.c     |  26 +-
> >   drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
> >   drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
> >   drivers/staging/media/imx/imx-media.h         |  24 +-
> >   drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
> >   drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
> >   10 files changed, 271 insertions(+), 289 deletions(-)

-- 
Regards,

Laurent Pinchart
