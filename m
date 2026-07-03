Return-Path: <linux-media+bounces-66446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +NpOKOGIR2pDaQAAu9opvQ
	(envelope-from <linux-media+bounces-66446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:03:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DB700EFF
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:03:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=vHrE632g;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66446-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66446-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF3D630DFB9E
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533463B5846;
	Fri,  3 Jul 2026 09:55:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80637E316;
	Fri,  3 Jul 2026 09:54:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072502; cv=none; b=fdzYYYN7urmFx1NEf2JldNWPRKKtyaDNV6335+lFyt65EJW5gb00NHM1rjjS57an+OAanZ3bcip8WB3EHdgal9tH9/RuBSbaR1znl0Uurg9WxWmGWp16l76HXZMnfyanexaL1JBNSxZQPuXjbxuiOSQ6KeIk6HxQIXWWLrFju2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072502; c=relaxed/simple;
	bh=tNPHgFl7kJp15sCoVSx6eG1N/VTSJRodYiHIYrBcMLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmjCsqyeN/YdrGBYTIPvvlyHobY9olrxQ2Qzq8maYZ0SQI7to1rYeb44XrPQn5feN6fvWfOOxmQWWEGIkoa7ArtiAbIBrld2bbmaQj2fFfLyXXDVwvPk78aL+0zWZ0PJlYAVMEMGsPQVsgQ/dLax8tyATOWz0IpbUVONpOdW/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vHrE632g; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D8E311DD;
	Fri,  3 Jul 2026 11:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072443;
	bh=tNPHgFl7kJp15sCoVSx6eG1N/VTSJRodYiHIYrBcMLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vHrE632g1SYLRi8rje1xi9RW9qmMh3PhEchqybYzdoSgrOOQbMVPVOO6TMYfwu++D
	 0kU+jcFihvPtskkF7glMde7m4QLc/VyNWuUZMAOjD2fdjxuG5zhXZKuJr3o4lJcJ7N
	 NQhNf+4LfETBWUs8sD3x1RzO0lRS4L4XTrtiRQyQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:08 +0530
Subject: [PATCH RFC 03/10] media: i2c: imx678: Add .get_frame_desc() hook
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-3-7c4924a0df05@ideasonboard.com>
References: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
In-Reply-To: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=tNPHgFl7kJp15sCoVSx6eG1N/VTSJRodYiHIYrBcMLI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bMpnEm5NSRkZnNVUS93z6A8XeIOUdy7yAyq
 8YFXFtJLkuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGzAAKCRBD3pH5JJpx
 Rd6vD/9BtC0yAvJ2emozzPwby47rthSR593pG7UmVGhoLW9DtFtc/WJxqiughj9TEW/v64jRaBr
 qWNt4ZUS6hTSdkjfrBT4VjOJ3xRqfaW2/glZHWbjrgzDF53wy2EQSgN6iSF9x1K5NgFgGvsZpQ4
 qDpWujoAmjPNj4Tdt5rbugZW1nCmc5dzPOZxQva2w4BE+TKbWVd+OZb5CtZydXYgcdg6P/CZW1E
 qpVMlkzbCZQDPzVvz6946vqY451oQKtcivZaE8mvHGKMnHM1nQPMMPjQSI6Ws7oOvauJY9kqrH4
 ko7sqkMLeH0BAgaZEomGLA7J7suyqZVOnumbBlXadYZcP/d0JtwhsEgPFQATRajo4TgKN3Ro3AV
 +CotBMb7Qc6+kriWZ546tDK1K25goewTZvOJZfGYNtRjLUvZkQIFcSz33fSdCuzq4vDU7DMOfRO
 paqFTFQkpDQO8fZ4S5RyHJNoOkScpsSi0YdFjVDhfwOnO+DkfHRSrjUiw9+wijWXhLgdCR11ChQ
 45Rhodd430gERkkxpyifNGLltcLYwtMwa5hzBJ3L/rC7vpy+hFg6VTB/mDiHSKB5iCNp5da01Gz
 vHbdW++GvnF0JmVP7EfCpspRCGik41THRGpBgUSJXpkgGTO5LTmOoeCX7N1rP+h2tDZlBqBGh5v
 dEegpPo20allq9g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66446-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D2DB700EFF

Downstream elements, like CSI bridge drivers, need to know the MIPI CSI
virtual channel and data type to filter and route the incoming streams.

Add the required .get_frame_desc() hook they can call.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index fb260ce6f5d9..51c5487fa1af 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -820,6 +821,29 @@ static const struct v4l2_ctrl_ops imx678_ctrl_ops = {
 	.s_ctrl = imx678_set_ctrl,
 };
 
+static int imx678_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != IMX678_SOURCE_PAD)
+		return -EINVAL;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+	fd->entry[0].stream = IMX678_STREAM_IMAGE;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_RAW12;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, pad, IMX678_STREAM_IMAGE);
+	fd->entry[0].pixelcode = fmt->code;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
 static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1213,6 +1237,7 @@ static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
 	.set_fmt = v4l2_subdev_get_fmt_ci,
 	.get_selection = imx678_get_selection,
 	.enum_frame_size = imx678_enum_frame_size,
+	.get_frame_desc = imx678_get_frame_desc,
 	.enable_streams = imx678_enable_streams,
 	.disable_streams = imx678_disable_streams,
 };

-- 
2.54.0


