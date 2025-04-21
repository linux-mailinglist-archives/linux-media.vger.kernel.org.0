Return-Path: <linux-media+bounces-30608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B1A950F0
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C0E16F10B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 12:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6F126159E;
	Mon, 21 Apr 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="tPYfa4Wb"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC3126BFF
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238704; cv=none; b=vDnpbt480gWpoh3zWvvC1HgFfzDUsAhZm3ENgYuDVW+x+UekLVc741IWb+ZZN0CxpNLPAd/wJPCgrUgBIUrwXXLj3+rSnubLHCxb8X4zqU1omfyfV3k7F2vtXg+B8MO4qokLoy7WHKJ6IOVfOIVi0iL/nhrrl4pSOrei/CFVvV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238704; c=relaxed/simple;
	bh=nl3+4vU7nmPSY/jb1nFpU3wayOFvmBeV7O/Sz/P5Ovg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=GlxRS7pPWuKulft/994eBBfe9G4WdkCzQN03QZnZCLjaLKhsYIf1cK+JLng/i6nSRbDzP2qjjhFltb9rgfzmeYhtK0LXFPkeVuz58f0hLU+qD6dWkCfT9DMFTCeontYCO7oXhT+TR9j+OTjja05MZ0+Ll3GE6/Yl946eypmS0Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=tPYfa4Wb; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4Zh4Vb6NBwz15sj;
	Mon, 21 Apr 2025 12:31:35 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4Zh4Vb0by3z4y;
	Mon, 21 Apr 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=tPYfa4Wb;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745238695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=FNAlO4VpQjdzC62snDj6JtVTltdXANTy019KwKbOx10=;
	b=tPYfa4WbbV/ecSnUSqZifenWtxKRHioDqd0wUZ+IhQNyuDjtxuXakPCTGOpatlac5yJpa5
	zfukuXtiUmsWmmNs/+k2aYdgyz5pWu1FzFo2wLkjwX0DKqPZUcWNcL4XXqZqyh6sPrq+nI
	KCMDX1lRkSzpty8CQfLMPuAsyFC9p00UUVQTthe3mEsy/tQS4xayU/SSVByKqpc8UwO6RZ
	FOQWzg9xerxUBPuo1/duqa2IA8GiKcrv6yaRmMYF5DdVzP6NH56OT5kYg0smD1g/t85ePi
	6efTmjPZMshInhDvGOuX9LgmxnEK5fauW0kVgJJC5Zoy9ZBxUbFSjM+jiEkfVg==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=68063aa7 a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=8s3bVdB6AAAA:8 a=smFrE9sGAAAA:8 a=VwnfekaSAAAA:8 a=xOd6jRPJAAAA:8 a=WN6_cwnCAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8 a=cm27Pg_UAAAA:8 a=sozttTNsAAAA:8 a=dML_XACEAAAA:8 a=mK_AVkanAAAA:8 a=PssDBZGIAAAA:8 a=8AirrxEcAAAA:8 a=drqXWh_Su-kwka9N9REA:9 a=QEXdDO2ut3YA:10 a=mX_46NTfp5VFrLZRzBmZ:22 a=F_EvON2TorMte8AU-hMi:22 a=eAomlcYGng2R2mZ923rV:22 a=ndfOWLLM0rR49n6Yv1rF:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=D0XLA9XvdZm18NrgonBM:22 a=L0fzO-P85HkJbeZJe4ir:22 a=3gWm3jAn84ENXaBijsEo:22 a=HJRSn2hXXqGixlvEXVkw:22 a=ST-jHhOKWsTCqRlWije3:22
