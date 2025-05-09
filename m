Return-Path: <linux-media+bounces-32135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFDAB15D3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C8563B4A31
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 13:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB562AC17;
	Fri,  9 May 2025 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="okIT88Xj"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4312918CF
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 13:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798545; cv=none; b=aB089Pzn0kD/V2zV1IvesgTkI5glgLqosVZQDB4mAw3fvw80/xCxf8cUiTKXofdGkKGhDB4LTQrrfKfntbj6n4R3j2NhEt0sWpZXfMxN+SZ4xqfUR2FwWqlJZgTFvqyTY8u0ejSvu18UXw0sU2o1TuYwXXo6aa/2LCCksgs6SrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798545; c=relaxed/simple;
	bh=r/t3OxQDMuEkA7zfsiZO0/CDV2LeOCuWYr/yI9Is9Hc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RkBzkg5sq2K7R9pPZYleESPcmA3EsDcJ2YgWHhMXlaYA5rihQQOqHPqTgbHDnp/2oFJOWZTDB+d2UZ2roPHHCDcA40bxu+WbmYZsKVvID90Wv0XbxtJakOx6W/ip/uFydQX/yvLRGtW+/DcInhBe0YK56Nk9O94Ompl7kNHalqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=okIT88Xj; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4Zv9Mb2cXzz1HwG;
	Fri,  9 May 2025 13:48:59 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4Zv9MZ10Mrz2xQ1;
	Fri,  9 May 2025 13:48:58 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=okIT88Xj;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1746798539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=BhjDGzhuIRo520CXx7gUogi7Vq7lnpTskUw+DV10Wp4=;
	b=okIT88Xj8DXpXs1g3ilEfnT6aH7b6WJlI8bY3DKDfTeRornfORvi1fEfYWNBaDgbPv9zo/
	2SRVrkxYovcjWet+DQm7p+1W4Ks1UfGqXB/KILkYjfRCKAghEws2EckptB0/rHdAG9r88x
	tixNnuq8ZcEEu6apCpikD1X2fSvo9IxwKocxiNyoYTu4MdJY/TsPRTlQzTv0xZMLm3To/7
	QGPKDBQ1evuCZ5TVJltwups1ZSeyxw/2TRDRGQNGW7hC6UMtKJig+uHGuYJWVJKZ/5eyiD
	Fgs4vkMd0boMIDZnScPQeA3EEomYUWHhWLM0LACqX8ZtaQPEjz4dMxTllcUnOA==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=681e07cb a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=8s3bVdB6AAAA:8 a=smFrE9sGAAAA:8 a=VwnfekaSAAAA:8 a=gRh77X2TAAAA:8 a=xOd6jRPJAAAA:8 a=WN6_cwnCAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8 a=8b9GpE9nAAAA:8 a=cm27Pg_UAAAA:8 a=RF00TdSWAAAA:8 a=sozttTNsAAAA:8 a=dML_XACEAAAA:8 a=PssDBZGIAAAA:8 a=mK_AVkanAAAA:8 a=8AirrxEcAAAA:8 a=N7ie1MMDyZOTvO5XP-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mX_46NTfp5VFrLZRzBmZ:22 a=F_EvON2TorMte8AU-hMi:22 a=eAomlcYGng2R2mZ923rV:22 a=cUli4m2IYk2iiwMI8fYa:22 a=ndfOWLLM0rR49n6Yv1rF:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=D0XLA9XvdZm18NrgonBM:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=_nx8FpPT0le-2JWwMI5O:22 a=L0fzO-P85HkJbeZJe4ir:22 a=HJRSn2hXXqGixlvEXVkw:22 a=3gWm3jAn84ENXaBijsEo:22 a=ST-jHhOKWsTCqRlWije3:22
