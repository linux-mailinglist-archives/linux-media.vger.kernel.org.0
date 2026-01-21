Return-Path: <linux-media+bounces-51185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCMRDciAcGktYAAAu9opvQ
	(envelope-from <linux-media+bounces-51185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:31:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276F52D41
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 119E5726E4E
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9673744CF4D;
	Wed, 21 Jan 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YHYrUhgV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DAB26B971;
	Wed, 21 Jan 2026 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980576; cv=none; b=RpazhlRyi1qbotYH/5abOY2mkHePYjz59Q+X/cnvF0LToyoZnxZOOdJzaTPD54OBcplKCgbg3W40rghzGaXtgzJLd+cM+7qf2p5m9WxuJCVeh0irbZ8xaCSEkgVbGg+rqg+PEFFplw8MWhmn8evb0020WiWOQ/OQaYPUpYeEAmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980576; c=relaxed/simple;
	bh=y9D3zqOejeIC2P8tmWoOAr1ltSyPEHTu0gBB47fi4ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcOTiwfutW7CawErKPhAG7teI9dlDS7Cu+B/xUuzIzV/lAj/20FVCG4BTKxZNyEbOa+YcGpKuSOIXgwVm8qriCaa831vFs8FKwcmcCtp3ffRf0+ENilaWGeV0rCObCfqI83v0DF8hko1y1DK0kLsKIHm6Uflhn1brwPDMxDvOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YHYrUhgV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768980567;
	bh=y9D3zqOejeIC2P8tmWoOAr1ltSyPEHTu0gBB47fi4ug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YHYrUhgVC1vHXdcaY3HihyQx+tBgkuUUdlEAI2+72KKq+GGPJqj7KWqnWCC/oIgKH
	 ua5tenLHessM0e8TIIN2bCc3nWb0HbniAIje+zJpnqbZzeuY2cPbznzeTY5etBi63h
	 /UM6oHIuIxzi8iUcdOsl+uEJCY/8BJYABuzUPNiaIWqWhT9tH/yL/eW3lM9h9PhVZw
	 sg0a9CIMfmZVdjogcx2sxIfBR+wlsdY9R5cfRyoPRSLoUhUL1APQpmA6gNIsueyeaT
	 4snc9MZHu285Eglwca5hxbq3Y6QgPN4DFN0dhkB27+DMnYQGBUYJUV29oKoJ56wUwS
	 ghI4u1cADgb7Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C16517E0342;
	Wed, 21 Jan 2026 08:29:26 +0100 (CET)
Message-ID: <2c0bbe6e-3328-438f-b9ab-8fe84fa87912@collabora.com>
Date: Wed, 21 Jan 2026 08:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fixup! media: synopsys: add driver for the designware mipi csi-2
 receiver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
 <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
 <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
 <aXAKHMjwVpWYUmp7@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aXAKHMjwVpWYUmp7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51185-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 3276F52D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 1/21/26 00:05, Sakari Ailus wrote:
> Hi Michael,
> 
> On Tue, Jan 20, 2026 at 08:35:17PM +0100, Michael Riesch wrote:
>> Make smatch happy by adding braces around the initialization in switch
>> cases.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>> @Sakari could you try the following patch? I think this should solve the
>> issues with smatch/sparse you mentioned off-list.
> 
> I don't know what went wrong but this won't apply.
> 
> Instead I made the following changes:

Yep, these are fine. Thank you very much for doing the fixup!

Best regards,
Michael

> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 29119a1a8d38..170346ae1a59 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -237,10 +237,8 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  
>  	switch (csi2->bus_type) {
>  	case V4L2_MBUS_CSI2_DPHY:
> -		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -
>  		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
> -								 lanes, cfg);
> +								 lanes, &opts.mipi_dphy);
>  		if (ret)
>  			return ret;
>  
> @@ -294,14 +292,12 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
>  
>  	switch (code->pad) {
>  	case DW_MIPI_CSI2RX_PAD_SRC:
> -		const struct v4l2_mbus_framefmt *sink_fmt;
> -
>  		if (code->index)
>  			return -EINVAL;
>  
> -		sink_fmt = v4l2_subdev_state_get_format(
> -			sd_state, DW_MIPI_CSI2RX_PAD_SINK);
> -		code->code = sink_fmt->code;
> +		code->code =
> +			v4l2_subdev_state_get_format(sd_state,
> +						     DW_MIPI_CSI2RX_PAD_SINK)->code;
>  
>  		return 0;
>  	case DW_MIPI_CSI2RX_PAD_SINK:
> 


