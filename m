Return-Path: <linux-media+bounces-20051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7D9AB35E
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 18:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50F51F24E59
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 16:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154811BBBF4;
	Tue, 22 Oct 2024 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ok49/o1R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6E139CEF
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729613144; cv=none; b=LRSEVNxywScheBoZa4UUKs0YJx2HQxVNF/NVSuTcjNvVf231fdZ0r7IPA2d9chZQhlJC2q9BT+4p8YNqG0mIyiumJ5vdC7OGsi9Hw/pwUn2D9GyB77qZ/ZIgcGUn0Vf13wsUpeBCStQWzVjBt6otEg71Ha+45Ut05HzALMi8xQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729613144; c=relaxed/simple;
	bh=Qu/DWj1DzmfXIhr5vzLOUU3pbHalQmDWeL0zp6GE05k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccbdpv0OXhzsi4ngpGk8yx3O4mSKq8c3jeCGi2/hs1CJcaXo5KmfO6zvp7XCTr0nX7J82xGXPRRfIEC2c942ZVmWqzuMJuEstx4budAtEfrherClMwqKFRcRUxIthgONCI3Fo9WlZXc0J0cMUet209YoMjPxQqyB/laE2RZEd4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ok49/o1R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 720323EA;
	Tue, 22 Oct 2024 18:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729613033;
	bh=Qu/DWj1DzmfXIhr5vzLOUU3pbHalQmDWeL0zp6GE05k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ok49/o1RxybK1Gf9HtpEWs5jZqwT+IeY7Ro6ifPwME+bhnsl5FHeJVkOSBQFuUi+2
	 GhpmKK4T1B7/uq8SPaz2wRd/wnTli407o8gDSGtEp+atNMplQlqSJi5WeinYpCEknZ
	 BtfDkEcFrVqZxJi3QpccW/PYtQ/6yecRa6Ntp7dY=
Date: Tue, 22 Oct 2024 18:05:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 0/4] Sub-device configuration models
Message-ID: <mye7inyopwlumstqhycuyk2iuldlsp5axlndyjyxy3j4zqonym@rtfz7ap2e66s>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <87ed497bcs.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ed497bcs.fsf@gmail.com>

Hi Mikhail

On Mon, Oct 21, 2024 at 05:29:33PM +0300, Mikhail Rudenko wrote:
>
> Hi, Sakari!
>
> On 2024-10-11 at 10:55 +03, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> > Hello everyone,
> >
> > I've been recently working (with others) on sub-device streams support as
> > well as on internal pads. The two can be used to make sub-device
> > configuration more versatile.
> >
> > At the same time, the added interfaces are much more useful if we require
> > specific semantics of those interfaces, so that the user space knows
> > exactly what e.g. a given selection target signifies. However, as the same
> > selection rectangle could be used for a different purpose on a non-raw
> > sensor device, we need a way to tell how should the user space determine
> > how to use a given interface.
> >
> > I'm proposing to solve this problem by introducing sub-device
> > configuration models, and by the common raw sensor model, also present in
> > this patchset, in particular.
> >
> > This has been (and will, for some time, continue to be) the reason why I
> > have reviewed few sensor driver related patches lately. As we're
> > introducing a new interface, it's beneficial to be able to use that
> > interface right from the start, rather than trying to later on offer
> > compatibility support, which is almost always a fair amount of work with
> > less than desirable results in the driver.
> >
> > With this solved, I believe we can enable the use of the streams UAPI.
> >
> > Comments are welcome.
> >
> > The compiled documentation can be found in
> > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/meta-format/output/userspace-api/media/v4l/dev-subdev.html#sub-device-configuration-models>
> > and the patches here
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>, i.e.
> > they're on top of the metadata set.
>
> I've read the updated documentation you shared, and have a question
> concerning binning configuration. IIUC binning should be configured via
> set_selection(V4L2_SEL_TGT_COMPOSE). But I also see some existing

set_selection(V4L2_SEL_TGT_COMPOSE) on the internal image pad, stream
#0

> drivers configure binning via set_fmt() (imx296) or both set_fmt() and
> set_selection(V4L2_SEL_TGT_COMPOSE) (imx274). What will be the right way

Existing drivers have adopted creative solutions to allow control of
the binning factor but all of them are somewhat non-compliant with the
specs (we went in great lenght in looking at these in the media summit
2 years ago). We didn't have internal pads at the time.

> to add binning support to a driver I care about (ov4689), which
> presently does not implement any binning configuration at all?

Now that you can use internal pads, I would follow what is described
in patch 3/4 of this series.

Thanks
  j

>
> --
> Best regards,
> Mikhail
>

