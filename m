Return-Path: <linux-media+bounces-65321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5DrsG22EN2r3OQcAu9opvQ
	(envelope-from <linux-media+bounces-65321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:27:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE86AA4D6
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:27:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d7XbsYzZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65321-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65321-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 111B33002D1F
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 06:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF5C25B090;
	Sun, 21 Jun 2026 06:27:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E598B19E97B;
	Sun, 21 Jun 2026 06:27:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782023270; cv=none; b=f+Bi9ZxohSH4lBZJqhtewaAe4qfkAtgsp85+Tw+fXZmdXUNa4h4Otz2yeaUSDt6FeHO1YnhZpdcLW+fdWVQKczDudhbfRtyNRvPO6v1ApvnOp1q+BXworEreJv7+K8WMRWtVQF9sqQTKKnA+8yNY9yNL1b4NyFVtMSnwyRBwmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782023270; c=relaxed/simple;
	bh=d4XRNhHJtx5vaNKiSKmVbw0J+gzb1Lz50Se24lVYn+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoURnc2w9U0ZLb1ItTZsWIE0iTS7G5cx6YUOjtsnY5jcEQAuN7Bwv5e8F6TY3u3nGJNogZ+Yu7RixJndtdPgA6y2UgrwaFwPCHjxq+Ljwmvzgktp8KNM6Fb1eGY14xRfWMFIIqwbXHnsf+0FygEP9f0tt0OiWybu7/E2zzINE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7XbsYzZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263BC1F000E9;
	Sun, 21 Jun 2026 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782023269;
	bh=dPMJsl3/PMQAvB1kuVlDZn4ufRU2xy2klAZD/cRiatI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=d7XbsYzZbMypvSqDkbRh3QOwHRkbCRrmOXm5Si4Z6OYLSETMqD6xkDSsZ3wCyo8mD
	 hYD+5In6BbOLaAsAtcRkojB6oBPAstgj0ABC9ice0+ego3t7T9Xk8PG+mjZCOkdjem
	 Ioe8z2zhgZMUTDzKtT4rvhL7AicR2s88SatZOoXXEc9o8OovFRVlc9AFc9x6donZ4M
	 a0uvguqM3wzoCXoNabx8pN0zrGBTfE9wkgx+SA2+X/xH5ZQF4RnSf7l7sIytUyat1C
	 BzI3G2JW2jEouqWs6nSHZ5/08eZh6mwtmMdiduZbh+T8vWRMOhYE2CNSZJdx95gFOD
	 juNg7JeaSj2Mw==
Message-ID: <6ffd489e-8f24-47b2-bbfb-ac464798883f@kernel.org>
Date: Sun, 21 Jun 2026 09:27:46 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] media: microchip-isc: fix pfe_cfg0_bps comment
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Eugen Hristev <ehristev@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
 <20260616-balki-isc-prefix-fixes-v1-v1-7-b23677fc5ab6@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260616-balki-isc-prefix-fixes-v1-v1-7-b23677fc5ab6@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65321-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,microchip.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59DE86AA4D6

On 6/16/26 14:51, Balakrishnan Sambath wrote:
> The @pfe_cfg0_bps comment claimed the field holds the "number of
> hardware data lines connected to the ISC". It does not. The field
> stores the pre-shifted PFE_CFG0 BPS value (e.g. ISC_PFE_CFG0_BPS_EIGHT,
> which is 0x4 << 28) and is ORed straight into the PFE_CFG0 register
> word in microchip-isc-base.c.
> 
> The old wording invites a reader to treat it as a small bit-depth
> integer (8, 10, 12) and compare or do arithmetic on it directly, which
> silently breaks since the value is shifted into bits 30:28. Document
> what the field really holds and how to read the bit-depth back out with
> FIELD_GET(ISC_PFE_CFG0_BPS_MASK, ...).

In this commit message I would focus on the correct meaning of
pfe_cfg0_bps and stop inferring what a reader *might* have understood.
Let's just fix it to be right, explain the right way, and forget the
wrong way.

But it looks like we could improve this to hold an actual meaningful
data here, instead of a preshifted value, and rather shift it to the
register when the hardware needs it.

Eugen

> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/media/platform/microchip/microchip-isc.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
> index f5e322c2e36b..b084459f4583 100644
> --- a/drivers/media/platform/microchip/microchip-isc.h
> +++ b/drivers/media/platform/microchip/microchip-isc.h
> @@ -62,7 +62,11 @@ struct isc_subdev_entity {
>   * @mbus_code:		V4L2 media bus format code.
>   * @cfa_baycfg:		If this format is RAW BAYER, indicate the type of bayer.
>  			this is either BGBG, RGRG, etc.
> - * @pfe_cfg0_bps:	Number of hardware data lines connected to the ISC
> + * @pfe_cfg0_bps:	Pre-shifted ISC_PFE_CFG0 BPS field value (e.g.
> +			ISC_PFE_CFG0_BPS_EIGHT), not a plain bit-depth integer.
> +			OR it directly into the PFE_CFG0 register word, or use
> +			FIELD_GET(ISC_PFE_CFG0_BPS_MASK, ...) to obtain the
> +			3-bit BPS field value.
>   * @raw:		If the format is raw bayer.
>   */
>  
> 


