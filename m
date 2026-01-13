Return-Path: <linux-media+bounces-50556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89577D18B83
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F4AB303CF65
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBF838F25C;
	Tue, 13 Jan 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZraZb6kd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5035CB73
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307430; cv=none; b=ghr8INoMNJtFFkMjdNEYvLlz5PItYXYvVbXXdNIH4/ZVn5wtTkD340DoVSv4mZ/5IyubnVZN1cB72wT7Zh4lnXq+qAMIOv/OJS842o6PfeUCEUwVAPSWF3RnSN3PeiAGmsX92hD2G6jTXqHZiBg4OqJw/msKo5AG9ztv1KS3DLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307430; c=relaxed/simple;
	bh=vfnQpi20yYVsX3238jAiRf7Uqe3atzItvjZ3rR/ouIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPD0Pb3hCuaYvva9GgrurE+9ulcpNTc8zEksIYWiJAmCHRVGahvYiVO9bVWTGrmCifCyB5+XxIpGp5D1Cme2QaP9WjYzc+Ty5Azo9HgURJ3roFtx0QsWscvEWtYLWXdMEIG5XAymB/BRJjMAgJ2viHSavEykwnzCM/a+YJbEYEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZraZb6kd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768307427; x=1799843427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vfnQpi20yYVsX3238jAiRf7Uqe3atzItvjZ3rR/ouIU=;
  b=ZraZb6kd2EqD534DgiMWuFhsNsUyzuyk/UYC82GM3fMP0qIr1vjHCF3Z
   iSsDWTSh6g2Pw476tiBjLoqHNHxPB5wSlqeFSWs8AG1bJG/2ulEM9fAdW
   ko6C5mAWnj2pDtuqsotdy+n7WtTGWCJhVd/Sr7NFIl70rXCH8daB6CjSM
   mJ2Jiv4a+mjT9fLeqj4d5Pg+n2JttP4RTOf9wrL3PWaM7QBO87dsKem8w
   +GtK1ToDRQ0njNU+bYFmsRsnGePCpS6M+ZNC9XpwaaoTkND4EsVpS0Z0s
   mpF1SuhBStjS6y2p6k6emEnCcz1u0+ytCjI1lKzGDh1BZFhOwrWtNxCHV
   A==;
X-CSE-ConnectionGUID: bniJF26qT6WDQiFZwdWS4A==
X-CSE-MsgGUID: YVa+rhN+RyGIS8mIQnx1Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69747992"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69747992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:30:22 -0800
X-CSE-ConnectionGUID: CDv510wsQUGvmKKbvg9Y1A==
X-CSE-MsgGUID: Z/z/k3c/TSWRBwdUcPYOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203585159"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:30:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54E7C11FB85;
	Tue, 13 Jan 2026 14:30:12 +0200 (EET)
Date: Tue, 13 Jan 2026 14:30:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [EXT] [PATCH v10 15/64] media: uapi: Add generic CSI-2 raw
 pixelformats
Message-ID: <aWY61FKxtnD6x7qI@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-16-sakari.ailus@linux.intel.com>
 <41ad339a-c78c-4c16-922a-b23b6b79bdde@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41ad339a-c78c-4c16-922a-b23b6b79bdde@nxp.com>

Hi Mirela,

On Sat, Jul 12, 2025 at 08:08:15PM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> > 
> > 
> > Add generic raw pixelformats for bit depths 8, 10, 12, 14, 16, 20, 24 and
> > 28. These formats are CSI-2 packed, apart from the 8-, 16- and 24-bit
> > formats.
> > 
> > Signed-off-by: Sakari Ailus<sakari.ailus@linux.intel.com>
> > ---
> >   .../media/v4l/pixfmt-raw-generic.rst          | 398 ++++++++++++++++++
> >   .../userspace-api/media/v4l/pixfmt.rst        |   1 +
> >   include/uapi/linux/videodev2.h                |  10 +
> >   3 files changed, 409 insertions(+)
> >   create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > new file mode 100644
> > index 000000000000..8561233f5262
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > @@ -0,0 +1,398 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +************************************************************************************************************************************************************************************************************************************************************************************
> > +V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
> > +************************************************************************************************************************************************************************************************************************************************************************************
> > +
> > +
> > +Generic line-based image data formats
> 
> Looking at the generated documentation, this does not appear very nice:
> 
> https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt.html
> 
> Instead of 2.7 V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10
> ('RACA'), ....
> 
> Would be nice to have "Generic line-based image data formats" instead, I
> think that should be the title.

