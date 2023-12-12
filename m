Return-Path: <linux-media+bounces-2243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C580EDCF
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 14:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB1A61C20CA5
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E3661FDD;
	Tue, 12 Dec 2023 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tnmjrRlF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DB383
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 05:39:24 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 356258C1;
	Tue, 12 Dec 2023 14:38:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702388317;
	bh=Z39Qrvkh9kvd65aAWfLNXDDL4Xb+wTS2ZFk9eM1foiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tnmjrRlF4CBGNSrdLrC+v3LO0s+dBnTgEzwT6j1d589v6WnmS5cVRspfyulAciV5Q
	 hp8FkiwPusP7hNNuH0cTAyIOiKAOOmDJWz0vQP1BVVcpS+1l37bk8uS71Fa2y5bOmC
	 UtiMR3LaInNTv+GV9lSdzH0+xOiEdUjzK92heNck=
Date: Tue, 12 Dec 2023 14:39:19 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.8] Some fixes and new drivers, too
Message-ID: <ou6onzlcf572yabpmjyao75vmcpjici65rsnbf5yol6nrq5phc@kklnilerzqzg>
References: <ZXgW25b9tV_YE7Mq@valkosipuli.retiisi.eu>
 <03b41071-e477-44c0-83f8-c90ce545c6de@xs4all.nl>
 <ZXg-jP23tEaj_RJk@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXg-jP23tEaj_RJk@valkosipuli.retiisi.eu>

Hello

On Tue, Dec 12, 2023 at 11:05:48AM +0000, Sakari Ailus wrote:
> Hi Hans,
>
> On Tue, Dec 12, 2023 at 10:09:31AM +0100, Hans Verkuil wrote:
> > On 12/12/2023 09:16, Sakari Ailus wrote:
> > > Hi Hans, Mauro,
> > >
> > > Here's a nice set of some fixes as well as new drivers that some of which,
> > > in turn, depend on the fixes. In particular, there are a few sensors
> > > (imx290 in particular) that have little endian registers, either just some
> > > or all, and this was missed in V4L2 CCI conversion earlier on. Another
> > > driver also needs these CCI_*LE() macros later in the set.
> > >
> > > There are new drivers for Galaxycore gc0308, Omnivision ov64a30 camera
> > > sensor as well as Avnet Alvium camera modules.
> > >
> > > Miscellaneous fixes exist for imx335, imx214, imx415, ov2740 as well as the
> > > IPU bridge.
> > >
> > > Documentation improvements for camera sensors are included, too.
> > >
> > > Please pull.

[snip]

> >
> > 0037-media-dt-bindings-Add-OmniVision-OV64A40.patch:
> >
> > WARNING: Co-developed-by and Signed-off-by: name/email do not match
> > #11:
> > Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > 0038-media-i2c-Add-driver-for-OmniVision-OV64A40.patch:
> >
> > WARNING: Co-developed-by and Signed-off-by: name/email do not match
> > #11:
> > Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > 0039-media-i2c-imx415-Convert-to-new-CCI-register-access-.patch:
>
> I'll ask Jacopo to fix these.
>

I noticed these while runnig checkpatch, but I thought it was
checkpatch beeing too picky. I added the Co-developed-by tag because
I was asked by dt maintainers. Before I had only Lee's Signed-off-by,
but it seems now I have to add both..

How would you like to proceed ?

> But overall, apart from the missing SoB lines (I missed this while looking
> at the long list of warnings the patches produce), is there something that
> prevents merging this? I agree there are bugs, but this all is still found
> at the time the PR has been sent which makes remedying them very difficult.
>
> >
> > CHECK: Alignment should match open parenthesis
> > #461: FILE: drivers/media/i2c/imx415.c:462:
> > +               cci_write(sensor->regmap, IMX415_BLKLEVEL,
> > +                                  IMX415_BLKLEVEL_DEFAULT, &ret);
>
> --
> Regards,
>
> Sakari Ailus
>

