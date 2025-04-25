Return-Path: <linux-media+bounces-31061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E540A9C8BB
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF629C57CB
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2545F248861;
	Fri, 25 Apr 2025 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tTcp93Zs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E323644D;
	Fri, 25 Apr 2025 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583298; cv=none; b=iy99UBHw08yH594upIZc+tgx/h/QGmlMLoih8E9WnUGEKvkeb8BxUb3aZuAYNi0FtvRH6LPzWzFesmn0lCWH+sEnncYo2bVG1wwn1qjll7sO3Ui9E5WPikPC+TzSm4WOdd5XqN1hZE58KLfilp/1bttLV1tq5OlMmJ0udJZ41Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583298; c=relaxed/simple;
	bh=hXVxzv2BEfGt9maqV0Cdf0h/9YhMXC57kWNciCKGBKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbtXbvGKbKJNeuEhMf4HfTq5lo+8CGGCtBnxNVilEhiMk6LZ/ZN5kO7DLmTWO3I7vD8aqyhx7xWqGn/Cdowm1pzD93OrMMypvzs3xaSiCCf58lSey25li8INEUDrcb2312G5wBN1oCuym+/eE+UUWWCIE1B6jcca8obXmL5zQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tTcp93Zs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 183A082E;
	Fri, 25 Apr 2025 14:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745583292;
	bh=hXVxzv2BEfGt9maqV0Cdf0h/9YhMXC57kWNciCKGBKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTcp93ZsMQ43V6m58Oy1GpAMWsWYLaT26xS6LndaKoq+G3xqOv/onC3x+d8OHhAjR
	 15rX3unqAaRxUPiz06jtjFUqaZrMo04ZsXRNKdHrEmBBbOXgz3ZrZQKpuq+Dys/1Hp
	 TNGBZlScy5Aue88ppNVxollbOo9xb2gl8PXfrgNw=
Date: Fri, 25 Apr 2025 15:14:51 +0300
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
Message-ID: <20250425121451.GP18085@pendragon.ideasonboard.com>
References: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>

Hi Adam,

(CC'ing Frank Li)

On Thu, Apr 24, 2025 at 08:59:18PM -0500, Adam Ford wrote:
> NXP-
> 
> I am trying use Libcamera to capture video on an i.MX8M Nano.
> (Hopefully, this makes Laurent smile)
> 
> I noticed that it has a maximum capture of 1080 lines when I query it
> with Libcamera, but the same camera on the Mini can capture at higher
> rates.  The multimedia overview states it can handle 1 unprocessed
> camera stream at 4kp30 without scaling.  The Nano's Ref manual later
> states that each processing channel has one line buffer, and each line
> buffer can store up to 2048 pixels.  It continues to describe when
> processing higher resolution images like 4k, the line buffer from
> other channels can be combined.
> 
> Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
> explicitly goes into detail on how to capture up to 4k image
> resolution by combining channel 'n' with channel 'n+1' which implies
> there are at least two channels.
> 
> Section 13.4.5.1 states the registers are dedicated for each channel
> and spaced 64KB apart, but then the following table only shows the
> base address for one, and Table 2-6 shows the ISI size is 64KB.
> 
> The driver is currently written to only support 1 channel.  When
> reading through the driver, it appears to require one IRQ per channel,
> so I looked through the Nano's IRQ table (7-1), and found there are
> three:
> ISI Camera Channel 0 Interrupt - 16
> ISI Camera Channel 1 Interrupt - 42
> ISI Camera Channel 2 Interrupt - 43
> 
> I attempted to enable a second channel by modifying the .num_channels
> = 2 value in the driver, and I modified my device tree to assign a
> second IRQ (42), but when I query the pipeline with libcamera, it
> still doesn't show an available resolution ov 2592x1944 that is
> supported by the camera and work on the Mini without the ISI system.
> 
> Can someone tell me how many channels are actually available, and
> whether or not  4Kp30 video is really available on the Nano?

My understanding, based on the i.MX8MN reference manual, is that the ISI
has a single channel. The ISI features list (13.4.1.2) reports

• Supports up to 2K resolution at 30 or 60 fps (24bpp) on each channel.

If you look at the i.MX8MP reference manual, the same features list
reports

• Supports one source of 4K resolution at 30 fps (24bpp).
• Supports up to 2K resolution at 30 or 60 fps (24bpp) on each channel.

There's no mention of 4K in the i.MX8MN ISI features. I expect that the
documentation about 4K support by combining pixel buffers comes from the
generic ISI documentation, and is not applicable to the i.MX8MN.

-- 
Regards,

Laurent Pinchart

