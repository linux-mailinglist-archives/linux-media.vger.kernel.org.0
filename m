Return-Path: <linux-media+bounces-66699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9MouI2lWS2qaPgEAu9opvQ
	(envelope-from <linux-media+bounces-66699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:16:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982570D6C1
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=INOnzt4t;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66699-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66699-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A3CE3044319
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851414252DA;
	Mon,  6 Jul 2026 06:50:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E73D6CD5;
	Mon,  6 Jul 2026 06:50:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320627; cv=none; b=YbIY2TtCb1VjqLjIoJtcKKfjpsDqqGQWZg7rRvL+oPFYdAlFjcXjodOEbQAfl+YQBu/sXN5sgOwjQCA8edsujCc/fmH17uHHBzP2qBBo35pue3ZW3Iwgz+pDw3bXS3tHXshOQMwYHZTkjs++yRey7jRh2JWL6ddz/Q1IBqDdVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320627; c=relaxed/simple;
	bh=gv72N4jyO7adOmDcrW+eaCs/1XXqvAAR2PEfDvP7t3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttM2WerKKIH7u7P/rQhnOHC+6v8P0S2qfaTGNnYVY+r7tcfy2IGjd+dwQ8gxJj1YtEFWm6uhsCmg3BzcEXS739nASZI9fR1WXe8ynbdqB0D3x7rJ6dQBFGgAgLQiJYHqf44poHSUGhUZeDcSQe4V2XiapecO/lw+GR5YymlOVko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INOnzt4t; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E051F000E9;
	Mon,  6 Jul 2026 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320620;
	bh=MBcKvaitl6TGKL/fg12umkfFHChEJFVRuFuHd7Ccm5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INOnzt4tSmE/dVljgT+XcA6lbhwyBP1xun90kstroUCflGF5BhkiCaHIWf90V0ERE
	 SpgABeN5sE8ZVwDCvMJm3gjPYN3MPdRIoIgqJb+ilBy0sF2JSEuA4rbU37vte0NAJN
	 XwzSKQ45QdF3c76tUCyK1IHxE0zv68FmmlGNsLUgztP4/hB5DQ/XYXKrRcVL9IrAr6
	 alUNpCJLlLmaUIgteZZqUuglxVMFgTPtGU5Cj4G8ZvBRWIfSKwGkfet3o1YGpdEi/E
	 HBnhLEhHiBok2FaYXLeI5PIQgKsF4UhsBGA44elzdUIpLH130SRvoJlaMsaacmtvL4
	 /k6oj4VzzBeFg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgd9l-00000001d97-3Qv5;
	Mon, 06 Jul 2026 08:50:17 +0200
Date: Mon, 6 Jul 2026 08:50:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix SCP device refcounting
Message-ID: <aktQKf4QrsnUADdf@hovoldconsulting.com>
References: <20260704173119.254975-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704173119.254975-1-lgs201920130244@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66699-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgs201920130244@gmail.com,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:marco.crivellari@suse.com,m:thomas.weissschuh@linutronix.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,suse.com,linutronix.de,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hovoldconsulting.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8982570D6C1

On Sun, Jul 05, 2026 at 01:31:19AM +0800, Guangshuo Li wrote:
> mdp_probe() first tries to get the SCP handle with scp_get(). When that
> fails, it falls back to looking up the SCP platform device with
> __get_pdev_by_id() and then reads its driver data.
> 
> The fallback lookup returns the platform device with a reference, just
> like scp_get() does. However, the fallback path currently drops that
> reference immediately after platform_get_drvdata(). The driver later
> still calls scp_put(mdp->scp) unconditionally from the probe error path
> and from mdp_video_device_release(), which drops the SCP device
> reference again.
> 
> Keep the fallback reference until the existing scp_put() call, so that
> the fallback path follows the same ownership rules as the scp_get()
> path.

Thanks for catching that.
 
> Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")

This one should also go to stable:

Cc: stable@vger.kernel.org

> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan

