Return-Path: <linux-media+bounces-51648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMX1NCmreGl9rwEAu9opvQ
	(envelope-from <linux-media+bounces-51648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:10:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E9940F4
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B41D307FC3F
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6473D34DB4C;
	Tue, 27 Jan 2026 12:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qLVmcoEF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C7238178;
	Tue, 27 Jan 2026 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515654; cv=none; b=XToMk0j6dGBYlvvAJyL1sGarMLyAErY+5LkcH0Ap3/kj78iKumeANf3tQVqUH2Eg/jlqePlwDZRqs8bQx09YmrmEs7BRRGhQXXJkv/UESXCVhHf0B4cKCW0R1KsOaL+HsKPPNuuAFnFE4vpAQTHqI2obIAJM2lus0u+LURohUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515654; c=relaxed/simple;
	bh=70+/DNYrFggN9eDfMpR3kzVs+VVxrYy4X0zpC3rdZ6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3Bi/X0Eq8bflpsm5emEL+D+MP0r495I2LE9jN1iJW772Ju14WoROZZxFmbuQTSNo+WpOeU57eopSUSRV/pZbImc59BUUL3FAbvZ+IWKNxAH3LbJc6jSgQQw+d2tG+v3z3Cwd1FE9ALnVG7q5nxGsnSycPVM8rVXIZmfjDcGRIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qLVmcoEF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769515649;
	bh=70+/DNYrFggN9eDfMpR3kzVs+VVxrYy4X0zpC3rdZ6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qLVmcoEF9ontFd7As8dWp2/kIT1cZWICwvigRIgKmDifiJcaBhxa6usfq7tK6rS9R
	 UPz3DbYlgs5/hekWcJhJC2MAftQdp8ZWNoxbYsFMDUSqowgOqSNTEZkMhXd/HEOMAt
	 JdbzaBBlMQjhKQKTxv+M0up+XkjLOAvlARBq0x6+iUMzrgpRIf9Lp/YfQ2R+W4bW9G
	 AV4H84TC2KwJqCYr7PEQvi+qKtsFw7yClDNemDAE9k9pU78pkbUtfUSOUVuuVxO1qo
	 /YZHOME7Sz6rAZm2p4he3nP2h8UL9lrxslINiy4O5wgY3Pz8SFhpHmOFcIPiBAOAJW
	 nQScDpmIyFHxw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2517217E13C4;
	Tue, 27 Jan 2026 13:07:29 +0100 (CET)
Message-ID: <069a1c90-9592-41f2-8f45-707231f782f6@collabora.com>
Date: Tue, 27 Jan 2026 13:07:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] media: mediatek: vcodec: add decoder compatible
 to support MT8189
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
 <20260127024248.18406-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127024248.18406-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51648-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,xs4all.nl,collabora.com,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Queue-Id: 2F9E9940F4
X-Rspamd-Action: no action

Il 27/01/26 03:42, Kyrie Wu ha scritto:
> MT8189 is pure single core architecture. Add its compatible to
> initialize platform data.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.h   |  1 +
>   .../vcodec/decoder/mtk_vcodec_dec_drv.c        |  4 ++++
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c  | 18 ++++++++++++++++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> index 80cb46f1cded..2bde871c0224 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> @@ -71,6 +71,7 @@ extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index c7af48f684c5..8f52e002a51e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -555,6 +555,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
>   		.compatible = "mediatek,mt8196-vcodec-dec",
>   		.data = &mtk_vdec_8196_pdata,
>   	},
> +	{
> +		.compatible = "mediatek,mt8189-vcodec-dec",
> +		.data = &mtk_vdec_8189_pdata,
> +	},
>   	{},
>   };
>   
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> index 0745bc3ee490..aba28d276bdf 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> @@ -968,3 +968,21 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
>   	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>   	.chip_name = 8186,
>   };
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
> +	.init_vdec_params = mtk_init_vdec_params,
> +	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
> +	.vdec_formats = mtk_video_formats,
> +	.num_formats = &num_formats,
> +	.default_out_fmt = &default_out_format,
> +	.default_cap_fmt = &default_cap_format,
> +	.uses_stateless_api = true,
> +	.worker = mtk_vdec_worker,
> +	.flush_decoder = mtk_vdec_flush_decoder,
> +	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer = vdec_get_cap_buffer,
> +	.is_subdev_supported = true,

You introduced `MTK_STATELESS_DEC_DATA` in the previous patch... and you should
use it here too.

Cheers,
Angelo

> +	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name = 8189,
> +};


