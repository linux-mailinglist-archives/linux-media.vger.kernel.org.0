Return-Path: <linux-media+bounces-62825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBRuFhr0FWqzfwcAu9opvQ
	(envelope-from <linux-media+bounces-62825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 21:27:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04155DBF92
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 21:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 600F6300FB4D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A343C0A0F;
	Tue, 26 May 2026 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="Y6JU/jKE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VSTzTrV/"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED1352C52;
	Tue, 26 May 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779823628; cv=none; b=gFm5X7G+0f6SY/hUZvW8mjfy7BqpXWPc8l3tn2+LfoW5JVOD3CplqlMT6XpbFWGkyjZX2iZN2jjmV/O0zGNTAvKiT6iV6BIdnYo4nLh5a1kfuO7L1uGXXVliEREslL9slEnjiDjCBjzjDWad0QbXfXqOjSeWazaRgGfoYP3wwIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779823628; c=relaxed/simple;
	bh=77/+ZGFfTGvt8mRdWPo2XaFHsdjtVQ7o8hyrs4/G/Y4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=N8A57YOLdmw34I003cjRhU31qyiYELWvC713ylvJydvtSbSLXHBxtsfQBQMkHBRQ5wX6ISgnvEYyhEQC+hdSft3WCCwojBe4O+y4fHQDQkK8ZeNBy5m8SkdGOLxaKMprl+eSXYoEGCZZn+24IgcF+2n+wXIFWeOEk04GY6DCuZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=Y6JU/jKE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VSTzTrV/; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D44E1D00084;
	Tue, 26 May 2026 15:27:05 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Tue, 26 May 2026 15:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779823625;
	 x=1779910025; bh=77/+ZGFfTGvt8mRdWPo2XaFHsdjtVQ7o8hyrs4/G/Y4=; b=
	Y6JU/jKEF1E6nSnunXBI+O85bhvOI+S+VFQWFnAV/p6e3oAGEaedeHVVjKTaZXvd
	tMszbAfoup2NiO2iJocNGKS3M+2Vs0yNxHgf1dufo0KfDp7/ELgNCa7BBD+RKMf0
	4wjqZVt85SW6gY1vg4jFkcUsLegN4ksBLyBSDy6FnwwdsmIQauq0Y357ke8TH3h4
	2ZuOfI4hvcn0eDfYfno2lgdoiKtAXNitiH3mn+/9DChnT9Nn7kRpzxDCEgpwNFqB
	dO6eo9vKiVv/UCdCBKf4SGTFVkUQMK6OKyjBgh96pH4R4KoWt46dXxHoOQZ/xv4l
	cYnvnIoCp+zMATD6NQYBJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779823625; x=
	1779910025; bh=77/+ZGFfTGvt8mRdWPo2XaFHsdjtVQ7o8hyrs4/G/Y4=; b=V
	STzTrV/SCT67mwjyvLCnl7Vy7erGqgPJBxviVrsk7zJswKbeWL75SpCD0TbLvVau
	S7uz4n7qzsslyz3UX4U2nFJfKfy+bfij3KvaPRC1/gPqeTxOmk6x6Hk+6/B2Ods5
	5IoShfyo+flcyCSKPNW8GTdf+iVDIbyPkfbv2r7GwLpCuUAIsqn0l0e/M9gJcc5L
	h+buGIA5K3fJH3Xlf6OpI6JNZm4+0XKm/M0AOBYYbZVfnIxfAMiwZsidmO6UN244
	scbyAAquhkfSRysqmI+Rv2ZAEr2ILqqGHOF5XUyW8uBxczyCIyqcJcH8vhS20pTh
	3iSTcjZbSOMcy0vxRgK8w==
X-ME-Sender: <xms:CfQVaphL9KGX0CT4BVD3NUz86ZB_ZObNbArwionxkHSfo83XRIEavQ>
    <xme:CfQVao2TncwCOQr45i_gSK1axahW9uCLTMEshWuMWvlrgRqVxdfU73WIvw_eCtSnG
    OC0s-a4gUVajcoV52lBeOAnDnnNg0TuhZHlhcPIFHT8Ya0ijZm7ncId>
X-ME-Proxy-Cause: dmFkZTFKOyn/k+gJ/GYMTo7ZsgSeiWloFYeuZlKbMQv0yX3qqGXrX8yhvAkXOzLNBFNsc8
    kaeaR+SiZJjBuZJf1QQum/vp2v5gEZSO5UEOgXqDmyjso51n3I8uQrp9/yepB0nNf9MsPN
    F3wkJwDZfaegA2J+PaEczcfuzg26RyBJRdv6b2OvstHuhbX6O92V5Rxi6OuWwtr+CTubVn
    KPkpaCO//ABMCKkFWD4HuBMNzLSDz0E4fuBhK0ZgIsUzkV0cLMgY6ThjkOXh/k4NtrCZRj
    jRqHn9gbAjeSpxcskrfQo1fvh+M8DSLf0+VmJC9qwf4l2jOfcp/O5En+gjJTIRv5v7rmlp
    aMbeI9pGsooHmAZIvVz4tRoF9yBoCqBK0h66GF/S0qhn+jSyf6w4TKYDia/k9IrITmcP/r
    uB0YHJ1hN+yl8QbI/33Zmnd29HmsxYZ8NPgK7Mpfrws+MuHIW+Mjj/WSGepgWN8Eah9yJ2
    9tOWnPZI+pBcDTZmcxswH28CtNoAr1qVoLnJV+DAeELS1qG6nYVcgkIcIFJb45TwE98P1O
    Z5nVA1JSEAZmSq5AUUQXQhQ2ATTCioJ35BRIPpM4FxB49YS1Bc37E45MK1Cszo4NAUwCyB
    SitxcapSa8zUW4VsMzeoDl2I/oLZE3+XhByNXLiUhNkxasWNu3NwFsLk4YKw
X-ME-Proxy: <xmx:CfQValDHK09HRFQCxAv7zZv6s0HRmOGlGvG-spvN48bMsEZ-KukEOQ>
    <xmx:CfQVamm-6lhkDgTCHlYDs8XBaugyxYBUgAw1w8wiWqA3BjOyLZuxsQ>
    <xmx:CfQVarNA77Vi5ZX4NAkSPGXdL2zT4SpT9i3S3bxz-Mpzbb49SDvKVg>
    <xmx:CfQVar_VBSNH58LF93nOqrfm6Tnlphkb2JmjwThZuf9wxlsvUhw76w>
    <xmx:CfQVaphdQBcpzzMG5tAuNrBsctQUJp3gD3aOwj6S6Xe44fEMt7oSqcrz>
Feedback-ID: i372e487a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02C71C40071; Tue, 26 May 2026 15:27:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEG3Zae6raYJ
Date: Wed, 27 May 2026 04:25:37 +0900
From: "Jeongin Yeo" <jeongin.yeo@luaberry.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, matt@mattwardle.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <7aecd867-68a8-4c83-a154-a96da89a269b@app.fastmail.com>
In-Reply-To: <2026052613-glamour-caress-1b8a@gregkh>
References: <20260526104750.1284935-1-jeongin.yeo@luaberry.com>
 <2026052613-glamour-caress-1b8a@gregkh>
Subject: Re: [PATCH] media: atomisp: use __func__ in debug messages in binary.c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[luaberry.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62825-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[luaberry.com:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[luaberry.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,luaberry.com:dkim]
X-Rspamd-Queue-Id: C04155DBF92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026, at 1:21 AM, Greg KH wrote:
> dev_dbg() already has __func__ in the output, why is it needed again?

You're right, dynamic_debug's 'f' flag can already emit the function
name, so both __func__ and the "ia_css_binary_find()" prefix were redundant.

I'll send v2 that removes the function name strings entirely instead
of converting them to __func__.

Thanks for the review.

Jeongin Yeo

