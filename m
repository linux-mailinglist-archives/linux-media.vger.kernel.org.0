Return-Path: <linux-media+bounces-15264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319E93917C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0EB51F2220A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BF216DEC1;
	Mon, 22 Jul 2024 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XbtFr2hW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966416DC1D;
	Mon, 22 Jul 2024 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661143; cv=none; b=R4ujx6fGBFozOOZ6+Kq0rgONkGjIMSGGBIK6U0XEOCH3sNzPFsi2LDZW1+kZmvq/yfqJvKXZ8vHG79yqb4lBtMgjMpaQH0vwdoUtdN38Anm4qbkufGyZZjM96S1mhzL1n0/lS7wvEcnHvbwRYDC75/VRICCqRCdXr8yUak6FU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661143; c=relaxed/simple;
	bh=m7n4dc4xNreoq3nEBkSTgwTBcQJMJsdmiJXdjfrTUD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFEsTjYNGhIh/rTy1seirBZ3ZkG7PWOSfLtlWtPEeL3drg+mPYF1/wAkx6W/FwQ+o7j4HPYXHpu7rtKHKR1SUxqOryQIPz+NupBZ9IFfgROcttZUlUfMpBaCVzY9IrtwYyDUJAuDSaQVzAuYqXAARi5IssiwccCwYGtH2/huKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XbtFr2hW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A98922B3;
	Mon, 22 Jul 2024 17:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721661098;
	bh=m7n4dc4xNreoq3nEBkSTgwTBcQJMJsdmiJXdjfrTUD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbtFr2hWGL3ygzmRE8p1NsWYKJNn42DBfeWKpdztd+Qe+MJ9RFwbKv/TTTEfReDw9
	 P9jC7KamR+hbLJx//sWqkDW4adoJrOwdpbc8tWy45UoRpD5sll0aXqvTc8T2TsQwt/
	 OSDkiFVmEPB/gI5sKR8OhAbrlksVV9lyqcI54PTk=
Date: Mon, 22 Jul 2024 18:12:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/6] media: videodev2.h: add visconti viif meta
 buffer format
Message-ID: <20240722151202.GB31490@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-3-yuji2.ishikawa@toshiba.co.jp>
 <20240722151035.GA31490@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240722151035.GA31490@pendragon.ideasonboard.com>

On Mon, Jul 22, 2024 at 06:10:37PM +0300, Laurent Pinchart wrote:
> Hi Ishikawa-san,
> 
> Thank you for the patch.
> 
> On Tue, Jul 09, 2024 at 09:08:44AM +0900, Yuji Ishikawa wrote:
> > Adds the Toshiba Visconti VIIF specific metadata format
> > 
> > - V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
> > - V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics
> > 
> > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> 
> This patch looks fine. Assuming the corresponding documentation patch is
> fine too,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Actually I spoke a bit too fast, you need to update
drivers/media/v4l2-core/v4l2-ioctl.c with the two new formats. See
commit 8f6c2202222fa for an example.

> > ---
> > Changelog v10:
> > - add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
> > - add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS
> > 
> > Changelog v11:
> > - no change
> > 
> >  include/uapi/linux/videodev2.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 4e91362da6..562038f144 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -858,6 +858,10 @@ struct v4l2_pix_format {
> >  /* Vendor specific - used for RaspberryPi PiSP */
> >  #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
> >  
> > +/* Vendor specific - used for Visconti VIIF sub-system */
> > +#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
> > +#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
> > +
> >  #ifdef __KERNEL__
> >  /*
> >   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

