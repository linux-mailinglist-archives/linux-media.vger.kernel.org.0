Return-Path: <linux-media+bounces-31068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13678A9CC83
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 17:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A34F9A508D
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 15:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74642741C3;
	Fri, 25 Apr 2025 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I17MMhgk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907212741B5;
	Fri, 25 Apr 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593922; cv=none; b=XiDxep2SyXqmFYFe05pmvAcuoMbRCbsXA9PIE0yMp0+GXBnRVMpkIPIzoq5JJ73erM54P1kNREb0N7x8Xl1LioTESEvXPiMSk/+SdKujHAu4xlTE6KQiJi4t7nnYRpkFAy6nbvScWWxBJx8b6uR3zu3zcs6lq2UURHBQk5LGXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593922; c=relaxed/simple;
	bh=KvTIdzuY3IPxomgHmuC86/3MdUg8rIwFGCx19KapkVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVUBJ2/+bdkr3CN3GLSZOfw/3dtVGnN+GImuYilxY49+bcBPyBQLFXywrthCSYdpWHcoT9NW6IUR1TzK5/IzOwM6LmUq+s5WkWBcc0kWYlU+u9riwAX9KRnJ9BbQPov5OWi2pTPptdKAqCZ8qAxUS+09foK6TKmx8TzsB+iSwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I17MMhgk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F5A4982;
	Fri, 25 Apr 2025 17:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745593910;
	bh=KvTIdzuY3IPxomgHmuC86/3MdUg8rIwFGCx19KapkVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I17MMhgkuyvJLdUB8hAdtg7r7XY7pZDOeojpNNyAJNjTY0nfeD3bab6ZUSae3IEuD
	 q1Zye01p62ZIhx5O+jOdIVrVtNLC7Y1Bpyze9yU8T2o3nL8Jn7+ebGUTDD00W/6pSB
	 USyoKn2XGKXwxppcbj66zZspY5R3qLtzkV9JLgnU=
Date: Fri, 25 Apr 2025 18:11:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: i.MX8M Nano ISI Channel Question
Message-ID: <20250425151150.GH24730@pendragon.ideasonboard.com>
References: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
 <20250425121451.GP18085@pendragon.ideasonboard.com>
 <CAHCN7xL=vgZO7TW5uZr+OBPX1EKcw2zQhYwjRokTUOHpVq_Wbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xL=vgZO7TW5uZr+OBPX1EKcw2zQhYwjRokTUOHpVq_Wbw@mail.gmail.com>

Hi Adam,

On Fri, Apr 25, 2025 at 07:36:52AM -0500, Adam Ford wrote:
> On Fri, Apr 25, 2025 at 7:14 AM Laurent Pinchart wrote:
> > On Thu, Apr 24, 2025 at 08:59:18PM -0500, Adam Ford wrote:
> > > NXP-
> > >
> > > I am trying use Libcamera to capture video on an i.MX8M Nano.
> > > (Hopefully, this makes Laurent smile)
> > >
> > > I noticed that it has a maximum capture of 1080 lines when I query it
> > > with Libcamera, but the same camera on the Mini can capture at higher
> > > rates.  The multimedia overview states it can handle 1 unprocessed
> > > camera stream at 4kp30 without scaling.  The Nano's Ref manual later
> > > states that each processing channel has one line buffer, and each line
> > > buffer can store up to 2048 pixels.  It continues to describe when
> > > processing higher resolution images like 4k, the line buffer from
> > > other channels can be combined.
> > >
> > > Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
> > > explicitly goes into detail on how to capture up to 4k image
> > > resolution by combining channel 'n' with channel 'n+1' which implies
> > > there are at least two channels.
> > >
> > > Section 13.4.5.1 states the registers are dedicated for each channel
> > > and spaced 64KB apart, but then the following table only shows the
> > > base address for one, and Table 2-6 shows the ISI size is 64KB.
> > >
> > > The driver is currently written to only support 1 channel.  When
> > > reading through the driver, it appears to require one IRQ per channel,
> > > so I looked through the Nano's IRQ table (7-1), and found there are
> > > three:
> > > ISI Camera Channel 0 Interrupt - 16
> > > ISI Camera Channel 1 Interrupt - 42
> > > ISI Camera Channel 2 Interrupt - 43
> > >
> > > I attempted to enable a second channel by modifying the .num_channels
> > > = 2 value in the driver, and I modified my device tree to assign a
> > > second IRQ (42), but when I query the pipeline with libcamera, it
> > > still doesn't show an available resolution ov 2592x1944 that is
> > > supported by the camera and work on the Mini without the ISI system.
> > >
> > > Can someone tell me how many channels are actually available, and
> > > whether or not  4Kp30 video is really available on the Nano?
> >
> > My understanding, based on the i.MX8MN reference manual, is that the ISI
> > has a single channel. The ISI features list (13.4.1.2) reports
> >
> > • Supports up to 2K resolution at 30 or 60 fps (24bpp) on each channel.
> 
> I saw that which is why I was really confused when they listed 4K in
> other section.
> 
> > If you look at the i.MX8MP reference manual, the same features list
> > reports
> >
> > • Supports one source of 4K resolution at 30 fps (24bpp).
> > • Supports up to 2K resolution at 30 or 60 fps (24bpp) on each channel.
> 
> I didn't look there, but that makes sense.
> 
> > There's no mention of 4K in the i.MX8MN ISI features. I expect that the
> > documentation about 4K support by combining pixel buffers comes from the
> > generic ISI documentation, and is not applicable to the i.MX8MN.
> 
> I suspect you're right, but the documentation is very confusing. If
> that's true, maybe Frank can get the NXP people to remove the
> references to the 4K capture from future documents.
> 
> Any idea is the CSI on Nano is really capable of 4-channel virtual
> channels as listed in section "13.5.1.2 Features" because I believe
> it's the same, or similar CSI as what is in 8M Plus and Mini, and I
> don't think those are capable of virtual channels.

That part isn't entirely clear to me. The integration of the CSI-2
receiver in various i.MX8 SoCs is not well documented, so we rely on
lots of guesswork.

-- 
Regards,

Laurent Pinchart

