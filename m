Return-Path: <linux-media+bounces-23070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110769EB5AC
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0528B161F63
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3191B86D5;
	Tue, 10 Dec 2024 16:09:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F8623DEA7
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733846973; cv=none; b=biSPMoOnv4/hQa6Xe1vBz7GlwI56Uw5B9Uke2neDJxcLtyvzmCR+GEqLQtrEsuRDClmtDXCrV2Eu4WNv5vnsDNavn2OyV3VQkGYhVdfELkzTDhooWPHPuri6tIyxeM6Samczs/rAj35+fP1ikWoh9rQ1CGNhXkJsfblSA0sYmVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733846973; c=relaxed/simple;
	bh=CuQH7jaVHL4FD3REqtMp9p7zlcq7a70MKLFcHKccaX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItFvTNcuJ2yAEB56A1M8xyYmw+wfgOy6UgXmTLlbQN3U4KRmaW42LbJi6ZQPZSNCoSdAZHighZRZNBSudkgRtGYjEfOPUpyROvEH+YH0pvOqQQ+TR1Z7+Zjvnko5CY5uVDSipenxzE0HbBNx+VFN/QrVyAaikqXsx9TuJxwzgOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1tL2nf-0001Ie-Ib; Tue, 10 Dec 2024 17:09:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tL2ne-002iRi-1U;
	Tue, 10 Dec 2024 17:09:27 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tL2nf-008Za7-0S;
	Tue, 10 Dec 2024 17:09:27 +0100
Date: Tue, 10 Dec 2024 17:09:27 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: PN888 <pierluigimichetti1@gmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: Allegro Video IP VCU Info
Message-ID: <Z1hnt1N7EEKf-mh5@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	PN888 <pierluigimichetti1@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <CAGmoHRj5gz8Wajsjy73XriLysToBR1sNZX+a+-ygrVEWw9ZgjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGmoHRj5gz8Wajsjy73XriLysToBR1sNZX+a+-ygrVEWw9ZgjQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Pierluigi,

On Tue, 10 Dec 2024 12:14:03 +0100, PN888 wrote:
> it is possible to find also any example of utilization of the the
> driver and how to initialize hardware and encode something for the
> hardware in the object?

Im not sure what you mean by example how to use the driver.

The driver is a V4L2 stateful encoder driver that follows the specified
stateful encoder uAPI [0]. For example, it can be used with the
v4l2videoenc element (the element will be called v4l2h264enc for the
h.264 encoder) of the video4linux2 Plugin from gst-plugins-good.

The other part is the bringup of the driver on your board. For that, you
need to prepare and load an FPGA bitstream that contains support for the
video encoder. (Or you may use a demo bitstream that has been published
with the official releases.) You further have to describe the encoder IP
core using the device tree binding [1]. This description really depends
on the configuration of your bitstream. The binding documentation
contains an example which may work with the demo bitstream. Finally you
have to put the (proprietary) encoder firmware [2] into the firmware
directory to allow the driver to find it and load it to the controller
of the encoder.

I agree that this is quite a complex setup, but that's caused by the
dependency on the bitstream and the firmware, which I unfortunately
cannot provide.

> 
> It is possible to find documentation or notes where you have
> documented registers and operation of this hardware? A lot of things
> are poorly or not at all documented on official documentation.

There are the register definitions in the driver [3], which are pretty
much all registers that I know of.

The more interesting and complex part is the mailbox interface to the
firmware. The mails for that interface are encoded and decoded by the
driver [4], but the mail format is not documented and may differ between
firmware versions.

Do you have specific questions regarding the operation of the encoder or
something that is not working for you?

Michael

[0] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/allegro,al5e.yaml
[2] https://github.com/Xilinx/vcu-firmware/tree/master/1.0.0/lib/firmware
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/allegro-dvt/allegro-core.c#n55
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/allegro-dvt/allegro-mail.c

