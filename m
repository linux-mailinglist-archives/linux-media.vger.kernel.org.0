Return-Path: <linux-media+bounces-67157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GropDC2gT2oalQIAu9opvQ
	(envelope-from <linux-media+bounces-67157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:20:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5273180D
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:20:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=I6CxzKFR;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67157-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67157-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75E1D3084353
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326E82727E2;
	Thu,  9 Jul 2026 13:14:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4F26FDBF;
	Thu,  9 Jul 2026 13:14:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602846; cv=none; b=IjsUqCjX0xIqXmUl2PrS1ltvXAt6FMJVN5J5wPjnRcUEVw8XdmzjdFZi88Kg73rjbUdt41F/OcMbvbNAfcpRHjkGaudNkjYcYX/E6qiAcj/lHMK0DRTP9n6E02J1Tw1mHhOapLSSnYmpdedPKOR2HR0TRxmJ/thPoz6MyfbT6m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602846; c=relaxed/simple;
	bh=gA6o49/FJ11NCS7sJqeM2onkDwL1L1SnZTVsGuJMSvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbLIIZ3YuaXewnRgv07cRcjUQOmoXUfI/zcycVrighyyW70ovxjz52q8agwEz3SY3BL7CPqaT+FaNr77e7td9J2+yo+Q5kVi/e0cZs9Qd/dP3R8mfiZrw3BpvV09pWk39+XXUiCdP65Be9GCzp816ddDnIro7tL5W1zLJIzT5gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I6CxzKFR; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F38B54DC;
	Thu,  9 Jul 2026 15:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783602787;
	bh=gA6o49/FJ11NCS7sJqeM2onkDwL1L1SnZTVsGuJMSvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I6CxzKFRb0sns6cIe8GkAJFPkIy5aRUBCV3k4Kxb3vYmAu1G0jQJsvYxBPW5kpD+1
	 eU+Vnf9DgUD1IJ1EoN21TCHsFqeNsUdkyJ8cy9Si9hCWK1QScgHdagkK98JXnMKysU
	 elBm9jy90gs04x2uCDiDG/87rBQZOmoQg8ilQraA=
Message-ID: <945f3325-3e53-4b14-9dff-1e3f558c52ac@ideasonboard.com>
Date: Thu, 9 Jul 2026 14:13:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Merge int3472 driver patches via the
 media tree by default
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20260708114740.47134-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260708114740.47134-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67157-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82A5273180D

Hi Sakari

On 08/07/2026 12:47, Sakari Ailus wrote:
> The int3472 driver (under drivers/platform/x86/intel/int3472) implements
> an effective kernel API (via instantiating regulators, clocks and GPIOs)
> that is primarily used by the drivers under drivers/media. This means that
> there are often dependencies between patches to the int3472 driver and the
> camera sensor drivers whereas dependencies to other parts of the x86
> platform tree are fairly rare.
> 
> Assign the int3472 driver tree to the Media tree.
> 
> Patches that have dependencies elsewhere than in the Media tree will be
> coordinated with the respective maintainers as usual.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Acked-by: Daniel Scally <dan.scally@ideasonboard.com>

>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2aec6afa8108..d41544a41c07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13379,6 +13379,7 @@ INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
>   M:	Daniel Scally <dan.scally@ideasonboard.com>
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>   S:	Maintained
> +T:	git git://linuxtv.org/media.git
>   F:	drivers/platform/x86/intel/int3472/
>   F:	include/linux/platform_data/x86/int3472.h
>   


