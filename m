Return-Path: <linux-media+bounces-29116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073AA776F2
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF81116A05A
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380D81EB9E5;
	Tue,  1 Apr 2025 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="PpVFWJD0"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80131EA84;
	Tue,  1 Apr 2025 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497652; cv=pass; b=epuRBjn4hhblaf8H59CHfgwLP6nz5WTosi3R1ygol02mZx9rfZacKfFRqhGzglMK2FcEnEcRjr+xE9+x0HMzzTGTWcf60FcW7KuGQF4Q9YfuWlzVxm7pE3JQv4MHMaAypDrCO7xJ7yrHNur1WtrIg7afW3sZYSAqd2Tn01XmYoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497652; c=relaxed/simple;
	bh=g9QHVW5E7yxcToZMnqomGt3CW3QJyyIarrxd9/qahdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUb1Nj44XLcck7gQ9yrvHNieX4uBPFfEvC3Br5EvBXO3BztsUdEzqQMi/p/hIwCwL159Hi/w7OjWRkUVXVYy+1ZZ8W9Re8r5Cb981UuhrifWUuwG1TyViYBml4FOvWCK3Jmd4PCi9jMZy10BtAzesd2NJ7Jkef8BZvo24/11+FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=PpVFWJD0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743497620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PwcJR2MjWwXZ3r/9DeFiS6+7HX4LBTkPVG94v4pkYGNOZBUS9NUrLujLNVD9mqpzOo4cyc9mJo+G9bUFzsnlOhmNYJDgPhq0AK/1Fi41oP0GhELU/aZFv7qvREIZk7YKcSqIHykHd5+6agZj7mWOFh0UW6c8EihDUoLQYSaLvMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743497620; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cBU0C7170I26NS2nL3j2yZ7Xa8vu3rMrCcjlkS+8Ii4=; 
	b=Xk1tqxqBkjLezlW5M9t9fVhI7IO7rByPCGQgdkn/nc5otDTywte40BKrWpeAWWsDFBoqENNJpmXLkzlLM8tKZYtFJT45/kWIZTQz9wEfuXX+wIP2yZg1egStBdEh4DvqTC9mn0B1jzgYeUK34FZ1qHJGeXDpW337EKQH2wxRWIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743497620;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=cBU0C7170I26NS2nL3j2yZ7Xa8vu3rMrCcjlkS+8Ii4=;
	b=PpVFWJD0dLal7/1EEs6FCsTrrBM8vEYAf0kbhBwpuBhgT52qxVjFXSFB2u2I2rco
	Frr3V9YS7Kg+A08eCo1g1CghgXjD3qG9CkFIt9D4ukX5hhMsLyj9EJXr1sUDhjIcGSb
	o6bhxAkqJP0wCfEJ11Q5xNPB8D8NKCZ6xpKAvvXE=
Received: by mx.zohomail.com with SMTPS id 1743497618474415.27018579292655;
	Tue, 1 Apr 2025 01:53:38 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:53:30 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
	eagle.zhou@nxp.com, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
Message-ID: <20250401085330.2n6mcyfrxbfgebzf@basti-XPS-13-9310>
References: <20250401073527.1626-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250401073527.1626-1-ming.qian@oss.nxp.com>
X-ZohoMailClient: External

Hey Ming,

thanks for the patches, unfortunatly our testing pipeline isn't happy
with them yet.

See below ...

On 01.04.2025 15:35, ming.qian@oss.nxp.com wrote:
>From: Ming Qian <ming.qian@oss.nxp.com>
>
>The amphion decoder firmware supports a low latency flush mode for the
>HEVC format since v1.9.0. This feature, which is enabled when the
>display delay is set to 0, can help to reduce the decoding latency by
>appending some padding data to every frame.
>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>---
>v5
>- Apply FIELD_PREP() and FIELD_GET() in CHECK_VERSION
>v4
>- Add CHECK_VERSION macro
>v3
>- Improve commit message as recommended
>v2
>- Improve commit message
>- Add firmware version check
>
> drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
> 1 file changed, 21 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 5c6b2a841b6f..b6e4996c2d91 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -68,6 +68,12 @@
>
> #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>
>+#define MALONE_VERSION_MASK			0xFFFFF
>+#define MALONE_VERSION(maj, min, inc)		\
>+		(FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | FIELD_PREP(0xFF, inc))

drivers/media/platform/amphion/vpu_malone.c:675:52: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   675 |         if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
       |                                                           ^
drivers/media/platform/amphion/vpu_malone.c:79:4: note: expanded from macro 'CHECK_VERSION'
    79 |                 (FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
       |                  ^
drivers/media/platform/amphion/vpu_malone.c:675:52: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/media/platform/amphion/vpu_malone.c:79:59: note: expanded from macro 'CHECK_VERSION'
    79 |                 (FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
       |                                                                         ^
drivers/media/platform/amphion/vpu_malone.c:77:4: note: expanded from macro 'MALONE_VERSION'
    77 |                 (FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | FIELD_PREP(0xFF, inc))
       |                  ^
2 errors generated.

https://linux-media.pages.freedesktop.org/-/users/sebastianfricke/-/jobs/73725346/artifacts/report.htm

Regards,
Sebastian

>+#define CHECK_VERSION(iface, maj, min)		\
>+		(FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
>+
> enum vpu_malone_stream_input_mode {
> 	INVALID_MODE = 0,
> 	FRAME_LVL,
>@@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
> 	u32 buf_addr[VID_API_NUM_STREAMS];
> };
>
>+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>+
> u32 vpu_malone_get_data_size(void)
> {
> 	return sizeof(struct vpu_dec_ctrl);
>@@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
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
>+	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
>+		hc->codec_param[instance].disp_imm = 0;
>+
> 	hc->codec_param[instance].dbglog_enable = 0;
> 	iface->dbglog_desc.level = 0;
>
>@@ -1024,6 +1038,7 @@ static const struct malone_padding_scode padding_scodes[] = {
> 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
> };
>
> static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>@@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
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
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

