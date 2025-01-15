Return-Path: <linux-media+bounces-24784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D149AA12577
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EABD0165343
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68CB24A7F8;
	Wed, 15 Jan 2025 13:53:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B524A7D0
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736949202; cv=none; b=QgpptA11nWgCyZiKQvHOrquQPdulVXGZ84I4pFSRoUOK2S7Di9QV3d4cxBFfUgofuyps4DKvihXj7tSoSWU2BNnowDdHY0HpUhEFhDIXzwUD6OZ4yY/lisZqVBnP0978eH/IV3haOL89A9tqmSn0eouSUKa4OIAqSs8vR1HroYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736949202; c=relaxed/simple;
	bh=WzSwlN3MjlaCNmpg0tY9S6pYb4u/EAkI/61ND5+Mf28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myNN5Rgki7B1cxmG+XJg+kwES2cFV17u6aQUkZ6zyZ2QsUqyTdyc93fX39MVcTKNwlichXRYK5RgGbEk+K7pWVAz/eCVdeYalVTf/YHk7Mez5A020+7XITa/NcemlDbdBJtoY1Mz4940YO4saCJiNqj35cw9hXSPYmlCHXbEPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1tY3pS-0007Wo-Mb; Wed, 15 Jan 2025 14:53:06 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tY3pQ-0005hD-2y;
	Wed, 15 Jan 2025 14:53:04 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tY3pQ-00BpEM-2b;
	Wed, 15 Jan 2025 14:53:04 +0100
Date: Wed, 15 Jan 2025 14:53:04 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com,
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com,
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com,
	paulk@sys-base.io,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Gustavo Padovan <gus@collabora.com>,
	Marco Felsch <m.felsch@pengutronix.de>, kernel@pengutronix.de
Subject: Re: Hantro H1 Encoding Upstreaming
Message-ID: <Z4e9wNxZjvnytXlL@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <dwlsalmeida@gmail.com>,
	Adam Ford <aford173@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	andrzejtp2010@gmail.com, Frank Li <frank.li@nxp.com>,
	ming.qian@oss.nxp.com, linux-media <linux-media@vger.kernel.org>,
	linux-imx@nxmp.com, paulk@sys-base.io,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Gustavo Padovan <gus@collabora.com>,
	Marco Felsch <m.felsch@pengutronix.de>, kernel@pengutronix.de
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Nicolas,

On Tue, 14 Jan 2025 11:16:47 -0500, Nicolas Dufresne wrote:
> despite Andrzej having left the community, we are not giving up on the encoder
> work. In 2025, we aim at working more seriously on the V4L2 spec, as just
> writing driver won't cut it. Each class of codecs needs a general workflow spec
> similar to what we have already for stateful encoder/decoder and stateless
> decoder.
> 
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateless-decoder.html
> 
> It is on top of this, that for each codec we have to add controls (mostly
> compound) specifics and details that suites stateless accelerators.
> 
> From a community stand point, the most important focus is to write and agree on
> spec and controls. Once we have that, vendors will be able to slowly move away
> from their custom solution, and compete on actual hardware rather then
> integration.
> 
> It is also time to start looking toward the future, since Hantro H1 is very
> limited and ancient encoder. On same brand, if someone could work on VC8000E
> shipped on IMX8M Plus, or Rockchip codecs, that will certainly help progress.

Marco Felsch and I recently started to work on stateless encoders, too.
Marco is working on a driver for VC8000E and I am working on a driver
for the Rockchip VEPU580. As user space, we are currently using the
GStreamer element from the draft merge request [0] on both drivers.

Michael

[0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5676

> We
> can also get inspiration from many other stateless encoding APIs now, notably
> VA, DXVA and Vulkan Video.
> 
> Of course, folks likes to know when this will happen, stateless decoders took 5
> years from start to the first codec being merged, hopefully we don't beat that
> record. I personally aim for producing work during the summer, and mostly focus
> on the spec. Its obvious for me that testing on H1 with a GStreamer
> implementation is the most productive, though I have strong interest in having
> an ecosystem of drivers. A second userspace implementation, perhaps ffmpeg ?,
> could also be useful.
> 
> If you'd like to take a bite, this is a good thread to discuss forward. Until
> the summer, I planned to reach to Paul, who made this great presentation [1] at
> FOSDEM last year and start moving the RFC into using these ideas. One of the
> biggest discussion is rate control, it is clear to me that modern HW integrated
> RC offloading, though some HW specific knobs or even firmware offloading, and
> this is what Paul has been putting some thought into.
> 
> If decoders have progressed so much in quality in the last few years, it is
> mostly before we have better ways to test them. It is also needed to start
> thinking how do we want to test our encoders. The stateful scene is not all
> green, with a very organic groth and difficult to unify set of encoders. And we
> have no metric of how good or bad they are either.

