Return-Path: <linux-media+bounces-52568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gALqLgAmjGnjiAAAu9opvQ
	(envelope-from <linux-media+bounces-52568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 07:47:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152F121B01
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 07:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20956303DF55
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 06:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C693315D28;
	Wed, 11 Feb 2026 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKotFZSc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E8A2DFA25;
	Wed, 11 Feb 2026 06:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792438; cv=none; b=T/i+/awE5n6ycIk9oMKEeWipHDU4ZV9xlBKvKYfQ/g9DML1pkfU+wwEcXPQtcSZLTOdi96qTZ3V1e7M4kmm+bdakNkbl2+z51csGB450SBi7R8Pj2ic4p50yqO6Drn+vRFeL54WKlFYsf7I9vGw6t3kT4GWHa9N1qWaoZpjo+cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792438; c=relaxed/simple;
	bh=D39DBVuYgmIqcUJ5WRCSy4xXOe9xyGcoG2v7vm14CAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv4HpdR1EaA7gw+zQiVhL6pRDAnIF1wcpmcnG5yAp82vYLMUAwjLrioEZBw/aseHmYFZHX86sjVVxb/SAemLCMQ4m5PHsO4pRCVv/hdn5N2lwHm0zj9bA6bT5pPg9ruMwOn5f57XYuN2AoOeA4kqLq7kZr7tiXcdwz6fmdCF20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKotFZSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAF5C4CEF7;
	Wed, 11 Feb 2026 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792438;
	bh=D39DBVuYgmIqcUJ5WRCSy4xXOe9xyGcoG2v7vm14CAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKotFZScyMprPsBLEJTJD4lj3XdUBAZuOt4X13Iwha2YeV7f/pWZ0yuPc+JGGQc+Q
	 maQUwcmbsTrwvpO7qBBOhEZ4Z4sH3xemDzfigZ8nxdO2mRQABtVMj4U25zYJNC95uO
	 OMoRFCiHxYXzxcoQFK61Nf+DFQhxZ9M/0cb6Q2Aae6FtgNFaCX8iellA1cB/XIxtxo
	 g1R6CGsl96a80EV48V58qtDlKl90vavUmEEqF/pwgpfTPssXHaOSf1McXnUAET6Xog
	 0hS+hQPnk2N2ohDdb0GpGYfgr2RySSFxA1Aw29E+UBHtrvEi6baFjpK0rupG6lSkn+
	 /DHGQLhVtEDHw==
Date: Wed, 11 Feb 2026 07:47:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
Subject: Re: [PATCH 5/6] media: dt-bindings: add NXP i.MX93 compatible string
Message-ID: <20260211-notorious-crow-of-lightning-627b63@quoll>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-5-69667bb86bfa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-5-69667bb86bfa@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52568-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 4152F121B01
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:11:12PM -0500, Frank Li wrote:
> The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
> Rockchip RK3568 implementation.
> 
> The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
> "fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
> rk3568.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


