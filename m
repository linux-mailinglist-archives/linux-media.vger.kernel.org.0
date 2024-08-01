Return-Path: <linux-media+bounces-15713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC2E945021
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 18:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1518B2876F
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 16:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA1A1BB681;
	Thu,  1 Aug 2024 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m/BAis2F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590A1B9B59;
	Thu,  1 Aug 2024 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528403; cv=none; b=hDZcGQtpVrJWoCMAyBP3JYTBOzFNls0++oaoJAtg3FGr+h4904ZHgoOGKn1t0dziwoSn9zoYInCZiIURSZkdZp7ZLwX+Rskwpek6fGdhPUHwChzwJSWixjg2HbTzGxYlrzvVcSWvGW5GcDOSfr4yYb5Qzpg3UHKZqFPSwdFcZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528403; c=relaxed/simple;
	bh=DK9tWdz/0iSJkJT5x7sqs/bLGa54vj+NBpGI/VPp5gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qu5a6XIpZ0nrKI7BDf892ksMgV+OhfkMPXcv2t8gi1+HyxdOhTDkh+xoijTDT6FfxnXIyQdTZDSNCiQGJSAuxKY3CM/j8z6PJipPnVSb5AGmKRZQlKBWHFhcYN7OsGsWXJsBGI25XP3+9gSgJD+t5W0uLsFFbaimItzmn/xBcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m/BAis2F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0819842;
	Thu,  1 Aug 2024 18:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722528345;
	bh=DK9tWdz/0iSJkJT5x7sqs/bLGa54vj+NBpGI/VPp5gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/BAis2FeetJ8Yd9EIMbkHlbRtKVOYWR6wQoO8lx5euCS0oPA+N3XzB9EUdTxwvUt
	 5ATESrc1Ab6ffMWPUn07zVB0XSsVOsc1A/Ww0CNuDaPEftsvNupdlyM27KXiHMX+Qh
	 0DOaka4qvdFJNF38MBi3oeeQYy59RvA/uLb0wIyY=
Date: Thu, 1 Aug 2024 19:06:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: yuji2.ishikawa@toshiba.co.jp
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	sakari.ailus@linux.intel.com, nobuhiro1.iwamatsu@toshiba.co.jp,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/6] documentation: media: add documentation for
 Toshiba Visconti Video Input Interface driver
Message-ID: <20240801160612.GA18732@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-6-yuji2.ishikawa@toshiba.co.jp>
 <20240722180251.GP13497@pendragon.ideasonboard.com>
 <OSZPR01MB942787AD2A406D91BB08B0EC92B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSZPR01MB942787AD2A406D91BB08B0EC92B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>

Hello Ishikawa-san,

On Thu, Aug 01, 2024 at 09:23:43AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> On Tuesday, July 23, 2024 3:03 AM, Laurent Pinchart wrote:
> > On Tue, Jul 09, 2024 at 09:08:47AM +0900, Yuji Ishikawa wrote:
> > > Added description of Video Input Interface driver of Toshiba Visconti
> > > architecture.
> > > It includes hardware organization, structure of the driver and
> > > metadata format for embedded image signal processor.
> > >
> > > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > > ---
> > > Changelog v3:
> > > - Newly add documentation to describe SW and HW
> > >
> > > Changelog v4:
> > > - no change
> > >
> > > Changelog v5:
> > > - no change
> > >
> > > Changelog v6:
> > > - add description of CSI2RX subdevice
> > > - add ordering of ioctl(S_FMT) and ioctl(S_EXT_CTRLS)
> > >
> > > Changelog v7:
> > > - no change
> > >
> > > Changelog v8:
> > > - add usage of V4L2_CTRL_TYPE_VISCONTI_ISP
> > >
> > > Changelog v9:
> > > - fix warning: set reference target for keyword
> > > V4L2_CTRL_TYPE_VISCONTI_ISP
> > >
> > > Changelog v10:
> > > - use parameter buffers instead of compound control
> > >   - removed description of vendor specific compound control
> > >   - add description of parameter buffers for ISP control
> > > - update directory structure
> > >   - remove documents under driver-api
> > >   - add documents to admin-guide, userspace-api
> > >
> > > Changelog v11:
> > > - update usage of the driver
> > >
> > >  .../admin-guide/media/v4l-drivers.rst         |   1 +
> > >  .../admin-guide/media/visconti-viif.dot       |  18 ++
> > >  .../admin-guide/media/visconti-viif.rst       | 255 ++++++++++++++++++
> > >  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
> > >  .../media/v4l/metafmt-visconti-viif.rst       |  48 ++++
> > >  5 files changed, 323 insertions(+)
> > >  create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
> > >  create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
> > >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst

[snip]

> > > diff --git a/Documentation/admin-guide/media/visconti-viif.rst b/Documentation/admin-guide/media/visconti-viif.rst
> > > new file mode 100644
> > > index 0000000000..4ef676754c
> > > --- /dev/null
> > > +++ b/Documentation/admin-guide/media/visconti-viif.rst
> > > @@ -0,0 +1,255 @@

[snip]

> > > +viif_capture_sub - Raw Image Capture Video Node
> > > +-----------------------------------------------
> > > +
> > > +This video node is used for capturing bayer image from the sensor.
> > > +The output picture has exactly the same resolution and format as the sensor input.
> > > +The following depth of bayer format is supported:
> > > +
> > > +- 8bit
> > > +- 10bit
> > > +- 12bit
> > > +- 14bit
> > 
> > Does the hardware support capturing embedded data from the sensor ?
> 
> The hardware supports capturing embdded data, however the software is
> not fully tested for that feature.

OK. Support for this can be added later. I recommend already checking
what it would imply in terms of changes to the media graph. Changing the
media graph later in a way that could break userspace won't be allowed,
so it's worth it preparing for embedded data support in the media graph
design already. Adding new pads to existing entities and adding new
entities later are fine, but renumbering existing pads or inserting new
entities between two existing entities could break userspace.

[snip]

-- 
Regards,

Laurent Pinchart

