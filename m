Return-Path: <linux-media+bounces-66292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pTn9Fl8QRmoeIwsAu9opvQ
	(envelope-from <linux-media+bounces-66292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7386F4137
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:16:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aeSWiXWa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66292-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66292-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5362302E7C6
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C2390212;
	Thu,  2 Jul 2026 07:16:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599726B2AD;
	Thu,  2 Jul 2026 07:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976561; cv=none; b=LDSQOnjXJ4UWULV3SecCfcraUHzG2T/XIhKeMjc0tv4zadBoagCEZnd5eSKdB49j0i6yUfHPEhpGkxN6bmQ9hnE8dYDDFdufPaDR0LDnLzqmqSzdLadcJKVWvGP8N5uOMLMa1djy8NKVY2oLOM2zDFrocifyZw8Ufo61YcnWLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976561; c=relaxed/simple;
	bh=uK+tGcHuxumpn0r/HhEEvO6qoUSxEA+hXCbeP4IU0Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxM3rtcwiRtRhVbyL/vyg+QtQefgG5BGENDki9/WYorD9L0F5W2WIqlZrOHobARvYjP3egO44sYciQ1keNacFr9bYNnchK5ev4nDWlhJwYvYM97hjbrQvW0ZTEeVc70q5guufTrz5tH0esYxPI2hPASqnmYtXtHk9Xf/2xWdmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeSWiXWa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363341F000E9;
	Thu,  2 Jul 2026 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976559;
	bh=xZuexnlIldizIVI1ciEFra7BMFjhF1yUKSWEY9COTh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeSWiXWaQQIWTt4l9QAaCxpHwXHTI+Lty6LIowreHGecvLHHGRLw5wo5bWzvMYxNU
	 aMzZQb2gpbZt6HTNqDKHm+zFCMDiZEkswMpvPFCRSerbHyHb5BIX2OrZNXCmqYXman
	 lCYYw1KyxxSKeAexFq5tRgq2LyZGSSd/401+jBSGlZaBHKflHuy/lMlDD0t7Ae/3ZE
	 KygDCQCPzUn+T6Y+piOolYNHwFBlm5rcCWaIwx5d7kQDO+H/8w6NqJfJhrA91M4Exy
	 MwE0U1dHUmoPSr2nXSHWq0swbDzdBTo6IRd7kf3PTNM7npqG+c1wMQ386d/IgRXgFm
	 WYeALd8Xt6QCA==
Date: Thu, 2 Jul 2026 09:15:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Message-ID: <20260702-generous-beaver-of-perception-f2a9bd@quoll>
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
 <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66292-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B7386F4137

On Thu, Jul 02, 2026 at 07:02:37AM +0530, Ramshouriesh R wrote:
> Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
> near-infrared CMOS image sensor used as the face-authentication IR
> camera on laptops. The sensor streams 10-bit RAW over a single MIPI
> CSI-2 data lane.
> 
> Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
> ---
>  .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof


