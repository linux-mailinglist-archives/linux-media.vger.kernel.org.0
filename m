Return-Path: <linux-media+bounces-63124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOVDMObWGmox9QgAu9opvQ
	(envelope-from <linux-media+bounces-63124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:24:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FF60CC1D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54BCE3044887
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC843B27C7;
	Sat, 30 May 2026 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgzswIjM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F42227EA4;
	Sat, 30 May 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780143831; cv=none; b=VWCDD9Oq3raO/e7egTpOZFb7IR/ZjloCHREJL3JxJdgNgpBjwMfAZmoCrOUl4MtA0EQDg1i9jtndPp053Uuy89rzKtWPzZITlhKclInjE5XuNobYH40oGW/6xRHkJlqn/UCIOSFStQk99mqh6Us3puL2urRtnmu938LsBgZ2vWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780143831; c=relaxed/simple;
	bh=Sh1hZbv7rlOdIKeJPwsYOqJMOwHIR9Au1SlJ5c6CtYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/mESLcumfqY3U+sH0ANqLYgtMlZTNv+TIUg2pP2pfXrJnl7Wdvdqu5XhGtZMYjC9EQ6WLxQwjxD9IsTpAXk76EPBuHCouiyIz+uSNmIynw8vIq33NRyAZlOkeLCn/8Q04GoyuSZOpTMyeeinCsSrtBjWLCYKW8iL5IngocVVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgzswIjM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21BC1F00893;
	Sat, 30 May 2026 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780143830;
	bh=r5DAp+Htga/xf6ftl1MzBgu4VAWMH0v34pGHCIlFIH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kgzswIjMgQxBu1PfaqLxeAGGWhXQEuzhsJ627S9xREYpi1Puqr8aDsUZKw4KLmDkz
	 1CjUJnhLTYEfsB9BIVcAj8WJw6fBAjIu2E12jCmVPKFd/+jyQ2A/wir4agrG5iMdkZ
	 zJE8KP/2825BMhIjdeOo426NyWWmLcTICuRwbTBAzTJmWI1UQ6QqzxAHLPKVGKjfK6
	 V+FhD/xJEeyjgR9VrSfEVsFvaXAVGEEmAsAF4/5cwy64lP+n2F89sVC5r5uJ3s9eje
	 2IjTQN4Rh/rP7ONqhX46JwY1Fe6I3jJdgQlD3Cx0Wfp94O3RE90Ny04Aeoqjxj/JNJ
	 MX+yLK/KJ/NHw==
Date: Sat, 30 May 2026 14:23:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
Message-ID: <20260530-striped-tuna-of-stamina-e2cbc6@quoll>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
 <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63124-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3E8FF60CC1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 04:07:38PM +0100, Bryan O'Donoghue wrote:
> On 29/05/2026 15:37, Vikram Sharma wrote:
> > +
> > +  vdd-csiphy-0p8-supply:
> > +    description:
> > +      Phandle to 0.8V regulator supply to CSI PHYs.
> > +
> > +  vdd-csiphy-1p2-supply:
> > +    description:
> > +      Phandle to a 1.2V regulator supply to CSI PHYs pll block.
> > +
> 
> To be brutally honest, I'd rather see effort and buy-in from qcom engineers
> in converting to CSIPHY as a distinct sub-node.
> 
> Pushing patches to hit your own internal deadlines to the detriment of
> upstream quality is not OK.
> 
> This binding should be predicated on separate CSIPHY nodes. I've
> published... three perhaps four versions of that patch to radio silence on
> your side.

I'll drop this and other camss patches from Patchwork.

Best regards,
Krzysztof


