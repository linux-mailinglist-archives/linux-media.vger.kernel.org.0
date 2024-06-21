Return-Path: <linux-media+bounces-13957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE25912C7C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 19:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF9EC1C22185
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC731684AA;
	Fri, 21 Jun 2024 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2co8RlL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D12F2E417;
	Fri, 21 Jun 2024 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718991378; cv=none; b=Zwnmfr17dUBStT1eJjb7NXTL4NdyrQvspOf9RVzRkeoCpD5hB+p+yxinWB37qGUpfZlxFiKmRLIYq1A3t0d6Cb7uStsdHRApLcuUJPuJm0w84Q/pYWeeL2sRoR5Z4MNiAkA9CxfrfAHaE/UaEiP85WGiYpWr6JE2nI4W982B5R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718991378; c=relaxed/simple;
	bh=qcPvzmgYj12g8ImX1mzdEnkJ4xTcuDJBE3vsD6BBM/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNIJiC2WJMEyq10ldkwK7AK/jp+wEvyRleUoF/eQLutV207SuPsuIHp9Ww9gpnOybOLJM8UFIdgrKIZKSG9hdY6RLqKKkCOaCqYpN3gioPGlvA855TmuDKkMMNju6Fw8ZB58vMGaQz+AB4KicQRH44N4T3pDlMbf4o1iFkyIbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2co8RlL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718991377; x=1750527377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qcPvzmgYj12g8ImX1mzdEnkJ4xTcuDJBE3vsD6BBM/8=;
  b=Z2co8RlLYAN8D+wvTAguu6XCH5ag5Uwwu9k8UXVB+df/bsRELZbcvBWN
   pSZ5K3Hu6VK+LDUsigRNKQMKePul15I49i4bttX1sz9Xe/bzrZV4JkssN
   IA/PJBbD7EWmkVYPMELS1+pIyobn1im2a68CbRXYTpUeAYRO05FjB8lMD
   /7T/6SZBExBxvnDcVQP09JHvph4QzS4f7rIXc080nm6iCX8uw5qpe8iKm
   Ch6v0RizVnj6V/4nitdzKnG60WD9yQJO6Ehb49RCdNA+r905x2KNOKK17
   vLxeBnRTQp88hQ2+K52OYjMHNHqJOhfIJNvoQrtGF2YYL1P5tQ8qCZLl6
   Q==;
X-CSE-ConnectionGUID: vcBk/8plTl6iC9P/BV5yxg==
X-CSE-MsgGUID: Fx6LAm2TR+uemhrv/2HGlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15793894"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15793894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:36:15 -0700
X-CSE-ConnectionGUID: H9IYCJeiSDarIWFxa6sdhA==
X-CSE-MsgGUID: 3ooXh5iNSpCEYlpT4ljgOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="43333717"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:36:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A070711F855;
	Fri, 21 Jun 2024 20:36:04 +0300 (EEST)
Date: Fri, 21 Jun 2024 17:36:04 +0000
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Zhi Mao =?utf-8?B?5q+b5pm6?= <zhi.mao@mediatek.com>,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org,
	dongchun.zhu@mediatek.com, "heiko@sntech.de" <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Yaya Chang =?utf-8?B?5by16ZuF5riF?= <Yaya.Chang@mediatek.com>,
	Shengnan Wang =?utf-8?B?546L5Zyj55S3?= <shengnan.wang@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"alain.volmat@foss.st.com" <alain.volmat@foss.st.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"10572168@qq.com" <10572168@qq.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"mehdi.djait@bootlin.com" <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
Message-ID: <ZnW6BO0ZLPPI71TP@kekkonen.localdomain>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
 <20240612012019.19078-3-zhi.mao@mediatek.com>
 <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com>
 <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
 <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
 <CAHp75VcA9yZ6bVt+10FrzB3L3wPj8fW5UBB9D7p0iHjLaxWCpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcA9yZ6bVt+10FrzB3L3wPj8fW5UBB9D7p0iHjLaxWCpA@mail.gmail.com>

Hi Andy, others,

On Thu, Jun 13, 2024 at 09:51:03PM +0200, Andy Shevchenko wrote:
> On Thu, Jun 13, 2024 at 2:05 AM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Also - Cc: Dongchun Zhu <dongchun.zhu@mediatek.com> who is listed as the
> > DW9768 VCM driver author...
> > Quoting Zhi Mao (毛智) (2024-06-12 12:13:40)
> > > On Wed, 2024-06-12 at 09:07 +0200, AngeloGioacchino Del Regno wrote:
> 
> ...
> 
> > > Our project uses Giantec VCM hardware.
> > > For detailed vendor information, please visit: (
> > > https://en.giantec-semi.com/yqmd/164).
> > > The VCM datasheet we are referencing is provided by Giantec.
> > > Currently, the relationship between Giantec VCM and Dongwoon VCM is
> > > unclear, but Dongwoon seems to be another manufacturer of VCM
> > > hardware.
> 
> There may be plenty of manufacturers of the same/similar IPs, but it's
> not an excuse to have a duplication like this.
> 
> > > From the perspective of software driver development and maintenance, it
> > > makes sense for each vendor's hardware should have its own software
> > > driver.
> >
> > Personally, I don't think so. If two vendors make identical parts, we
> > shouldn't have two identical drivers.
> 
> Exactly! That's why we have compatible strings or other means of
> reusing the same code base as much as possible. This in particular
> reduces maintenance costs (of all means!) _a lot_.

Indeed. I'll mark these thus "rejected" in Patchwork.

If there's something that needs to be handled differently for the other
VCM, that can be taken into account in the driver.

-- 
Kind regards,

Sakari Ailus

