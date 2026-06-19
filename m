Return-Path: <linux-media+bounces-65252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8QhsAGz3NGrMlQYAu9opvQ
	(envelope-from <linux-media+bounces-65252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:01:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC646A47CD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:01:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YW2quG2H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65252-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65252-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CDEA301A087
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 08:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2568435BDC7;
	Fri, 19 Jun 2026 08:01:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC9632B11D;
	Fri, 19 Jun 2026 08:01:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856101; cv=none; b=CdbpkcBv9ht/W9UCMzDiEA8id4pz44khRHAj25me+X+n1dr3H5LihH+hP29e91v75CjQHlkucrB7ph4blHadZhUSG9bdLyBbJTa/aY3BzMJOWzuJ3mqIcIBwx8+aA6j2jZUX1Rrk94IldQU+VQ0MnIrD50t8/ry8V5DakP/4Av0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856101; c=relaxed/simple;
	bh=tjVHnSpEH/bgN1eRjAXU8UI/87UG1ARWudlF/Set55c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7pBwYz6mvQQU1rKK4jwsE+UHE8LL6iZa4SvuPt6m/Ra0P8ol0QtWjNSeIJnIos/qgafbvKWWuEcrhK8oK0FuZuHc3FwABOjx2/UCaA93SdqqbUSt8WlmAm4N+KACDwNIuJtShsl5epmArkE6LmSN38Jb5z9lhOsPfJV0lQlfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YW2quG2H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3433D1F000E9;
	Fri, 19 Jun 2026 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781856100;
	bh=0TjxzzDO6vmgFkmwlKHAqYBOln9gocUIZalMIUI/bV8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YW2quG2H9BUc2Mrz3NOAdYm943VPFSEUdyqcTxqJCcvHBAOSjco9MM4hR/C2QWaXl
	 VUY27KuHT9tXUOSZRT+cgkkDXF7M2QraFNxz3iE3Kd3nsO3QQGqMsl46eO6CfSKFgE
	 LaJ/C7CPEVz2NnQ23TjmvflMy9OdZeHVeupQZ5gVY97bWp7AqlgkUp7lXR/oZqlaMm
	 Yhs1egQIRizu8SPjlDu6Fm9hN/MMwzWPf/6ErLtAJ1SVuaZhqp98B8qelgve7fgSG9
	 6cLBVbEcT3TdtOdeHmRpGyR/kxY4JJoHt7pVg/FWKQeWzSE62ROyGTvc7xOnPx7vMR
	 hxWG1Nyh0JoEg==
Message-ID: <a4116337-64d8-4a10-8c1d-c14abc1ce6aa@kernel.org>
Date: Fri, 19 Jun 2026 11:01:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] media: microchip-isc: synchronize the IRQ before
 disabling clocks on stop
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
 <20260616-balki-isc-prefix-fixes-v1-v1-3-b23677fc5ab6@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260616-balki-isc-prefix-fixes-v1-v1-3-b23677fc5ab6@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65252-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FC646A47CD

On 6/16/26 14:50, Balakrishnan Sambath wrote:
> isc_stop_streaming() masks the DMA interrupt and then drops the runtime
> PM reference, which disables the ISC clocks. microchip_isc_interrupt()
> may still be executing on another CPU at that point; it reads ISC_INTSR
> over regmap, and touching the unclocked registers triggers an external
> abort.
> 
> Store the IRQ number at probe and call synchronize_irq() after masking
> the interrupt, before dropping the PM reference.
> 
> Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Reviewed-by: Eugen Hristev <ehristev@kernel.org>

