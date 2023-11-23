Return-Path: <linux-media+bounces-910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E08087F61E6
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 15:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72953B21682
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5BF33CC6;
	Thu, 23 Nov 2023 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="im0x0auj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA14D6F
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 06:48:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2018AA06;
	Thu, 23 Nov 2023 15:48:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700750891;
	bh=Vn9LF/EgjMiMUS0a8KZ5DZY78xzSQaehbq+5grOqxoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=im0x0aujtLQ/SDlxyT9JyAG3N0YLJuRf+PhpBxAAqk/loPmK6ENYLSl9TkxVGjlZy
	 m1GeL9+H++73NbAXJxtRnZBxc9Dl4dd87ACoNVfjdFq7zC1QjvpEwYIH77BvbaCnIy
	 TayzxWUq2fIUekkTTSGvWyInZmtNfTtgD/N250kU=
Date: Thu, 23 Nov 2023 16:48:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.8] V4L2 subdev patches
Message-ID: <20231123144849.GA4370@pendragon.ideasonboard.com>
References: <ZVdnpn9EpuY9phPg@valkosipuli.retiisi.eu>
 <3f075f19-fbe8-4bab-ba2c-296e43da030b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f075f19-fbe8-4bab-ba2c-296e43da030b@xs4all.nl>

On Wed, Nov 22, 2023 at 11:00:19AM +0100, Hans Verkuil wrote:
> On 17/11/2023 14:16, Sakari Ailus wrote:
> > Hi Mauro, Hans,
> > 
> > I've split the large PR into two smaller ones, this only contains
> > relatively unimportant fixes and cleanups mainly for the recenlty merged
> > IVSC driver, but also one for the CCS driver as well as an indentation fix
> > for the v4l2-subdev.h header.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit 1865913dd590ca6d5e3207b15099a1210dd62f29:
> > 
> >   media: meson-ir-tx: Drop usage of platform_driver_probe() (2023-11-16 13:56:48 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-3-signed
> > 
> > for you to fetch changes up to 27b4ca9ef301b2475d4a72d2a8c264ebe7f91482:
> > 
> >   media: ivsc: csi: Check number of lanes on source, too (2023-11-17 09:41:52 +0200)
> > 
> > ----------------------------------------------------------------
> > V4L2 patches for 6.8
> > 
> > ----------------------------------------------------------------
> > Laurent Pinchart (1):
> >       media: v4l2-subdev: Fix indentation in v4l2-subdev.h
> 
> I am skipping this patch: it will clash with this fix for v6.7:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/b9b0c0c8-6ece-466a-99e4-d49797f69957@moroto.mountain/
> 
> Once this is merged back into our tree it can be applied again.

It's no big deal in this case, but in general, why would we need to skip
when there's a merge conflict ? You can simply resolve the merge
conflict when merging.

> Too bad this wasn't corrected in the v6.7 fix, that would have been
> nice.
> 
> > Sakari Ailus (7):
> >       media: ccs: Ensure control handlers have been set up after probe
> >       media: ivsc: csi: Don't parse remote endpoints
> >       media: ivsc: csi: Clean up V4L2 async notifier on error
> >       media: ivsc: csi: Clean up notifier set-up
> >       media: ivsc: csi: Clean up parsing firmware and setting up async notifier
> >       media: ivsc: csi: Don't mask v4l2_fwnode_endpoint_parse return value
> >       media: ivsc: csi: Check number of lanes on source, too
> > 
> >  drivers/media/i2c/ccs/ccs-core.c       |  5 ++-
> >  drivers/media/i2c/ccs/ccs.h            |  1 +
> >  drivers/media/pci/intel/ivsc/mei_csi.c | 69 ++++++++++++++++++++++------------
> >  include/uapi/linux/v4l2-subdev.h       |  2 +-
> >  4 files changed, 50 insertions(+), 27 deletions(-)

-- 
Regards,

Laurent Pinchart

