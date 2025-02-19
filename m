Return-Path: <linux-media+bounces-26383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28355A3C0A5
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C382A18988DE
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8091F941B;
	Wed, 19 Feb 2025 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WzMrdpWb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0A1F891D;
	Wed, 19 Feb 2025 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973006; cv=none; b=lK8BZurEBe2t85vgiCxxxkcDo9gQTafLsBYapFS6nYMWNmstzIXbW65+83K0/MU9xwhAagJxWUkG2eRgvPHKFeO7jX4ns9hWvfuu138UNRgpK5MKaMP+oFq8mWwwWcvbQSgfc5WGO8JVP+0nDZfeKWyoF+FRITZGZZ7qQYKlhak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973006; c=relaxed/simple;
	bh=vL1OANKaXYDEK1GHNVhZ9Igmc1X5JgHGxsFyphi/a3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVU+Uq8r9zIdeWt06agZskRDKMkOniNh2PXgDEHPyleSoRyBmoOyWvNMEm9gjv4xMMpvlg/j8x0F6fAgb2LdG+muITxzLYAnIObbk5xQFTlOXB8CARdbaJd/djEymn28ofSDo/lmLwlyU+HizyLZ7F7q5mbFSKvL+x/j8oWn9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WzMrdpWb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD1F31980;
	Wed, 19 Feb 2025 14:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972910;
	bh=vL1OANKaXYDEK1GHNVhZ9Igmc1X5JgHGxsFyphi/a3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WzMrdpWbku8/DC9r4jyDU278X5KXK52EZCzMG0dzaeIZdErMeE0ecrfnggJut7iYr
	 4wIurYmLHMm7YdxZl7sTKl9iBoXCpIyeqemH4Eg/vB/3vWUX++LLPJgHQuPTlekf41
	 +tyIMtgBDbS7p1BiSOyan/MFDVHx2bRMys/Z9hNA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:07 +0200
Subject: [PATCH 13/18] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-13-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=vL1OANKaXYDEK1GHNVhZ9Igmc1X5JgHGxsFyphi/a3s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF0Q2QWo/N8SvBzqo71J7n0uHTDsyh8m9Otw
 wDqdnB3HYOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdAAKCRD6PaqMvJYe
 9XevEACnJdyamtEl7qbglLToACR/jkmcU/wPCYH/t5hDEM0+TW6zWYBGQIC7e1ndQuYk1d2ncLr
 pMvMbaJKWsurp0aZ061Hw51Lz1ykyHgDurg/pk7BulVybaszrCfdhrJBnCBz3FCEYD/uFg46m8J
 e5o6oWgDtdHxE5sqMTzoxA4gYV9x1lq/XOk1Udo9F8gB4azmlzAMYOvxg6Q8bTHQD3SW1UadV34
 5f0IbzpPxFpxhdAIHx2btdKhv/Xvq7bABoaaCGn/ae9ha2mCfshReGg5o6gG7ELEZqOj61tqDR3
 pbZloPmRTevpvUXrpRxQonGRjZ+Za+cwG1nWCDLgNSyJNEDnSdJwrZkNj9ye2H0jyWOWSYdZh6o
 9sVj1/82/ruLNKR6eFQmpT3EwOn/+b6vfPyaoKaQjyhAFPplZyu88C1s9ZKowJJ6T4QVDhOjkWO
 r4pCQLhtPZLamDvpPSbS7R+sCKZVdyAfZxvNHrQFHr05yxsctK8n/jnMm5L5h1WrGWEEZQishUP
 RRfKKOL1dksiIcmYTcSwkw1t6HUcV5mkTfbkUwCkBu5CkESlhHjz+83KVWlaYzkOhwMtEcJO3rF
 lAhdy3Wp0jxNeW5Bv2VGzGIhftkqmEYfCzgKG51Yo2ESkyh7I/ZtDoJdmp607bpVDBfC9hfHGzH
 wIU9t2G24mrNX8Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add v4l2_subdev_pad_ops.get_frame_desc() implementation.

We also implement a fallback for the case where the upstream subdevice
does not implement .get_frame_desc. It assumes a single stream with VC =
0 and DT based on the configured stream mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 71836a9e063b..17ded37d5ca7 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1672,12 +1672,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
+					 unsigned int pad,
+					 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct rcar_csi2_format *format;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fd->num_entries = 1;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->entry[0].stream = 0;
+	fd->entry[0].pixelcode = fmt->code;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = format->datatype;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	if (WARN_ON(!priv->info->use_isp))
+		return -ENOTTY;
+
+	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
+		return -EINVAL;
+
+	ret = v4l2_get_frame_desc_passthrough(sd, pad, fd);
+	if (ret == -ENOIOCTLCMD)
+		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.enable_streams = rcsi2_enable_streams,
 	.disable_streams = rcsi2_disable_streams,
 
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+
+	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {

-- 
2.43.0


