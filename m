Return-Path: <linux-media+bounces-52325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOxFOkJUhmlzMAQAu9opvQ
	(envelope-from <linux-media+bounces-52325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 21:51:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3D1033F7
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 21:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD130300B29A
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 20:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B583112AB;
	Fri,  6 Feb 2026 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CjmAqriU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D51286D5C;
	Fri,  6 Feb 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770411064; cv=none; b=sQiRd8NoBVkmbIHdAT29tmCe6Bsbi43n2mPjBw6Oth12yPE5XknCMUEaFENgmr0Vf7uK68RZ7SW0ugd/aaBCKWKFS1vEBZdNAy6n4lKD45V0JCEPIoKnRrFzKz12CLc2NbRp/zIG5Iy5sdkCeUr1AZiGFrPp2Bw9Jq+qVkl55gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770411064; c=relaxed/simple;
	bh=8HbIYuSYMKTE3k/M9Jzlj2eAn/mGL/5476qJtR0rpvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8YG0HIZFk0D41UjFmdR7tsSs5/uJ7YFcHu842XaP7vPBFa0RWJ4Q/9lQNQAa9EPHp/xIeJnMuxgC8EUCx0ABQ53lGqV7aBF8o83xaiuOAghWFwaVvaHBkXTsqja9I/I62a/2YBJpMxtLv7DxxwJ2qJDXIOLjCvveNNW/gVtloE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CjmAqriU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770411062;
	bh=8HbIYuSYMKTE3k/M9Jzlj2eAn/mGL/5476qJtR0rpvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CjmAqriUH6Hg2qSkmjQpbTYFfQP+khhX4zoGz5mXdSmlxf+6ZpqMgBD836w/SDsK1
	 PgkTzDmZhuTLqYdhWIekPQJAKTQauz31SwTpP1LiWl+2vzU4QkqOCoueQTgsoCF/Mo
	 ylplhDDAr2GD704dgdBrlJPhmc/88x1d4SXHfx3RNIAXLIkmZbbK4b36H8cIVdxhcC
	 hr+nPKNqI29a+2e6ttc4OwJuKMAHrvnW/aiIgVh7AUZbit67NVLX4I4u8sdJuHnbw0
	 eeWvYU88rhZJZeaVdyxKlP4t1MUEkqw33OW5K4lhWCutAYPVJGtitIKLPhGgi7OkHh
	 CtOOSqqvN45Vw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9517417E1299;
	Fri,  6 Feb 2026 21:51:01 +0100 (CET)
Message-ID: <1a25302d-2483-4cf5-8994-9de41ea9ab6a@collabora.com>
Date: Fri, 6 Feb 2026 21:51:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Antoine Bouyer <antoine.bouyer@nxp.com>, julien.vuillaumier@nxp.com,
 alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
 frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52325-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E2D3D1033F7
X-Rspamd-Action: no action

Hi Antoine,

On 1/23/26 09:09, Antoine Bouyer wrote:
> [...]
> This series is posted as RFC because extending the v4l2-isp interface may
> overlap with ongoing work. If similar development already exists, I am
> happy to rebase or adapt the series accordingly. If preferred, the series
> can also be split into two parts: the v4l2-isp rework and the Neo ISP
> driver introduction.

I would be a huge fan of this split, at least when you submit the first
non-RFC patch series.

> 
> [...]

Thanks and best regards,
Michael


