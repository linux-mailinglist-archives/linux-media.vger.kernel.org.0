Return-Path: <linux-media+bounces-39807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A31B248A5
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C05581735
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548272F7445;
	Wed, 13 Aug 2025 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O2Uo4TVE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5E2D0C96
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085335; cv=none; b=kLZzhnCwYbynJw7KQU2713RAHdDzhGUeGjWnxmcBq15iBFLymFvuyJrDBF2d8VZXqaAa54RjmMReMOo2982Do1N9+F50Lxb/FYkOzK++6J0HILp8sft7eDSTnYm0q/BOMu1ZRuRJB1BbPOCu/8aBqOfSs45jGFToba1XO7/wp6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085335; c=relaxed/simple;
	bh=hbKhzb8i98o8Lym7FHfVGkRRLk7R0XljA2+yKInqrpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIXhVcWiL7Ky6iTk+S06diHQyypD9UuLB3ShE9W2N2SYyOcpA1CRGtnQJ54siYxI9+3ARnCfKiKsXFCY/dDDF5XpSSiwCytu+OSD8KD56aWgUJIykZjL21MtGTFHd8yVE8WKPcWjUrBv7rI81jEhGwNPwCQF1gzLYFUln3WoWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O2Uo4TVE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E8CB72C5;
	Wed, 13 Aug 2025 13:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755085279;
	bh=hbKhzb8i98o8Lym7FHfVGkRRLk7R0XljA2+yKInqrpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2Uo4TVEY6Kh8kFB2R8lNFT3o8CynkU0zUuLKoSIt1OOsFg7plXHWEOXNHFVl1C4j
	 Pu6U9ake5Xl62u/qtJVDly31bcyRn7437HpvbXaSBQmwtbX0HK8fXADMVpJU3V4oTY
	 aDqjJ0K14HRXL5HQnGx4CljQNgvn9Jvpw5WDhGl8=
Date: Wed, 13 Aug 2025 14:41:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
	mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
Message-ID: <20250813114153.GA20174@pendragon.ideasonboard.com>
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
 <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
 <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>
 <20250813113558.GH6440@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813113558.GH6440@pendragon.ideasonboard.com>

On Wed, Aug 13, 2025 at 02:36:01PM +0300, Laurent Pinchart wrote:
> On Wed, Aug 13, 2025 at 01:31:34PM +0200, Maud Spierings wrote:
> > On 8/13/25 13:23, Fabio Estevam wrote:
> > > Hi Maud,
> > > 
> > > [Adding Tim]
> > > 
> > > On Wed, Aug 13, 2025 at 8:12 AM Maud Spierings wrote:
> > > 
> > >> My devicetree setup is practically identical to the one in
> > >> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
> > >> regulator gpio only)
> > > 
> > > You'll need to configure the camera pipeline using media-ctl commands.
> > > 
> > > Take a look at:
> > > https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline
> > 
> > I have been messing around with that, but it still shouldn't panic right?
> 
> It shouldn't panic, no. That's a bug in the driver.
> 
> > It seems to be happen in:
> > sd = media_entity_to_v4l2_subdev(pad->entity);
> > 
> > in mxc_isi_crossbar_xlate_streams()
> > 
> > Checking now if the pad variable is the issue
> > 
> > it seems media_pad_remote_pad_first() can return NULL which would cause 
> > the issue there I think.

Can you share the media graph as output by `media-ctl -p -d /dev/media0`
just before running ffmpeg ? You may need to replace media0 with the
device corresponding to the ISI if you have multiple media devices in
the system.

-- 
Regards,

Laurent Pinchart

