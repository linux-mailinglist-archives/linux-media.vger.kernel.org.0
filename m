Return-Path: <linux-media+bounces-23192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4839ECD07
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A9C1885E71
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 13:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FA6229151;
	Wed, 11 Dec 2024 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="i8gtEjfn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA492229149;
	Wed, 11 Dec 2024 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923087; cv=pass; b=AKDnnEyKN0McgGsUvtc2r9LfzcUWdh+m7oP8k2tuKNJxkib0PbtnYvoZrojC9dvIKy+tRLo5nAGN88Hmto9dZIfJL/6w3wUZTuUro0KcBLrz7BpGVoydqNouBu85f9ubOPdXerYEiWkgh03OYlHs9c70n+Ur6Mdp8b4+WRte3GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923087; c=relaxed/simple;
	bh=UO5ZHRjQKWJpBumQE8BkVFZ/40WWTQGw7Zg/3Sb6MsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I32piBeXJyfiAiTu6ff5m/XFockKmygxKJ656LUZRfRN2flNUu1cGRGshK5WVrdCdNvreeDEi+7aRCBWFhBDjTWdTtVnth3OMzD3g7gEUCsChUxLyyx2Ar9lJJdamguadHBlGIaBfG1zivWuatBs0GAHE+cYjPc/HYBa6GISedQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=i8gtEjfn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1733923070; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FzvZ9vsnFE8JzCyYwN4aLGg2OJMY5cChGxYQKjgnm8TZnC3sivb2D3NQe5AGWFNmfGXvWOhnxlMn9E1wjH88RWTkmxIPE59+cUy8brBq6BLbII2Sf2HejM76PfdtbcXrmHUtPtk4bVXpxDB/fzyVXM7PEwCROi22piNRfSqGnFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733923070; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BsqAVGRVtN7IvQG7hD+SDFUGpEQJ+euBRQSBpwnKYF0=; 
	b=YyoevzDEhEBD9I0uOZRY1MfqT+sxvkk4ejbLqJgAA9jh/Uvf8ELD0IjayI+vpxsulbTibKcr12gzxnoXg/2l+ExlFqQmeVVlkIfhvhzWBX7LJ0GDJ1+bvHj/Me2ouYAHDJwwPOOZ1WTHCSLHHs4PC5NnA56tYmO9fY0DDFRfFUI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733923069;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BsqAVGRVtN7IvQG7hD+SDFUGpEQJ+euBRQSBpwnKYF0=;
	b=i8gtEjfnc1uU6Wn4uJYSxg7l+sdRaVL1IsuPriyvQJj1bILMotZUQVomKAxwnTYo
	Ijnox4tIspXC/FI7aiWy0tTSWGKqRh3umARJVSIf7rF+3WsZm5RDoWmofwMOBzPerng
	BqQZjXcxUnRRpUvIA+603sbS00M15OmUn1yvYMWo=
Received: by mx.zohomail.com with SMTPS id 173392306724954.317217262560916;
	Wed, 11 Dec 2024 05:17:47 -0800 (PST)
Date: Wed, 11 Dec 2024 14:17:40 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 1/3] media: mediatek: vcodec: remove vsi operation in
 common interface
Message-ID: <20241211131740.x6lrlamgi5ogdq7b@basti-XPS-13-9310>
References: <20241116031616.15656-1-yunfei.dong@mediatek.com>
 <20241116031616.15656-2-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031616.15656-2-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 16.11.2024 11:16, Yunfei Dong wrote:
>Extend struct video shared information (vsi) to send different
>parameters to scp for mt8188 architecture is changed.
>Remove vsi related operation in common interface to make sure the
>interface can be called by extended and non extended architecture
>at the same time. The new extended interfaces with new vsi will
>be introduced in later patches.

My recommendation:

Extend the VSI (video shared information) struct to allow sending slice
parameters to SCP, as the parameters have changed on MT8188
architecture. Remove VSI related information from the common interface
to ensure, that the interface is usable by architectures with and
without the extended parameters. The new VSI extensions will be
introduced in later patches.

The rest looks good to me.

Regards,
Sebastian Fricke

>Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 +++++++------
> 1 file changed, 7 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>index 1ed0ccec5665..ab192ce0b851 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>@@ -171,9 +171,9 @@ struct vdec_h264_slice_inst {
> };
>
> static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
>-						  struct vdec_h264_slice_share_info *share_info)
>+						  struct vdec_h264_slice_share_info *share_info,
>+						  struct vdec_h264_slice_lat_dec_param *slice_param)
> {
>-	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->vsi->h264_slice_params;
> 	const struct v4l2_ctrl_h264_decode_params *dec_params;
> 	const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
> 	const struct v4l2_ctrl_h264_sps *sps;
>@@ -266,9 +266,6 @@ static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
> 	mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_builder.num_valid);
> 	mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_builder.num_valid);
>
>-	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
>-	       sizeof(inst->vsi_ctx.h264_slice_params));
>-
> 	return 0;
> }
>
>@@ -608,7 +605,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
>
>-	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
>+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
>+						     &inst->vsi->h264_slice_params);
> 	if (err)
> 		goto err_free_fb_out;
>
>@@ -749,6 +747,9 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
> 	if (err)
> 		goto err_free_fb_out;
>
>+	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
>+	       sizeof(inst->vsi_ctx.h264_slice_params));
>+
> 	buf = (unsigned char *)bs->va;
> 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
> 	if (nal_start_idx < 0) {
>-- 
>2.46.0

