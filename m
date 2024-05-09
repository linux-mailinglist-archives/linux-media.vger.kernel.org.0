Return-Path: <linux-media+bounces-11192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DF8C0DD5
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 11:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C1F1F22103
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FC114AD2B;
	Thu,  9 May 2024 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="njHpLvDQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4047101E3;
	Thu,  9 May 2024 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715248476; cv=none; b=Guu6eaTEROBgKXlsQoj+TA/Kp8F63KXz3S3d4yjEJF201czMZ4Da+kGBeomFlVu5dbYTVgNsq6Ul4pZJYme7Dl93fWePXdaY53HGXwWmNEVHvPTy1pdCAUhP4ymSxNCWe4b613Q0rZd2QUzR5MNdVvN6Bjl/PpKO6nBmOVUf6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715248476; c=relaxed/simple;
	bh=vlum46Tb8PK1ROm2H5JtmPI6YiTvRNegUq7mRooArb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBilxlkS8ZkAg5+KwBg4vdsHY+tSGFDjhMjXL2KuV3Pca4eGFFJY+WSlh1IMgiiDqAwCwCTysmt2EBlO5yE6Ui11zHqf4e50pEVHLVVaH31u2dareE/Wcis5gPQ7m7w0mD48jBZ38NdGmBf+x0108JkyL15Kz79vufA2RsFoZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=njHpLvDQ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715248472;
	bh=vlum46Tb8PK1ROm2H5JtmPI6YiTvRNegUq7mRooArb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=njHpLvDQoHLR62SJqkphCa4t2y6tge0nUhsPjiEp71pkNWsyrAN9BxUS304Kx7X7p
	 gNzc+DR86MGpZTq+PcN5NGK7RqX1XBRruJSACmb0wweYeaAXtNL9djgi9y32NYf7Fp
	 z7IBKnI5nwAd7fhzO8nGjt/Kl/UTDQaQRXAETNW7sYcIYYl3xj6ufid1lfBQmy9dOr
	 1JKijGa9ezVTF6Aj3opG0KkReV/MAVHTvZx24CDxcp7a9nysq14/ymKDQ+MAVnSeez
	 9hsjM1FNr3fdjZEE7DZu18QYbwQvt3fFVSNeBM7HbE06eEI+geyYFFWJQoOCfG+UVr
	 1szJShnvwrpvA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C518637820FA;
	Thu,  9 May 2024 09:54:31 +0000 (UTC)
Message-ID: <2aefd938-f70a-4133-a3a8-9c96464c9f5f@collabora.com>
Date: Thu, 9 May 2024 11:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: mediatek: vcodec: add decoder command to
 support stateless decoder
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240316081344.4262-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240316081344.4262-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/03/24 09:13, Yunfei Dong ha scritto:
> The supported decoder commands are different for stateless and
> stateful architecture. Add stateless decoder commands to fix
> the v4l2-compliance test error below.
> 
> Codec ioctls:
>      VIDIOC_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>      VIDIOC_TRY_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>      VIDIOC_G_ENC_INDEX returned -1 (Inappropriate ioctl for device)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>      VIDIOC_DECODER_CMD returned -1 (Invalid argument)
>      VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>      VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>      fail: v4l2-test-codecs.cpp(126): ret
>   test VIDIOC_(TRY_)DECODER_CMD: FAIL
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Nicolas, Sebastian, anything to add?

Cheers,
Angelo

> ---
> changed with v1:
> - remove the static function prefix.
> - fix some messages not reasonable.
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 60 +++++++++++++++++--
>   1 file changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index ba742f0e391d..c2b64a528028 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -80,21 +80,18 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_dec_ctx *ctx,
>   	return &ctx->q_data[MTK_Q_DATA_DST];
>   }
>   
> -static int vidioc_try_decoder_cmd(struct file *file, void *priv,
> -				struct v4l2_decoder_cmd *cmd)
> +static int stateful_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>   {
>   	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>   }
>   
> -
> -static int vidioc_decoder_cmd(struct file *file, void *priv,
> -				struct v4l2_decoder_cmd *cmd)
> +static int stateful_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>   {
>   	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>   	struct vb2_queue *src_vq, *dst_vq;
>   	int ret;
>   
> -	ret = vidioc_try_decoder_cmd(file, priv, cmd);
> +	ret = stateful_try_decoder_cmd(file, priv, cmd);
>   	if (ret)
>   		return ret;
>   
> @@ -128,6 +125,57 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
>   	return 0;
>   }
>   
> +static int stateless_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
> +}
> +
> +static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> +	int ret;
> +
> +	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
> +	if (ret)
> +		return ret;
> +
> +	mtk_v4l2_vdec_dbg(3, ctx, "decoder cmd=%u", cmd->cmd);
> +	switch (cmd->cmd) {
> +	case V4L2_DEC_CMD_FLUSH:
> +		/*
> +		 * If the flag of the output buffer is equals V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF,
> +		 * this command will prevent dequeueing the capture buffer containing the last
> +		 * decoded frame. Or do nothing
> +		 */
> +		break;
> +	default:
> +		mtk_v4l2_vdec_err(ctx, "invalid stateless decoder cmd=%u", cmd->cmd);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> +
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return stateless_try_decoder_cmd(file, priv, cmd);
> +
> +	return stateful_try_decoder_cmd(file, priv, cmd);
> +}
> +
> +static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> +
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return stateless_decoder_cmd(file, priv, cmd);
> +
> +	return stateful_decoder_cmd(file, priv, cmd);
> +}
> +
>   void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
>   {
>   	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);




