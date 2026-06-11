Return-Path: <linux-media+bounces-64560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U8mbEPp8KmrFqwMAu9opvQ
	(envelope-from <linux-media+bounces-64560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:16:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A7B670519
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:16:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=kwbQx1kx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64560-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64560-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E94E300AD55
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB1F3BE17D;
	Thu, 11 Jun 2026 09:13:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC93BE15F;
	Thu, 11 Jun 2026 09:13:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169219; cv=none; b=oyDnHKpDRJwIg9NZzrPTE+Jmlcc9FgSgLyulefU1O9jDry6ziVH9JcojiRpcPbrUIrfz31upaeCB97pd04Ees/0vvc1zBkCIvXkfssUwCj1J2MbHs/yKXqEp7urtHSzeKetnpJHxRTe8NoPXK+S0QjhZPxpIi/lcYWQ9nnlvRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169219; c=relaxed/simple;
	bh=z+zrxu3X3RJuR5mwJ/VmetqFmxDQTmedxJxh/Qzh9a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CPMvEWbJF/YWBog0/WicMn4d7pCY6lfoCQWOaPSHIDdgnLoKyNaZLya4VKV4NLurjEO9b0sjyk8DgtLW/P20/wrzX6tvbZTYL36mxPKslZ1MRoWExNvDEOy8JyhbvIvycTF/wQDMkBjTMUluzAMhPNL7Etg34TLnr6Ne2K0Ichs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kwbQx1kx; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41F30673;
	Thu, 11 Jun 2026 11:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781169185;
	bh=z+zrxu3X3RJuR5mwJ/VmetqFmxDQTmedxJxh/Qzh9a0=;
	h=From:Date:Subject:To:Cc:From;
	b=kwbQx1kx2fIPg+5/j0wrkNKRnRtmhaS3HrMhJzsm/6oKFnReVAb/cQmx90uVV+sO5
	 hRgR80gEYZ1zmXfTlqQbV6Sa4PTRkUUUS9tX5OVYzyS/WU19L4hFOlgYB9ZJXchftn
	 3RKOhpcoqrb2Ibb7sSwPbptG7otdtaESJ6iyPpk4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 11 Jun 2026 12:13:02 +0300
Subject: [PATCH] media: imx219: Report streams using frame descriptors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAB18KmoC/yXMQQqDQAxA0atI1g2YFAW9SunCyWQ0grZM2iKId
 +/YLt/i/x1cs6lDX+2Q9WNuj7WALhXINKyjosVi4JrbuiVCWzamDlMeFsWoLtiJMF8DpRAbKN0
 za7Lt97zd//Z3mFVe5wiO4wt4HEE7dQAAAA==
X-Change-ID: 20260611-imx219-frame-desc-9cc223b1fbd5
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3481;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bqjbSI0SS/VcBriYHrlJETmUzhUGTnT4PivJUU3117U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqKnw7cGI790FN+RV3nA2fexDCXUHyrbOkRYBfV
 T9sGVUs/cyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaip8OwAKCRD6PaqMvJYe
 9V8pD/wNh/SoKwLrixomhWFnTlk0zXMpmDqVLUMyYx1slgaFREQRcnrakFIhxue+Ja+uUahYDpg
 YwKlTYKAlpP3BUiwBocs3mUsgAg1ZBX7pC/WqZ7ezKEj/SSAxx9/MY3aTEpul5m4HIcJFFllJYr
 4QcM3Q1FPX7k7eJHCvz/7Wnne+V0x8Jg2IJeuADN58y+5/ZY5AZKkmcdzfx+biMENubo60oOc0O
 gjTz9eRJP+w4/5d3/FCyGYLUSb8BEdbdZnDZM1rFl4tZAb6LwB6eTqNlf3WRGf6nNMplCj2Bvgi
 oyNpeQfTsUl7XJN4+jmguNMmFeNJhFZOcDx+7TIBd7Qa7KvchwI7nxAAGEfhZl4M1hcFNiPBEvK
 s8L+E/2OMEgoLfD1ROmZ+hd9XHexVLI1pAX7hO8vsFKCOEMdxnUaADkVWkWg7U+uFNfunagF8X5
 f+N9sln4yvGPRu0V88nZ4nuHzC+zvhdJTastsW2m9T8MhhCB6ft+nBqj/Ja8dI+e2MHXeRHwzWX
 FhB27M3H/M7Mgq0QhabI96MVd1IDvYds6s6Ryh7Z/8uwqFy9JpJuu6L/Q0EqdVYlKuFybjdfQIP
 pMZ4iaNVgUp6zXis36OITHHAfwW8PdU++YaO0kDbfiFeU04FC2PrTTQfO99fvDTZgOjxPm4DYG8
 M/UkGclPt8VsfWA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64560-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50A7B670519

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
[tomi.valkeinen: picked from "Generic line based metadata support, internal pads" series]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
This patch that adds .get_frame_desc() support to imx219 driver has been
circulating for a few years, and is currently posted in "[PATCH v12
00/86] Generic line based metadata support, internal pads" series.

However, as some bridge drivers require modern drivers that support
.get_frame_desc, specifically ds90ub960.c, let's pick the patch and
queue it separately from the huge metadata series.
---
 drivers/media/i2c/imx219.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753cc93..7829ddc115a0 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -661,6 +662,24 @@ static void imx219_free_controls(struct imx219 *imx219)
  * Subdev operations
  */
 
+static unsigned int imx219_format_bpp(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return 8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return 10;
+	}
+}
+
 static int imx219_set_framefmt(struct imx219 *imx219,
 			       struct v4l2_subdev_state *state)
 {
@@ -969,6 +988,30 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	code = fmt->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
+		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -995,6 +1038,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 	.enable_streams = imx219_enable_streams,
 	.disable_streams = imx219_disable_streams,
 };

---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260611-imx219-frame-desc-9cc223b1fbd5

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


