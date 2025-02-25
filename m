Return-Path: <linux-media+bounces-26919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E49A43A05
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172443A7875
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06C12641CA;
	Tue, 25 Feb 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="A1YEbXxX"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93A9263F4D;
	Tue, 25 Feb 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476489; cv=pass; b=QAEeN1BpHcg77PRezLJiTv4PKhZspYw/u+8gx7Nh2aT66pKHj7QfrSYe+ykCD6Bf+RB/LfzpffRWgLaS3seH5Yu0cnyWNxCw8D0JUaZuPyckuvNLbaAsEYt7wE1XLpkH8VYlpPIuo/eg+xgaIMb2i0vk7IgaxDAKLx3T8dmZXGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476489; c=relaxed/simple;
	bh=t7qOwuEdrk7TIbGTl5prHqdzjtw/ZS4TI53BQRojnOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWGIEOYxOjVRRDkRH/NGTYbV1SWCsZVHqFfcL4HIkgWsBJjr0n3NTBiEzl4wMOBsQxKGl4l9KghoqOTXo5DNPX6M4P9xwg3Z37FMsEaFOTx5hGZpDoh+CjDUV9M8T4OkCZioDT0yYCdwmihtTPidbxGh0SasG5OPL50ihvUOewc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=A1YEbXxX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YYfAzepUWYGd3GDzpwbLkuBhJ9JZVRKI/QdrojcVj7uz2bJQsmJOAeFzNRPHGloqH7WJfDo8UUAwuvlIH2ruqXJkPdnglKE6Jr6MNbK/TFeXBaFkTBZGqryq+w/j9vjN650ieE3oIswVkIptd2ggMWmAImO7ULQkyEzQ0O4TarQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476466; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b9ilxX5CFJsfRD+3HmHdIwTNigrE5DvjKvpEvlNxk8s=; 
	b=MFGHlP6nkeR8OIH4iO+JFGmisqawsJVJsBlYv3emYX5AJpRBxPvGB/qI/akv3hJwvm2L5H4a0bbDGBrG9yE8cGGYMsEQd1FYyBAU/SPq4u78eg0jjrOFXQSzG4ARJgD0zDsbLRD5SUkXbOcX2GOhJTmEqo7/c644AAVdL5JO40I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476466;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=b9ilxX5CFJsfRD+3HmHdIwTNigrE5DvjKvpEvlNxk8s=;
	b=A1YEbXxXw2BB34v4PyvXiqLwNs2O+3dcrFYUv2VB34oEHm+ko9CBmLRgkvPuSpMB
	1WGw86CToMPs/6CSaWtAzLMBxrLDepz0Re0TpcqgbNV3YXXhkKy1j0fJA3TbhakBt8+
	BIogmxgnlUGqVcyhRpSEAH+07X3U55/be9iyOEBk=
Received: by mx.zohomail.com with SMTPS id 1740476464618491.75863387985737;
	Tue, 25 Feb 2025 01:41:04 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:24 +0100
Subject: [PATCH v7 03/12] media: rkvdec: h264: Use bytesperline and buffer
 height as virstride
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-3-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=2074;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=KYB4ZNR5ZL8Q48yfgLX5D28TL6rugHy3+KYd/Y+Czgw=;
 b=96DCcJFZ52Npt4SoE+iyLByVAi7kr9VEE1tiDAYgbAeEurqnDyAzMNRddjVIAzltK/Wpc/rqS5PH
 NRz21k+eCKoeeqaD3wLttjbrcy6sXBQepwVRJgQ4+619MYWDMm8Z
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Jonas Karlman <jonas@kwiboo.se>

Use bytesperline and buffer height to calculate the strides configured.

This does not really change anything other than ensuring the
bytesperline that is signaled to userspace matches what is configured
in HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 4fc167b42cf0c74fcc7adad5b867d9d7cd8af29b..7a1e76d423df55bd01c1ff26ff2c6d1b81ee7169 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -896,9 +896,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	dma_addr_t rlc_addr;
 	dma_addr_t refer_addr;
 	u32 rlc_len;
-	u32 hor_virstride = 0;
-	u32 ver_virstride = 0;
-	u32 y_virstride = 0;
+	u32 hor_virstride;
+	u32 ver_virstride;
+	u32 y_virstride;
 	u32 yuv_virstride = 0;
 	u32 offset;
 	dma_addr_t dst_addr;
@@ -909,16 +909,16 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	f = &ctx->decoded_fmt;
 	dst_fmt = &f->fmt.pix_mp;
-	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
-	ver_virstride = round_up(dst_fmt->height, 16);
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
 	y_virstride = hor_virstride * ver_virstride;
 
 	if (sps->chroma_format_idc == 0)
 		yuv_virstride = y_virstride;
 	else if (sps->chroma_format_idc == 1)
-		yuv_virstride += y_virstride + y_virstride / 2;
+		yuv_virstride = y_virstride + y_virstride / 2;
 	else if (sps->chroma_format_idc == 2)
-		yuv_virstride += 2 * y_virstride;
+		yuv_virstride = 2 * y_virstride;
 
 	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
 	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |

-- 
2.25.1


