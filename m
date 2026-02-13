Return-Path: <linux-media+bounces-52707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GbzAjvujmk5GAEAu9opvQ
	(envelope-from <linux-media+bounces-52707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:26:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AE134713
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FB1C304A598
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E28734D4FB;
	Fri, 13 Feb 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VTOkrQjJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E833ADB3;
	Fri, 13 Feb 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974734; cv=none; b=cAxAZqPjmvb6p7iJ//F/N2fpRc0QqvFA8hvrla5PltgaFwUqqGl/B+XQuWbhAnYiVLdcmwOBg+G/wrDLUpv+qHloJZyLJJnMf7H8/9HD2Q2K6HxRL/pe1WmefRmbTXLotHlU8ZaJOnltkgkK0S18YFtKe9R0l3g6QOqlU+UD0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974734; c=relaxed/simple;
	bh=G5uVfiHvpJL7gGWEE69leLa5qM6BlavB/hM9VB1DZnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6njQ6/3MPyHTg4cNkjsydzgxrPWhpbR614J05c6g8T02ygmGohkiwYnt3Hd1/GM4Lj2vuHLmRPhd2Rd4bTJZTXg+Z3RpdMd2KWGPBCD6lZlxgkEtUab6aWSe28fho64/aQyPC6tuIm+8J6E9SwVdLpSEifo9pfSH7AeaK9G2mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VTOkrQjJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770974731;
	bh=G5uVfiHvpJL7gGWEE69leLa5qM6BlavB/hM9VB1DZnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VTOkrQjJfHt53FBmeh4TZceysttLfR6T/agUdUWq8bavGxs1gHSKaS5OamqBMHmAy
	 UQ+JnnfJVwJDdLYdmdfKn4loOzu8y1oNVDqrjZimuck2GrCFSLYnhW1Ig6lR2gxM58
	 c387nPyYx+gFMcBvfRh3AuXJwFTQQb3NZjcl5Y1+2onXga3PBQcdew4wVb9gttu5vg
	 bOws3sNAXwv138v3CGWVu7J+vip9ZOQbBP8o0MBH3Sj+Dqb588T3FADYS8YXg2zCdo
	 xxRet0yJJ1yEGYBdxDc4bMJN6k8VS43OO/KINDkchQw9P8E6mBeo62UC/1lSMhc+co
	 0Yfyc3kobPuzw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D2DA17E12C6;
	Fri, 13 Feb 2026 10:25:31 +0100 (CET)
Message-ID: <1de39897-7e7b-4c49-963b-9fed48dacc81@collabora.com>
Date: Fri, 13 Feb 2026 10:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: synopsys: use
 devm_reset_control_get_optional_exclusive()
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-1-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-1-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52707-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 694AE134713
X-Rspamd-Action: no action

Hi Frank,

Thanks for the patch series.

Could you use "media: synopsys: csi2rx: " as prefix for your commit
messages?

On 2/10/26 18:11, Frank Li wrote:
> The DW MIPI CSI-2 RX is used on different SoCs, not all of which provide a
> reset controller. Switch to devm_reset_control_get_optional_exclusive()
> to support such platforms.
> 
> Reset presence and numbering are validated by the DT binding.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With that change,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 170346ae1a599e43bba9d19476ee4d65124303bd..0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -639,7 +639,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(csi2->phy),
>  				     "failed to get MIPI CSI-2 PHY\n");
>  
> -	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	csi2->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
>  	if (IS_ERR(csi2->reset))
>  		return dev_err_probe(dev, PTR_ERR(csi2->reset),
>  				     "failed to get reset\n");
> 


