Return-Path: <linux-media+bounces-62561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHa0HUH0D2qXRwYAu9opvQ
	(envelope-from <linux-media+bounces-62561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:14:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE665AF6BD
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C82AC3016B07
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 06:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263E83A6403;
	Fri, 22 May 2026 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8Hf1oI9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8091C3A5E66;
	Fri, 22 May 2026 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430456; cv=none; b=CPjAjMSSFFloNw6sr1Eh4NJiRxnAEZpTg718tlK9wLpo7Ia4KjmaanD2MrmVImsC3w31M45NcVEjOszFX6b0hHoPSlZ4jyP/Rka98kol6WxJnO76TGTm2cUDoNcwnhzTWqMWjvTnGq4lNVC/fz3Yl3j0sTV2lVIsTMYnHnMGvFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430456; c=relaxed/simple;
	bh=bpNstVlBkEZ22nnX8dbLDlh6Cf8GF6TaIQlyT19OGws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lsnc+Ya65omcUlwNLSOwVyVZgROoyUa/U9oAgo/U2o0T/vgQ8lZ+yWeq0GEZ2VH5/5qQuJdJj/y4y8YT9F4fSlEb7pUHO+S0JMBL/JOxbBpcFkSytGGGo6VrPB7U7ejkUFILX+XlJuiPA9cQFzF+C7+MB/7oayfwAiUgw1mq1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8Hf1oI9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9E21F00A3D;
	Fri, 22 May 2026 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430455;
	bh=6KxElQ/1NbJLbXdGSwiHM0Ub+Tht2d9BPPUcc8qkThM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U8Hf1oI9ucIExBN4qRxoSHjbsPBpcBTOj5jn+KEO0lQPCQGGmP8XJsXKlWk1mxur8
	 hnalNhdgzZDbYL3D/hDN5o+A4RND0djdtBviArKfkPJW5ycVgHmjf0b6ktKICAEnxP
	 bgCg/6ZeKM0MugU98FayrihyfzBuaZpVRbQH+JBvMwI4CmNEjsKEODVPHh5j5bdTVy
	 QrYOA6emnHwsUGPuIMGGOP4aytc6pDNS/n0ha66wismlQnfo2gX3m13QDkyfwQc+cN
	 v4TYOCKz/+TmiGQT1L57Gh3D0NCtXNngf5NC0lgvM8PTAO2T/emfr8IZWo16xmbo1j
	 c5lnzHWGE4wEQ==
Message-ID: <fb2fa249-468f-416e-bb05-f1cfc0d10026@kernel.org>
Date: Fri, 22 May 2026 09:14:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] media: microchip-isc: fix SBGGR10 Bayer pattern
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
 <20260518-balki-isc-series1-v4-v4-1-97f189185b7e@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-1-97f189185b7e@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62561-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email]
X-Rspamd-Queue-Id: 7BE665AF6BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 14:29, Balakrishnan Sambath wrote:
> SBGGR10 was mapped to ISC_BAY_CFG_RGRG instead of ISC_BAY_CFG_BGBG,
> causing red/blue channel swap.
> 
> Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---

Reviewed-by: Eugen Hristev <ehristev@kernel.org>

