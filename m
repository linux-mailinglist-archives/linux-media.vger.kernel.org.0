Return-Path: <linux-media+bounces-27011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545DA45A89
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A25B3A9E7D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FF1238172;
	Wed, 26 Feb 2025 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="I8IyydGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0E238160;
	Wed, 26 Feb 2025 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563186; cv=pass; b=tsN3qyGzi2qTtxZJMZlkirxRxqFeP+Ga3alIavyUA0wbna7lX0bdxJFll2w/mUzHDTMEFiVqO4YLzPDaxrmsWtv0M4dbzh7XXs0r5X0s5VB+p52xK8WHnln7t9xRc6/yG18VwZ5cukSCi/B8y8aZccAv7H2F0YfOgkDgtRUk9Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563186; c=relaxed/simple;
	bh=jMhCi2lGoBNhfWScI0gNVaijzNEe6KlHiTA4K78enB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+bB789Ift3WMoxxTfkZkeilC0F9QLUkAfe4vyB7jndUoQmKdri4hFyIORvNgmsXb80Zpk0ECmKlwtWEJiC+AOXGz1w9cC4Toltpx75Y808Ionj9SHvaiT1qsTsAskn66OaNI3HzDMQ61BpNLnlTYGqpOZRJyJWbxstJ1xsiPaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=I8IyydGQ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740563155; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m31gMZ7PHeDL/F4qCXEU4O3yLVCHcOVX/5y1QMYRaSweufzdT1jXwNp1dMeRmvKshBycs8FeSuzrYIv2uUQ9MVw2ubaAWczoK7ZhMBFrsgtUgkXYAKFAVsYeRXFXt69HgzrdADDKyBG/sd+18VK+VvWaVAuFap3SVHjb3koAp+c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740563155; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r/92kSJvY1+rN7R1Wa41yTcFlIjE+7u8+6SYiP5XVx4=; 
	b=POFs53U5pyE0qysaazZesJqL2f+JCSyzetbBgz3V4E/Q27aLKJvW+vZqCco8CNCW1ImJt2ns0PEO5IFdLrftN0IdQR3mIAsTdtB9Mpf3NMcAzj7iy6Dl4RK14ZRrtatTtATXl6WvI3lzqKsM6rM1F1JbNiDCTvaSJqUkJgivTRU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740563155;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=r/92kSJvY1+rN7R1Wa41yTcFlIjE+7u8+6SYiP5XVx4=;
	b=I8IyydGQEZwn7/WYgA/DfF4oMMeiC2EYo5lrBwXlRSS0/MlQq8IhONdNXcGKl+fQ
	pl53yxiw7eWzMe4n25/m5E+ic5ghVSAylF3uFIKq4Rj9ATlGXx62JZI6jKeu0B/B8B8
	pYCvZ1e+WdVC5PvHkjdsIImyy5EsPHAc2wIN2ang=
Received: by mx.zohomail.com with SMTPS id 1740563153661642.0756053378082;
	Wed, 26 Feb 2025 01:45:53 -0800 (PST)
Date: Wed, 26 Feb 2025 10:45:45 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
Message-ID: <20250226094545.byr2b3p26w5vit63@basti-XPS-13-9310>
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
X-ZohoMailClient: External

Hey Ming,

thank you for the patch!

On 17.01.2025 16:57, Ming Qian wrote:
>The amphion decoder firmware supports low latency flush mode for
>HEVC format since v1.9.0, it can help reduce the decoding latency by
>appending some padding data after every frame, then driver can enable
>this feature when the display delay 0 is enabled.

I see that you already changed the commit message for this version, but
I still have a few recommendations for the description:

     The amphion decoder firmware supports a low latency flush mode for
     the HEVC format since v1.9.0. This feature, which is enabled when
     the display delay is set to 0, can help to reduce the decoding
     latency by appending some padding data to every frame.

The rest looks good to me.

Regards,
Sebastian

>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
>v2
>- Improve commit message
>- Add firmware version check
>
> drivers/media/platform/amphion/vpu_malone.c | 22 ++++++++++++++++++---
> 1 file changed, 19 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 5c6b2a841b6f..1d9e10d9bec1 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -68,6 +68,9 @@
>
> #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>
>+#define MALONE_VERSION_MASK			0xFFFFF
>+#define MALONE_MIN_VERSION_HEVC_BUFFLUSH	(((1 << 16) | (9 << 8) | 0) & MALONE_VERSION_MASK)
>+
> enum vpu_malone_stream_input_mode {
> 	INVALID_MODE = 0,
> 	FRAME_LVL,
>@@ -332,6 +335,8 @@ struct vpu_dec_ctrl {
> 	u32 buf_addr[VID_API_NUM_STREAMS];
> };
>
>+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>+
> u32 vpu_malone_get_data_size(void)
> {
> 	return sizeof(struct vpu_dec_ctrl);
>@@ -654,9 +659,16 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
> 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
> 	}
>
>-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
>-	if (malone_format != MALONE_FMT_AVC)
>+	if (params->display_delay_enable &&
>+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
>+		hc->codec_param[instance].disp_imm = 1;
>+	else
> 		hc->codec_param[instance].disp_imm = 0;
>+
>+	if (params->codec_format == V4L2_PIX_FMT_HEVC &&
>+	    (iface->fw_version & MALONE_VERSION_MASK) < MALONE_MIN_VERSION_HEVC_BUFFLUSH)
>+		hc->codec_param[instance].disp_imm = 0;
>+
> 	hc->codec_param[instance].dbglog_enable = 0;
> 	iface->dbglog_desc.level = 0;
>
>@@ -1024,6 +1036,7 @@ static const struct malone_padding_scode padding_scodes[] = {
> 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
> };
>
> static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>@@ -1058,8 +1071,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
> 	int ret;
>
> 	ps = get_padding_scode(scode_type, pixelformat);
>-	if (!ps)
>+	if (!ps) {
>+		if (scode_type == SCODE_PADDING_BUFFLUSH)
>+			return 0;
> 		return -EINVAL;
>+	}
>
> 	wptr = readl(&str_buf->wptr);
> 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
>-- 
>2.43.0-rc1
>
>

