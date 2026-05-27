Return-Path: <linux-media+bounces-62915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGTlHuEjF2rw5AcAu9opvQ
	(envelope-from <linux-media+bounces-62915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:03:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1CF5E81E6
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 061C6301D12E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C775144B663;
	Wed, 27 May 2026 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffGPLuJf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F52C330B3B;
	Wed, 27 May 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901398; cv=none; b=D+c2x57qFewMSOeX8XHLTB4hK45U+tfEuS6s75aOabfVKIcBp8DvtRDkkvEb9wfMRERxQjz8sT7cbJIY6DUEdAj7WKiICdYOryCzK4H4vEQMoFxbmmIstoTffbgr33ZTNQytbnh2lZEdyEtqv0Kfxgql7vQBwaKSd6O43SuN03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901398; c=relaxed/simple;
	bh=nM4AgNCZ/XlwiX+zBiXCI+KWD562ofP9ezmcj3Wq0s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkyKqT0JMOhsma7Pnhsw93ttyPRmruL61Um0rUnEH6WqKSUBjl5xKKjSMmuQ6aQ3rmV6LuGSfWe3/eXx/aExe3Ivwt30hAWcCxlDmzMZzznRVW3Au0a4YWkmMbw2jCnrqamjvau3pS9kMBfEtMRTYlSVhORn2yPtEhE2fOneH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffGPLuJf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F8B1F000E9;
	Wed, 27 May 2026 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779901397;
	bh=ohprP1K+E6urFA1goOeThQnGr7Q3SMsVAq7rrTXCIms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ffGPLuJfhPWGSD/hCk0hutssiTIvEhC9FMMU9sAHvPSmxcOX+krHFi2z5iYnADTvP
	 FX2cJQJgybPojPuGauBaFqUpmnkOKbzxh5JKcw9spH1a5dPrzieI65Gz32hWrkQ6jF
	 IIOG1mNAgI5bPlgD9UZLS5tILb0LUonDf52yGNBvoHHxX6am18/7IcobJr88rh+REU
	 Ohn/KkAhsdVD7CsHK0PUQ8UY5qW2rfFAH0JnqefQe90Pn0qRAFpM4gVtozdpBZaXLq
	 AubN4OVCEbatRkgTPFUbkeccYIUnBxnaKfCf7QzqBcrOszS3TnEtMimvH+sPnEuAPC
	 ml5ZPmKoe8ScQ==
Message-ID: <3652956f-9782-438b-9fa6-a4ba924c5d5f@kernel.org>
Date: Wed, 27 May 2026 20:03:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] media: microchip-isc: fix SBGGR10 Bayer pattern
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 stable@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
 <20260527-microchip-isc-fixes-v5-1-b0ec1bb954be@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260527-microchip-isc-fixes-v5-1-b0ec1bb954be@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62915-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F1CF5E81E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/27/26 14:07, Balakrishnan Sambath wrote:
> SBGGR10 was mapped to ISC_BAY_CFG_RGRG instead of ISC_BAY_CFG_BGBG,
> causing red/blue channel swap.
> 
> Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---

Reviewed-by: Eugen Hristev <ehristev@kernel.org>

