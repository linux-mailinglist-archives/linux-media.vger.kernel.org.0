Return-Path: <linux-media+bounces-11928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B125F8CFE6E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 12:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7ED282D9F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89E313B789;
	Mon, 27 May 2024 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YSuZz/P8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DB26AFA
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716807372; cv=none; b=s78Q2fEIxEqVgOPPRePunObT8Q42oNbqS8o5uznysZLrQgD7GW1IiS0uRjZ5DdNSIj/Xj6BnlGWWJ6QjQ3AqipAjSF79mwLI5XMZJJ39eSxLp5Rs0tQwEXbQFztvYx2e5pamWUpKnsEJTRpD86EKS0IiaF2yypmnefnmifmCFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716807372; c=relaxed/simple;
	bh=QrM3eJbfUYT05ngr2/He3jEU1AtnqNEaTy1iVg26Gs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ui2B622UNWUpXfGkMpjH6hXPYA4PiFxXNG71DW6hfWy/OiBCG3bnKTbgCOJ8/FdMJeG6c/u9a24NeBtfb4I98X3rHzWhh/VxqEcUDobex2WYVWLkW+nLa7hdS9aEAbZBjc/w5RME7nOFZLt7p00DbfygFlxhc/nrTC1xYfMhh8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YSuZz/P8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30A37471;
	Mon, 27 May 2024 12:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716807366;
	bh=QrM3eJbfUYT05ngr2/He3jEU1AtnqNEaTy1iVg26Gs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSuZz/P8E3HD7c1hEIoC1/vJuYjH8bnYqEDY5an7Fbk7YB5lJIh8Ch4gNGq7PXFpC
	 u6rcMkDlNTiy/BltK/F1ETLvE+MxA8+fTe8f8U58Js0xowFo361llY91sufI1mEhVj
	 Gfa2WOwB4jSVuYCt4S8HIw5jN0e5tOaQySUNijDY=
Date: Mon, 27 May 2024 13:55:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <20240527105556.GC2986@pendragon.ideasonboard.com>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <lqo77pdefh6f5ynxu32s24paj2qa22rc6pih623mhywifgr4pw@kt4iic67ljfz>
 <ZlRAyMCduqsxYaQu@valkosipuli.retiisi.eu>
 <20240527083133.GB2986@pendragon.ideasonboard.com>
 <ZlRIIv3PHJQyysEm@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZlRIIv3PHJQyysEm@valkosipuli.retiisi.eu>

Hi Sakari,

On Mon, May 27, 2024 at 08:45:22AM +0000, Sakari Ailus wrote:
> On Mon, May 27, 2024 at 11:31:33AM +0300, Laurent Pinchart wrote:
> > On Mon, May 27, 2024 at 08:14:00AM +0000, Sakari Ailus wrote:
> > > Hi Jacopo,
> > > 
> > > On Mon, May 27, 2024 at 09:56:00AM +0200, Jacopo Mondi wrote:
> > > > > > +#include <linux/media/raspberrypi/pisp_be_config.h>
> > > > >
> > > > > Where is the header included from? If it's just this driver, then I'd put
> > > > > it in the driver's directory.
> > > > 
> > > > It's the uAPI header file. Or did I miss your question ?
> > > 
> > > If it's uapi, then you should have uapi in its header path. I.e.
> > > 
> > > #include <uapi/linux...>
> > > 
> > > > > > +	/* Everything else is as supplied by the user. */
> > > > > > +	begin =	offsetof(struct pisp_be_config, global.bayer_order)
> > > > > > +	      / sizeof(u32);
> > > > >
> > > > > The slash should be on the previous line. Same elsewhere.
> > > > >
> > > > 
> > > > Please, this is highly subjective and other people (like Laurent) often
> > > > ask for the contrary. Without any polemic intent, I encourage reviewers
> > > > (myself included) in considering how much time we spend (and
> > > > demand) on such subjective issues. Even more when other reviewers might have
> > > > different opinions, with the end result of pulling contributors in
> > > > different directions.
> > > 
> > > Having binary operators at the beginning of a statement split on multiple
> > > lines is simply uncommon, perhaps around 10 % of the cases in the media
> > > tree based on a quick look. Keeping the coding style consistent is
> > > beneficial for us all.
> > 
> > I've been slowly but steadily working on increasing that number :-) I
> > think the style above is the most readable, and I would leave it to
> > driver authors (as long as they're consistent within a driver).
> 
> This has been one of the differences between what's commonly (albeit not
> explicitly I guess) used in Linux compared to the GNU coding standards
> which is explicit about it.
> 
> I prefer to keep it at the end of the line which apparently is the
> preference of a largish majority.
> 
> ...
> 
> > > > > > +	/* Hardware initialisation */
> > > > > > +	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > > > > > +	pm_runtime_use_autosuspend(pispbe->dev);
> > > > > > +	pm_runtime_enable(pispbe->dev);
> > > > > > +
> > > > > > +	ret = pm_runtime_resume_and_get(pispbe->dev);
> > > > >
> > > > > You'll need to call the driver's resume function manually instead. The
> > > > > above depends on CONFIG_PM.
> > > > 
> > > > The driver selects CONFIG_PM, doesn't it ?
> > > 
> > > It depends on PM.
> > > 
> > > It'd be trivial to remove that dependency.
> > 
> > For drivers such as sensor drivers that need to work on a wide variety
> > of platforms, with varying configurations, I agree that not depending on
> > CONFIG_PM is a good thing (I reserve the right to change my mind though
> > :-)). For this driver, I don't think the dependency is an issue.
> 
> People tend to copy these from one driver to another so there is value in
> doing it properly even if the benefits for this driver might be minor.

For most ISP drivers I don't really see much value in supporting
!CONFIG_PM. I don't think it's worth doing so here, especially given
that it will never be tested.

-- 
Regards,

Laurent Pinchart

