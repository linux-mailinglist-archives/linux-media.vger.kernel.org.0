Return-Path: <linux-media+bounces-57515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBU6LJgiyWljvAUAu9opvQ
	(envelope-from <linux-media+bounces-57515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 15:01:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C33520EF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 15:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93E9930143DF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 13:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0879736F412;
	Sun, 29 Mar 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="bdLI6Etg"
X-Original-To: linux-media@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B5433AD;
	Sun, 29 Mar 2026 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789262; cv=none; b=Iw0gDENnqCmmeCrqATJhumEMsCkr8t+lPeVpsMdCun9f0Eg9Ra45p1i64ixFPfmm2JZlyuN0g2cJtuOgGlL9Is4nRUZZrnBJQB4Cx1se7mYBmjaRgA352eEQ953aHDUYNqVS3pUhQ2XczgnO5Tn/bGzVQxhPe0x6DlU1XcEr62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789262; c=relaxed/simple;
	bh=W03FI6e80dvROeD6qW3dxWpa6gLkOQSEIxsVWkQzlaE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HeqZXvq4smYkgAWs/A2Vjqg/NVqs0PjQKakepA3qTxJHhKtLnJyNNk+DeCEUO8HPyweJN9ZNXiTuWKmRMoTtGBPApQg8S/B49zhM8CidYOzIgP/sr3yRt6myJ1WdxL5TxGLuskJ+DTtI/LwiCq277XMvlAjUqsDh4EzuEqgPnEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=bdLI6Etg; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=7ds2j9sLWyfvX6+jyaCW9+3Cik3Amrs5CO0KC6EvITc=; b=bdLI6EtgcvoAI70xnMhcK6mcsD
	w+8pPAfefXaLtMD1gfi3Lr9rVqewfH4uHv5mrptQs94JOqZBrrsxjt3v5YTzodVBVEAySZHwnj3Yv
	cuJv6mwESx+A1JACL3Q4KjqSxq2h38EJCYMqbFsTl+2QmIkGHNMg+tXz9v5eX15vxzX+OX2AxAmk4
	kWFAL6vU5q1LhFkWMjasbVzQntEM3KhguJDYRfBxKlPNtCccP1yFaflSLWzwwFfjn7nAdRFNP/yMu
	9ToGKplIYDKTribOsxGDwxrlrrBxOMWajKti2IoM1GykZVwOK8SeR9ZGlmh1Yr7FerqFwnUTP10ic
	ZxF5kwhg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <obbardc@debian.org>)
	id 1w6pl3-000gvo-0w;
	Sun, 29 Mar 2026 13:00:48 +0000
Message-ID: <76072b04a6ec68dc3cdca773ad843e66fe468685.camel@debian.org>
Subject: Re: [PATCH v2 0/3] media: camss: Link CAMSS power domain on MSM8996
From: Christopher Obbard <obbardc@debian.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>, Robert Foss
 <rfoss@kernel.org>,  Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Andy Gross	 <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio	
 <konrad.dybcio@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hansverk@cisco.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Vladimir Zapolskiy
	 <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 29 Mar 2026 14:00:46 +0100
In-Reply-To: <20230526180712.8481-1-y.oudjana@protonmail.com>
References: <20230526180712.8481-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Debian-User: obbardc
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,cisco.com];
	TAGGED_FROM(0.00)[bounces-57515-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_NA(0.00)[debian.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[obbardc@debian.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,linaro.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 283C33520EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Yassine,

On Fri, 2023-05-26 at 21:07 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> CAMSS on MSM8996 has been broken since commit
> 46cc03175498 ("media: camss: Split power domain management").
> This would happen when trying to start streaming:
>=20
> [  199.097810] ------------[ cut here ]------------
> [  199.097893] camss_top_ahb_clk status stuck at 'off'
> [  199.097913] WARNING: CPU: 3 PID: 728 at drivers/clk/qcom/clk-branch.c:=
91 clk_branch_wait+0x140/0x160
> ...
> [  199.100064]  clk_branch_wait+0x140/0x160
> [  199.100112]  clk_branch2_enable+0x30/0x40
> [  199.100159]  clk_core_enable+0x6c/0xb0
> [  199.100211]  clk_enable+0x2c/0x50
> [  199.100257]  camss_enable_clocks+0x94/0xe0 [qcom_camss]
> [  199.100342]  csiphy_set_power+0x154/0x2a0 [qcom_camss]
> ...
> [  199.101594] ---[ end trace 0000000000000000 ]---
> [  199.101736] qcom-camss a34000.camss: clock enable failed: -16
> [  199.101813] qcom-camss a34000.camss: Failed to power up pipeline: -16
>=20
> Turns out camss_top_ahb_clk needs the CAMSS power domain to be on. Before
> the change, VFE power domains were enabled before CSIPHY enabled clocks,
> and since the CAMSS power domain was their parent, it got enabled as well=
.
> With the VFE power domains now enabled after CSIPHY is powered on, the
> CAMSS power domain remains off and things go south when CSIPHY tries to
> enable camss_top_ahb_clk.
>=20
> Link the CAMSS power domain in camss_configure_pd to make sure it gets
> enabled before CSIPHY tries to enable clocks.

Do you have any plans to spin another version of this patch series ?


Cheers!

Chris

