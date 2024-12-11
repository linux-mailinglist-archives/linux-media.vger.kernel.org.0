Return-Path: <linux-media+bounces-23221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 593009ED31A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 18:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05E62844F9
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 17:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFE91DE4D4;
	Wed, 11 Dec 2024 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="fzK6gjUj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367824634B;
	Wed, 11 Dec 2024 17:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937081; cv=pass; b=dnVOxjdC/kDnE3WKbKOf/VwdkkTCJa9aiXHArKtsDDD92SeuElBrTa+kRzMXnqwZWMeejqYSwzF6POSogWqD1t/8N51nMr9JidfMhTkGJt3ak+MgHkYSMIWAI+llkOXG5huiDthXbw67+1uPHGWWrmngQM6jVe/nE7FewG6iHzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937081; c=relaxed/simple;
	bh=uvPixkTNJKh52GHWvhtoPvfZNxhexWKWuiNbWKgY31I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJZ4fX+TCJwCRrHwL1eKAQZlPy+5pzzIb0dUK9Ha/C+JqR91S8c774g6z2a+QscIywu8BEGqjddN+FntIEN1pMOMcvVFOQK50OX7MQMvQR+Iv9ReMh5qfZE2ZMeWUveBbgrknqPyBFjVnL4MIoy4rAS9GIXwBvlKEtF+kB3ebUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=fzK6gjUj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1733937061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MqDxC5RCWqj6frARveTY+iBLr/DNp2amjN9WKm9gl1GerCyqulp+ounDB/0XEDlcIEfGyZU3VJ38VzK8JIvfbXW9FVAqoWaUFULxbsmsiTa2aEGHoWnKXo9DFn7g3/XGpp8pa2XwrFz9OTs40mluKyN2j+F+GbzUn+VRDaQNNH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733937061; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o6mgR9JSMbzuDpvHOfYMWLmhuCb2AgVcK+vn11JpoMQ=; 
	b=MXJme1FJztZTmm3P1gKLG7Nu5KV+p40obUz5OdwQdPKtWdDUiRoM6i+Ye4NLVHWGO8AGcXm4vLr7BA4xXHI+VnI4hpCJFbMgsKCduKgjvJ5xjwWe1bk2XTJD+FYIIYKGNkVVV4Qnnxelmy5KvQb/CPY+uqjPi6U85hMgPwTJJMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733937061;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=o6mgR9JSMbzuDpvHOfYMWLmhuCb2AgVcK+vn11JpoMQ=;
	b=fzK6gjUjXS3j31LavblxZCCPDzUAOWyEA8fJnHdsskJL+zIaeEX31O6u2GL5K7t6
	8l0WPBUG7YhDqqt6M1UZiPeFWzbFnQWbqgaSGPzzs4UwacadgN5ff7xHrDLmXZ3nFrx
	nYTMC8ZZgWRsMpNoiQNkcZ6MlJ6J9lE5POxTSLVI=
Received: by mx.zohomail.com with SMTPS id 1733937059334981.4575681462861;
	Wed, 11 Dec 2024 09:10:59 -0800 (PST)
Date: Wed, 11 Dec 2024 18:10:52 +0100
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
Subject: Re: [PATCH v6 3/3] media: mediatek: vcodec: add description for vsi
 struct
Message-ID: <20241211171052.wl4wqoka7yyeso2l@basti-XPS-13-9310>
References: <20241116031616.15656-1-yunfei.dong@mediatek.com>
 <20241116031616.15656-4-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031616.15656-4-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 16.11.2024 11:16, Yunfei Dong wrote:
>If the video shared information (vsi) is changed accidentally,

How can that struct be changed accidentally?

>will leading to play h264 bitstream fail if the firmware won't
>be changed at the same time.

Okay I guess you mean that the struct has to be memcpy'd to the firmware
to synchronize it right?
Also is this really just a H264 thing? I would imagine that incorrect
data in the firmware will cause issues no matter which codec.

>Marking the shared struct with "shared interface with firmware".

Can we do anything more to ensure that the firmware doesn't fall out of
sync besides adding a comment to the description?

To fix grammatical issues the description above should be changed to:

The vsi (video shared information) struct needs to be synchronized
between the firmware and the host, as a change that is only done in the
host version of the struct but isn't synchronized to the firmware can
lead to decoding issues with H264 bitstreams. Highlight this requirement
within the struct descriptions.

But as highlighted above it is not clear to me whether the content of
this message is right yet.

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>index a7de95b9a7c0..5a202691e209 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>@@ -30,6 +30,7 @@ enum vdec_h264_core_dec_err_type {
>
> /**
>  * struct vdec_h264_slice_lat_dec_param  - parameters for decode current frame
>+ *        (shared interface with firmware)
>  *
>  * @sps:		h264 sps syntax parameters
>  * @pps:		h264 pps syntax parameters
>@@ -48,7 +49,7 @@ struct vdec_h264_slice_lat_dec_param {
> };
>
> /**
>- * struct vdec_h264_slice_info - decode information
>+ * struct vdec_h264_slice_info - decode information (shared interface with firmware)
>  *
>  * @nal_info:		nal info of current picture
>  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
>@@ -72,7 +73,7 @@ struct vdec_h264_slice_info {
>
> /**
>  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
>- *        between SCP and Host.
>+ *        between SCP and Host (shared interface with firmware).

In this case, I feel like the previous description made the fact, that
this is shared data between the host and the firmware, rather clear
already.

>  *
>  * @wdma_err_addr:		wdma error dma address
>  * @wdma_start_addr:		wdma start dma address
>-- 
>2.46.0
>
>
Regards,
Sebastian Fricke

