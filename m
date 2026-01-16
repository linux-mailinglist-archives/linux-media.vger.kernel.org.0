Return-Path: <linux-media+bounces-50899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 861AED31E0C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7A9130AC746
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FB4274FC1;
	Fri, 16 Jan 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDxka4fu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE525BF13
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570193; cv=none; b=AAlJwJiwsxv21rB7KcoZQiyfNZ13jMiSq/Qa6Fg3kGXMfKsygKnDgTIi+3xKJkDuU/Wv35X7cAYNqfcWLxbuuAJxKZTVgAX/lQivA1FQbU+upMtpMKM3Fteh8Ccd/h5bSZo50qKyw+AnF5eJVYFVu+n/59b7KMEG0KzsG54Rz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570193; c=relaxed/simple;
	bh=Ii34bnfNGZgLEL8OC3/10ci4kB1hRgTpFPFbSfTbYAY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qVzajf1gDGJAlfBFqj6Nhz9RT8o3BF4b4C8uqZCbFio+Mubvl00erR4WiTrruSXvAwti6OjvT0L5IOrEh5RYtxCtbyoiDMiBHPknReaPAjTPFKRVyV42dnPY2fxZj6NS520IP/Dv1mUtOF9rBDlR7YzLEsEyuWeBdvSJ2raVf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDxka4fu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8443BC116C6;
	Fri, 16 Jan 2026 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768570193;
	bh=Ii34bnfNGZgLEL8OC3/10ci4kB1hRgTpFPFbSfTbYAY=;
	h=Date:From:Subject:To:Cc:From;
	b=eDxka4fuo7yg0UCvt72Tskwuk99CnBxZRurGDL6QeVPHbNl/3q1K5q3riLVuNw5qe
	 1WVkp1BhFXwdi96RDdo0v30BLrY7vhw/qxIEaeIju9KyrTbO/eQFpy+2SRdJTjro3r
	 z5HXQwkQfU7qne5alpfPDauS0Ng4cr1ibaLp987Asgvdpdnu5Rg3IUDbWl3LQmoCVH
	 SVOyfajeB9kCnkvLOFkUO4qCX7vr+MKk2B47Qp9Yecqy9Xcb0zOSOd3fiRm/D9FJN1
	 Btnjas5i1bvcxAp/tcdumnFPxWwIDECdu70Gat/lZ9aAjhTC5vTbK/up8aOgkDmg3s
	 O2ukHt3FZHxVg==
Message-ID: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
Date: Fri, 16 Jan 2026 14:29:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANN] Media Summit on May 26th in Nice, France
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
 Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(Please pass this on to anyone you think might be interested in this!)

Hi all,

This year's Media Summit will be held on Tuesday May 26th the day before the
Embedded Recipes Conference in Nice, France:

https://embedded-recipes.org/2026/

The Media Summit will be held at Hotel Campanile and in the same meeting room
as last year (Nikaia):

https://nice-aeroport.campanile.com/en-us/

It is close to the Airport and to the Embedded Recipes venue.

The meeting room can hold up to 30 people and I will provide video conferencing support,
just like last year. The location and the meeting room was quite nice last year, so
I saw no need to change it.

That said, in-person participation is very much preferred. This yearly summit is meant
for active media developers to meet face-to-face and to discuss media subsystem issues.

And it is also a good opportunity to talk to each other during the Embedded Recipes
conference to discuss topics in a smaller group. But if you are an active media developer
and are really not able to attend in person, then remote participation is an option.

If you want to attend the meeting (either in person or remote), then send an email to me
directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
final number of attendees by then.

There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
appreciated.

If you have a topic that you want to discuss, just 'Reply All' to this announcement
and give the topic title, a short description and a guesstimate of the time you need
for your topic.

See last year's Media Summit Report as an example of what to expect:

https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/

This announcement goes out quite early for once, usually it takes a lot longer
to organize, but having it in the same place as before made life so much easier.

Regards,

	Hans

PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
closed those days.

