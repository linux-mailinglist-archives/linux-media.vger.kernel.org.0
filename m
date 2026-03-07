Return-Path: <linux-media+bounces-54857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEDpEdpFrGlLoQEAu9opvQ
	(envelope-from <linux-media+bounces-54857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 16:35:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27E22C766
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 16:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CB9E301AD11
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146753A452C;
	Sat,  7 Mar 2026 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9RJ8MLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0547DA66;
	Sat,  7 Mar 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772897743; cv=none; b=krsIg4SFdzwuZXW60fqkPvWwoUWaHmfq2oTZ9Hg+Rzz7vLeN7bcGcb5AZeMJF/oJbfJbfMnFvW2BZEhHJXoyhY6dy0+WKNT4JWy8hWu5Sz3b97abPGNuFQ4SUsf1LwduJOV7r3qFSuxg5ltsCP1y7Men5W2uZwaA9yE9P+gQpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772897743; c=relaxed/simple;
	bh=RhsV1o0tx6qDW0oNLBHCTGUNLy9Nze20CKSCrkhYlSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq81+WlnPlJfmVmSFRyrPY0oChyrkBU63iG5FkYQGwOGVONbpUTLve6LvaUW5tzH3ZAFzM8nlMZRcqKanrYiitOSsJ8Gn16V9ezYCFzTZItZf+GGSudENTtIMeRT1QcAHBlcikPXtU7D/fK2KIwOqaWof13G9GaZ7KO4itRB9mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9RJ8MLJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC06AC19422;
	Sat,  7 Mar 2026 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772897743;
	bh=RhsV1o0tx6qDW0oNLBHCTGUNLy9Nze20CKSCrkhYlSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9RJ8MLJbnpuO7ZK/6PWRfHB1qsnnaavMYfpbJTU95QdDTTrXGNK2waRGplZ/SNCV
	 1jwaE5YWYpJb58W/RJAyHnMw1264Agd78+A7GsCqbNAQjG+OjWUwnR0z7IwmlpkV6n
	 y67g+L+emeLezYdrdXqpQYcc4YcHYlekIvCAvYDxzWnipFxQ1O+H6g2rHRkbo/LtmJ
	 XmieY7PiDV0buFrf7kjA0dZo4nyzEwdlCsp/QD+tgF3uxdskhbdxoMqVojEi8ObCeq
	 TmQrKX2BuoXNYgb2hXcIQHcISNqT68RRzTYa5HN1geElgqrcJrqv8t+LvpIHrOuLr6
	 e0RVIKWPoSfIg==
Date: Sat, 7 Mar 2026 16:35:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: synopsys: csi2rx: add support for rk3588
 variant
Message-ID: <20260307-gleaming-loose-boobook-d75820@quoll>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-2-0cd8d2bf28c0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v1-2-0cd8d2bf28c0@collabora.com>
X-Rspamd-Queue-Id: DB27E22C766
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54857-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:09:49PM +0100, Michael Riesch wrote:
> Add support for the RK3588 variant of the Synopsys MIPI CSI-2
> Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 170346ae1a59..45ec815b0fba 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -609,6 +609,9 @@ static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
>  	},
> +	{
> +		.compatible = "rockchip,rk3588-mipi-csi2",

So device is fully compatible? Drop the entry then... or your bindings
patch is really not explained correctly.

Best regards,
Krzysztof


