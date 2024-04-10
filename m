Return-Path: <linux-media+bounces-8964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6C89EC37
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 09:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15C28284105
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 07:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108FB13D26E;
	Wed, 10 Apr 2024 07:36:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EB13C9D7
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712734571; cv=none; b=QagiSuXtJy75Y7864HNrL4vYVoDRVdSPYuLWC0AXTE41/QXzofXTColJ2aibppUFmeS5WazUkI+gC2JX4KEDBRd0MbTx/Eu07MwNKMUruEe50MBDhEoJvv68YR+Pir4LwWw4FtdjC0IgtqWaMmLiLZwpuUVzCtHw7PSP8hF15SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712734571; c=relaxed/simple;
	bh=UST1YTwQqCtdvxzfcnj77RjFiZ6DJzR8ArUGU9oai8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qi7OrVqlUYe1ldYSGgOZmudA7qdCRtPr2YfLRxdzmrKpF1F2Gsyw+JYXi0XJ7tmc+aT4JJrS4Xzp3+EL0+AV33B/6kmFl8NshLLgcNg0sXl41G2vbFPMEc3yx0toBRD3Hrx6hXwX0BjTvHCwbMXDstVYZqBSLa0Yd/aUEuLIRcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1ruSV6-0005Dz-FN; Wed, 10 Apr 2024 09:36:08 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1ruSV5-00BS1X-TS; Wed, 10 Apr 2024 09:36:07 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1ruSV5-0060tX-2f;
	Wed, 10 Apr 2024 09:36:07 +0200
Date: Wed, 10 Apr 2024 09:36:07 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: "BRES, Guillaume" <guillaume.bres@bertin.group>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"ORIOT DE LA CHAPELLE, DAVID" <david.oriot@bertin.group>,
	"DUMAS, Victor" <victor.dumas@bertin.group>
Subject: Re: Allegro/VCU on Zynq-MP 2023+
Message-ID: <ZhZBZ7aqU5VDMHXe@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	"BRES, Guillaume" <guillaume.bres@bertin.group>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"ORIOT DE LA CHAPELLE, DAVID" <david.oriot@bertin.group>,
	"DUMAS, Victor" <victor.dumas@bertin.group>
References: <MRZP264MB3098B2F903EC080C7EF37066E2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
 <ZhT3VVvzBCi2QkEo@pengutronix.de>
 <MRZP264MB3098098B02FB23660850D43EE2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
 <ZhVBgzksyirY-YGy@pengutronix.de>
 <MRZP264MB30982C0933D0AC0DDC8165B3E2062@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MRZP264MB30982C0933D0AC0DDC8165B3E2062@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Wed, 10 Apr 2024 06:46:09 +0000, BRES, Guillaume wrote: [...]
> I can confirm that your driver is probed successfully, and so is
> xlnx-vcu.  Unfortunately the /dev/allegroIP entry point is not
> created, therefore gstreamer has no means to operate this part.
>  
> Is your driver supposed to create a /dev/allegroIP entry point like
> the previous out-of-tree solution?  Would you have ideas what we
> might be missing (probably v4l related) that would cause the /dev
> entry not to appear, while everything seems sane at the kernel level ?

/dev/allegroIP is not a standard Linux API. The upstream driver creates
a V4L2 device node as /dev/videoX.

Therefore, you can't use the VCU control software or any of the related
GStreamer elements, but you should use a user space that handles V4L2
mem2mem devices. For example, you may use the v4l2videoenc elements
(they show up as v4l2h264enc/v4l2h265enc in the running system), which
are part of gst-plugins-good.

> 
> > This node doesn't follow the documented binding. There should be
> > only two clocks and no interrupt.
> 
> Is it clk/xlnx-vcu that we are talking about here? 

Yes, that's the related driver.

Michael

> > The driver is able to do h.264 and h.265 encoding with a few options
> > for quality and rate control. In contrast to the downstream driver,
> > it exposes a standard V4L2 video encoder interface to userspace.
> > Which features do you need? I'm very open to review and test patches
> > that add more features to improve and extend the upstream driver.
> 
> I'm not advanced enough to correctly answer that question at the
> moment.  All I can say, is our first goal is to compress SDI-HD/SDI3G
> standard formats, and our ultimate goal, once we master the VCU, would
> be to compress slightly off standard formats, Like a couple of lines
> or columns truncated. IMO this is feasible considering the VCU is said
> to work on multiple of 4 pixels, it is not particularly limited to
> standard formats.  I presume we will tweak gstreamer to do that. Yet
> we're not able to achieve step 1 and I personally have no clue how far
> we are from that
> 

