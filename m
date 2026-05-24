Return-Path: <linux-media+bounces-62688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAdFGO1eE2r1/AYAu9opvQ
	(envelope-from <linux-media+bounces-62688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:26:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C746E5C4225
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 720B0300E27F
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 20:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53D033122A;
	Sun, 24 May 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvRG70LL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417CB18B0F;
	Sun, 24 May 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779654366; cv=none; b=RZq9/GJXSSLUOahQe1MQpZDv7TANzvSNKt2+ScFyk+BH5vRZ9sJnSXZ9fWuLUczSpQbI3OiUYjz7JkJbXBs5m+uIq6fRg4euUGzv7b+lyQaHNs5pSJtMjeCOmIStQ/udTKg/fPXNjwPPkActBT84GsGGiU0jIowT0YcKor8YO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779654366; c=relaxed/simple;
	bh=gLZJmWH0rfyAbLdmrU5RYKc4BWO1Rh1KNpMAZD2rx/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e5sig7MnDNaKhPjFjA6keHw/elqNwTPXJzLGH2wQQFN43n2tXRFvP/gNOPpxYEfcTE3CIPrYoOtUZHNVIdQO4hJtsBwIpF9CL5ucNdp6dD1/BdOjeO5xMZO03dYGz1sUvwvt+5rJXgiyNTDrt2lOEZf2FhYTeyFbVJw9J4HFAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvRG70LL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15631F000E9;
	Sun, 24 May 2026 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779654364;
	bh=kDZQdx0V4ORVSnvj5YQgBwCeMJlhihGjLYyEJL2le2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lvRG70LLvT2JwbEMukCh4CI+t33SRUlZmpS7Ky+ttZxPDo+1IzCcMoigOb4fgJmXE
	 kQ9tEQu5g2jDjFZ73ALNDePZa1A/OiMBXp/PGLgjXK12qyhOIdKy78CYgESGWCy5vO
	 6zIGKsFyXSKCUz76MaTvem0XBU0VHmcXdhTDyP3PfRPYfkXbFvq5LsE/bnK8Wu86LM
	 yHiBBNnLTiPazFaGH0yLXF/COKD3OkqQAzQ1V3j6vExNLnvPiURngZgLsAmy+L6aUN
	 t1QJk9s3lkeM2DwNw4S0Bk3wbFdQw2gJGoos/UBk2BzALymCITlAZrfExXpydTGqe+
	 KE2w1p8sFdLUQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH v9 0/9] Allwinner A31/A83T MIPI CSI-2 and A31
 ISP / Platform Support
Message-Id: <177965436154.163755.7683015392753567325.b4-ty@kernel.org>
Date: Mon, 25 May 2026 04:26:01 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62688-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[magewell.com,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C746E5C4225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 17:33:29 +0200, Paul Kocialkowski wrote:
> This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
> as well the as A83T MIPI CSI-2 unit in the respective device-trees.
> Overlays for the BananaPi M3 cameras are also provided as actual users of the
> camera pipeline on A83T.
> 
> The corresponding drivers and dt bindings were merged a long time ago but this
> series was never actually picked up. It seems more than ready to be merged!
> 
> [...]

Applied to sunxi/dt-for-7.2 in sunxi, thanks!

[1/9] dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
      https://git.kernel.org/sunxi/linux/c/4543300b2d55
[2/9] dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
      https://git.kernel.org/sunxi/linux/c/bdf22efc6cb2
[4/9] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
      https://git.kernel.org/sunxi/linux/c/3c6867908ecb
[7/9] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
      https://git.kernel.org/sunxi/linux/c/4fc5086a3d99

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


