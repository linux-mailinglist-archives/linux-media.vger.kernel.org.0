Return-Path: <linux-media+bounces-58653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGRCLlq/3GliVwkAu9opvQ
	(envelope-from <linux-media+bounces-58653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:03:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDA3EA273
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC49304A59F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7D43B3C1A;
	Mon, 13 Apr 2026 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="MWLGWQVA"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F55A30E84B
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074277; cv=pass; b=tAIUtwKj7eA+8h3vFFNnwqFPdRI5hfvIMFrdmDRiXJqq3NBeRNpTAb8gvZBk5c5Fy0A+9o+S9gxeNUHP62SoIn3B6VQN7hbvGZFh4KSfy27yius+RMfcINqeO/8tx00ZBsYkxrs2JdfPr5FsYCxphaZoBku0MdKk1+ZKnjG2weo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074277; c=relaxed/simple;
	bh=OXLn8oEFcN0nmUcJ730NSLDOkzmOKE7Wwfm+z2CL4Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqbVVzpYi0C9iMNhrGI1witZE/16rWDOz8jJYUjKLc+V1985feeaNfLpGV+yBmODf9QYO9LxxPFE5aco9it0RxndK5UuCGU+/fFxCL+WCUhgxqzEA/IxaUEXluk5oAgfF6+GqHRhRfDmoEva3T3QnxeaFd68SOW+yOBYmxudo6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=MWLGWQVA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776074231; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dxC7k7Bk8dW+dEckDTJ74mynSFsKQ6Qs5f7vg7rwJIia3Xlrji4hF2/HVq5YhTF8603d0caDWvCie36w3ebDV79rKpaAxRXySUlo/BdAavvJLgOw5ImeIlce0HmF3fCMpqWb3Z6Rv//UcSxomOlrCIrWT3E6+Fa/lgXJqZYoXzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776074231; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V7HfWmu/QQFJuG0+gWcaDlp4XjYbGIF4U2eAmNKkCH0=; 
	b=B4ZsKYtcINP85WLaiGTPO4GOX61ksmKruKoRt+7w02tgt46WDCXoc+R1Utbua/WWEYi0/abYPyQTwWgg6tto1AFiaxyyCg6OCWSJKJZJ1FpWmolugmGgXNlOySPNwQDFbjT3oRYrt6kjDOBG1/Py9HMk+zMkpYpTQR59mXmzhwo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776074231;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V7HfWmu/QQFJuG0+gWcaDlp4XjYbGIF4U2eAmNKkCH0=;
	b=MWLGWQVAgbn229+P2V07pqI9xWhWbncGgJmsk6zU7xV4BDel+OhsEElfc4/VPzx4
	Mt+YVDD4giZGHHKKXum+4YEHhrLOZfHOr57Dj8TUdchK4klbcLnBHkgfnhun+m8hFaT
	G7i9ryxgkgXf82z52bABB9/z9mZ4ypdQMlZ7f2GI=
Received: by mx.zohomail.com with SMTPS id 177607422907093.38342824159827;
	Mon, 13 Apr 2026 02:57:09 -0700 (PDT)
Message-ID: <756a634a-9699-4118-90e1-4ce06844c369@collabora.com>
Date: Mon, 13 Apr 2026 11:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Brandon Brnich <b-brnich@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Devarsh Thakkar <devarsht@ti.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar"
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58653-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: E7DDA3EA273
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On 4/12/26 12:25, Hans Verkuil wrote:
> [...]
> Agenda (tentative):
> 
> 8:45-9:20: Arrive, settle in
> 
> 9:20-9:30: Short intro (Hans Verkuil)
> 
> 9:30-9:45: Status of ISP support in V4L2
> 	Presenter: Laurent Pinchart
> 	Description: Summary of ISP-related development in V4L2 since the last
> 	Linux Media Summit. This includes a brief overview of technical
> 	developments, and a summary of the efforts to engage with vendors.
> 
> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
> 	Presenter: Paul Kocialkowski
> 	Description: An update on the ongonig work to support stateless codecs in V4L2.
> 	Some of the remaining open topics will be presented and discussed.
> 
> 10:45-11:00: break
> 
> 11:00-11:30: Vulkan Video Codecs
> 	Presenter: Nicolas Dufresne
> 	Description: Vulkan video codecs: what are the viable options for Linux Media
> 	and what is in preparation outside of our subsystem. The second aspect is
> 	informative as these discussions don't seem to lean toward our subsystem as the
> 	foundation. But I think it's rather useful for everyone to understand why and
> 	what is included.
> 
> 11:30-12:00: Protected Video playback on i.MX8MQ
> 	Presenter: Rouven Czerwinski
> 	Description: Introduction to protected video playback
> 	on i.MX8MQ and missing bits for linux-media & protected heap interoperability.
> 
> 12:00-13:30: Lunch
> 
> 13:30-14:00: HDCP support for HDMI receivers
> 	Presenter: Hans Verkuil
> 	Description: I have been working on adding HDCP support for HDMI receivers.
> 	Specifically the HDCP negotiation between sources and sinks.
> 
> 14:00-14:30: AI patches
> 	Presenter: Sakari Ailus
> 	Description: What is our policy w.r.t. AI generated patches?
> 
> 14:30-15:00 Overview of Media CI: where do pipelines run?
> 	Presenter: Ricardo Ribalda
> 	Description: How are jobs in pipelines assigned? How does the infrastructure
> 	for Media CI work? Are there things that can be tweaked to make it more
> 	reliable?
> 
> 15:00-15:15: Break
> 
> 15:15-16:15: Discussion of the media subsystem development process
> 	Presenter: Hans Verkuil
> 	Description: Review of the multi-committer model: current status and next steps.
> 	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?
> 
> As you can see, there is still some available time for other topics.

If there is still a bit of time left, maybe we can reserve some 15-30
minutes for the following:

-------%<---snip--------------------------------------------------------

The Butterfly Effect or How Support for Complex Hardware may affect the uAPI

Video capture and camera hardware in recent SoCs is exceedingly complex
and the assumption that there is one central V4L2 driver that registers
the media device does not necessarily hold anymore. IMHO we need a
central media device to rule them all and adaptations to the
v4l2_{async,device}_register_subdev code. The discussion [0, 1] quickly
escalated:
 - Dynamic (de)registration of media entities is desired
 - This requires considerations about the uAPI
 - There is significant overlap with the notion of fault-tolerant V4L2
 - There is also a ton of cleanup work, but the resulting patches must
   not break anything existing
 - So we need to talk about possible migration strategies in order to
   achieve reasonable progress without interfering too much with
   existing and working parts

TL;DR: This short talk outlines the effects of upstreaming Rockchip
RK3588 video capture and camera support on the V4L2/MC uAPI and on the
(linux-media) universe as we know it today.

[0]
https://linuxtv.org/irc/oftc/irclogger_log/linux-media?date=2026-02-17,Tue&sel=72#l68
[1]
https://linuxtv.org/irc/oftc/irclogger_log/linux-media?date=2026-02-18,Wed&sel=14#l10

-------%<---snip--------------------------------------------------------

If desired, I'll try to find the time to describe the issue in more
detail on the list *before* everyone travels to Nice. Then, we can use
the time on site more effectively to discuss it.

Best regards,
Michael

