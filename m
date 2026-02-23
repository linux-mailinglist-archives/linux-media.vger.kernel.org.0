Return-Path: <linux-media+bounces-53172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FDmDhscnGkZ/wMAu9opvQ
	(envelope-from <linux-media+bounces-53172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:21:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ED7173D00
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE8F0306EE1B
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00D2349B1D;
	Mon, 23 Feb 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlWFLtMM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E241428F4
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837939; cv=none; b=TG7m00q7N8mlL8nymxHv7560dX7D0J6UF7TSB6eeghpBwK6Haa5iyXJlMWYeOn7YfF/hasbHUdtJKYh+KpBsvzXTjPcXqd6m/xHdpTV6hs0MWmSxX1skd3DxkfbVzqDSNp5Gm6APMsyX1RfNqDgCpELozgaSUqsxAJtzLkXUeZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837939; c=relaxed/simple;
	bh=1nQnalcxwiz/p2XHQuI+8eQ+k3Y8wOc6NSBuz53Nhi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LxTltrQch9JUOZU3p6gY0Vtmd1Nczz8zbzPB3haLJaMXzPfFvxoy40b3+EiGKr1kUQ/xAMn6Ko6vT4Mw1EjdbukjdG557G3mc3tLktk7ZDZfq1U9miqRqj1OdJ6Mg8nB/5zx/Bx6FU6RdLKU+zk6WZUyRwZY2U1w3GmV8kjokoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlWFLtMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD3EC116C6;
	Mon, 23 Feb 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771837938;
	bh=1nQnalcxwiz/p2XHQuI+8eQ+k3Y8wOc6NSBuz53Nhi0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YlWFLtMMF02FiW/7hkQ3klBf/BC/zb0SzLyy2k58IRnjObSKlICMObFNOFEi7HaeE
	 Oqg1024vJNq4I1pOdz58/Te4q0o4LfEuh/oTPvh1VRd04kIe/kZTP9zK8PwuMoxQtA
	 vGxQK0H1oZCk28+F4awcCKYKFWCw3O/NhgYkMbpy6UDhhsoAmx6ocnpN7tVmn/0umD
	 LlunIjoVFaC8ynYtX+2tEzNiAVwhDjedgZOk1aayLnT+M1QNoI6mTp+THVcMvoBqSx
	 Zn+PI77Iu5tzkoGVULP86FEEgeFxLsB3GK0ErZ5+DK3MVApExTeGt89+YS0ZeJG7oA
	 Ps0aNUlA1ae5A==
Message-ID: <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
Date: Mon, 23 Feb 2026 10:12:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
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
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-53172-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,campanile.com:url]
X-Rspamd-Queue-Id: A5ED7173D00
X-Rspamd-Action: no action

Hi all,

A gentle reminder to let me know by email if you will join this year's Media Summit.
I only received 7 confirmations until now, so there is room for quite a few more.

Also, please reply to this email if you have topics that you would like to discuss.
Just 'Reply All' to this announcement and give the topic title, a short description and
a guesstimate of the time you need for your topic.

And here is my topic:

Title: Discussion of the media subsystem development process

Description: Review of the multi-committer model: current status and next steps.
Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?

Guesstimate: 1 hour

Regards,

	Hans

On 16/01/2026 14:29, Hans Verkuil wrote:
> (Please pass this on to anyone you think might be interested in this!)
> 
> Hi all,
> 
> This year's Media Summit will be held on Tuesday May 26th the day before the
> Embedded Recipes Conference in Nice, France:
> 
> https://embedded-recipes.org/2026/
> 
> The Media Summit will be held at Hotel Campanile and in the same meeting room
> as last year (Nikaia):
> 
> https://nice-aeroport.campanile.com/en-us/
> 
> It is close to the Airport and to the Embedded Recipes venue.
> 
> The meeting room can hold up to 30 people and I will provide video conferencing support,
> just like last year. The location and the meeting room was quite nice last year, so
> I saw no need to change it.
> 
> That said, in-person participation is very much preferred. This yearly summit is meant
> for active media developers to meet face-to-face and to discuss media subsystem issues.
> 
> And it is also a good opportunity to talk to each other during the Embedded Recipes
> conference to discuss topics in a smaller group. But if you are an active media developer
> and are really not able to attend in person, then remote participation is an option.
> 
> If you want to attend the meeting (either in person or remote), then send an email to me
> directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
> final number of attendees by then.
> 
> There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
> the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
> appreciated.
> 
> If you have a topic that you want to discuss, just 'Reply All' to this announcement
> and give the topic title, a short description and a guesstimate of the time you need
> for your topic.
> 
> See last year's Media Summit Report as an example of what to expect:
> 
> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/
> 
> This announcement goes out quite early for once, usually it takes a lot longer
> to organize, but having it in the same place as before made life so much easier.
> 
> Regards,
> 
> 	Hans
> 
> PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
> closed those days.
> 