X-CM-Envelope: MS4xfJqaqsSbTVSV5Kmk+mbdMwUqsHIUArfhlorf0o22vy6kmpXekhhRkYkmBbve5u/O8DWRoFMUvFECaITBur+irA20CQ6x73pltIhCnyWpWVIftgR0f9BX uxQFiAIDN1AsUmbnzEhXkHsQFqJwvn7FpIA2hHtMKQ8wdxpKuZsnui40WYEn9UCH3P/IOuNLz4DnYaICkB1Q5baps42GKy0GNcz5vahyRmT7SCXBaPdCaQp0 EK99GGsxvZM5lkV7Wgp/rqCOjDdAzRXSGvrijk0ytJ3xznuf7yaHrJrMaoK3Z0ox8VyqIHd1aIL69hSbbUVbBeUjz637/oa5jCmHSn9M1vL0lGPErc3wxtJi h84SURtW8398u0oNnuSKeeuIxISSMBkPGywe66RSot/2hUkGMUaV8yBkl+g+HqN8q3hNm3apt2IQw86b791roi4kRuCOyqlyYk1Pt8QBOHJiFaiMMei8ptHj JluCLE9M7OSwvlDyTPvEPJKp+UcDBfM/JKDM0K63XuGN+CpXzahJJLe+RJJCJbjS6YSz9ryFQ4eFmIqnHe+YFvn7DPwbSl3SjbtjkrKPOfDq5WhezBwYMCVu WnfzEIlsVwguuvYscd1AZwf8N9g22e6OYVqwn4j+uB7K5fAOM0nlx+4jSdaKQa5kOxJ9om87cdS3cIAPAD5CC/fxbAg8OJV0XGSYH8aqsuFhWUZPlS2RwI+d MH5Zm9yV1jaThDWBpown2VosXwaOpS6oPOej8bS1CeAtVpYaU09ERyu9EQ8y/+AdDOAjINCfJFfz8A0l8JUzrFTSSe2UiDPRC/Q3lE9MMQ073wEBfPrwrA3J SPicwihaBWWuvinbs9+qQUkdi0SuNFZlVy/bEFbYRh/d9KVXNeCLWFybTR7vmELNq+s2r53bgHEMHAwid1/UNtG9jCms9hqRu1CH4nBbgCrvBDfML9qiR/24 kodihb3R9CJUdvj
 KfWZycOJht9kr0Uua9TuVHj9kD+SVPWHVf6CzHKNiScMNBu6+FiYxL9xEoJzoS5WmH/OLP26YVLWRnhld0pw0wZU2BG6ddOwKXq3ctYSM hEiB8/yWdtG1o3ITgeKRhbqdZE1jxiSKd92eLTT6X+rrk75R7d0vLH9vMJ0WvhMMw2EqtJEcfo7MszOFfv+RNyJGOSmlEia+nEde4nqjCW/iVv0hY9wRPQWx rcf5uSrX3xRIeV79Bny/Hf9t9vV3C0Q/i98fKCsiMKeTBkrzTeqczQ0jKf1Z04C3
Message-ID: <bed7aead-2a88-4b80-b5d1-a2cb0d50bfe4@jjverkuil.nl>
Date: Fri, 9 May 2025 15:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: [ANN] Media Summit May 13th: Final Agenda (v5)
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 "Hu, Jerry W" <jerry.w.hu@intel.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede
 <hdegoede@redhat.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mattijs Korpershoek <mkorpershoek@redhat.com>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

Hi all,

Here is the final agenda for the media summit.

Changes since v4: added more attendees, added room information, added etherpad
link, updated information for remote participants, added note to avoid white-on-black
presentations.

We have 19 in-person attendees, which is a bit more than previous summits, even though
the time since the last summit is less than usual and we are co-located with a
different conference. It's good to know that those changes didn't impact the turn-out.

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

The Media Summit will be held in the meeting room NIKAIA at Hotel Campanile:

https://nice-aeroport.campanile.com/en-us/

It is close to the Airport and to the Embedded Recipes venue.

For those who make presentations: from what I can tell this room uses a projector.
From past experience I know projectors are often poor at showing presentations
with a dark background. Generally black-on-white gives the best results.

The meeting room is sponsored by Collabora and Cisco Systems Norway.
The lunch is sponsored by Ideas on Board. Many thanks to our sponsors
for making this Media Summit possible!

We have the following confirmed in-person attendees:

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Huawei)
Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
Hans de Goede <hdegoede@redhat.com> (Red Hat)
Stefan Klug <stefan.klug@ideasonboard.com> (Ideas on Board)
Paul Kocialkowski <paulk@sys-base.io> (sys-base)
Mattijs Korpershoek <mkorpershoek@redhat.com> (Red Hat)
Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Maxime Ripard <mripard@redhat.com> (Red Hat)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas on Board)
Hans Verkuil <hans@jjverkuil.nl> (Cisco Systems Norway)
Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)

And the following remote participants:

Nas Chung <nas.chung@chipsnmedia.com> (Chips 'n Media)
Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
Donadkar, Rishikesh <r-donadkar@ti.com> (Texas Instruments)
Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> (Intel)
Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)

The remote participants will receive a meeting invite during the weekend.

If any information above is incorrect, or if I missed someone, then please let me know asap.

Agenda:

Note: we'll use this etherpad: https://pad.systemli.org/p/media-summit-2025

9:00-9:30: Get settled :-)

9:30-9:40: Hans Verkuil: Quick introduction

9:40-10:25: Paul Kocialkowski: Stateless video encoding uAPI

10:25-11:15: Jai Luthra: Per-stream V4L2 controls

11:15-11:30: Break

11:30-12:15: Sakari Ailus: Identifying camera modules

12:15-13:30: Lunch at L'Azur Bistrot Niçois

13:30-14:00: Laurent Pinchart: Review of the status of staging drivers

14:00-14:50: Hans de Goede: Discuss V4L2 subdev API ambiguities

14:50-15:10: Jacopo Mondi: Unify the multi-context support with the m2m context handling

15:10-15:25: Break

15:25-15:50: Maxime Ripard: V4L2 & cgroups memory accounting

15:50-16:35: Ricardo Ribalda: Openness Framework for ISPs

16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers

17:30-18:00: Sakari Ailus: Tentative: keysigning party?

Please reply with corrections, questions, etc. to the agenda.

Regards,

	Hans