X-CM-Envelope: MS4xfGPOuwILOJLL4jmFOiYxA3tDqH2nj3NyTyL/N+AZJa+axFB0g7zMvdy6vxBc4+AhvwlElpGw/LVDbKjEQSFT+RqJgcrATO+E0mDFOQ00r2127E+xxU7x zLYSUfg8vWGzQesNDM9lZJ0vPCVcZLJ7ZTFFPJNEQG8E+UZbryaM8d3+6hvIRTasqitjsuo0JctNGxLAe9vw94QP1ZyuPqMD8C5DSry4g5V2tAgznycqaRIy G14E/7KIPVv5TwuXxdfRXjGg0EV/WHVontockcD3l+veJn19gvAdgTIivkPDuwbHYn0OJKQtHv6bLBcJcI80k8WIg4KvBhxTxhnvxmhGd+/NKP6ld5ZyDFkg 6K2nc5aVMG/7XvG+FhA5/61g1w4AQAHOAlaZcgCN6z+fyRoES2y/tT+ikWQDhT00srekC6QHfgwjLHFpW+XlSaD1mKpeAoX7NDtl0tZFNrIpPpqb0ESNXvMO JBqvQwdIWNQmYPnry1cDWbmK2dzLvdJ2K6rAoun5L4li5WO1g/BmRL7/3iivSFHxcx0PWDDRZ0OvJIyGkvAULVQ0vFZrlo9H0MY6Yr3TCsa9JrTAvDro9TtZ Aro9qsgVpBdsKGXxmLUwlxbKHLegDssBu8vywVwDkmz3JrsgkTHJeJbzBP0PTiMJLPs6Kqewwvl4XGku4Z23iyCdkrgK2S9AbA1GVaJ7feLjATbBHb7/Urt7 VU3racNvwvgqnaz/an9qv2LYh9lqw+BsnFn0Itf6MWvsoHyLUwn5fH2uii746honzSZhEOy8A+OI9YL+KbgDaFRQs7DbNSHDch25gPGfFCx1m2wat5mba9xD 4ryDGp7JY4zP0Q2vWMlNA1XI0OPrIilyzYcxK23osos8dZdJqjVyPFZRQ3iMEag1BPAUl1b6KaNA7oPPZhO2AMer85Z6xsmWnN/RRP70yWpKwAyxZfAAlPEU 2VpMZYLKWShj3Aj
 1pFJNJVodLihqOuiylS8LUXr4q87Ioe19EfBC5Ey1F7S2OQVBYSsNxnxVg1yedpnLvo4PldfsU/7wpPVV25Xqt2m+sWq1rgC774m4Dl0a juSmiy7I17CHH6nxir7AWRJL6ERinYGtiOVK/0JgjVtcZUdTWi/JOO+P5rQv1bQY9Ko/Y7s/HydC0vhI4d4e2+1LJ2r9cmWQbKm/Fp648XLvaCcXWd3XAKG1 Z2JlTzZiqzUPdrLzm896WQSD5JBwVHubb2DFmuToqWlWIsKKExDZs60cTOJkHptqDnFlr4f44ux+vH4Vag3eK7KqEqP4Q0WrzH/MHiWVQBR5ircvG7N8koU9 pl6Sy/zc
Message-ID: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
Date: Mon, 21 Apr 2025 14:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: [ANN] Media Summit May 13th: Draft Agenda (v2)
To: Linux Media Mailing List <linux-media@vger.kernel.org>
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
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede
 <hdegoede@redhat.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi all,

Here is my v2 of the draft agenda for the media summit. The only changes
are dropping Sebastian's email and fixing Devarsh' email.

As always, this draft agenda is subject to change and all times are guesstimates!

Please note that I am transitioning from my old hverkuil@xs4all.nl email to
my new hans@jjverkuil.nl email. If you have problems replying to that new email,
please let me know and just send it to the old email (that won't go away).

The Media Summit will be held Tuesday May 13th to coincide with
the Embedded Recipes Conference in Nice, France:

https://embedded-recipes.org/2025/

Note that there are also some workshops held after this conference:

https://embedded-recipes.org/2025/workshops/

And a gStreamer hackfest:

https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366

The Media Summit will be held at Hotel Campanile:

https://nice-aeroport.campanile.com/en-us/

It is close to the Airport and to the Embedded Recipes venue.

The meeting room can hold up to 30 people and has video conferencing support; it is
sponsored by Collabora and Cisco Systems Norway.

We currently have the following confirmed in-person attendees:

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
Hans de Goede <hdegoede@redhat.com> (RedHat)
Paul Kocialkowski <paulk@sys-base.io> (sys-base)
Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Maxime Ripard <mripard@redhat.com> (RedHat)
Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)

As you can see, there is enough room for more people, so don't hesitate to
register by sending an email to me. The deadline is May 2nd.

And the following remote participants:

Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)

Note: information on how to connect remotely will come later.

If any information above is incorrect, or if I missed someone, then please let me know asap.

Draft Agenda:

9:00-9:30: Get settled :-)

9:30-9:40: Hans Verkuil: Quick introduction

9:40-10:30: Jai Luthra: Per-stream V4L2 controls

10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI

11:15-11:30: break

11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs

12:15-13:30: lunch TBD

13:30-14:00: Laurent Pinchart: Review of the status of staging drivers

14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers

15:00-17:00: TDB

Please reply with corrections, questions, etc. to this email. I'll update the agenda
over time. Again, these times are very preliminary.

Also, as you can see we are light on topics, so don't hesitate to add more.

Part of the reason for this is that we switched to co-locating from the ELCE to the
Embedded Recipes conference, so it is only 8 months since the previous Media Summit.

Regards,

	Hans


