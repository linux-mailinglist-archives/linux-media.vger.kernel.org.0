Return-Path: <linux-media+bounces-61489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH0VNlm+BGoeNgIAu9opvQ
	(envelope-from <linux-media+bounces-61489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:09:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 597395389DC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BD2300B615
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F883A5453;
	Wed, 13 May 2026 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsC7ML7+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2DA3A5E81;
	Wed, 13 May 2026 18:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695381; cv=none; b=uMeIxyW3f/8VBWD9eiEd3UaSJV4VyZUBgSbstH0tHWQoBGIlLRv0ZNSQAbjd62zramxxooOPNPypOymYNSAxIaH2eXp1O5CzEpvMdRzxFCFbt4sPGLsgfaNrD2MgLne+Zm9hmuFyhv+IqEvT/amTg7B8Kvs8Ot3s/biAKLmiyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695381; c=relaxed/simple;
	bh=J3/DeLg5yTop5i593NLz2wTc3lXqfnyjLigYKgxELko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvPr3VbhKKFmGZ+8jzK1CEAJFkpiQbHAnhm359tqtsw3SdW1j0kQHyCkkHh14fFxUqBDYP+mJPicYjI4kJwr4DS63zCAqFjXp3e+26GJbf2MWf0Fbg/pjl6BZPcZOhY6kb3BopKzKpjXp6eqYm77Hh41trnqArjOb8jvvIUcPbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsC7ML7+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357E2C2BCB7;
	Wed, 13 May 2026 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695381;
	bh=J3/DeLg5yTop5i593NLz2wTc3lXqfnyjLigYKgxELko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsC7ML7+E1vmFSyI7MITRqGJgYaIFjQgpwnG47Vhqq+gGxLSfIg1mWCCanEc37RT/
	 +YHw4SnHWaSblYW5f16wZrchFqjcLMm2aa+U0SgpsFsOjrh5p+KLQgR3bCFUsd+Gh9
	 wqlhJcUMQFIgdMz5UVY4Vc2u6p+y82raKfniGwEGxv8MyzgAK7y4O/1YSFZAsQxp2P
	 rFvrLsW/FTWUY9frpXeE2p5TF9BpQvkF4YLutrOpcgj2XGxwsk97g0pY7OPtvoFoFS
	 jOM110JeqqE3S6J3fTBmTTmnsuDWEKNFqfDiZzal3ZUHEwG4CTjyaScqQzPhVonfJR
	 p+KJvDrRpyjZA==
Date: Wed, 13 May 2026 13:02:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-media@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM
 count for H6
Message-ID: <177869537686.1492647.6830300416623513833.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>
X-Rspamd-Queue-Id: 597395389DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61489-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 05 May 2026 21:48:06 +0800, Chen-Yu Tsai wrote:
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
> 
> Add a second SRAM region phandle to the video engine for the H6.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


