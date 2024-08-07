Return-Path: <linux-media+bounces-15930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA76794A85A
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2B91F21A67
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 13:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0081E7A22;
	Wed,  7 Aug 2024 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b="UqwX/xls"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E313155C83;
	Wed,  7 Aug 2024 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723036157; cv=pass; b=iqx/p7wdFbX7UjhJDFHp5EFu+CSpUbkoamfXY6e12+pbxziBVpCOHYuVb+2gFDxhc7fQU1d3gYoyu4gQKUzVcgmVCP+R4mpQzbw0VxC3IN1raMlhBsUN8MKbdk2ycs2fVzbllylLSyqDnaooUMgj25zamD29d8VwNopRhr5pRtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723036157; c=relaxed/simple;
	bh=zwClFYRT7EBI1S6KyLWKQbsZyLnSRihHjgOGjbwCjuQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RqZplV280I32Y5kOiVaTznBZbdTvvGF1mFHZaqO33qNKuhqrCdqOcK7ampEsyxmF7cKomnABZY/AAQbgJ63qSIGUWtxmz+5HUSVRA8ekFxjN7tyNfytK/C2H53hnmOiLGVLra2TLzi3mqbGKxJ9508e9LM3RTqKBOJxDYF1vO84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b=UqwX/xls; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nfraprado@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723036142; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cCEvUedM8DBzYhd7+dWhV1X1QXTtfWA5kOy9TZptiz069HnKin63ZlhP2wL/igLLFVHbJMa1gVBe3WxrkeZ6hkj1JSFM2A4xU5rboazKmxP25OlqqUqr1dJEStIA9IEK3e9jSdxh3iMIGO61+Ac90NkM4rSbZoUY7KcJAjXAe8M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723036142; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b31lzuqk+NEUR5lPB03lOlP/KpJzHFymO7PF1OSOIos=; 
	b=cs1fOf70MwoOlFjm8WiY0ZZLEUmWnlEcAes3EVjYYEgKSQglrSAyeavabN69mvIVyWnTmdxr8eS4p8rYYXfz11gTdZYafIvOPIUuJNE1DSAF4eyMwY2uoZY7FInmpExUdNPfSB4RmZun9tEtzxce3OJCaneBe6zWo9rWDNXXyXw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723036142;
	s=zohomail; d=collabora.com; i=nicolas.dufresne@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=b31lzuqk+NEUR5lPB03lOlP/KpJzHFymO7PF1OSOIos=;
	b=UqwX/xlshjRtYJ3PwgfnQ1waRWhsqIlo9HmyDEaJqQfky2TW1VZ9AHcDtJQ9YkYD
	ec17ijB7hYJ64eoaUNCiLFBC+B7mrCoLZPR9eillRP70eoQP+uHDDDhSD5WeJhlJEaD
	JBzVXzK4NQsqRh+tEL9h9zgpuskfawBDGsmoXc3g=
Received: by mx.zohomail.com with SMTPS id 1723036140967275.53857334940585;
	Wed, 7 Aug 2024 06:09:00 -0700 (PDT)
Message-ID: <be4baa6313d16ed52245347d866dd878049a12a0.camel@collabora.com>
Subject: Re: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 07 Aug 2024 09:08:58 -0400
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Yunfei,

Le mercredi 07 ao=C3=BBt 2024 =C3=A0 16:24 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> v4l2_m2m_buf_done is called in lat work queue, v4l2_ctrl_request_complete
> is called in core queue. The request status of output queue will be set t=
o
> MEDIA_REQUEST_STATE_COMPLETE when v4l2_m2m_buf_done is called, leading to
> output queue request complete fail. Must move v4l2_ctrl_request_complete
> in front of v4l2_m2m_buf_done.

Sebastian and I have analyzed further the issue and the description here do=
es
not seem to match. What happens is that in Stateless decoding, you have to =
set
header controls out-of-request to negotiate the format at first.

With VP9 notably, the header control is the only control there is. Chromium=
 will
optimize out this and only attach a bitstream buffer to the request. So whe=
n the
buffer is mark to done, it is the last object in the request, which implici=
tly
mark the request as complete.

When v4l2_ctrl_request_complete() is later called, the control code detect =
that
there is no controls in the request. It then creates an empty control, but
attaching an object to a completed request is not allowed.

>=20
> Patch 1 setting request complete before buffer done
> Patch 2 change flush decode order when stream off
> Patch 3 flush decoder before stream off
> Patch 4 using input information to get vb2 buffer
> Patch 5 store source vb2 buffer
> Patch 6 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
> Patch 7 remove media request checking

I will give a some testing soon. Can you clarify on if the LAT and the CORE
still runs in parallel after this change ?

Nicolas

>=20
> ---
> compared with v3:
> - fix flush decoder issue when userspace stream off capture queue firstly
> - fluster test result same with v3
>=20
> compared with v2:
> - add patch 5/6/7 to fix decode again issue
> - add fluster test result with mt8195 platform(same with no changed):
>   1> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0 -j1 -t 90
>      VP8-TEST-VECTORS 59/61
>   2> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j1 -t 90
>      VP9-TEST-VECTORS 276/305
>   3> ./fluster.py run -d GStreamer-AV1-V4L2SL-Gst1.0 -j1 -t 90
>      AV1-TEST-VECTORS 237/239
>   4> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
>      JVT-AVC_V1       95/135
>   5> ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -j1 -t 90
>      JCT-VC-HEVC_V1   142/147
>=20
> compared with v1:
> - add patch 2/3/4 to fix timing issue.
> ---
> Yunfei Dong (7):
>   media: mediatek: vcodec: setting request complete before buffer done
>   media: mediatek: vcodec: change flush decode order when stream off
>   media: mediatek: vcodec: flush decoder before stream off
>   media: mediatek: vcodec: using input information to get vb2 buffer
>   media: mediatek: vcodec: store source vb2 buffer
>   media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
>     v4l2_m2m_src_buf_remove
>   media: mediatek: vcodec: remove media request checking
>=20
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 ++++++++---------
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 48 ++++++++++++++-----
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 +++----
>  .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
>  .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 19 ++++----
>  .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
>  8 files changed, 85 insertions(+), 60 deletions(-)
>=20


