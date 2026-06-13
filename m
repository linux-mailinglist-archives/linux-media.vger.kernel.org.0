Return-Path: <linux-media+bounces-64778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lFAPFZGkLWqmiAQAu9opvQ
	(envelope-from <linux-media+bounces-64778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:42:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6367F55C
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:42:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mhUejQtP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64778-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64778-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE7BD3019B8B
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 18:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D6238E5FF;
	Sat, 13 Jun 2026 18:42:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B942773FF;
	Sat, 13 Jun 2026 18:42:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781376125; cv=none; b=p6s/ewgsjBEX8GZVtMdnpCO/2s3/K0hRynrQuN79HGQcrIKdV7JGozZ987Dj+Uxbb8ICXIbZml+cXlLkHFxZS3TgD/qWNnZxdq/WxzyWQPPoWiSU3dDwbaZoj0zEYX1ivoROq4ovu3qdDmcfXKaSb3rj73XmV7/0j6TTSAw9YAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781376125; c=relaxed/simple;
	bh=DD3epTLdOI/iq9gtDq4YLdI/6YH7kFcJpbYRh73j9fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVJ8Kam4y8qe2PRao4rEczvHkRybq2noddryfw1nlyHDUEuO+OcFEPjx2z2B9b65/Lzmdw0wZ7228cvzrNXmGXRGHoLzJURcsgIGjEcWyzkWKHR1WmhzY/u8f5zxiUywB8sm/isqCTeGM6tnF/UsPdfv4XUti68rHdZzQwW6XZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhUejQtP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ABB1F000E9;
	Sat, 13 Jun 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781376123;
	bh=mNwvGYybZ8Yy5CUf+N/gqnjWQ0NStQU7SxwA+Xc3aL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhUejQtP+7X6YRBNQXX3C+h21jqibS0/SWMqI9fF1PB5w2A3b45NwQOAk8W13yM1w
	 bWh8JfwusyyvIr71/ajE3MOSi9XKFnYo6Wdo5bTcLxxNE4+c6UqXTKG8XqqiKXqZuX
	 py0ZKKfGjPdWgKBmvz9LDlIGt/zAB9fNa4bqPxV6RQyoJEW8udd06noOIPN199/J/k
	 y06KJHUNqwakZpbsaysmYPzT6C1FpGn46ZKfN5blJh66/AYXb2FcXbQTrgw3Lnwbv/
	 O6NR38LumwHDXpyqmwhOMsEG1kAT/a16pI8uY/pTa1qPzmKvPh3CF7W07Z8w08UyfV
	 QVBPyYuj9Rzwg==
Date: Sat, 13 Jun 2026 20:42:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <20260613-fair-ultraviolet-dog-fece5e@quoll>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64778-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9C6367F55C

On Fri, Jun 12, 2026 at 10:44:14PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the standalone Qualcomm JPEG encoder
> hardware block (separate from CAMSS media pipelines).
> 
> Document required resources briefly and scope initial support to
> currently used compatibles in this series, including SM8250,
> QCM6490, and SM8550 class platforms.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++

You already sent v1 and you received review. Quite a lot of comments.

Please do not send duplicated work, but address the feedback.

Then version your patches correctly, so the toolset will work. Sending
duplicated work is not making the review easy.  I am dropping this from
DT patchwork.

Best regards,
Krzysztof


