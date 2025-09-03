Return-Path: <linux-media+bounces-41712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318FB423E2
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09FD91A80631
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA20212D7C;
	Wed,  3 Sep 2025 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jT7wPlew"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335A332F756
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910421; cv=none; b=iVIpHj+ihd9ZT7vO9HLFLwCJIWD/Sa+5VSWigrcW0RP7PYBn75oj1jzLK5uuZCLTH7SdIZBnLg9Og0lHjIpEr51MsoJM5YoO51yZEVEWwvpM6Xm8ANoWinhpKVlUx47T8B/YRK8SXg2OShDxKuFoAYQwqLj/0yJqcY5ZQlX1+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910421; c=relaxed/simple;
	bh=dd90u3HyZhqWVDfRWRVeryUi9iIgSIg9iIjUOzkcNmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y978yYXp1B+tanO44xjaYVl3TnTW3/xqBywLiydpDDE1mMIqrc0wwgsMKNOJm1TDM3v3ji/IO8/RHjT5HlaaTtOkQHwFGGzpMYp1+BoVrJ1JQtLsHIRa2D/XPnfcUflua45oh+CcLc0wV42AfCZnAq819q9eMlEFyJRnun9yzFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jT7wPlew; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C0FF48BF;
	Wed,  3 Sep 2025 16:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756910349;
	bh=dd90u3HyZhqWVDfRWRVeryUi9iIgSIg9iIjUOzkcNmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jT7wPlewWThJzTYHxOxIXWcnKsvNXqgd0+MQXM5Aj+fdu/aMVe5y/t0EB+kI/iWFl
	 TZRzFbLEe6OvoCxqxhU5EJpMKhkkbXPt613xz672ucBOv+F13mV1e1JLaxPJjN7lzn
	 CVdjvRx0c8DdqtZp/reodOiLzuQMsVu6RkybnVYM=
Date: Wed, 3 Sep 2025 16:39:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 17/66] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <20250903143958.GN3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-18-sakari.ailus@linux.intel.com>
 <httktoswdeltortwoqn5hllzjwtb3prjoe2tigx7u4x6ojdpwr@misyxjdfk3lb>
 <aLgKDYgjx5opEi1Q@kekkonen.localdomain>
 <20250903143215.GL3648@pendragon.ideasonboard.com>
 <aLhSJqZx3WVfyUbw@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhSJqZx3WVfyUbw@kekkonen.localdomain>

On Wed, Sep 03, 2025 at 05:35:18PM +0300, Sakari Ailus wrote:
> On Wed, Sep 03, 2025 at 04:32:15PM +0200, Laurent Pinchart wrote:
> > On Wed, Sep 03, 2025 at 12:27:41PM +0300, Sakari Ailus wrote:
> > > On Mon, Sep 01, 2025 at 04:12:33PM +0200, Jacopo Mondi wrote:
> > > > On Mon, Aug 25, 2025 at 12:50:18PM +0300, Sakari Ailus wrote:
> > > > > Add new media bus codes for generic raw formats that are not specific to
> > > > > the colour filter array but that simply specify the bit depth. The layout
> > > > > (packing) of the data is interface specific.
> > > > >
> > > > > The rest of the properties of the format are specified with controls in
> > > > > the image source.
> > > > >
> > > > > The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.
> > > > 
> > > > Same as per the pixel formats, your branch contains
> > > > "media: uapi: Add more media bus codes for generic raw formats"
> > > > 
> > > > Should you squash it in ?
> > > 
> > > Related to my comment on bit depths and what we know of CSI-2 receiver
> > > implementations, no. But let me know if there's a need to further discuss
> > > this.
> > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
> > > > >  include/uapi/linux/media-bus-format.h         |  6 +++++
> > > > >  2 files changed, 33 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > index 9ef1bc22ad9c..1a51b5c817f1 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > @@ -3434,6 +3434,33 @@ organization is given as an example for the first pixel only.
> > > > >
> > > > >      \endgroup
> > > > >
> > > > > +Generic raw formats on serial interfaces
> > > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > +
> > > > > +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> > > > 
> > > > I would remove "(largely) unprocessed", mostly because I'm not sure
> > > > what you mean here.
> > > 
> > > I'm fine with removing that.
> > > 
> > > > > +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > > > > +interfaces. The packing of the data on the bus is determined by the hardware,
> > > > > +however the bit depth is still specific to the format.
> > > > > +
> > > > > +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. flat-table:: Generic raw formats on serial buses
> > > > > +    :header-rows:  1
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1
> > > > > +
> > > > > +    * - Format name
> > > > > +      - Bit depth
> > > > > +    * - MEDIA_BUS_FMT_RAW_8
> > > > > +      - 8
> > > > > +    * - MEDIA_BUS_FMT_RAW_10
> > > > > +      - 10
> > > > > +    * - MEDIA_BUS_FMT_RAW_12
> > > > > +      - 12
> > > > > +    * - MEDIA_BUS_FMT_RAW_14
> > > > > +      - 14
> > > > 
> > > > Should we now say in the "Bayer Formats" section that the existing
> > > > media bus codes that convey the color components ordering are now
> > > > superseded by these ones ?
> > > 
> > > I can add a note that new drivers need to use these codes but may use older
> > > mbus codes, too. I'd add that to the camera sensor driver documentation
> > > though.
> > 
> > Agreed. Let's make the new formats mandatory for new drivers, an the old
> > formats optional. Implementing the old formats is required when porting
> > existing drivers to new formats, but I would discourage it for new
> > drivers in order to get userspace to move forward.
> 
> I'll also add that receiver drivers should be amended with support for the
> new formats instead of adding support for the old ones in the sensor
> drivers. The latter is likely much easier in any case.

Good idea.

-- 
Regards,

Laurent Pinchart

