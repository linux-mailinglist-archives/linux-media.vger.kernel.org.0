Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0682B5009
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgKPSls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:41:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51172 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgKPSls (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:41:48 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49BA9A1B;
        Mon, 16 Nov 2020 19:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605552106;
        bh=5OeHQZRtfPi54rqgGt6jww7xRTdgxALSeq/6WvH4z6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OJO2wqzivtTu2Y/XVErsqtKYSu226JX22o8zV4OKnjcRAuAkeKQS7la0m4CnmjYR/
         D6webwiaEbtEXFtztsTcbbP2aocEGm+THVzLuK/qZI6dtrsFMXsGtx9GgqBQ3Oid50
         tCU2TTNiwFRk7jK5P97SEXRJ2WDme9gvHfEFbkWs=
Date:   Mon, 16 Nov 2020 20:41:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v2 19/19] media: v4l2: Add 10-, 12- and 16-bpc 4:2:0 and
 4:2:2 semi-planar YUV formats
Message-ID: <20201116184141.GW6540@pendragon.ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-20-laurent.pinchart@ideasonboard.com>
 <6f172b50-15d7-fc38-65e3-08b009adcb41@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f172b50-15d7-fc38-65e3-08b009adcb41@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Nov 16, 2020 at 01:17:10PM +0100, Hans Verkuil wrote:
> On 02/11/2020 23:41, Laurent Pinchart wrote:
> > Add semi-planar YUV formats with 10, 12 and 16 bits per components, in
> > both 4:2:0 (NV12) and 4:2:2 (NV16) subsampling, and with both chroma
> > orderings. They are used by the Xilinx Video Frame Buffer Read/Write IP
> > cores.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../media/v4l/pixfmt-yuv-planar.rst           | 564 +++++++++++++++++-
> >  include/uapi/linux/videodev2.h                |  12 +
> >  2 files changed, 575 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > index 07081ab05419..7f0fe2e4b668 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> 
> <snip>
> 
> >  Fully Planar YUV Formats
> >  ========================
> >  
> 
> I found a mistake in the "Overview of Fully Planar YUV Formats" table:
> 
> For formats V4L2_PIX_FMT_YVU420M and V4L2_PIX_FMT_YVU444M it gives "Y, Cb, Cr" as the
> planes order, this should be "Y, Cr, Cb". Can you fix that in a new patch?

Thanks for spotting this. I'll fix it in v3 of "[PATCH v2 14/19] media:
doc: pixfmt-yuv: Move all planar YUV formats to common file", as that's
where the error was introduced.

-- 
Regards,

Laurent Pinchart
