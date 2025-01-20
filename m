Return-Path: <linux-media+bounces-24969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182CA16D22
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C2F81615A0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577B51E5701;
	Mon, 20 Jan 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ETxGXJY3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CAA1E0E05;
	Mon, 20 Jan 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378707; cv=none; b=p/AsSuDUojzN92TEc3unn9nXia2/TFdXEU01gwGGnJIsi7PVGtbWytVCpdscnJP06VOA3eNGw3yAT7P0dGDDZ3P+OJPJWORkhSfQhLw1fInuPP3Dbl9F1HOgjZH9ErFg0tmdeC4+MCQUL/a5mmYKvttplSGAAtUX83r6EPEDh2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378707; c=relaxed/simple;
	bh=6jI52+vImqohuSnWm8+OipEZIHzHwt+jMvCFZ8Pk6aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Osj6zJ3CqlfLLIDhUudFpKKzDlM88qZ/DL+gXSNce71+NVBoD4ashKQZNMW5HipUbJFM6Q9SAaIxzruvUwWm1EibhdW6cSnnGA3sqiikwlzTC3MRvHrJrM7ivEzdEjVrAL3KqW8wZ9g+yIGzbSgGEjS/7Q7uEw38HzyFQ6QCl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ETxGXJY3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1881E11E9;
	Mon, 20 Jan 2025 14:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378627;
	bh=6jI52+vImqohuSnWm8+OipEZIHzHwt+jMvCFZ8Pk6aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ETxGXJY3Owydo2TlY41mhH7PcVK5XGcGwX8FKPa2T+sQpQ6HKWi2G0Jvo+c9yFZjH
	 Jxexm4C8H4iuRysdEq4erBzUCHtyxcCjUS9f1BErU7MC/GkQ4F7fX2CC9OVJ4Y78e3
	 EFxdXu4EpDDu12U0s3SBAesSS15yfc77IEj0zCfQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:42 +0200
Subject: [PATCH 09/10] media: rcar-isp: Convert to
 .{enable|disable}_streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-9-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=6jI52+vImqohuSnWm8+OipEZIHzHwt+jMvCFZ8Pk6aQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt66ScvbuoNHkMwMbYyKjns99Pp76dD/30UA
 lb5GpmBXo+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LegAKCRD6PaqMvJYe
 9afGD/9Msnn3IKMqqupyxksfGXDVlnVJJReIf/0N8vkvrYVa/XrfgpuTtuibVfVKc+YTwZcN40w
 xLC1F7faiAwsSn5MvBy3JMhytXwXv6DF7Az7xJuBiZa0A9m92E4RgpK1FcgIFxNNDLLwYQPKrZo
 XVOzhjTbOBPre0u2Z2ub3ZsB9147zQOpUXuwQmT+vQXFe64ncEMuo9rkkcHsKkvvcCuM6crkRpH
 xH693YMzntlu/h+2ffKjYUmz4pEfc9EK72P9IlJi5DlgqDbM2hq68hniwDADf1S6lBANr7bhedI
 Atrra5yQY1tXHVpug2R8OClfN+WdGQRr+u2jrRsYTX9JfW2CIlN6oDyy64+86RGtohAhxjEmX19
 /3Bv3xDvl7W5mlwMjHR34+VvvyxUfyRfCtEJvoTYiZT4uRZjq0BjUZ3acITJwCA3nYNsslfVUaP
 wbV2hAVPqpApDiQcHIRjbgH6GXhAodugVQSEN7q74FXbvGbsQYnYjr7EIDbh6K5zO5Y+mciau75
 HqytjqpPte/tUXw+7c3CdubVKmY/edpx8IbZPFMEb0auKhN5rHJhxbmfjF5gqWuD22HKGEp3wJw
 AfVuDRSFEeQruHtXC7K/It0h6M+nYhyvJXIGv2KPgExPcmnRcXNVyxa97Z5TOHhXSSaHVHoNuh6
 tT4IcfqNIinKVbQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop the legacy .s_stream and convert to .{enable|disable}_streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 49 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index d4eaabb45e07..4bc89d4757fa 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -289,37 +289,49 @@ static void risp_stop(struct rcar_isp *isp)
 	risp_power_off(isp);
 }
 
-static int risp_s_stream(struct v4l2_subdev *sd, int enable)
+static int risp_enable_streams(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state, u32 source_pad,
+			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
-	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (source_streams_mask != 1)
+		return -EINVAL;
 
-	if (!isp->remote) {
-		ret = -ENODEV;
-		goto out;
-	}
+	if (!isp->remote)
+		return -ENODEV;
 
-	if (enable && isp->stream_count == 0) {
+	if (isp->stream_count == 0) {
 		ret = risp_start(isp, state);
 		if (ret)
-			goto out;
-	} else if (!enable && isp->stream_count == 1) {
-		risp_stop(isp);
+			return ret;
 	}
 
-	isp->stream_count += enable ? 1 : -1;
-out:
-	v4l2_subdev_unlock_state(state);
+	isp->stream_count += 1;
 
 	return ret;
 }
 
-static const struct v4l2_subdev_video_ops risp_video_ops = {
-	.s_stream = risp_s_stream,
-};
+static int risp_disable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 source_pad,
+				u64 source_streams_mask)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+
+	if (source_streams_mask != 1)
+		return -EINVAL;
+
+	if (!isp->remote)
+		return -ENODEV;
+
+	if (isp->stream_count == 1)
+		risp_stop(isp);
+
+	isp->stream_count -= 1;
+
+	return 0;
+}
 
 static int risp_set_pad_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
@@ -342,13 +354,14 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
+	.enable_streams = risp_enable_streams,
+	.disable_streams = risp_disable_streams,
 	.set_fmt = risp_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
 };
 
 static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
-	.video	= &risp_video_ops,
 	.pad	= &risp_pad_ops,
 };
 

-- 
2.43.0


