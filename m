Return-Path: <linux-media+bounces-56257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDbiLl48u2lmhQIAu9opvQ
	(envelope-from <linux-media+bounces-56257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD02C3F65
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C20AC3022E29
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42BB393DC8;
	Wed, 18 Mar 2026 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ncXdjOht"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CC6392C34;
	Wed, 18 Mar 2026 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878363; cv=none; b=fppgoh8csdz79gMnNm84ZqYF4hxlzhVmWXxWQSwFojJJe8XKcUtj+rsIooJ/lqGtzoOR6azx6lyhnVOMkpzmYEIKdtNpdYZ4UggHnYAT7SrzAvYLH8iUR9jnL2WIBr2uujdvYUhsD6aHq7CMkgRzOw1ONx4cj18tXDGqXxxoFHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878363; c=relaxed/simple;
	bh=bXPhOHoWQTTxra5PQc0Jj701/2uWHLHu8dGbjsoPzfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVDXXtVLoM/t7ocjQ3sx5RX5LtgYdFviWb8MzIsqCSclgOL4fL0jnupIzjBCThV8fjthOj+o8PwYywztpzBWJfBsq1FyBFJBwNYsLTId7OnF2nvMx80JKMS/boL2bNmCmnfh4soVbssADkTOU2dQxMX1MIQI02erYfJahceD5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ncXdjOht; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 076F81777;
	Thu, 19 Mar 2026 00:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878284;
	bh=bXPhOHoWQTTxra5PQc0Jj701/2uWHLHu8dGbjsoPzfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ncXdjOht8A2EtMR64sPvrbBDCkKpD2w9yOq1Lv3ypxLFEaX4RSpk3B5Rs5f33qf/q
	 1pFrSyqgl9wO0LD9hn/Gj8VBXfb7S3F1DhqsabiBdqN/QuSTOce4fDZkJEg1V67IdF
	 uGJHa5kLP+tkRM7GJS0D2BKavAnPtllNUv3AD8e8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 06/13] media: renesas: vsp1: rwpf: Fix media bus code and frame size enumeration
Date: Thu, 19 Mar 2026 01:59:00 +0200
Message-ID: <20260318235907.831556-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56257-lists,linux-media=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 92BD02C3F65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RWPF can't freely convert between all input and output formats. They
support RGB <-> YUV conversion, but HSV formats can't be converted. Fix
the media bus code and frame size enumeration to take this into account
on the source pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v1:

- Replace hardcoded pad number with RWPF_PAD_SINK
---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 80 +++++++++++++++++--
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index ccc7608f538d..c9e6fb98f863 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -18,29 +18,97 @@
  * V4L2 Subdevice Operations
  */
 
+/* Keep HSV last. */
 static const unsigned int rwpf_codes[] = {
+	MEDIA_BUS_FMT_AYUV8_1X32,
 	MEDIA_BUS_FMT_ARGB8888_1X32,
 	MEDIA_BUS_FMT_AHSV8888_1X32,
-	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
 static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(rwpf_codes))
+	struct vsp1_entity *entity = to_vsp1_entity(subdev);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+
+	if (code->pad == RWPF_PAD_SINK)
+		return vsp1_subdev_enum_mbus_code(subdev, sd_state, code);
+
+	state = vsp1_entity_get_state(entity, sd_state, code->which);
+	if (!state)
 		return -EINVAL;
 
-	code->code = rwpf_codes[code->index];
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
-	if (code->pad == RWPF_PAD_SOURCE &&
-	    code->code == MEDIA_BUS_FMT_AYUV8_1X32)
+	guard(mutex)(&entity->lock);
+
+	/*
+	 * The RWPF supports conversion between RGB and YUV formats, but HSV
+	 * formats can't be converted.
+	 */
+	if (format->code == MEDIA_BUS_FMT_AHSV8888_1X32) {
+		if (code->index)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_AHSV8888_1X32;
+	} else {
+		if (code->index >= ARRAY_SIZE(rwpf_codes) - 1)
+			return -EINVAL;
+
+		code->code = rwpf_codes[code->index];
+	}
+
+	if (code->code == MEDIA_BUS_FMT_AYUV8_1X32)
 		code->flags = V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
 			    | V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
 
 	return 0;
 }
 
+static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct vsp1_entity *entity = to_vsp1_entity(subdev);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+
+	if (fse->pad == RWPF_PAD_SINK)
+		return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
+
+	if (fse->index)
+		return -EINVAL;
+
+	state = vsp1_entity_get_state(entity, sd_state, fse->which);
+	if (!state)
+		return -EINVAL;
+
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
+
+	guard(mutex)(&entity->lock);
+
+	/*
+	 * The RWPF supports conversion between RGB and YUV formats, but
+	 * HSV formats can't be converted.
+	 */
+	if ((format->code == MEDIA_BUS_FMT_AHSV8888_1X32) !=
+	    (fse->code == MEDIA_BUS_FMT_AHSV8888_1X32))
+		return -EINVAL;
+
+	/*
+	 * The size on the source pad is fixed and always identical to
+	 * the sink pad.
+	 */
+	fse->min_width = format->width;
+	fse->max_width = format->width;
+	fse->min_height = format->height;
+	fse->max_height = format->height;
+
+	return 0;
+}
+
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
@@ -281,7 +349,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 
 static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
 	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
-	.enum_frame_size = vsp1_subdev_enum_frame_size,
+	.enum_frame_size = vsp1_rwpf_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = vsp1_rwpf_set_format,
 	.get_selection = vsp1_rwpf_get_selection,
-- 
Regards,

Laurent Pinchart


