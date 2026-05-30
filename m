Return-Path: <linux-media+bounces-63127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD1wBiHYGmp89QgAu9opvQ
	(envelope-from <linux-media+bounces-63127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:29:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A466360CCAD
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE6E3047045
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB2A3B2D0B;
	Sat, 30 May 2026 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQDSOBjW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7A3A3E60;
	Sat, 30 May 2026 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780144033; cv=none; b=rJDsO9AQjokWS/jegMi5k4Nwcja9V6YwBpLswdXeCrPooiCYYHYC3EoAr533flp4cDcGlI5D/RlyUzDZ4WUbOT0gNmAju/iliUCNmPqM7CSW0/H6bDGSi8VyWAtmcCCK/g998aei4slpgpkIWvczrdljmpWR7QR9rC47tldEoGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780144033; c=relaxed/simple;
	bh=9cBTXCaMO5Yt7ub4sxJOpje8YAnpNhHQH/3ibX0gR6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eht4jm+0QVk7LJyM9781I1WLw0mqr/6axcK6BWmY5ApHvF3Uqr6zq90dvC4i0EimF8nFnRMfhAq7ZFBdmE+NU0R8CQ15JLkosPmZKiU17SVxNYJoplUuFjlhLfpmzmZQ6+YbZgbTZfdkUDdwiJ4jp5yoCwwklGGCdE01povi6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQDSOBjW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AEE1F00893;
	Sat, 30 May 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780144031;
	bh=QC/a5MUWJ40rRAXloX7W4uyf34uVCenmPEBusDykpZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQDSOBjW6pdjWl6ThfB03E4r3zQNcufpuMDJtZ8cPi+oGrnKqLh88R+yxiHdRKYkB
	 kbV5Olnx6E9tiun+OiB6L73Q5ddWtLHHMOuyTE6Wzdq8vRfxQk5T004CmxXlFo3R30
	 Nm9jWEiQXw2dTCTm4e6vrcjnKR6/gERcUMnX3WDKgfNjY/A8BJpBDy3YfyteydWiFJ
	 +7GiyPKlmW4mm6xaTfoFpZo+rboYfzozc1gGrTHwTwiCYeoveEFvWa5h4GUlvKoDY1
	 BeNQ0Kw00v1t/7ainFrB9E4rvWoeMvSzFIz7d7xSQV/hDKhiW/83XqsjqHnv1VBcjB
	 L/PhuLuljdfdg==
Date: Sat, 30 May 2026 14:27:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 6/6] media: qcom: camss: Enumerate resources for Glymur
Message-ID: <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63127-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A466360CCAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 08:07:26PM +0530, Vikram Sharma wrote:
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> 
> Enumerate csiphy, csid vfe and tpg resources for Glymur.

NAK, this is getting ridicilous. You add incomplete "compatible"
claiming that such change as adding a compatible is a complete work,
complete change (as explained in submitting patches).

Then later you add missing description of what that compatible means.

I could not stress more how WRONG this approach is.

Stop inflating your patchcount.


