Return-Path: <linux-media+bounces-62686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP5JCFNTE2qB+gYAu9opvQ
	(envelope-from <linux-media+bounces-62686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 21:36:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C95C3C4B
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 21:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3DAB300C91F
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 19:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1707315785;
	Sun, 24 May 2026 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3kATJU5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401C30C14B;
	Sun, 24 May 2026 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651377; cv=none; b=T0RDDDdDT3jYGBaM2/Cej34bjvEdg7cwt3K3/NqypmmxY6cw3aqv3kBIVKYerQCQEqN46SxUSYrg68kgFyoDj561sT3Sb1fM9FqTv+FXig7/Moa2sGVVeToOOzmUi7fDcE6e7b4hO/FopQjdcazMoiXNOQh38n1mPf2mWBfqN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651377; c=relaxed/simple;
	bh=pwoE/4OdPgY3kOKcEkMurBcwFJF93A8G8YsharzaYcM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TSTuxNIA1v66AAj+MpmAYJAymBhu0L5dh6hQqqaxAMPqeTnxbIQMLeA+/ZH3hk91hwNgnB+LmhY2tTY/nM6+oeEaQmcf2gEseJcRMGE8P3KBnhoizY5Sl/IVm0gGhRd2L9uFXNfn7jbMNUU6kAc+TavuNM1dmr6G7Mng9FrmybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3kATJU5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E931F000E9;
	Sun, 24 May 2026 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779651375;
	bh=r0Kn4NGTEBvYvSppdtEhlAPBMULs4K0n5D5V+p+MP10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e3kATJU5wCp1elAKPsF+pwI0r3IZPzNvgIXNIWYUQhOReywzbnaOAZm3PYjIQdBUO
	 nE0WX/tkZ8B/qFkILHvUKtC18Z43nLt8RgW+nAvRXmux1/ZHca7h3cOQeGCJ3qqgJr
	 JIZbVO7YdqsrRlhpgn4pGXk+BXerbTPWej0LjnRXg8yIk6pn0WcPdOi+WKfwq1pF1Q
	 1PMB4TCxtxF/w26OAP8Eu6afoMxz/t2VTpnmBo98BJGf5CoOiLnvxDelQNP1Mx7ZiS
	 lmTwfnlviaFrfdO1qGmkfiO7c8aSLQoitMLJ5DEM1uxz2LLrB590/CIIRuK4nsAoGi
	 dCOAzxhYtlwNg==
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
Message-Id: <177965137265.112804.8792823661852323201.b4-ty@kernel.org>
Date: Mon, 25 May 2026 03:36:12 +0800
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62686-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 646C95C3C4B
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

Applied to sunxi/shared-clk-dt-ids-for-7.2 in sunxi, thanks!

[3/9] clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
      https://git.kernel.org/sunxi/linux/c/356a74a9325d

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