Interesting idea. There will probably be (much?) less use for the non-raw
formats though. I wonder what others think. It'd mean re-naming these
macros effectively.

> 
> > +
> > +
> > +Description
> > +===========
> > +
> > +These generic raw image data formats define the memory layout of the data
> > +without defining the order of the pixels in the format or even the CFA (Colour
> > +Filter Array) itself. These formats may only be used with a Media Controller
> > +pipeline where the more specific format is reported by an :ref:`internal sink
> > +pad <MEDIA-PAD-FL-INTERNAL>` of the source sub-device. See also :ref:`source
> > +routes <subdev-routing>`.
> > +
> > +.. _v4l2-pix-fmt-raw-8:
> > +
> > +V4L2_PIX_FMT_RAW_8
> > +------------------
> > +
> > +The V4L2_PIX_FMT_GENERIC_8 format is a plain 8-bit raw pixel data format. This
> > +format is used on CSI-2 for 8 bits per :term:`Data Unit`.
> > +
> > +**Byte Order Of V4L2_PIX_FMT_RAW_8.**
> > +Each cell is one byte. "P" denotes a pixel. + +.. tabularcolumns::
> > |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}| + +.. flat-table:: Sample
> > 4x2 Image Frame + :header-rows: 0 + :stub-columns: 0 + :widths: 12 8 8 8
> > 8 + + * - start + 0: + - P\ :sub:`00` + - P\ :sub:`10` + - P\ :sub:`20`
> > + - P\ :sub:`30` + * - start + 4: + - P\ :sub:`01` + - P\ :sub:`11` + -
> > P\ :sub:`21` + - P\ :sub:`31` + +.. _v4l2-pix-fmt-raw-csi2-10: +
> > +V4L2_PIX_FMT_RAW_CSI2_10 +------------------------ +
> > +V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four
> > bytes +containing the top 8 bits of the pixels followed by lowest 2 bits
> > of the pixels +packed into one byte. This format is typically used by
> > CSI-2 receivers with +a source that transmits MEDIA_BUS_FMT_RAW_10 and
> > the CSI-2 receiver writes the +received data to memory as-is. + +The
> > packing of the data follows the MIPI CSI-2 specification. + +This format
> > is little endian. + +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.** +Each
> > cell is one byte. "P" denotes a pixel.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
> > +
> > +.. flat-table:: Sample 4x2 Image Frame
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - P\ :sub:`00 bits 9--2`
> These elements of the table do not show up nice, perhaps adjusting the
> widths would improve the readability?

Hmm. They seem fine here. Which browser are you using?

That being said, there are issues with wider tables below. I'll try to
improve this for v12.

> > +      - P\ :sub:`10 bits 9--2`
> > +      - P\ :sub:`20 bits 9--2`
> > +      - P\ :sub:`30 bits 9--2`
> > +      - P\ :sub:`00 bits 1--0` (bits 1--0)
> > +        P\ :sub:`10 bits 1--0` (bits 3--2)
> 
> Is this intentional? It shows up as bits 1--0 and then again as bits 3--2. I
> think this should not be on 2 rows, it's not readable. Same comments for the
> remaining tables.

I'm not sure how much we have control over how the browser decides to wrap
this. Perhaps adding commas between elements could improve readability?

-- 
Kind regards,

Sakari Ailus

