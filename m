Return-Path: <linux-media+bounces-52710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMvwMA3xjmk5GAEAu9opvQ
	(envelope-from <linux-media+bounces-52710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:38:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82C134912
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9B8E31171C8
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF7334D4DF;
	Fri, 13 Feb 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WF6UIG1L"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A734A3D2;
	Fri, 13 Feb 2026 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975321; cv=none; b=jVoiv2hTd0TGyPN10GGml8FVx73aR/ne8fLpF+gtmBjAebqSSFygDt+pkDOM9S6uL43bntcmWT4bNBfbNqzm7NsrEf8i6Z64oFhQumF5ERRR7t6naGtHTNNZ68FIFFlsnDouWbWhosRLT1PstmZl+iMtg2qir2uitFtqnp7SZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975321; c=relaxed/simple;
	bh=f9czAYBnY4F1mb2qB92X9nU6lRz+eaOYt/gVPcytyK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyX4zgKvhiyKM+GHmPdrL/DFzP3qIvtRa45aHjgE19RbJRybpv0/XVYB+9W/+MY4DBwlpOdgCVi6jw4HsUTvIx3FRlJ3GTEXOfmU/dBJwhGj6zONNNZncgnPOoSDXOS4OOi3MsKSAEv9uoQTdOFrMQVFG+FgPhB/T/EW0g6HkVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WF6UIG1L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770975318;
	bh=f9czAYBnY4F1mb2qB92X9nU6lRz+eaOYt/gVPcytyK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WF6UIG1L/DlR4lhHsHYVWBoyIIbWGoqF7Za+PgATHTvvIW7tKTp5QLlfltd4S0alo
	 8yYP9PCnSjAjrbpuP/8PWMnSCOCNLqRresRVB2pO8Ac4I+qo92a5czKysIEBmAnRh6
	 qGqVUPNYVcvE8YrLf4Cumf4MqgQL7i2ki6ZHOFna+ETtfye5KfEamjqH9VeVunrJUi
	 rOsqxyFxPzE00DR0b7DzFJ5CsAWc4yZMDEMhxDduR9CbSF8CLVAe2dtA8MNh+4gbfv
	 J/gkLKVBtwgEJSKNKu7iW3ZM1SwmKWjLmU9R3OrPH/zs7TrnrNaMiph0OUx4HaKvj9
	 M4XzZzruB0zRw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 019B217E00AC;
	Fri, 13 Feb 2026 10:35:17 +0100 (CET)
Message-ID: <c58b5662-6785-4605-9832-f7c4704c33ba@collabora.com>
Date: Fri, 13 Feb 2026 10:35:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: synopsys: only check errors from
 devm_clk_bulk_get_all()
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-2-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-2-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52710-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 2F82C134912
X-Rspamd-Action: no action

Hi Frank,

Thanks for your patch.

The remark w.r.t. the "media: synopsys: csi2rx: " prefix holds for this
and all the other patches in this series as well, of course.

On 2/10/26 18:11, Frank Li wrote:
> devm_clk_bulk_get_all() returns all clocks described in the DT, which are
> already validated by the binding. Do not need enforce an expected clock
> count.
> 
> Only check for error returns (< 0) to support more SoCs.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7..61cd7f491b3d5b8a37707b23ca03ce709b40a79f 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -630,7 +630,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  		return PTR_ERR(csi2->base_addr);
>  
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
> -	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)

DW_MIPI_CSI2RX_CLKS_MAX is not used anymore, please remove.

With that change,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


> +	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
>  	csi2->clks_num = ret;
>  
> 


