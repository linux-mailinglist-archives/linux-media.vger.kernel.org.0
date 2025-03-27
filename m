Return-Path: <linux-media+bounces-28818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B00A72AD4
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD1D3B0AC0
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B717F1FF7D6;
	Thu, 27 Mar 2025 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="WBGOEDGg"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02611CA0;
	Thu, 27 Mar 2025 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061758; cv=pass; b=Ex2OvBRL5/T/EnrP8rqN+ShLTfLHY8a1ydmKlpyqBN0iCK+dbrWySg+Qnz5oGGX+Gpi5jqifIYInh5iViDlM7wBfyHHUDmkeWIHNW+dDdJNWDmLKJ8I214X0ROYHODHIlTAifBZ4vdd0O2sUb8DiEGVKLEjt/Jb+JnAaAAlmyzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061758; c=relaxed/simple;
	bh=eWf+lUzuxBC0lic2+0dFJxd6idcICS2Im6Lp/Kckwco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4tQ+TtGgh6/QEThYt04SLOyEa3r6DrN2SBKkba7dcTDJto5pFVVvzHnTlP45SV30xiXyV9WHVoDwNNjAqt6A1nA26FN4ryfAyqHNQclIh6blzgghM5dfO3+S0WfdWWXqN6PURTII6Z2wEGi3OAF+24gQ5HTNswIhpSRnjpXz5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=WBGOEDGg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743061725; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PTK/VnBXW3FY5HLtjhSHlmaHpEQAoUlew0ZnngucI5PgkwQF4TlxD9C7su8vvzsj1Dko8Lf0ABsDQAUSsGZ/+v33wDhhyfscu7j7GcHRGiv5V12y4X0XsP1ZYrBVyPlrzloeL7i7bSzWnfZWNHocp7k2DBJCqbqYCOaTjJGVju0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743061725; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kyCtzHoq8aUFZrJR5s643KhWlSqeHq7AVGaEl+qqeno=; 
	b=hp6PTMhKpQyN4RQJbn3XDq/ci4oZ7oAOTLoaFGWtEg0kgB9yJsVbEqZn7qyRmsZv2QrM8AfdxWI+nK8mW802m1MXLi7s+bWS04gRe+AND7m/hmkgfV7VlfCmitE4ewYOgPbWnQAiCn62rcCtR7mGlNGo5kwx3OVu7QjGuAaphRE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743061725;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=kyCtzHoq8aUFZrJR5s643KhWlSqeHq7AVGaEl+qqeno=;
	b=WBGOEDGgkGWXrufxSI09IWNEwh3G8obvCm6o2LWWYTmrAI+EjFypnkKf1BAq54tg
	IK+EqN/Fa6V9emxp/etHcQ1z+gRbhPwSybXFIonkraCXIa3XXuBwipjNMsbld6ObQHG
	RD9c4tNCXLscaxLY9GCBBjifEjSRzEyUmsUGHSoc=
Received: by mx.zohomail.com with SMTPS id 1743061723696163.541725841117;
	Thu, 27 Mar 2025 00:48:43 -0700 (PDT)
Date: Thu, 27 Mar 2025 08:48:35 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
	eagle.zhou@nxp.com, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] media: amphion: Add a frame flush mode for decoder
Message-ID: <20250327074835.r47kaabtwu5jqvxf@basti-XPS-13-9310>
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
 <20250305062630.2329032-2-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250305062630.2329032-2-ming.qian@oss.nxp.com>
X-ZohoMailClient: External

Hey Ming,

On 05.03.2025 14:26, ming.qian@oss.nxp.com wrote:
>From: Ming Qian <ming.qian@oss.nxp.com>
>
>By default the amphion decoder will pre-parse 3 frames before starting
>to decode the first frame. Alternatively, a block of flush padding data
>can be appended to the frame, which will ensure that the decoder can
>start decoding immediately after parsing the flush padding data, thus
>potentially reducing decoding latency.
>
>This mode was previously only enabled, when the display delay was set to
>0. Allow the user to manually toggle the use of that mode via a module
>parameter called frame_flush_mode, which enables the mode without
>changing the display order.
>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
>v3
>- Improve commit message as recommended
>- Add some comments to avoid code looks cryptic
>
> drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 1d9e10d9bec1..4ef9810d8142 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -25,6 +25,10 @@
> #include "vpu_imx8q.h"
> #include "vpu_malone.h"
>
>+static bool frame_flush_mode;
>+module_param(frame_flush_mode, bool, 0644);
>+MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 (disable) or 1 (enable)");
>+
> #define CMD_SIZE			25600
> #define MSG_SIZE			25600
> #define CODEC_SIZE			0x1000
>@@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
>
> 	vpu_malone_update_wptr(str_buf, wptr);
>
>-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>+	/*
>+	 * Enable the low latency flush mode if display delay is set to 0
>+	 * or parameter frame_flush_mode is set to 1.

s/or parameter frame_flush_mode is set to 1./
   or the frame flush mode if it is set to 1./

>+	 * The low latency flush mode requires some padding data to be appended after each frame,

s/appended after each/appended to each/
(the word append implies that something is added after something else)

>+	 * but don't put it in between the sequence header and frame.

s/but don't put it in between the sequence header and frame./
   but there must not be any padding data between the sequence header and the frame./

(As this is not a suggestion for the developer but a description of what
the code does)

>+	 * Only H264 and HEVC decoder support this module yet,

s/decoder/formats/

I'd rewrite this part:
This module is currently only supported for the H264 and HEVC formats,

but that is only because this sounds more natural to me.

>+	 * for other formats, vpu_malone_add_scode() will return 0.
>+	 */
>+	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
> 		ret = vpu_malone_add_scode(inst->core->iface,
> 					   inst->id,
> 					   &inst->stream_buffer,
>-- 
>2.43.0-rc1
>
>

Thank you!

Regards,
Sebastian Fricke

