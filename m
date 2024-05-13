Return-Path: <linux-media+bounces-11399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D1F8C3E95
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 12:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A9DAB22551
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A819149DF0;
	Mon, 13 May 2024 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F8LAzgVG"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF63148852;
	Mon, 13 May 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594808; cv=none; b=i+ih4RT0Ia/++A6dbXXJ5ZDJ9odT0yKb9UDxyYhwtdfyCzxKF+MRxpTH5gyzdRVA4VG05xV/T7usuNW4lGmeT1UjMwFZEObQfRfM5mZqi1oYe/AJ/A/HfnJVkN5y41JgBlMyVJY4imAvgSNcW/ONslV7jB7YUK2h/1Ex4Ey4VMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594808; c=relaxed/simple;
	bh=/u1BvXSx8Lv++d99CvsKZTPM/q6EViJhondoc5qg6x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vx7eTSPd9JnMl14kw7yNhJdktNuIlc4JecYD9NaveK72pzhB/XHL36TURit3wiN5yM73LMQeqf+RTCr5PdKY8UJEQB0nJh4HeI++Sg+5nakJy+GkR6I27catsu1iYSD7zC8dT7TPOILA2FDgRxr3l8pPQJm1+mJoNEwQeZ/pKvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F8LAzgVG; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715594803;
	bh=/u1BvXSx8Lv++d99CvsKZTPM/q6EViJhondoc5qg6x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8LAzgVG2QWlfeItmfkvpmY4lb36FXLrtoBmVNV6zOHshIVF5JvNOnY0EjSoYZ/cB
	 9vqpsx6KdLXL3qv7wVbVQYMbjYNUho0DIuKi1ADO583HUAvyzL9J5cWK1xxtKGGsfy
	 sOveSKRu8cQbvAbhSa8tRkoNsWT1xiQ8f6w7rlXJT77z98uERExQuJL+agD+67eabO
	 fcrgDRB3FimdtLIPYZh6Rwvp9stbx+lqHp/8jJ25ZFXLgyzouaRNNHJkOr7YhauaiI
	 dBEPGBhx2eI0ulcKy6erR41/+SVhL7PL1rNX6HFDGRX/SLu9Jm7SrCwj1hOLGF2mEm
	 SukvNpPBwi+sA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDE383782121;
	Mon, 13 May 2024 10:06:42 +0000 (UTC)
Date: Mon, 13 May 2024 12:06:41 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2] media: mediatek: vcodec: add decoder command to
 support stateless decoder
Message-ID: <20240513100641.5irday5ej2v66jur@basti-XPS-13-9310>
References: <20240316081344.4262-1-yunfei.dong@mediatek.com>
 <2aefd938-f70a-4133-a3a8-9c96464c9f5f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <2aefd938-f70a-4133-a3a8-9c96464c9f5f@collabora.com>

Hey Angelo,

On 09.05.2024 11:54, AngeloGioacchino Del Regno wrote:
>Il 16/03/24 09:13, Yunfei Dong ha scritto:
>>The supported decoder commands are different for stateless and
>>stateful architecture. Add stateless decoder commands to fix
>>the v4l2-compliance test error below.
>>
>>Codec ioctls:
>>     VIDIOC_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>>     VIDIOC_TRY_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>>  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>     VIDIOC_G_ENC_INDEX returned -1 (Inappropriate ioctl for device)
>>  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>     VIDIOC_DECODER_CMD returned -1 (Invalid argument)
>>     VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>>     VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>>     fail: v4l2-test-codecs.cpp(126): ret
>>  test VIDIOC_(TRY_)DECODER_CMD: FAIL
>>
>>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>Nicolas, Sebastian, anything to add?

No looks fine for me, this is on my list for the next round of pull
requests.

>
>Cheers,
>Angelo

Greetings,
Sebastian

>
>>---
>>changed with v1:
>>- remove the static function prefix.
>>- fix some messages not reasonable.
>>---
>>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 60 +++++++++++++++++--
>>  1 file changed, 54 insertions(+), 6 deletions(-)
>>
>>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>>index ba742f0e391d..c2b64a528028 100644
>>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>>@@ -80,21 +80,18 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_dec_ctx *ctx,
>>  	return &ctx->q_data[MTK_Q_DATA_DST];
>>  }
>>-static int vidioc_try_decoder_cmd(struct file *file, void *priv,
>>-				struct v4l2_decoder_cmd *cmd)
>>+static int stateful_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>>  {
>>  	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>>  }
>>-
>>-static int vidioc_decoder_cmd(struct file *file, void *priv,
>>-				struct v4l2_decoder_cmd *cmd)
>>+static int stateful_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>>  {
>>  	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>>  	struct vb2_queue *src_vq, *dst_vq;
>>  	int ret;
>>-	ret = vidioc_try_decoder_cmd(file, priv, cmd);
>>+	ret = stateful_try_decoder_cmd(file, priv, cmd);
>>  	if (ret)
>>  		return ret;
>>@@ -128,6 +125,57 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
>>  	return 0;
>>  }
>>+static int stateless_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>>+{
>>+	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
>>+}
>>+
>>+static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>>+{
>>+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>>+	int ret;
>>+
>>+	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
>>+	if (ret)
>>+		return ret;
>>+
>>+	mtk_v4l2_vdec_dbg(3, ctx, "decoder cmd=%u", cmd->cmd);
>>+	switch (cmd->cmd) {
>>+	case V4L2_DEC_CMD_FLUSH:
>>+		/*
>>+		 * If the flag of the output buffer is equals V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF,
>>+		 * this command will prevent dequeueing the capture buffer containing the last
>>+		 * decoded frame. Or do nothing
>>+		 */
>>+		break;
>>+	default:
>>+		mtk_v4l2_vdec_err(ctx, "invalid stateless decoder cmd=%u", cmd->cmd);
>>+		return -EINVAL;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>>+{
>>+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>>+
>>+	if (ctx->dev->vdec_pdata->uses_stateless_api)
>>+		return stateless_try_decoder_cmd(file, priv, cmd);
>>+
>>+	return stateful_try_decoder_cmd(file, priv, cmd);
>>+}
>>+
>>+static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>>+{
>>+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>>+
>>+	if (ctx->dev->vdec_pdata->uses_stateless_api)
>>+		return stateless_decoder_cmd(file, priv, cmd);
>>+
>>+	return stateful_decoder_cmd(file, priv, cmd);
>>+}
>>+
>>  void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
>>  {
>>  	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
>
>
>

