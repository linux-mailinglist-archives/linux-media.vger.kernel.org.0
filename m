Return-Path: <linux-media+bounces-62858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKyBO2OxFmqOowcAu9opvQ
	(envelope-from <linux-media+bounces-62858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:55:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 582B05E1647
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AABB9307F8A4
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22FF3E1226;
	Wed, 27 May 2026 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivMOmd3E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB082F6560
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871739; cv=none; b=EdIcdQsqyANSrEOLqXkFPgk59Xu3dXabDMwA3b1M3VKk9ZwDvY9eoTjSahJ1G7FwoqdsASxjxJvVq7JTyG+4VA6sjN5YP5Q2I7iSMF8CnLAoL4QERVMj02akVjdd/aBtcI0RqaS0uj1nAfmXH9B4XZTkQMn7oJnBz/EPNkNn1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871739; c=relaxed/simple;
	bh=5OhL50CeDKwAOgw6QFwB07STie6tG3r6cAsfzcMd+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ayI2aBYr58MAovNzRj8gvqTFgXR0916JDhTlNpa6/PCzm/60vpenUpVNtmdf4qPc1LdqjaTRgdhG+D7sJj1t0jIwTyFCIlCBXJZd92TTPfR/sy8O6xM2gs872mLUYI0WRucuaB0P/g0m/EZvHO0LOsowvOfvNCjdsYn9cG9a1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivMOmd3E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE4A1F000E9;
	Wed, 27 May 2026 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871738;
	bh=ZXBJtfpmRPrhXDlu9beayf8zmLy9OEzybmKE1uhw5tA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ivMOmd3Ee7775kl08bNiZ6KkeNR/+qKMCsYKKdZyRdqyPog9s4lE6U8rSBYOksfQi
	 DgBZl/lXlWaLEAKxXnDDAAGdKIOZPND+1/oPRzKFwRFi5aroa5nYOYe+fpa5ITqqmb
	 zSzwI3v6ycn0Cl5IWJQj2umsfCKkFkxAklI999yCQNOfP5euV8OK3wwU65TbGaxT3k
	 TTz9mFxisOXs4hCSQ+Hw0Eqre/woqrg3l+ZK/Fb09EOMgQeFK7xeTxWrUzcS5HZf32
	 8KtqpJR9bmxcNueobj5+Q4avy0y/FTSd8pPRKPgaxTQU1VD1OSxTvK1yqLVYUvIQ/6
	 iSqLvOOSNTjUg==
Date: Wed, 27 May 2026 10:48:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Michael Tretter
 <m.tretter@pengutronix.de>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Brandon Brnich
 <b-brnich@ti.com>, Marco Felsch <m.felsch@pengutronix.de>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Sven =?UTF-8?B?UMO8c2NoZWw=?=
 <s.pueschel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>,
 Devarsh Thakkar <devarsht@ti.com>, Yemike Abhilash Chandra
 <y-abhilashchandra@ti.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, Jai
 Luthra <jai.luthra@ideasonboard.com>, Mehdi Djait
 <mehdi.djait@linux.intel.com>, "Padhi, Beleswar" <b-padhi@ti.com>,
 "Donadkar, Rishikesh" <r-donadkar@ti.com>, Rouven Czerwinski
 <rouven.czerwinski@linaro.org>, "Jose A. Perez de Azpillaga"
 <azpijr@gmail.com>, Daniel Stone <daniel@fooishbar.org>, Robert Mader
 <robert.mader@collabora.com>, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Satish Babu Patakokila
 <spatakok@qti.qualcomm.com>, Antti Laakso <antti.laakso@linux.intel.com>,
 =?UTF-8?B?VsOtY3RvciBKw6FxdWV6?= <vjaquez@igalia.com>, Frank Li
 <Frank.li@nxp.com>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>, Mirela
 Rabulea <mirela.rabulea@nxp.com>, Martin Hecht <mhecht73@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [ANNv7, final] Media Summit on May 26th in Nice, France
Message-ID: <20260527104847.0f2aa5fc@foz.lan>
In-Reply-To: <e6c07c24-da54-4269-b42f-b9af544da2d8@kernel.org>
References: <e6c07c24-da54-4269-b42f-b9af544da2d8@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62858-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,ideasonboard.com,linux.intel.com,chromium.org,collabora.com,linaro.org,raspberrypi.com,pengutronix.de,sys-base.io,foss.st.com,ti.com,oss.qualcomm.com,chipsnmedia.com,gmail.com,fooishbar.org,qti.qualcomm.com,igalia.com,nxp.com,allegrodvt.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,foz.lan:mid]
X-Rspamd-Queue-Id: 582B05E1647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Thu, 21 May 2026 21:22:51 +0200
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> 17:00-17:45: Discussion of the media subsystem development process
> 	Presenter: Hans Verkuil
> 	Description: Review of the multi-committer model: current status and next steps.
> 	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?
> 

Based at Media Summit discussions about patchwork, I opted to pick this PR 
from upstream to create a per patch series view:
	https://github.com/getpatchwork/patchwork/pull/575

With that, we now have a patch series view at:
	https://patchwork.linuxtv.org/project/linux-media/series-list/

and there are icons on the top to switch between Patches and Series
lists.

I hope it can be helpful.

Thanks,
Mauro

