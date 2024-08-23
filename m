Return-Path: <linux-media+bounces-16671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC195D1F2
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 17:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90EDD281192
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0A818BB84;
	Fri, 23 Aug 2024 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="HfrO7R0+"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F6189B87;
	Fri, 23 Aug 2024 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427943; cv=pass; b=dALhG4i2ezRHNNUWUhXND02eE/oqlZCKwo37lGrn2bIcfRyUf+4WQbU2nGEyiGUG95jdNeSI8wQwNgtmKQRzYe4HPQ9M6H0k4sNlNRoriTSrNCfcsu3NSRp7kiKOHitGVphQnBgUei0J8Av4LhTkCD+7+17RBojsxjdVg95m5wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427943; c=relaxed/simple;
	bh=SbTZ5jUd18sDORERkkplbV0CCxMr8pO8Ee8Ao1aiFd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2u7YbWInSB8ZXEEXR0NGikaiSDsVgc0y8r526BQ3zR8VnmzTuBEG7K++gnQCAcEc69RP/ObVTDS7ti2VZftD5uW98WWKlgA+hryvlrv5BBTDVHGUbI1OGTvJPrXs2tWv61PdJJdZFgxowwdlGj7NXhkWVF3lMiM5rZhQ5ikgzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=HfrO7R0+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nfraprado@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724427930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZpWRIXfx5JAWcNDBsiSv5hE91EAiPNui/gKAuJZKKA5w94+WDufEL/6AgUh7oavRIguleCu+x0/bio5oiDe/WGLW3pH1/p5VQZQnv00KDmcGgpm5WUPoXeRAa71adpdFOfLewqzDc023l9Z4CFylaGXytzdsZFWfZW2vyn/ifRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724427930; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jjRlTDki3GkTErS0Ge0MuLopk0eojhlCbmXkL45WmuQ=; 
	b=Xv6xEqOSLx9VHjLCOb9OW3yiC8NHjTkq/xyIkjMuRIaJU0o9XeSK05arJCIJhDuzO8ZlMcLIGuPbjBLuDnJj4g/Cn73VFX9K/GCkyvtytPSCgc5FZwG1a3gHSqQIvEFJybwYmTYlkeV/UyVaLJm5AajIHMUwRLX5ctHzxV+mMSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724427930;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=jjRlTDki3GkTErS0Ge0MuLopk0eojhlCbmXkL45WmuQ=;
	b=HfrO7R0+qzI9ALPjs4zyDBXi0KETzRfCfuVdVVksD43xuiO/KM4hAti+yxXZef9d
	9xGB0yAzY3APNfmRPxxLpHQqwngodEuQW287/xHtIYSkt8PwtPia+J8EXIQzSiCZuK3
	hs0inY0Z8J4JSeTc5AVlvO5FUf6NmH/wmNYLncUs=
Received: by mx.zohomail.com with SMTPS id 1724427929068728.6124036633798;
	Fri, 23 Aug 2024 08:45:29 -0700 (PDT)
Date: Fri, 23 Aug 2024 17:45:23 +0200
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
Subject: Re: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
Message-ID: <20240823154523.fucqvc4cnqk5jrlg@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

given this new series by Hans:
https://patchwork.linuxtv.org/project/linux-media/list/?series=13427

we might actually be able to find a more performant solution of the
problem, I'll work on that a bit and give you feedback.

Regards,
Sebastian

On 07.08.2024 16:24, Yunfei Dong wrote:
>v4l2_m2m_buf_done is called in lat work queue, v4l2_ctrl_request_complete
>is called in core queue. The request status of output queue will be set to
>MEDIA_REQUEST_STATE_COMPLETE when v4l2_m2m_buf_done is called, leading to
>output queue request complete fail. Must move v4l2_ctrl_request_complete
>in front of v4l2_m2m_buf_done.
>
>Patch 1 setting request complete before buffer done
>Patch 2 change flush decode order when stream off
>Patch 3 flush decoder before stream off
>Patch 4 using input information to get vb2 buffer
>Patch 5 store source vb2 buffer
>Patch 6 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
>Patch 7 remove media request checking
>
>---
>compared with v3:
>- fix flush decoder issue when userspace stream off capture queue firstly
>- fluster test result same with v3
>
>compared with v2:
>- add patch 5/6/7 to fix decode again issue
>- add fluster test result with mt8195 platform(same with no changed):
>  1> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0 -j1 -t 90
>     VP8-TEST-VECTORS 59/61
>  2> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j1 -t 90
>     VP9-TEST-VECTORS 276/305
>  3> ./fluster.py run -d GStreamer-AV1-V4L2SL-Gst1.0 -j1 -t 90
>     AV1-TEST-VECTORS 237/239
>  4> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
>     JVT-AVC_V1       95/135
>  5> ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -j1 -t 90
>     JCT-VC-HEVC_V1   142/147
>
>compared with v1:
>- add patch 2/3/4 to fix timing issue.
>---
>Yunfei Dong (7):
>  media: mediatek: vcodec: setting request complete before buffer done
>  media: mediatek: vcodec: change flush decode order when stream off
>  media: mediatek: vcodec: flush decoder before stream off
>  media: mediatek: vcodec: using input information to get vb2 buffer
>  media: mediatek: vcodec: store source vb2 buffer
>  media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
>    v4l2_m2m_src_buf_remove
>  media: mediatek: vcodec: remove media request checking
>
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 ++++++++---------
> .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 48 ++++++++++++++-----
> .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 +++----
> .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
> .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
> .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 19 ++++----
> .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
> 8 files changed, 85 insertions(+), 60 deletions(-)
>
>-- 
>2.46.0
>
>

