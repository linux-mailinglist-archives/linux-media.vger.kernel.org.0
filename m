Return-Path: <linux-media+bounces-14999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74421930BA4
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 22:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F02761F22669
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 20:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A540513D244;
	Sun, 14 Jul 2024 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="kVadHHB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E982B9A4
	for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720989377; cv=none; b=Qoa2XsHqvaioJ1F5PjAz8epZX0nHG7OcTpCU9mP/qadjdQyyyT+1oG/XkP1O4yn1BPhNgSog99z/a4LjmDQXk+V3zKT1r8RICxvEGnhTjIgRbMf22nZ8koV87AcKzMo2FbA1IO4slkCkiUNPBaxby2u5cOo03VIMiIUQsJI11vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720989377; c=relaxed/simple;
	bh=Zp5UXedqcjkdYkMtI6qJ6mmJqj45T0b3xtc5VJfWkOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8h5Pr3DXY96r4gL34CBivoTCZ1UCpScM0v29OokI7P/ldRSdYKqU/TmVdIbbH+GtTS7QZVdiEycfKK94Ail08e083acMg3pTuFrH+j3bNwn2pMxN1pWtL0GMNyThJi84QabcmuyuEuVZoZ3UwrFXuu6S/DDatsE3d1SOtfkNi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=kVadHHB4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 70F4E1F9C8;
	Sun, 14 Jul 2024 22:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1720989369;
	bh=HPIYDHn7qSLtx0KuNir022tsAbx0ku/rj5uItbFtVeY=;
	h=Received:From:To:Subject;
	b=kVadHHB45BUQHAwAsyy8OD+s6gENVDloFnnnEExNqW0o9Jzz4loZa+FmszS9wPTg2
	 d1C0yon5Wh84crtnrO4+Pi4a2TX6NPENNILcI7XBBX9J0+7nzDhdVFiV2XWCln6Pf3
	 4zvWLqVwRwjmdbbrfq4Ua+fi3XLLrlO0Ia6T2YDl2sVCGXJJ1hoeDUrgH8UbDumyZH
	 SBZu8N8d/01zyL0vM4T0feyZ+6Cx9Uea7yNgbVCbZmvrDZsTDMotpKEV2FxjsFcNjr
	 OsVeXRiLg4lHqVVx85hPKMV46Wz4cVXZ7DoY8cxsJ44EZG1qduroFG4obqsn7953WW
	 5bIHQRQnyhQwA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 0EEE67F9C5; Sun, 14 Jul 2024 22:36:09 +0200 (CEST)
Date: Sun, 14 Jul 2024 22:36:08 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] media: i2c: isl7998x: Implement get_mbus_config
Message-ID: <ZpQ2uET81UuSC4cJ@gaggiata.pivistrello.it>
References: <20240713154242.107903-1-marex@denx.de>
 <20240713154242.107903-3-marex@denx.de>
 <20240714143357.GA9013@francesco-nb>
 <30dd244f-3f9b-479f-af07-aa473fd11896@denx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30dd244f-3f9b-479f-af07-aa473fd11896@denx.de>

On Sun, Jul 14, 2024 at 05:37:10PM +0200, Marek Vasut wrote:
> On 7/14/24 4:33 PM, Francesco Dolcini wrote:
> > On Sat, Jul 13, 2024 at 05:41:56PM +0200, Marek Vasut wrote:
> > > This is used e.g. by imx6-mipi-csi2.c to determine the CSI2 lane count.
> > > Implement the callback in isl7998x driver so it can be used with i.MX6
> > > CSI2 receiver.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > 
> > We had a similar need and we did send a similar patch for ov5640 [1],
> > however it was rejected. I did not follow-up if anything changed that
> > makes this patch not required, or maybe I am misunderstanding all of it?
> > Any comment?
> 
> I am not sure what to make of that discussion, there was a lot of
> discussion, but no conclusion or hint how to move forward . So, what now?

That discusion was very confusing to me, but given I know little on the
topic I was hoping you could understand better than me ... 

BTW, I am not even sure this patch is about the same issue.

Francesco


