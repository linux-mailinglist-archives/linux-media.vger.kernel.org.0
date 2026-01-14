Return-Path: <linux-media+bounces-50686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A05D1E3C3
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04F73096736
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2795D3939DE;
	Wed, 14 Jan 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZiL9pKT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B73F34E74D
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387420; cv=none; b=rHUsxH8ZS39mPrJ7cCfbHwmrBFXSDhLF1iAu7ULvsbhLYl7oSpMhzqghjCkuSQ9yTlZgizmC4sUFAsm8+/bQi9BrFnkKDZkXHNf+VvF7pSDzXru8Po6jd8q+do7yn6j/6f9uSv9ebMfZcTrS7UpXd0ZrtKnIH6FsHUulDfcLss4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387420; c=relaxed/simple;
	bh=IFQe84LEKJsyhL9f8frhlK/MNMzI9rSaKoTGQeE+K2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su4OGfClb3+KxUC1wehjU64zAY1kPfeAfGdAek8S5YfLqDWStnSPQ4uHr5EhGvYzdN71BCD1g7cUm5+UQXdz+yVHfLPy/MrkwY+4iyu3BrP56Z8Y9/0d3rWX/vMYE4FulMqE9+vZTrFf/epzKJLsfCE2Qu49soyCIJXt6hb6E0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZiL9pKT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768387416; x=1799923416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IFQe84LEKJsyhL9f8frhlK/MNMzI9rSaKoTGQeE+K2w=;
  b=AZiL9pKTHihnXctxSBIaKVm2ObmO5dSQtbSmv17GxPnxllGMDxitiGVt
   35eebadRo0fbN80DsbyWgC6ehWMJpYQ/95GHq8Cd8QY9E/XPcNV5/RI4i
   wCfV3zjIVQhAXfxK/3DLLdjxqxun/2lzZ1YtpAOe4SIaAkBD/uoA4C4fQ
   RpZ64XUx7XI56BQOfkHfIS9d1DUfyLwdFT23Ppk01rMqjNJBiVo3CI49v
   x62mKCyu0pUY4fTIN8mkqREiwlBE5DHpjJAuAmGbQsZefv+6M4m6CyCxJ
   9jbis0tAS5clzrhWDdbpRv68tSqIygziCDMevTH0vjr+tEiD6YTk/yXFv
   Q==;
X-CSE-ConnectionGUID: 7lW2LQvxTAGxrTOCTn+OhA==
X-CSE-MsgGUID: JWEQ1tVBQv6aavYch1zOfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73319571"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73319571"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:43:34 -0800
X-CSE-ConnectionGUID: VsWBta3JQzGI6EJylCD54g==
X-CSE-MsgGUID: o58NJJSeQvCPRu75PyWRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204434756"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.116])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:43:26 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 63B3811F9B2;
	Wed, 14 Jan 2026 12:43:24 +0200 (EET)
Date: Wed, 14 Jan 2026 12:43:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 45/64] media: Documentation: Add binning and
 sub-sampling controls
Message-ID: <aWdzTI_o-G8XIaHa@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-46-sakari.ailus@linux.intel.com>
 <3h2uiwbzg65djyy22p2yi3s72wdfssnddblyzphfsnfhrczzp5@przqnnisxl32>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3h2uiwbzg65djyy22p2yi3s72wdfssnddblyzphfsnfhrczzp5@przqnnisxl32>

Hi Jacopo,

On Mon, Jul 28, 2025 at 05:33:57PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:58:17PM +0300, Sakari Ailus wrote:
> > Document the binning and scaling controls (V4L2_CID_BINNING and
> > V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
> > model.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > index ee59bf3c5761..c1c9c9b8bc14 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -134,8 +134,12 @@ separately horizontally and vertically.
> >
> >  Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
> >  rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> > -1/0. The driver implementation determines how to configure binning and
> > -sub-sampling to achieve the desired size.
> > +1/0. It depends on the driver which of these operations are being used to
> > +achieve the resulting size. Binning and sub-sampling are also directly
> > +configured using :ref:`V4L2_CID_BINNING_FACTORS
> > +<v4l2-cid-camera-sensor-binning>` and :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>` controls on
> > +drivers that support them.
> 
> This is a big vague, as it allows drivers to ignore the two newly
> introduced controls.
> 
> I understand existing drivers cannot all be moved to use them, but new
> drivers complying with the V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR should
> probably implement the full model, including the controls.
> 
> What do you think ?

I agree, but this is UAPI documentation so we need to accommodate older
drivers, too.

> 
> >
> >  The digital crop operation takes place after binning and sub-sampling. It is
> >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > @@ -194,9 +198,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> >        - \-
> >        - X
> >        - Binning and sub-sampling. This rectangle is relative to the
> > -        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> > -        combination of binning and sub-sampling is configured using this
> > -        selection target.
> > +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
> > +        configured using the :ref:`V4L2_CID_BINNING_FACTORS
> > +        <v4l2-cid-camera-sensor-binning>` control and sub-sampling is configured
> > +        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > +        V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`
> > +        controls on drivers that support these controls. To configure binning
> > +        and sub-sampling on drivers that do not support these controls, the
> > +        selection rectangle may be changed directly to configure the combined
> > +        effect on the image size.
> >      * - 2/0
> >        - Format
> >        - X

-- 
Kind regards,

Sakari Ailus

