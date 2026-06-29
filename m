Return-Path: <linux-media+bounces-65945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IJkgHrxxQmqW7QkAu9opvQ
	(envelope-from <linux-media+bounces-65945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:23:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B766DB229
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:23:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=vQEMozRh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65945-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65945-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C049232071D4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EAF40E8D7;
	Mon, 29 Jun 2026 13:07:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98AB407CC7;
	Mon, 29 Jun 2026 13:07:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738453; cv=none; b=CrwA6YzCGuErVddn/eFnAr2yr9+lUz/LUsWwZyh61nj3a3cUriIaei6uQ7xHMGIRFsFgpI7cLLD4iqimhewtvJ5i+6wGu3gcGLc3rsGn4bUEBnqElzq5WKvbSphOq4j9NUmw+6v5JMcMduQHldvupByzhJjL+MC031qUYl/4K1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738453; c=relaxed/simple;
	bh=1nHoFufCQRZvZOzt8TZ/+CpQGjP+E9zQBPVYPA1TvoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Id0Z/QzeZYCj4tJjoU+aN4d8KdKjjac/7LN0aMjINsjIEHxvBGTHixXVK5E7vnkhAI+m6DNVjssCuJST1QOoJjOeymukKzWc/+P86/4c90CPusoaDMq6U6H7wK5MokGy8CqdQpqNRBQb3EQYzZy98vYP2vlxoNJ6BXjvYs/DRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vQEMozRh; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8461596;
	Mon, 29 Jun 2026 06:07:26 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0C4A3F85F;
	Mon, 29 Jun 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782738451; bh=1nHoFufCQRZvZOzt8TZ/+CpQGjP+E9zQBPVYPA1TvoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vQEMozRhtF8HLcAtsO/5itm66nu0uYE7GsfU+w6ru4676Pf6ULE7Ed0RNFlBYonRc
	 tIASWVrc2MS7Iaivv0/qLyZ1/Y4ZNVjHZCAdFQVn7XlKSmnDeHBJGBwr0y821F6kDx
	 6zmTfdTUVHkrVy0TEiZmN43gRbAwOcjlql5jHu8w=
Message-ID: <ac40d519-6e95-472c-b843-70cac5728fb6@arm.com>
Date: Mon, 29 Jun 2026 14:07:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <20260629095732.GC3054459@killaraus.ideasonboard.com>
 <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com> <akJUZ7TAGLnTmbFJ@zed>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <akJUZ7TAGLnTmbFJ@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65945-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,arm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1B766DB229

Hi Jacopo,

Thanks for the clarification.

On 29/06/2026 12:33, Jacopo Mondi wrote:
> I don't think it's strictly an hot path but we're in ioctl context and
> I think it makes sense to minimize the time it takes to complete the
> ioctl call.

I agree with what you are saying on the validation of the paramenters, I am fine
with dropping the checks.

-- 
Regards,
Vincenzo


