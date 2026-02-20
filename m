Return-Path: <linux-media+bounces-53122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIDjNeIimGlNBgMAu9opvQ
	(envelope-from <linux-media+bounces-53122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 10:01:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B8165FA3
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 10:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6EF4303D73C
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D0F31A7EA;
	Fri, 20 Feb 2026 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L5C+M2jQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF263115B1;
	Fri, 20 Feb 2026 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578065; cv=none; b=rpw/Kr/2zW5+8uhiueMpIAgZDSR4Ex055cNJDzJmAm8ZzM6POEwQn6WLtRsTmZGNtyCxBEr2umTh4BAf2i1X/SOAQM161CyOGVy06wpkzNfvLXM10hCiagMsZpLvqDgKEoL++lxGwSxyhjZGD3uPlI0c6Zwd8g4BNeeJcNWbo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578065; c=relaxed/simple;
	bh=Qyfx7vIQJpUOhbXGextIhoP6RuhpY8zjMDDMUTtK9W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWE9ATUdDXglqMnM4h0+nG1H634IGwNywnO2KnUAiFldBElqZYLrVXg5Vak2a9w+18qgs4gtmbBEztqB/YlAsFafEvr2v9XG52siEeCAHFd7nYPGFqMfDu1d0f+lYtaS0rFn7MidaW9XR7v+LZEz495775ydcDQGwJ9NzK6Th0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L5C+M2jQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771578062;
	bh=Qyfx7vIQJpUOhbXGextIhoP6RuhpY8zjMDDMUTtK9W8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L5C+M2jQY/y68bEcwrLqFQCRTsgP8GcfINwZfAXsc3s8Q2Lvfo4P7UICsBkVjoB0h
	 u1E7i0/Kai7k3vgDlMIqomjv8DGgZK3ki0ZRgu/z3e9X3quDvfDkIUQA5e5w9w1vlG
	 aYMYL5Wr58oevdPnV0DqGBomtE6DEWo8OhY+1jTbIk69h7VsO7ov8gj4PNbbZZleA8
	 vW9ym9WPHT/MfDUpY48iu+fofnSBHbDUdJG0xoQVmOKrbo4PCbBp7Rw2+vspkRJjwp
	 01LImxQyC/rJA9d1EMbnW0JcAcqArx0n3HJ2LBFtn9TttU8Ai3oWMjd6D79bTrQE8b
	 JM85V/waKA/Kg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9E6717E0097;
	Fri, 20 Feb 2026 10:01:01 +0100 (CET)
Message-ID: <fb697f64-1f2f-4a9b-b430-23867f205f12@collabora.com>
Date: Fri, 20 Feb 2026 10:01:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
To: Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53122-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[collabora.com:query timed out,nxp.com:query timed out];
	DKIM_TRACE(0.00)[collabora.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[frank.li.nxp.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 714B8165FA3
X-Rspamd-Action: no action

Hi Frank,

Thanks for your patches.

On 2/10/26 22:42, Frank Li wrote:
> Add the helper API v4l2_async_pad_init_and_register_subdev(), which
> combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
> v4l2_async_register_subdev() into a single call.

I think this is a good idea, but can you extend that to offer variants
for v4l2_async_register_subdev_sensor and v4l2_device_register_subdev too?

The function names are awfully long, though. Can we call this
    media_register_subdev{_async,_sensor,}
maybe?

Best regards,
Michael

> 
> Reduce code duplication and simplify error handling in drivers.
> 
> Only change dwc and cdns. If agree add API, more driver can be simplified.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (3):
>       media: v4l: async: add helper API v4l2_async_pad_init_and_register_subdev()
>       media: synopsys: Use v4l2_async_pad_init_and_register_subdev() to simplify code
>       media: cadence: cdns-csi2rx: Use v4l2_async_pad_init_and_register_subdev() to simplify code
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c     | 18 ++++----------
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++---------
>  drivers/media/v4l2-core/v4l2-async.c             | 30 ++++++++++++++++++++++++
>  include/media/v4l2-async.h                       | 18 ++++++++++++++
>  4 files changed, 55 insertions(+), 26 deletions(-)
> ---
> base-commit: bc0bfce7d0f8204e0bbadcee72e87ad9ec105c73
> change-id: 20260210-v4l2_init_register-0e6d0adcfa21
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 


