Return-Path: <linux-media+bounces-3751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8482F00D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 14:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21F1A1C234BD
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 13:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FDB1BDD8;
	Tue, 16 Jan 2024 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="T/QEUXR+"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9A1BDC8
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TDr9w1jx2z49Q0K;
	Tue, 16 Jan 2024 15:55:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1705413316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wVYY+Kw2SBLSRGaTFONsIlMM0JkD6ChioyDK8+oQQww=;
	b=T/QEUXR+yh/ftd7pq/6hTayvWOwaaJ98/xGvobNlphM88LVtT8vZwgcTIF7MGa0vCi6iHG
	bC25HH3NyYklKPqqPhrId6PU7km82MJiVD0CpEJmYUTT1ba+BdG2q5+XwJWqXDSA0ZRMNH
	OuGmA4iUyPDNhd4UCckacehnxywnB5r3NnJfuaBicwLOYg5xVv+q1cfjtfVYLAtz1F6aIu
	Qa3HIzxJ4ebCdS+aJtfO5hm1SswSsxhwuK3leg6orOB5GRtkAuCBMYpoV2JmYXprO/XhYP
	aBbJ0rbbKTEMLwKIsYpvgFGAqAhxqYNWIwaNpx5zgyJOSd6W8Olgyhh/PphsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1705413316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wVYY+Kw2SBLSRGaTFONsIlMM0JkD6ChioyDK8+oQQww=;
	b=K9TwgPeKO/WY5MzXsluNtXvACSHD6CLNOP31kmmx3dLQpYjiegpnntJM0y4nSPbHFucIsM
	451Ympw3sozcb37kcRApt4RRep3/CV4fokqRknliHiEEWssHZrKqzVWK5GDF1tGYHp+NJz
	PX7cV9TQyYSoBp9RzQnR6qjxvjjfnobnqVjQjYo9dJgITHv00iHXDsD6kjHwL5ISFh0qbg
	32zfZsp5YQp2Y6GhoFf2+PJcneNDefyl5wII4Vm+zZI0MGfSw8y6JhnLS9eho6r3oxun9B
	vNUUlUo/Ct1CYvwYcLJbcQywXGJ65s7efIM7Ma4jPelJMw0U03oHP+ywCE4aag==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1705413316; a=rsa-sha256;
	cv=none;
	b=maEZX8ZlXZwSLKtTZeCKVLBEUYsQa5Se7/Y8UlpltTJ4q3uBnNaUDOZgu1CjQ7LemRPQ2Z
	2qp068hvj3kpuU6Ajz3wtQzl7vnrW9R5ahsBuOw6cC6JUvRQQwmLeKIoVOgkd0mYBFgqCx
	7nRnV+JzKmBcp0HAPtOckK0o1mld8ZVzkF7gq5zDomwU/o3/MpFuTxLbKtTRmO6DaVgT+I
	zlFHHXgHRYM4qxxP2XYOCEn/vvjRdh6e3CYKMVGdLwfUs/BW2BGH3hGQiS5Esagb/B0H5I
	latJkGwmoqxO9Mrfeud7T1ed02d/f570mxLjE6L4D9GwLx5OBG7RKK53VIw4PA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D2269634C93;
	Tue, 16 Jan 2024 15:55:15 +0200 (EET)
Date: Tue, 16 Jan 2024 13:55:15 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH v2 1/7] media: mc: Add local pad to pipeline regardless
 of the link state
Message-ID: <ZaaKw7j8anl9Q_48@valkosipuli.retiisi.eu>
References: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
 <20240116084240.14228-2-laurent.pinchart@ideasonboard.com>
 <ZaZoIXiM0XGDchIo@valkosipuli.retiisi.eu>
 <20240116133516.GA7325@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116133516.GA7325@pendragon.ideasonboard.com>

On Tue, Jan 16, 2024 at 03:35:16PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Jan 16, 2024 at 11:27:29AM +0000, Sakari Ailus wrote:
> > On Tue, Jan 16, 2024 at 10:42:34AM +0200, Laurent Pinchart wrote:
> > > When building pipelines by following links, the
> > > media_pipeline_explore_next_link() function only traverses enabled
> > > links. The remote pad of a disabled link is not added to the pipeline,
> > > and neither is the local pad. While the former is correct as disabled
> > > links should not be followed, not adding the local pad breaks processing
> > > of the MEDIA_PAD_FL_MUST_CONNECT flag.
> > > 
> > > The MEDIA_PAD_FL_MUST_CONNECT flag is checked in the
> > > __media_pipeline_start() function that iterates over all pads after
> > > populating the pipeline. If the pad is not present, the check gets
> > > skipped, rendering it useless.
> > > 
> > > Fix this by adding the local pad of all links regardless of their state,
> > > only skipping the remote pad for disabled links.
> > > 
> > > Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
> > > Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> > > Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > > Closes: https://lore.kernel.org/linux-media/7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Could you add Cc: stable when sending the PR? This should be applied to 6.1
> > and later.
> 
> I'll do so, far all patches in the series.

Thanks!

-- 
Sakari Ailus

