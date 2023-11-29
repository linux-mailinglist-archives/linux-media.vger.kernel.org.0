Return-Path: <linux-media+bounces-1373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E97FDA20
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C57B1C20DAC
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E0A32C8E;
	Wed, 29 Nov 2023 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sB7Pw4l6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207751991;
	Wed, 29 Nov 2023 06:44:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D776896;
	Wed, 29 Nov 2023 15:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701269038;
	bh=hZ34+8XvuP5jUGm15VlG9omBwOmZ7i4xuna7zyqqhWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sB7Pw4l6wug0GxVw/0oM6yITWUCoa8OGlJ/whLhe4SQhKjrpmErBfMiNE+LaPJWw3
	 RpWiKYKBqbuHEs+s4i6552FLVb8fR28igQkYohG+t3dFNlnYdLbe9Ocr3t2rdkTAAe
	 0nlFHur4gLV4CLcD1pzJ8g6/U90LuHJ4ZnCRy56U=
Date: Wed, 29 Nov 2023 16:44:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Adam Ford <aford173@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20231129144441.GF24293@pendragon.ideasonboard.com>
References: <20231129093113.255161-1-paul.elder@ideasonboard.com>
 <20231129093113.255161-2-paul.elder@ideasonboard.com>
 <CAOMZO5BPQCyCQKPvc9HHqANk5rKic25EkUGCjBdf-d78zGDR0Q@mail.gmail.com>
 <CAHCN7xJyqEN_3GFCRogii_ST3oC354CBG6d029HGRnBKh=H_rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJyqEN_3GFCRogii_ST3oC354CBG6d029HGRnBKh=H_rQ@mail.gmail.com>

On Wed, Nov 29, 2023 at 07:49:31AM -0600, Adam Ford wrote:
> On Wed, Nov 29, 2023 at 5:59 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Paul,
> >
> > On Wed, Nov 29, 2023 at 6:31 AM Paul Elder <paul.elder@ideasonboard.com> wrote:
> >
> > > +                       isp_0: isp@32e10000 {
> > > +                               compatible = "fsl,imx8mp-isp";
> >
> > This compatible string is still not present in today's linux-next.
> >
> > Will it be merged soon?
> 
> Fabio,
> 
> Paul posted a series to the media mailing list adding support for the
> i.MX8MP ISP:
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=11776

Paul, this is the kind of information that needs to go to the cover
letter, along with anything else that reviewers may need to review the
patches. Otherwise, as Fabio pointed out, it gets confusing. Please
expand the cover letter for the next iterations of the series.

> I am guessing it'll have to go through the review process.  I was CC'd
> because I did some previous testing before.  I have a Sony imx219 that
> works in 4-lane mode.  I'm likely to review and test tonight or
> tomorrow.  I am guessing he posted the DTS changes via a different
> series since they usually go through Shawn's branch instead of the
> media one.
> 
> Hopefully that helps.

-- 
Regards,

Laurent Pinchart

