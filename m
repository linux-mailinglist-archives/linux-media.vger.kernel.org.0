Return-Path: <linux-media+bounces-16653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1D95CC87
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 14:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F28C284952
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63DE185B65;
	Fri, 23 Aug 2024 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Q5w8vDGc"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AB185B43;
	Fri, 23 Aug 2024 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416857; cv=pass; b=fzQMl0L8T2TBypRPR8pVO8CEFWSt/dj4rM5UWeJyGzauhofSe9NycmAYoy9cks3PVxVdlGFa0dXSlQy7ygaZKGIc7SaWIx9PJAqgKj5XLtX2Qs4sr5cSMEH5cCusHZdqEKFWs5h6y8fO2Qyp7R9ztFVV6+GM/aBnkaN4/9DzHWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416857; c=relaxed/simple;
	bh=alWyxxtutQB1Iit1K6IkF1VFmfKgMsw4+F/w0BJLL00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5uOcK/GSJBzeDUP8XjKAHVtU9kkXUfsNXWukuAdb10RUZ0y8Ygcy3cYtAKBstGhoO4CIaqRkp+6gd5Qpp8x7I/ZBK8FyKya4iW4ZHN1jx6LJbR6p65QmyYuYYNmJQV5Y8v75Zc1lp/VmaRIVELalOJGyEZKdoX1+2XNzNa9TT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Q5w8vDGc; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nfraprado@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724416831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lFoGHoIkT/mAibpILBItN6WgjmX/CI0oZ6D/NUXN2bKsfLT4+OvekFfrS4tKyAg6cgQa4YwYvPimxdicYZLp1IxTFi4jcRrP2EVb9A3sNMF0WuqNS75XVhT+ZBvwyj71T9QHWmz6bELKUN0qvQOSrySiwxsHUeBaSt2YPsE4t38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724416831; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XidCKBwilQdKIAPfiY223u/XUs5Gi5LF34Sh5zMVqVQ=; 
	b=WFmfAEFUVjd4vCnIncMyG6Pf7iUuLDiniGT4Q6rPomrCSJlCEGjbBmyofIbH2qkDUAzLE7cw3HeP3VqIO6E9zUU3ZUrjlmnDUsGvUlEpktZpEb/QhvuRU5jgMwnxmZXNxy3pDQnAY2PxLWV96SBhYG7dwfJKvcP9z8YopDtynNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724416831;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XidCKBwilQdKIAPfiY223u/XUs5Gi5LF34Sh5zMVqVQ=;
	b=Q5w8vDGcEiBTiX8f4Im0x0qNGvTrpQS657ZHR7GoEs+6v1pol95+beKfAoTFV/R+
	TczIkqqSKULDusEO/Yafth2OdM6KTLRhnWdGGPbs0iZCq7VDq3baveMZjtiB1i19wck
	h7ITkEmLdCcZra27DyGwlUT1M04aH2NfNUqkBh3o=
Received: by mx.zohomail.com with SMTPS id 1724416828944996.9773317618417;
	Fri, 23 Aug 2024 05:40:28 -0700 (PDT)
Date: Fri, 23 Aug 2024 14:40:23 +0200
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
Subject: Re: [PATCH v4 4/7] media: mediatek: vcodec: using input information
 to get vb2 buffer
Message-ID: <20240823124023.uhypfcixfsget26q@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-5-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-5-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

I would rename the title to something like this:

media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M

On 07.08.2024 16:24, Yunfei Dong wrote:
>vb2 buffer may be removed from ready list when lat try to get next
>src buffer, leading to vb2 buffer not the current one. Need to get
>vb2 buffer according to current input memory information.

And I would rewrite the commit log like this:

Getting the SRC buffer from the M2M buffer-queue risks picking a
different SRC buffer than the one used for the current decode operation.
Get the SRC buffer therefore from the bitstream data, which was set up
earlier during the decode.

Did I get that right?

Also could you explain why this change is required in this series?

Regards,
Sebastian Fricke

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c     | 13 +++++++------
> .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 15 +++++++--------
> 2 files changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>index 90217cc8e242..a744740ba5f1 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>@@ -1062,19 +1062,20 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
>
> static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
> 						 struct vdec_av1_slice_vsi *vsi,
>+						 struct mtk_vcodec_mem *bs,
> 						 struct vdec_lat_buf *lat_buf)
> {
>-	struct vb2_v4l2_buffer *src;
>+	struct mtk_video_dec_buf *src_buf_info;
> 	struct vb2_v4l2_buffer *dst;
>
>-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
>-	if (!src)
>+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>+	if (!src_buf_info)
> 		return -EINVAL;
>
>-	lat_buf->vb2_v4l2_src = src;
>+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
>
> 	dst = &lat_buf->ts_info;
>-	v4l2_m2m_buf_copy_metadata(src, dst, true);
>+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
> 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
>
> 	return 0;
>@@ -1724,7 +1725,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
> 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
> 	int ret;
>
>-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
>+	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf);
> 	if (ret)
> 		return ret;
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>index 3dceb668ba1c..c50a454ab4f7 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>@@ -712,19 +712,18 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *
> }
>
> static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
>+						 struct mtk_vcodec_mem *bs,
> 						 struct vdec_lat_buf *lat_buf)
> {
>-	struct vb2_v4l2_buffer *src;
>-	struct vb2_v4l2_buffer *dst;
>+	struct mtk_video_dec_buf *src_buf_info;
>
>-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
>-	if (!src)
>+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>+	if (!src_buf_info)
> 		return -EINVAL;
>
>-	lat_buf->vb2_v4l2_src = src;
>+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
>
>-	dst = &lat_buf->ts_info;
>-	v4l2_m2m_buf_copy_metadata(src, dst, true);
>+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_info, true);
> 	return 0;
> }
>
>@@ -1154,7 +1153,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
> 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
> 	int ret;
>
>-	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
>+	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
> 	if (ret)
> 		goto err;
>
>-- 
>2.46.0
>
>

