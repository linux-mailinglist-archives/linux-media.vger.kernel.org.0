Return-Path: <linux-media+bounces-46231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB67C2DE51
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 20:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE7A1899774
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 19:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F153164AF;
	Mon,  3 Nov 2025 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJZTTIfL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5408D347C3;
	Mon,  3 Nov 2025 19:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197899; cv=none; b=SYEMTVaJ6EhjG/MIfh8nbiz90qFs30KnHVItC+prw2PUEsLzaDxNGM3GJUkSyxRZBVYankXPPR/5jGG3RNOwpAuniT+Iq3PA9knvJvXpJVAOeY0oy+xm+DnWbqK/qgEjMEc9QTRiHqv53KpGX+tHfWJpYmTkQfcHoCDIdaqaeV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197899; c=relaxed/simple;
	bh=YT4mXxQdx1Z/PE3Yf/aXEevukAJlGlp/Gs7YbI3nPgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs1nnFAfyLv9SnkJvK9DibYZF5fEkSB/lqsKTshLdwFh3kuPpwzW7TmznMijCpBIni8YALICqmtxOreJWt7TAIex+Hh/MaoS/dKlLCu4QutcZRJOJWuMWWGTGK3yafxojRCyrlkH0jsfPtMdLrNYGwudZYdQ1Izw3O3rsb9ORvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJZTTIfL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762197896; x=1793733896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YT4mXxQdx1Z/PE3Yf/aXEevukAJlGlp/Gs7YbI3nPgs=;
  b=FJZTTIfLsIr6OvfNmGZ2PoSbQN4xCvgBwWZL8mLLAc/nkAbPM5qUnBai
   u7aABQREiXXcSlbPARiTE8ttGY6qMB5TTkQXmXxOyMx0CYO5qkkVSWklx
   5x1qT6spIu6MBzm6KVVgqQVMWadARwijGIpGuEUvA4pL5USrJma10eu2n
   jqL9HVHAKzZSoOEbXy2i7+Izl623x8q8tdKSYzdz4vuN1Ev9p9xKhLI4c
   QDtvoqQOgh62PIKZbuEUcMaaD4pIpEalCxkfmMPRwiIowrT9QaGFC77HL
   Yzhuv1Z/cH+W00CX/fpPucfgxc8AdaScRsbVbwr12j4vsNC1eFj3A0Q32
   g==;
X-CSE-ConnectionGUID: faikKZF7SL6iO2JJOQT4ew==
X-CSE-MsgGUID: YTccQ5UvRTyhGRYiA7Qc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64321086"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="64321086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 11:24:56 -0800
X-CSE-ConnectionGUID: ts9V3WD0TjuY0nwK8/miog==
X-CSE-MsgGUID: AcugWwu0TFOcPf0UgpNZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="217588322"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.81])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 11:24:53 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CA30121466;
	Mon, 03 Nov 2025 21:24:49 +0200 (EET)
Date: Mon, 3 Nov 2025 21:24:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: add Sony IMX111 CMOS camera sensor
 driver
Message-ID: <aQkBgVwi2FS5ve42@kekkonen.localdomain>
References: <20251030115757.33695-1-clamor95@gmail.com>
 <20251030115757.33695-3-clamor95@gmail.com>
 <PN3P287MB182950EC8691183FBFC4EC098BFBA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAPVz0n0Vqi0xg8c=PS3vyFr9YzRC0PtFXyxw9G5yHohS4FKVbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0Vqi0xg8c=PS3vyFr9YzRC0PtFXyxw9G5yHohS4FKVbQ@mail.gmail.com>

Hi Svyatoslav,

On Thu, Oct 30, 2025 at 05:13:31PM +0200, Svyatoslav Ryhel wrote:
> чт, 30 жовт. 2025 р. о 16:55 Tarang Raval <tarang.raval@siliconsignals.io> пише:
> >
> > Hi Svyatoslav,
> >
> > > Add a v4l2 sub-device driver for the Sony IMX111 image sensor. This is a
> > > camera sensor using the i2c bus for control and the csi-2 bus for data.
> > >
> > > The following features are supported:
> > > - manual exposure, digital and analog gain control support
> > > - pixel rate/link freq control support
> > > - supported resolution up to 3280x2464 for single shot capture
> > > - supported resolution up to 1920x1080 @ 30fps for video
> > > - supported bayer order output SGBRG10 and SGBRG8
> > >
> > > Camera module seems to be partially compatible with Nokia SMIA but it
> > > lacks a few registers required for clock calculations and has different
> > > vendor-specific per-mode configurations which makes it incompatible with
> > > existing CCS driver.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > ---
> >
> > > +static int imx111_set_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +   struct imx111 *sensor = ctrl_to_imx111(ctrl);
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   s64 max;
> > > +   int ret = 0;
> > > +
> > > +   /* Propagate change of current control to all related controls */
> > > +   switch (ctrl->id) {
> >
> > Do we need the switch statement, since only one case is present?
> > You can use an 'if' instead.
> >
> 
> imx219 and imx319 which are recommended references use switch, and it
> seems that media maintainters are particularly picky to code style, I
> have copied it from there.

The documentation lists areas where the mentioned drivers serve as good
examples, it does not say everything in those drivers is done the way it is
best. Common sense indeed should prevail.

The reason why we mention these these drivers as examples is that there are
things that have been notoriously hard to get right (such as runtime PM
usage in sensor drivers).

...

> > > +static int imx111_initialize(struct imx111 *sensor)
> > > +{
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   int ret;
> >
> > ret = 0;
> >
> 
> cci_write does not state that ret must be initiated.

It does not explicitly use that wording but the documentation is clear
enough IMO.

-- 
Kind regards,

Sakari Ailus

