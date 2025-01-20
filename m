Return-Path: <linux-media+bounces-24967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E1A16D28
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5913F7A4E25
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7EF1E4110;
	Mon, 20 Jan 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pgL3pCkV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E391E3796;
	Mon, 20 Jan 2025 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378704; cv=none; b=Ek2DmDk305b2rGRCi7eLjWiL05Dp02kCf/8/oJrTF60dTcGXnpaxye9Ch5q7jp07yEvSf8nAjsvo5V33Y/4a1ZKBtAeg/zODZNasbX4LPY3aQb0mxxKCNaRVuUtfycj9AbAf4l+uqICDpAEZq3CIS1qOlFHWC6Gb/QrCSaIZ5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378704; c=relaxed/simple;
	bh=5vSj21XFA++SuVr1CESTyfGqY5ake/5yy+jidRxQtFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeUf9R5cHQ3m6Crci/OiYfsTmY5/Ic9RVBH/HLdVa719R8Adyil/1VUoSR4ZHl7ZuPAG0DokYbguuY1deMkm+YyJvkTedweb7FBFTQTGSIYqlF7qMRWfOz8PhhD8iC2VnTa4x7m9ipCXPGr2rQHTMh4Bq8z+hFe/AZyZazaSizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pgL3pCkV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E05B11E4;
	Mon, 20 Jan 2025 14:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378626;
	bh=5vSj21XFA++SuVr1CESTyfGqY5ake/5yy+jidRxQtFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pgL3pCkVfmio4DLNFbTVxABYT05MQepnsIKjQ/bzuYT8EzGx2sN57UJDbRBgjPSfZ
	 G27Q61NyHcIRwFtrOk/QYo2++j7QcRHJ8KCQQe1WgtAJxGz2jVlJ1vJUtWgJvsJLYr
	 Qs1IJJWb+wJr9LSp7RteAm3ZJRDfFluzFVv5I1jY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:40 +0200
Subject: [PATCH 07/10] media: rcar-csi2: Use
 v4l2_subdev_{enable|disable}_streams()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-7-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=5vSj21XFA++SuVr1CESTyfGqY5ake/5yy+jidRxQtFI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt6/uC7WBNUuRia7toejUQbN49CFpq064//C
 gRFRX8JK+SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LegAKCRD6PaqMvJYe
 9e0EEACaa7NR5ZkzMB1oqwHtSb9r/lT1NdQgI5e8VqFRA8+3ACALx4Wa++vHyyvb62H+JAlAvI8
 /jBmjTknMl77zCn7TdbHI9coIYvlbpg69Yvfr+NwNfV9/vq8F26BG1Qqnf15PeJM9uOwSrAygY7
 XetYleLQnXzjptvPYSOnmkpakzlfozwdZIeGfDs/1olXBgq1NPc1h2zK5M10v7W32DTnxryuotP
 wPvLJnjJcaojaQVEgKrJ1CsucO3/xW5hMGGJGk+FdDwGrd0qfbomyfyZqXGcIp0FP5gupTklfu1
 69GCJWVSx51f5dcB9PVw9lJ7vTrm3UYM0J0Tr9GbOVJPNPag1V1FZ664oWixJlSyWUw4/XMxSvj
 CAccMltB4UhHFXVnmvUMYnGtBpS6QxsDx9JL7Urv8Ljmi+PCqx4gxR9+YTfginHX44oEzYU+okN
 x4vwNMof9rZ7LGfPdD/HWECc5VbVwy4DtLKFf4VS09qB7XTFGTehQlWZanH0aUQ657x/cWbsCXx
 a0ipGFTwxa2qHGaOH4egRgI0eskkXnyE3L6VpvfKCM/ij9ooHjHz74pIolaAT6oY3tLRqhqgzb9
 oHAjA/XpsLxZAoJAt9UHjJwYbZfnTuIzMyxV1Fn2sjzUR3Z4x5dziiTDksqvQpdYPAiFWkl2NkR
 gHecSOMSeXHGYgg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use v4l2_subdev_{enable|disable}_streams() instead of calling s_stream
op directly. This allows the called subdev to drop the legacy s_stream
op.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 84e6194fed6c..ff27a8845969 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1577,7 +1577,8 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 		return ret;
 	}
 
-	ret = v4l2_subdev_call(priv->remote, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT_ULL(0));
 	if (ret) {
 		rcsi2_enter_standby(priv);
 		return ret;
@@ -1589,7 +1590,7 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 static void rcsi2_stop(struct rcar_csi2 *priv)
 {
 	rcsi2_enter_standby(priv);
-	v4l2_subdev_call(priv->remote, video, s_stream, 0);
+	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
 }
 
 static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)

-- 
2.43.0


