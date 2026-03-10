Return-Path: <linux-media+bounces-55050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NcBGI3Wr2kfcgIAu9opvQ
	(envelope-from <linux-media+bounces-55050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:30:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF754247586
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EEC030774FE
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6323F0774;
	Tue, 10 Mar 2026 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKcBRkUG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C6D3644D3;
	Tue, 10 Mar 2026 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131236; cv=none; b=a/pfiV1SBp4bCPBAghMjjzUvUDPHxz4KJ2f9so1RmyEVq9ZIEp6hS9Rpf3FPHlYfKiKKvCo71y8X6TCVmhnllvZm+5G+p4cvX9Yib578VImWRKDRFErJUISJiRe/U4IOweQ6eL93tO91s3Aen/r0lqR35EpwRfasczBbL5FLnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131236; c=relaxed/simple;
	bh=qkJk0ZIrwJ7f/aH/4uJcDjSL/B/E0j/pABEF2EXhYmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeHYjQdsfTCBg/Panquqve3FPcnXsJiPZRVapd4kReJaa6Db0+AsYMqYERME4JkCHSirO3PMH+PM7TS7cENzWQQK0lWjURRMd0eVBdNgi0AyRZOVii6/NgQSkQ4pyXBgIdm7wHwNYRHYxeZbdM13o6zUE84VPxUeqXw2SSH+FP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKcBRkUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F6AC19423;
	Tue, 10 Mar 2026 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131235;
	bh=qkJk0ZIrwJ7f/aH/4uJcDjSL/B/E0j/pABEF2EXhYmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKcBRkUGwB7jgLYrS9rUgP7RtF3UdfFpiqcyR4JiKPIGgITMuy9/s8+hxglULhq0P
	 RCwMfjH+J0wKHHoL6SUV5bJPmeudtlNJuwhCrveS/ZYTvNCGFQfVKce2KCXeM3D9w9
	 ncQ3qYtONpBC63cf8qBd4tnebuWkvwqvSyVnyesJpXXF3SwCgq8L0HYeV3gQKiYufy
	 87Tew/jF8H4uIcCq4qkKGuZfgOpO+brMsHprhNXYpDgjTYqWQDcskv0e146n6dEIxE
	 wLx0MLWgi93V0fkhVwOMtcQ+FqrVX5qCatZJT/GWhk/8JmtNN924nw4l0c0X7BgsvK
	 D6Ivu7XTFfnpg==
Date: Tue, 10 Mar 2026 09:27:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Jimmy Su <jimmy.su@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 6/9] dt-bindings: media: i2c: document Omnivision
 OV08D10 CMOS image sensor
Message-ID: <20260310-fair-malachite-gaur-af3410@quoll>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
 <20260309-ov08d10-v2-6-81f8b5d99984@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-ov08d10-v2-6-81f8b5d99984@emfend.at>
X-Rspamd-Queue-Id: AF754247586
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55050-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,emfend.at:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 06:07:08PM +0100, Matthias Fend wrote:
> Add bindings for the Omnivision OV08D10 CMOS image sensor.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 102 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


