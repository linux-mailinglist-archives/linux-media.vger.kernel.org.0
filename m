Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A61C2EF6C6
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 18:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbhAHRsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 12:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbhAHRsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 12:48:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6D2C061380
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 09:47:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2450058B;
        Fri,  8 Jan 2021 18:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610128059;
        bh=SWi6JgeVbzivxcXnz2IG69n79rSQ9M89hvFl0HgDroo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hQwSvDXe5qb/H5LG3mT0KlRa239vd6d8r9nmWdYaLnagJOdZWEWZgeng9m7A3eIzL
         qc6Vurt1fJtJEr0w0tEpPkR2z5MjoHJZ7b176DcnuoU2bSFuZPBGkiRFwJOnBqtWqk
         Etmgg0ip/N+d8MesmvxAHQa3tn+Kr0lpshlSIrSY=
Date:   Fri, 8 Jan 2021 19:47:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 05/75] media: imx: Compile imx6-media-objs only for
 CONFIG_VIDEO_IMX_CSI
Message-ID: <X/iaroI60aVLuAqW@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-6-laurent.pinchart@ideasonboard.com>
 <08b4a9c06e3468615ea55ed4d7d615b5139e1809.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08b4a9c06e3468615ea55ed4d7d615b5139e1809.camel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jan 08, 2021 at 02:42:32PM -0300, Ezequiel Garcia wrote:
> On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> > imx6-media-objs contains a set of objects that are specific to the i.MX6
> > IPU-based media subsystem. They're not needed for the i.MX7 CSI. Only
> > compile them if CONFIG_VIDEO_IMX_CSI is selected.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/Makefile | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> > index 9bd9e873ba7c..6ac33275cc97 100644
> > --- a/drivers/staging/media/imx/Makefile
> > +++ b/drivers/staging/media/imx/Makefile
> > @@ -1,16 +1,16 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
> > +       imx-media-of.o imx-media-utils.o
> > +
> >  imx6-media-objs := imx-media-dev.o imx-media-internal-sd.o \
> >         imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o imx-media-vdic.o \
> >         imx-media-csc-scaler.o
> >  
> > -imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
> > -       imx-media-of.o imx-media-utils.o
> > -
> >  imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
> >  
> > -obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
> >  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
> >  
> > +obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media.o
> >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
> >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> 
> Nice change. This shows more clearly what's shared and what not.
> 
> Would it be too hard to walk the extra kilometer (not necesarily now,
> not necesarily looking at you do it) split imx6 and imx7 better,
> so we can start thinking what's needed to destage imx6?

I'd really welcome that, but I'd like to get this series merged first.
Unless you want a v2 with twice the number of patches ;-)

> I don't think the imx6 support is all that bad that it has
> to live in staging.

-- 
Regards,

Laurent Pinchart
