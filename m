Return-Path: <linux-media+bounces-39805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A0B24889
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC753A5EB9
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E97B2F6576;
	Wed, 13 Aug 2025 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EbSOa6iC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4926E140
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084982; cv=none; b=UfUzSQ0gYem8c7ZCngzOBFGva7vdDcziTr8iSKkfFTw0peO/nOJBqQRMYQN1E8LOQFK7oJa63l/dgI3pcF3FIOZP4ctiGjP8Bxgf/ufroNb7AzXu3TrY9GCvajQg1Slkc68Ioea825GqpLCfe2R70rdeMzPa/6P2inYNR1SOnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084982; c=relaxed/simple;
	bh=IAoIGTFHlfBWvVN98Ly3Lrl7xNs+QETFaOkQXLsOlBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2abSn2U94/yzq2h4dJXDDz41eyZ976BJMLT7JEmxNFCXv6rftdxOStbaIF/RGqpK5UlPIy1V5iw4QzsJB3MV8Kg/n991T0xwSeatZf5k4fXDkMsJVo+oF++Te8Z6t6EZqU9npmhrQmf/O7y55Qx+zm9z7FpJ2mrfEpOAiPlPvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EbSOa6iC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA9AF2C5;
	Wed, 13 Aug 2025 13:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755084925;
	bh=IAoIGTFHlfBWvVN98Ly3Lrl7xNs+QETFaOkQXLsOlBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbSOa6iCrZhqGwQ45zEqYEmmLORGWAmcBfWHlflXpp0LpXf7iK9UHHOW2jZ0eo7HZ
	 Uj0T/qcLJuLszxY2i/td1o7dXVqwEy8NfYPyAjxRJfJFufnHqO34ou5GT/VU39IAU0
	 83Iydvmc1nbUs7zqzqxpiydMW+Ca/arEhDZycBd0=
Date: Wed, 13 Aug 2025 14:35:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
	mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
Message-ID: <20250813113558.GH6440@pendragon.ideasonboard.com>
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
 <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
 <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>

On Wed, Aug 13, 2025 at 01:31:34PM +0200, Maud Spierings wrote:
> On 8/13/25 13:23, Fabio Estevam wrote:
> > Hi Maud,
> > 
> > [Adding Tim]
> > 
> > On Wed, Aug 13, 2025 at 8:12 AM Maud Spierings wrote:
> > 
> >> My devicetree setup is practically identical to the one in
> >> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
> >> regulator gpio only)
> > 
> > You'll need to configure the camera pipeline using media-ctl commands.
> > 
> > Take a look at:
> > https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline
> 
> I have been messing around with that, but it still shouldn't panic right?

It shouldn't panic, no. That's a bug in the driver.

> It seems to be happen in:
> sd = media_entity_to_v4l2_subdev(pad->entity);
> 
> in mxc_isi_crossbar_xlate_streams()
> 
> Checking now if the pad variable is the issue
> 
> it seems media_pad_remote_pad_first() can return NULL which would cause 
> the issue there I think.

-- 
Regards,

Laurent Pinchart

