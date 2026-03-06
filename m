Return-Path: <linux-media+bounces-54804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKfvKgDtqmmOYAEAu9opvQ
	(envelope-from <linux-media+bounces-54804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:04:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7ED223615
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F4893051466
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4E93A9D8B;
	Fri,  6 Mar 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="awAroQae"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341127FD4B;
	Fri,  6 Mar 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809079; cv=none; b=NC5o3NWiHOSdUGzKX2CROSYTiWpq98g4j4btNQ5IgSVpEU/hUqXCFcPt/uCPW7448ya1sUtTvkGLUdV7DJMudFlUjTNZ6KhDvAHFyec5Qi3CYvRk9pD7L+1fDOSHbehjqjwk5rXF9cQi8o3MJe03kvz9YdAZD0NKKNiecj3gh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809079; c=relaxed/simple;
	bh=yu6vv2R9SJ+PnDaTdrxUkDMbR02bXycJ6cLyto26Y20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJajcQzYJi9qlDRoAvzI5r467fIKnqzHEqL4CWhhqAm1eSrIw7/BpJ463W7yVlWbfoy+5YOH8IFJoMQp9sL4ZZwxBFsQrQKGDH45kOP6zHzS2gt+ioxMHmugtvk3B7T86IqaBEiPoUb+Ykekz0T3BRt/Q2VjVpUvm2RtvCy9gXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=awAroQae; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772809075;
	bh=yu6vv2R9SJ+PnDaTdrxUkDMbR02bXycJ6cLyto26Y20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=awAroQaeyTB95H7iYydcBK5g7uM/HeGmS/K6Uu2S9E+52G15x4LWlCIElyo1TL9JO
	 mULejZRlwU1K0oGnrFQMowhMhs27oGmTK5YbI83ofkTdaSlZbLHLcHveBSZ4tNGIx/
	 Gkm8mJXcU7VcfoqnkGgVjJ9a1xUoOYizTJGMVE0F5MZRqGALet8wvD+FAcaU1avBPc
	 N/6Hjti4XJsZttGKukWl5qbW+awdBaw7B8FmqPVBpQHyclDCw7Ee0SySxvPukwAB3v
	 e16FLZcOkuD//1aBRTFbFrp2oJMMrWUjF6MnNIyskY2JhqNtQfIbipDijmAs8v8k8e
	 GT+0CigeLTv8g==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8125B17E0D98;
	Fri,  6 Mar 2026 15:57:55 +0100 (CET)
Message-ID: <0c99cfc9-a101-490b-a1db-45a9691b61b8@collabora.com>
Date: Fri, 6 Mar 2026 15:57:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: fix link failure against
 GENERIC_PHY_MIPI_DPHY
To: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260306144507.3449000-1-arnd@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260306144507.3449000-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D7ED223615
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
	TAGGED_FROM(0.00)[bounces-54804-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Action: no action

Hi Arnd,

On 3/6/26 15:45, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver uses the generic mipi dphy driver but is missing
> a Kconfig dependency:
> 
> ld.lld-22: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
>>>> referenced by dw-mipi-csi2rx.c:240 (/home/arnd/arm-soc/drivers/media/platform/synopsys/dw-mipi-csi2rx.c:240)
>>>>               drivers/media/platform/synopsys/dw-mipi-csi2rx.o:(dw_mipi_csi2rx_enable_streams) in archive vmlinux.a
> 
> This is in a library module that needs to be selected by each user, so
> add the missing 'select' here.
> 
> Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch, but this issue has been addressed here [0] and I
think Sakari has applied this series already.

Best regards,
Michael

> ---
>  drivers/media/platform/synopsys/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> index e798ec00b189..bf2ac092fbb3 100644
> --- a/drivers/media/platform/synopsys/Kconfig
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -7,6 +7,7 @@ config VIDEO_DW_MIPI_CSI2RX
>  	depends on VIDEO_DEV
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on PM && COMMON_CLK
> +	select GENERIC_PHY_MIPI_DPHY
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API

[0]
https://lore.kernel.org/all/20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com/

