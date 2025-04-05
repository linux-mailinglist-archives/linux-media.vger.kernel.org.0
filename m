Return-Path: <linux-media+bounces-29435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3789A7C9F4
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 17:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D03B17454C
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 15:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5122F14F125;
	Sat,  5 Apr 2025 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="jYUJylMc"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA78BEC;
	Sat,  5 Apr 2025 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743867493; cv=pass; b=NBIsY3C9dJYykTEwzfKg1q2IcOv7WP3GJExXN9BoOdaCihBKI5ZtvS4u2V9y4JhoKkww83r8EBwwOUp/IE5s3teFNBwBUJ105lkZgy2Csou6PLRbCywkqDITT/bYXIQC8Yzk9YqlhyVV70PZ3dHLmsq8jJ0Uc1n2/LnR/ZlR3to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743867493; c=relaxed/simple;
	bh=CK6ygHAUCsm/eH+FoOd0f5wwhChL/wFEEP7u2AKcsqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPD/8IUHgSuM3xI0EqisBDzMZlgWrCY0uSNeHAGTZ2ZxtNI9049DGRCb3fcMsE5B68khsQYMsQQDQhZdrybdoEBwS9KKCBY8mdYw8ZNLGujgdDJrMC5Zt/wNZuEoxu/XGwbUbet1uj9QNAVOGDY/kPofKDOUPltSZLer4Jb6vvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=jYUJylMc; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743867465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N7TYLJRZD6ltPOJ0w6zkwmqoCX8a9oPm0e3j9fFcAyICmX6Wso/h3+qeUlum4T5aS7VueRg1cnQsh0OCXcNi2FhfQO4hh9TN17kbh7VnDXeVqO/N5zb7QlAzEp8BoqmTfmnh6K1pBVl3yvy9/looxNI4f2o6IIT/4fKnzwS+bE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743867465; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BugjcZAgjg+SxWM6msfC6lZpG578nU3iM1C5nasdLKg=; 
	b=Yj2IFgu51s6yzD3LROPXgD2p1O6Z7PhKFJzdOcttzMgGqZDPblfR8SPaXDiRfiizP5hqCuPINUVpwBMbYJEEibD+u3IMDO0E8yJM+XzP6IRdm4Vhx6TtqXwirI03sE6fkLKoPlFVBD9dPojfA1NCAJRn78A94rNwVE7C01PsykI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743867465;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BugjcZAgjg+SxWM6msfC6lZpG578nU3iM1C5nasdLKg=;
	b=jYUJylMc4wasWcn/B1RmXJTAM+mJqN90T/VAhxFdLDid9c3AlqIgL90ta4/CTSPa
	3onteTmoLzeh1fh0usB1I1+QDb9sCpsfl8M59sx0BQ5ZcLunt29rfJpnoPh79lZqzaz
	8XD0eMp87mc2VWrQstA3g409VOqD9ONBPn3P0w4Y=
Received: by mx.zohomail.com with SMTPS id 1743867462417829.8012660744155;
	Sat, 5 Apr 2025 08:37:42 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:37:32 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <20250405153732.sitanh6tucpzvkoe@basti-XPS-13-9310>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328063056.762-4-ming.qian@oss.nxp.com>
X-ZohoMailClient: External

Hey Ming,

On 28.03.2025 14:30, ming.qian@oss.nxp.com wrote:
>From: Ming Qian <ming.qian@oss.nxp.com>
>
>To support decoding motion-jpeg without DHT, driver will try to decode a
>pattern jpeg before actual jpeg frame by use of linked descriptors
>(This is called "repeat mode"), then the DHT in the pattern jpeg can be
>used for decoding the motion-jpeg.

Hmm do we need to repeat the description from the previous patch?
>
>In other words, 2 frame done interrupts will be triggered, driver will
>ignore the first interrupt, and wait for the second interrupt.
>If the resolution is small, and the 2 interrupts may be too close,
>when driver is handling the first interrupt, two frames are done, then
>driver will fail to wait for the second interrupt.

Okay this first part is a bit hard to understand, how about:

As the first frame in "repeat-mode" is the pattern, the first interrupt
is ignored by the driver. With small resolution bitstreams, the
interrupts might fire too quickly and thus the driver might miss the
second interrupt from the first actual frame.

Is that what you mean?

>
>In such case, driver can check whether the decoding is still ongoing,
>if not, just done the current decoding.

That doesn't answer to me why this solves the issue of missing the
second interrupt, can you elaborate your solution a bit so that the
reader of the commit description understands why this is needed?

Regards,
Sebastian

>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
> .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
> .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
> 2 files changed, 20 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>index d579c804b047..adb93e977be9 100644
>--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>@@ -89,6 +89,7 @@
> /* SLOT_STATUS fields for slots 0..3 */
> #define SLOT_STATUS_FRMDONE			(0x1 << 3)
> #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
>+#define SLOT_STATUS_ONGOING			(0x1 << 31)
>
> /* SLOT_IRQ_EN fields TBD */
>
>diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>index 45705c606769..e6bb45633a19 100644
>--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>@@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
> 	return size;
> }
>
>+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>+{
>+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>+	u32 curr_desc;
>+	u32 slot_status;
>+
>+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>+
>+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>+		return true;
>+	if (slot_status & SLOT_STATUS_ONGOING)
>+		return true;
>+
>+	return false;
>+}
>+
> static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> {
> 	struct mxc_jpeg_dev *jpeg = priv;
>@@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> 		goto job_unlock;
> 	}
>-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>+	    mxc_dec_is_ongoing(ctx)) {
> 		jpeg_src_buf->dht_needed = false;
> 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
> 		goto job_unlock;
>-- 
>2.43.0-rc1
>
>

