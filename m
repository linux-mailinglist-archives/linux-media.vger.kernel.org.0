Return-Path: <linux-media+bounces-51645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPNjMa+qeGl9rwEAu9opvQ
	(envelope-from <linux-media+bounces-51645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:08:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A49408A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04328304B5AB
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B76B34CFB7;
	Tue, 27 Jan 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dngHkLiE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A13019B2;
	Tue, 27 Jan 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515649; cv=none; b=qWurmZbnmz+U5laF17Yws/1xKYXd4A+Lj9RByrgARsjw/k6q1Tt9jwr0WQ4yRZtL7mTDBmU1Aw/V9Yv8mQEg5MpL8jqnhsd48p9ZvKFwhgsgSMGr3H91kCKPUFR1V4EQ3lybHbF45luk1sb7HZkNPL3woKpXgps0mhIOtAtBnjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515649; c=relaxed/simple;
	bh=P7VS3Al0RQDv6ZHGjp7sc2q4SgL0CMQgVMIFKTcrfls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DW0ET9hBA9cDnGbvAvZfecP5BQIUw8a0TrVr/eBumwSgdfUnGpsZnlIu1RnATcxv8UjMxJu9iDyH6tZYwMIOuSjpdlyoqEjNlTRZ2CzY0gf+g2dxWCssDyRgux6VKfEZnusm9ss4eFxuetvYOya7XsR5bSlBFaugm2fa5JeqXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dngHkLiE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769515645;
	bh=P7VS3Al0RQDv6ZHGjp7sc2q4SgL0CMQgVMIFKTcrfls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dngHkLiEeytzFEKz9kO6puBwGrTvnznyFgqpSa6JL3fp5GnOEdp8a51lxLR5q+8Q0
	 YgpMDN6aH/DAeVSDcRyaUhXGdb1SiQ4CEW2u0jieJDFLgfYWU3kMzXAcY6w72MxK8/
	 C3KR0xg4aYjn6GkLC9WHFrG8PuaIdA7dLoH/mAVwYYE8j3suPCAuTxnZWpa4ZpiEVL
	 1FJFd16MsUOKBaAufPMCfNqmtyd2zhZxeYjh5+wG+iyGV52Memfb9IzP0UekJVahls
	 rbBKZbthdudmIqFSRxssfXIVHX5HYTYWkLuUfhGUocmNo4lnDaMrQRd5zaqPPi5toE
	 GorymRfQ5SEow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C00AB17E0182;
	Tue, 27 Jan 2026 13:07:24 +0100 (CET)
Message-ID: <558d1cbf-1765-49b7-acbc-f38d448d0411@collabora.com>
Date: Tue, 27 Jan 2026 13:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] media: mediatek: vcodec: Add VP9 Probability
 Size Configuration
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
 <20260127024248.18406-7-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127024248.18406-7-kyrie.wu@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-51645-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 727A49408A
X-Rspamd-Action: no action

Il 27/01/26 03:42, Kyrie Wu ha scritto:
> This commit introduces support for configuring the VP9 decoder
> probability buffer size. It removes hard-coded values and ensures
> chipset-specific buffer sizes are handled dynamically, improving
> maintainability and alignment.

Depending on how you see it, the buffer sizes are still static, as those are
defined in const structures and never change during the entire driver life.

Also, never start a commit description with "this commit" - as it's implicit
that you're describing ... this commit.

Moreover, the hardcoded values are not removed - they're just hardcoded in a
different way - as in, they are now hardcoded as a possibly different value
for each decoder.

A better description would be:


Introduce support for using different probability buffer sizes for different
stateless decoders: in particular, the VP9 decoder can use a different size
on different SoCs because of different hardware capabilities.

Move the hardcoded single probability buffer size value to decoder params,
introduce a new VP9_4K_PROB_BUF_SIZE and assign:
  - VP9_PROB_BUF_SIZE (2560 lines) to legacy SoCs; and
  - VP9_PROB_BUF_SIZE (3840 lines) to newer SoCs (MT8196, MT8189).


After which...
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 ++
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c  |  1 +
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 10 ++++++++++
>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  4 ++--
>   4 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index f38b5dc4bb74..08cc65054de5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -80,10 +80,12 @@ struct vdec_pic_info {
>    * struct mtk_vcodec_dec_params - decoder supported parameters
>    * @level: decoder supported vcodec level
>    * @profile: decoder supported vcodec profile
> + * @prob_size: vp9 decoder probability size
>    */
>   struct mtk_vcodec_dec_params {
>   	s64 level;
>   	s64 profile;
> +	size_t prob_size;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
> index a47906b9d717..99c252e0a2e1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
> @@ -630,5 +630,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size = 2560,
>   	},
>   };
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> index b571c4ed3f79..ca39ae3571a3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> @@ -10,6 +10,9 @@
>   #include "mtk_vcodec_dec_pm.h"
>   #include "vdec_drv_if.h"
>   
> +#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_4K_PROB_BUF_SIZE 3840
> +
>   /**
>    * struct mtk_stateless_control  - CID control type
>    * @cfg: control configuration
> @@ -841,6 +844,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size = VP9_PROB_BUF_SIZE,
>   	},
>   };
>   
> @@ -892,6 +896,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size = VP9_PROB_BUF_SIZE,
>   	},
>   };
>   
> @@ -910,6 +915,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size = VP9_PROB_BUF_SIZE,
>   	},
>   };
>   
> @@ -928,6 +934,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size = VP9_PROB_BUF_SIZE,
>   	},
>   };
>   
> @@ -946,6 +953,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size = VP9_4K_PROB_BUF_SIZE,
>   	},
>   };
>   
> @@ -981,6 +989,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size = VP9_PROB_BUF_SIZE,
>   	},
>   };
>   
> @@ -1011,5 +1020,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
>   	.vp9_params = {
>   		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>   		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size = VP9_4K_PROB_BUF_SIZE,
>   	},
>   };
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index 82e257bd059f..e8ba99d31e74 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -22,7 +22,6 @@
>   #define VP9_RESET_FRAME_CONTEXT_ALL 3
>   
>   #define VP9_TILE_BUF_SIZE 4096
> -#define VP9_PROB_BUF_SIZE 2560
>   #define VP9_COUNTS_BUF_SIZE 16384
>   
>   #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -546,6 +545,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
>   					       struct vdec_vp9_slice_vsi *vsi)
>   {
>   	struct mtk_vcodec_dec_ctx *ctx = instance->ctx;
> +	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
>   	enum vdec_vp9_slice_resolution_level level;
>   	/* super blocks */
>   	unsigned int max_sb_w;
> @@ -616,7 +616,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
>   	}
>   
>   	if (!instance->prob.va) {
> -		instance->prob.size = VP9_PROB_BUF_SIZE;
> +		instance->prob.size = pdev->vdec_pdata->vp9_params.prob_size;
>   		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
>   			goto err;
>   	}



