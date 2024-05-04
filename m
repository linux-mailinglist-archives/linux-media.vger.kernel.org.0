Return-Path: <linux-media+bounces-10765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19028BBC60
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 16:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82B15B21701
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7818E3BBC9;
	Sat,  4 May 2024 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oc2a49Dv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAC39FEB;
	Sat,  4 May 2024 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714832338; cv=none; b=DwvMrb0lWSJkgOlL1RnhKZF/fdBScvuuh7LxUzcFmfcwnddLZ4XFQ7tN29gR7CzUVxLVtsyFp6M+9DIDpXL20jfMyihHfmOH5T5WEmHbtekS6rtlZleDxOm9fqt2gC5p/hYxo644Sr4a8HPQZpKNvb/+6ykvDQJNaxG5Qpw3xW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714832338; c=relaxed/simple;
	bh=w6bn/4no8NMVEJqPP561BcxXipVz/9y/dItL/1UBPSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szivVnzZ6f1pzVAPUv2OItJDKGjGHxGtanoKnuNlV/auFSkWQvJj72/Bg9lif6tJAp/Ll13MWSQaw2MLaZMEdTH6bgWhO+lSBMZpSXB7LHBD5C0Px9vuC/03iI+tjCRkyWgxttUjXdhFrEkGOBv65xNnyFQlxCPd1HFGFZ+uOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oc2a49Dv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85A2D33D;
	Sat,  4 May 2024 16:17:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714832273;
	bh=w6bn/4no8NMVEJqPP561BcxXipVz/9y/dItL/1UBPSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oc2a49DvYCMivQW8QKuerCPDE3NB3M4O9gQMO9h7ew1S3EyQGPeuVqDZMxOQ0Rhx8
	 noPhHVWfaI4WgcUwRiPdTUdxX6QxUwk259ygX79+BNPafprI95tRigE5Hftkcr53OA
	 fLFvCGMtvo6Bbhyh2FDfgLBjJcV+gwxbyscJXnXg=
Date: Sat, 4 May 2024 17:18:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Jai Luthra <j-luthra@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce v4l2_async_nf_unregister_cleanup
Message-ID: <20240504141845.GC24548@pendragon.ideasonboard.com>
References: <20240502-master-v1-0-8bd109c6a3ba@collabora.com>
 <20240502155626.GD15807@pendragon.ideasonboard.com>
 <ZjO46Uo_tVcRTdA0@kekkonen.localdomain>
 <20240502160830.GB11443@pendragon.ideasonboard.com>
 <ZjO-JDBdHXVLbz5H@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZjO-JDBdHXVLbz5H@kekkonen.localdomain>

On Thu, May 02, 2024 at 04:24:04PM +0000, Sakari Ailus wrote:
> On Thu, May 02, 2024 at 07:08:30PM +0300, Laurent Pinchart wrote:
> > On Thu, May 02, 2024 at 04:01:45PM +0000, Sakari Ailus wrote:
> > > On Thu, May 02, 2024 at 06:56:26PM +0300, Laurent Pinchart wrote:
> > > > On Thu, May 02, 2024 at 05:22:20PM +0200, Julien Massot wrote:
> > > > > Many drivers has
> > > > >   v4l2_async_nf_unregister(&notifier);
> > > > >   v4l2_async_nf_cleanup(&notifier);
> > > > > 
> > > > > Introduce a helper function to call both functions in one line.
> > > > 
> > > > Does this really go in the right direction ? For other objects (video
> > > > devices, media devices, ...), the unregistration should be done at
> > > > .remove() time, and the cleanup at .release() time (the operation called
> > > > when the last reference to the object is released). This is needed to
> > > > ensure proper lifetime management of the objects, and avoid a
> > > > use-after-free for objects that can be reached from userspace.
> > > > 
> > > > It could be argued that the notifier isn't exposed to userspace, but can
> > > > we guarantee that no driver will have a need to access the notifier in a
> > > > code path triggered by a userspace operation ? I think it would be safer
> > > > to adopt the same split for the nofifier unregistration and cleanup. In
> > > > my opinion using the same rule across different APIs also make it easier
> > > > for driver authors and for reviewers to get it right.
> > > > 
> > > > As shown by your series, lots of drivers call v4l2_async_nf_cleanup()
> > > > and .remove() time instead of .release(). That's because most drivers
> > > > get lifetime management wrong and don't even implement .release().
> > > > That's something Sakari is addressing with ongoing work. This patch
> > > > series seems to go in the opposite direction.
> > > 
> > > This still avoids the driver authors feeling they need to implement wrapper
> > > functions for v4l2_async_nf_{unregister,cleanup}. I'd be in favour merging
> > > this.
> > > 
> > > I don't see this getting in the way of adding use counts as the code will
> > > need to be changed in any case.
> > 
> > Fixing the lifetime issues would essentially revert 2/2 and move the
> > v4l2_async_nf_cleanup() call to .remove(). I don't think providing a
> > helper that forces the cleanup at .remove() time is a good idea, it
> > gives a false sense of doing things right to drivers. This is the same
> > reason why devm_kzalloc() is so harmful, it gave the wrong message, and
> > created (or participated in) all those lifetime issues.
> 
> I still prefer having devm_*alloc() functions than having the drivers open
> coding the same -- with the same result. The frameworks won't enable doing
> this right at the moment and I don't think drivers (or us!) should be
> penalised for that.

I don't really see where the penalty is. What's the urgency to switch
from calling v4l2_async_nf_unregister() and v4l2_async_nf_cleanup() to a
helper that we know goes in the wrong direction ?

> The driver authors will only change what they do, with
> these patches or without, when told so. But we don't really have an
> alternative today.

There's already a .release() callback that can be used, and some drivers
use it.

> A similar situation exists with clk_unprepare() and clk_disable().

-- 
Regards,

Laurent Pinchart

