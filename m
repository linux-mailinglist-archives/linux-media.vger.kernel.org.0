Return-Path: <linux-media+bounces-51709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AGcNx8ReWmHuwEAu9opvQ
	(envelope-from <linux-media+bounces-51709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 20:25:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CC99C42
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 20:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EAE3055433
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 19:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6349136CDEA;
	Tue, 27 Jan 2026 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k6GRqBcP"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C536C592;
	Tue, 27 Jan 2026 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541902; cv=none; b=lSoRaMI1vobkaz3Um/BCBTyJxROQMhWeFkoFx42jrLuCu0TuyF1unYbN2OK9VQaNKR9HZMNh6R75QvVoM8RLErbfMG7Pvr7fENwo9cPsXLGx1hDdLQBI94bubmB5ZWQiX0nBF299l89wMDB6d4KjbLLd9MlHMB3XU5hFiX7iDWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541902; c=relaxed/simple;
	bh=VI+U/3gIahN2vxRen/hq+mnog+t1Oyg9GTlM82wFYzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJJIVmi0P/N6CR7/svtgcemZOJdKS1Fpv1Fa7ARGM+610Bu33wQOMKWNT+rlSoi+pK5qKk4VgDnCjeEoRGpSnL89rhMACFEEtyvAFqA560PVgAK4dMHFQrvMurIGbrTVDdBuoavn53alLwPBpNZ0ND7k4lvK6KFIxbillHttdHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k6GRqBcP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769541899;
	bh=VI+U/3gIahN2vxRen/hq+mnog+t1Oyg9GTlM82wFYzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k6GRqBcPqIUFaXwDZbZKtGVOq2dxJG3DEHlbBaF3SvkU17o12K6ZWvRwrW8MOAXPj
	 MsV0VdrmBQDJ0hQfPkK/OYSuAAAKGa8DAa+p3ifkJ28I8wcnIVTAaTbdjc4h1+d/bS
	 kMZD6mTQzg50XpMRnUnHy+KfWziE+Zdckjodmogj6U5xqgcCMSg5doXBMEnGQEr4Z4
	 eJ1+jXPdMZqVjPQWIp2I1g3xtaxVghoW3em4D9RQckS+jzbvHtqE6bapbQPPkz9MY1
	 gi7yRS2WXGcf/vRKeQs/qy6k36rqKlu0dQOx+aFsFkYAI6RxDN8+/ZHZ8SOei5Mkcd
	 quknDZkyiwOHA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3DC517E10E0;
	Tue, 27 Jan 2026 20:24:58 +0100 (CET)
Message-ID: <d3b9fe8c-688f-48a2-aa00-2f640dec079e@collabora.com>
Date: Tue, 27 Jan 2026 20:24:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: VIDEO_DW_MIPI_CSI2RX should depend on
 ARCH_ROCKCHIP
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <02ef452575fda61ca1d5d54086fec1223e3421a9.1769540923.git.geert+renesas@glider.be>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <02ef452575fda61ca1d5d54086fec1223e3421a9.1769540923.git.geert+renesas@glider.be>
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51709-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 856CC99C42
X-Rspamd-Action: no action

Hi Geert,

Thanks for the patch!

On 1/27/26 20:10, Geert Uytterhoeven wrote:
> The Synopsys DesignWare MIPI CSI-2 Receiver is currently only supported
> on Rockchip RK3568 SoCs.  Hence add a dependency on ARCH_ROCKCHIP, to
> prevent asking the user about this driver when configuring a kernel
> without Rockchip platform support.
> 
> The dependency can be relaxed later, when adding support for appropriate
> SoCs from other vendors (if any).

No objections from my side. I kicked out exactly this line when I moved
the driver from rockchip to synopsys, as I thought there shouldn't be
any Rockchip-specific bits.

Cc: Frank (since he aims to build upon this driver IIRC)

> 
> Fixes: 355a110040665e43 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

AFAIC:

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Regards,
Michael

> ---
>  drivers/media/platform/synopsys/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> index e798ec00b1897560..8d0f5e3e8cd58eab 100644
> --- a/drivers/media/platform/synopsys/Kconfig
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -4,6 +4,7 @@ source "drivers/media/platform/synopsys/hdmirx/Kconfig"
>  
>  config VIDEO_DW_MIPI_CSI2RX
>  	tristate "Synopsys DesignWare MIPI CSI-2 Receiver"
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on VIDEO_DEV
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on PM && COMMON_CLK


