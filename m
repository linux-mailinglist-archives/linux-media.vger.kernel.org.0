Return-Path: <linux-media+bounces-1392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56C7FEC1C
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 10:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D41C1C20E25
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 09:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5447C3986D;
	Thu, 30 Nov 2023 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r0Uj9+5q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD8B10D4;
	Thu, 30 Nov 2023 01:46:02 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C8FA8C1;
	Thu, 30 Nov 2023 10:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701337523;
	bh=WV7upD+FFFLTGLLvYXanKOUa5AfZ/hueHZz/fvxdFs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0Uj9+5qe67C6Pydq2UHI1hU/Hen3vw9eP2fegrtiiJHGHALBlTm9iQfnAvJSiw4t
	 9iwswI/vIKzyTdqRk3QdkY/bbmflEs6SSb4KmmqmoXtjGVvLbq5+oWeFgWTWq/sant
	 D4jRguRlCRe4weLwctTbLoDc81RjbkuwG4A7b2u4=
Date: Thu, 30 Nov 2023 18:45:48 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com
Subject: Re: [PATCH v4 00/11] media: rkisp1: Add support for i.MX8MP
Message-ID: <ZWhZzNQ6VWcfvWZy@pyrite.rasen.tech>
References: <20231129092759.242641-1-paul.elder@ideasonboard.com>
 <CAHCN7xLgypy8YMhxM1g27DWU7hY3nwAYLYRSMMDtODeGdd_CQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLgypy8YMhxM1g27DWU7hY3nwAYLYRSMMDtODeGdd_CQg@mail.gmail.com>

On Wed, Nov 29, 2023 at 05:36:25AM -0600, Adam Ford wrote:
> On Wed, Nov 29, 2023 at 3:28 AM Paul Elder <paul.elder@ideasonboard.com> wrote:
> >
> > This series extends the rkisp1 driver to support the ISP found in the
> > NXP i.MX8MP SoC.
> >
> > The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
> > and in the NXP i.MX8MP have the same origin, and have slightly diverged
> > over time as they are now independently developed (afaik) by Rockchip
> > and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
> > and is close enough to the RK3399 ISP that it can easily be supported by
> > the same driver.
> >
> > The last two patches add support for UYVY output format, which can be
> > implemented on the ISP version in the i.MX8MP but not in the one in the
> > RK3399.
> >
> > This version of the series specifically has been tested on a Polyhex
> > Debix model A with an imx219 (Raspberry Pi cam v2).
> 
> I have tested previous versions with a imx219 camera running in 4-lane
> mode with great success.  Should I apply this series against
> linux-next, or do I need to apply it against something in the media
> tree to test?  I hope to test it tonight or tomorrow.

I have it applied on 6.7-rc1.


Thanks,

Paul

> >
> > Laurent Pinchart (2):
> >   media: rkisp1: Add and use rkisp1_has_feature() macro
> >   media: rkisp1: Configure gasket on i.MX8MP
> >
> > Paul Elder (9):
> >   media: rkisp1: Support setting memory stride for main path
> >   media: rkisp1: Support devices lacking self path
> >   media: rkisp1: Support devices lacking dual crop
> >   media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
> >   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
> >   media: rkisp1: Add match data for i.MX8MP ISP
> >   media: rkisp1: Shift DMA buffer addresses on i.MX8MP
> >   media: rkisp1: Add YC swap capability
> >   media: rkisp1: Add UYVY as an output format
> >
> >  .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c | 128 ++++++++++++-----
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++++-
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  66 +++++++--
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 +++++++++++++++++-
> >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  32 +++++
> >  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  27 ++--
> >  include/uapi/linux/rkisp1-config.h            |   2 +
> >  8 files changed, 398 insertions(+), 60 deletions(-)
> >
> > --
> > 2.39.2
> >

