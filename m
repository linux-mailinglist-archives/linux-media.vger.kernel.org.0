Return-Path: <linux-media+bounces-28020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7618A5BD9B
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A0D1890613
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8D1231A24;
	Tue, 11 Mar 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIEYayfL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56831EE7CB;
	Tue, 11 Mar 2025 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688333; cv=none; b=lZi6ISKPXtt0Bn5uRvjPh6oULCSQOWfq4YaRsbLtctLM1tgTetLgj0UCu0S9sIU5RXdJTxmOhz9FByV8z0g92hI23X5DJ7sj8+xIGp+j0JnSai70viMRpcjzwF95wIsPdNcM6b+LV1c6SJ4W6WeCnMqVst9Ec8F/HWzPbaEIFD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688333; c=relaxed/simple;
	bh=01sOVUPbNeWequzCM14Vb8FmyT9+hZ83vgLe53UwStg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLgasnAehX6esl5XdqQCrSj3sO2CJqxtABlopc2HL3bhw0OO4D/ieK11z7/Hxof4ZBWYWTMU0/22fKMFSmZ6NBSRJHI93Rx0iKNQLCddRWiY00WjBg1H6haDsruwuZqiOkWt5518d7Q0tT3wm0Jfb/oAS7MFlcpcjs/JhtnGgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIEYayfL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741688332; x=1773224332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=01sOVUPbNeWequzCM14Vb8FmyT9+hZ83vgLe53UwStg=;
  b=TIEYayfLIat6SzOXwo/SzPthDmM5LU1nL15rvmitaN5zp67GEL5jS/lB
   877xPGWQ0yk6PoISfI+ALt4Uzw985LC/kM2FSTSF3fRsNSQld+6qwTrAM
   MjqgG/cjSq1vZLoHLFPPLaJdMB6t9J6e2Tarogg40CcgD0hxUC0zsDEiT
   qaeLs0kuocssCcsVJTQtkrKZwaiFTHDatDrB2XX7Rq2nSjM8ng31HUtnE
   253WZSlS0M82a6Y8+ieiOyLR2YoLIoq7JRgp1Ob177w1c/NetaaJQ1USQ
   AlDBVxCo9FP/OxXLi7r0c3EUz9hcMsHcAekgP3PLDk0v//2rQhGB73XSv
   w==;
X-CSE-ConnectionGUID: hc0RGJgtSXiCOsiFe3GYyw==
X-CSE-MsgGUID: qydtmDvxQma5nQ+0wsKKmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="45503494"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="45503494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:18:50 -0700
X-CSE-ConnectionGUID: wviOlQuzQGGl9dl+J9CknQ==
X-CSE-MsgGUID: lfjkY8ClS0+uA3DYnP5lZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120004427"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:18:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7FAFD11F7E5;
	Tue, 11 Mar 2025 12:18:38 +0200 (EET)
Date: Tue, 11 Mar 2025 10:18:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Achath Vaishnav <vaishnav.a@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jianzhong Xu <xuj@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stuart Burtner <sburtner@d3embedded.com>,
	Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
Message-ID: <Z9AN_lo5T5VfshT9@kekkonen.localdomain>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
 <20250213101903.GH5888@pendragon.ideasonboard.com>
 <D8CU9UT1XQV9.3NFZ4OAQOKQG0@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8CU9UT1XQV9.3NFZ4OAQOKQG0@d3embedded.com>

Hi Sebastian,

On Mon, Mar 10, 2025 at 03:39:02PM -0400, Sebastian LaVine wrote:
> On Thu Feb 13, 2025 at 5:19 AM EST, Laurent Pinchart wrote:
> >
> > ...
> >
> >> +static const struct cci_reg_sequence imx728_wdr_12bit_3856x2176[] = {
> >
> > This table is way too big, with over 8000 entries. Some are even
> > duplicated, with identical or different values for the same register. It
> > will take more than a second at 400kHz to program this.
> >
> > At the very least I would expect a way to compact the table and make use
> > of I2C register address auto-increment. Default power-up values should
> > also likely be just dropped.
> >
> > I haven't checked in details, but doesn't this table also contain tuning
> > data for your specific camera ?
> >
> 
> In my testing, it takes around two seconds to write this table to the sensor.
> 
> I can investigate how to condense the table further, though the
> registers for this sensor are more complex than just writing values to
> addresses. The meaning of certain address writes depend on previous
> writes -- thus the "duplicated" writes you mentioned.
> 
> I do not believe this table contains tuning information for our camera
> module in particular.

The amount of the data is significantly higher than what sensors mostly
have for configuring the analogue processing and does not look like
executable code either (I've seen that, too).

Any idea what that data is?

-- 
Kind regards,

Sakari Ailus

