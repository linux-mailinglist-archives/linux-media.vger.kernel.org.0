Return-Path: <linux-media+bounces-18858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439598A37E
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D03C1F24DAC
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AE318E361;
	Mon, 30 Sep 2024 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q8OMd4IQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616CFB65C;
	Mon, 30 Sep 2024 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727700726; cv=none; b=OFUXj5/1fwn7TEO2y9FzU4Paojs5krDP9wfAtRDLPWNhELlFNbGqdLX0bR6HGeBEBNESRHQQWJRAEZ0cOHRmSyoktokOqbBtHrzAIrZBZmZwzh0XHbh/fluWZemDlH16CQwbts/qN+jn79jkcjsVp/34w0Eros3xMdzEXqlx8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727700726; c=relaxed/simple;
	bh=oEdRY0xfZAt0vs+wsCCFEiwjqAsGidh4KG+YFGUS0qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3xGG90IdvOD0rwiSvh7PKqsfabK5olhx/vI6Wm4bKMGT6JiVlDRh5YkiQNBLL8AQH/N9V/DAl0I5O1g2Z/e+fl8l5/x4qJPq7v8hHCyiC4udbdCsNaXWnDFOAzLLS1nXmS+u/zttw1YrKhrH5pJRIPgE87D+8yTD1oKBzu8AIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q8OMd4IQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9634632A;
	Mon, 30 Sep 2024 14:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727700632;
	bh=oEdRY0xfZAt0vs+wsCCFEiwjqAsGidh4KG+YFGUS0qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8OMd4IQQoFJQ6q0lRfh7QttARcPlbY6qLcpRHgR7eu8qRkLgw3L3HWaS2PdbR2tu
	 8i5vlBN6uY20J+oxUKrBB8PGr6lvSQeovFbhFDO6Iqd0HBLhnrIkudRlQEfU3iaa8/
	 dyWv4f0JuWGAkI1IuI3N2FjGTWvKl7fuiuuB2HO8=
Date: Mon, 30 Sep 2024 15:52:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 14/16] media: platform: rzg2l-cru: rzg2l-csi2: Make
 use of rzg2l_csi2_formats array in rzg2l_csi2_enum_frame_size()
Message-ID: <20240930125200.GH31662@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240927231122.GN12322@pendragon.ideasonboard.com>
 <CA+V-a8vzf7gjcO-jPTB2Sd=4GBmpSkUfWDCnAR8BbL1xohytvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vzf7gjcO-jPTB2Sd=4GBmpSkUfWDCnAR8BbL1xohytvQ@mail.gmail.com>

On Mon, Sep 30, 2024 at 01:19:25PM +0100, Lad, Prabhakar wrote:
> Hi Laurent,
> 
> Thank you for the review.
> 
> On Sat, Sep 28, 2024 at 12:11 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Prabhakar,
> >
> > Thank you for the patch.
> >
> > I've just noticed that the subject line of most of your patches is much
> > longer than the 72 characters limit. Please try to shorten them. You can
> > replace the prefixes with "media: rzg2l-cru:", and reword the subject
> > lines that mention long function names.
> >
> Ok, I'll rework the subject line so that it fits within 72 characters.
> 
> > On Tue, Sep 10, 2024 at 06:53:55PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Make use `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size().
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > index 79d99d865c1f..e630283dd1f1 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > @@ -570,7 +570,10 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
> > >                                     struct v4l2_subdev_state *sd_state,
> > >                                     struct v4l2_subdev_frame_size_enum *fse)
> > >  {
> > > -     if (fse->index != 0)
> > > +     if (fse->index >= ARRAY_SIZE(rzg2l_csi2_formats))
> > > +             return -EINVAL;
> >
> > Same comment as in 11/16. With this fixed,
> >
> Ok, I'll drop this check.

Don't drop the check, drop the change. if (fse->index != 0) is the
right check (testing > 0 works too).

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

