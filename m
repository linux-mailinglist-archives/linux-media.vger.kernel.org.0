Return-Path: <linux-media+bounces-58855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LTEA/yT4GmsjwAAu9opvQ
	(envelope-from <linux-media+bounces-58855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:47:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2440B2C8
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FA6A31564A7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F2838C2D4;
	Thu, 16 Apr 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="gQbki9GP"
X-Original-To: linux-media@vger.kernel.org
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F375381AEA;
	Thu, 16 Apr 2026 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776325432; cv=none; b=jL/jKEHMdUM4Tsk62M0DGZOUC0zFjAV7YSsBPHJoYXRMiknXVdPtVys6E6e9mfWoZLeuOoEVTVPkA7ZKM42NGXfHN2MER6/vtb9QU4jdttbjikuwuQBUjgD92zDYyU8m7I8I/03QFkvgp+8AYd24Pt0KBva9Cp+hOd13pxfiyxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776325432; c=relaxed/simple;
	bh=+ecJ534F8dsoaoexMA/rS7Psg5FFmu6fbhdoOq8uN5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euYW7MDToIHO4dOygXHGzTXJy5lBFzGBeCKuBNErUxKO5pRrAH0c8cTjGVRTTfKqgM6R98n9LmpVjWkyzzzvr7+E+8orHfjmrTrCmU7UFXD60EVhx8xoNjG0nDw2VXfRou7uiPLd5a0e1I78ipqtYa79L8c/XucuxHZ+0TTWI+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=gQbki9GP reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776324880; bh=+ecJ534F8dsoaoexMA/rS7Psg5FFmu6fbhdoOq8uN5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQbki9GPXeXl3OBsMhW+nXstvxFWjXrFoBuGHpZ5lgEIzyEKXmM51jbx532Jb4SPk
	 vj4mC+/ZNfL31W8527yXYIQDGzl1l6ljydu66UldrvzcizTOCyV2+gMB79kRzvXonv
	 NvnkT5pMrM90XlZk71Nrn/9Qiz5880ccpTNQV2dxFRR5OnAVNrvI4LG9e6810BOcwm
	 0mWThNyFNSWb99zPxfThoKOvTXiIQiYwUzfad0WvWKW1QIPrwLtK86Z+5t1ZrWmr2c
	 IrbxKcJBK69t3L9JAROjCL5yhZWWbOHbfsl0lw4iBdPShtgNrEVMJrZW65nFSFUOM+
	 ScAIgMiA0NRkA==
Received: from jovis.fritz.box (p54909809.dip0.t-ipconnect.de [84.144.152.9])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 2B6C92201E0A;
	Thu, 16 Apr 2026 09:34:40 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id E0CAB5F; Thu, 16 Apr 2026 09:34:39 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: Handle SENSOR_HV7131R
Date: Thu, 16 Apr 2026 09:34:32 +0200
Message-ID: <e7f8b8998a22b883bce0b41ebb804f6319d75a3d.1776323993.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776323993.git.pmhahn@pmhahn.de>
References: <cover.1776323993.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pmhahn.de : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[pmhahn.de:s=202501];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58855-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[pmhahn.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pmhahn@pmhahn.de,linux-media@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.333];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pmhahn.de:mid,pmhahn.de:email]
X-Rspamd-Queue-Id: D1D2440B2C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I found an old USB webcam 0c45:602d Microdia VideoCAM ExpressII. `vlc`
triggered an OOPS as soon as I opened the device:

> BUG: kernel NULL pointer dereference, address: 0000000000000068
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 8 UID: 1000 PID: 19655 Comm: vlc Tainted: G           O       6.12.74+deb13+1-amd64 #1  Debian 6.12.74-2
> Tainted: [O]=OOT_MODULE
> Hardware name: Micro-Star International Co., Ltd. MS-7B89/B450M MORTAR MAX (MS-7B89), BIOS 2.P1 09/18/2025
> RIP: 0010:do_autogain+0x7d/0x100 [gspca_sonixb]
> Code: 74 21 0f af 90 c4 00 00 00 89 d0 48 63 d2 48 69 d2 09 04 02 81 48 c1 ea 20 01 c2 c1 f8 1f c1 fa 06 29 c2 48 8b 83 48 06 00 00 <48> 81 78 68 f3 01 00 00 7f 34 48 89 df e8 41 f1 3b 00 85 c0 74 07

(The out-of-tree-module is v4l2-loopback.)

Adding addition debug information I found out, that the cam is based on
an SENSOR_HV7131R:

> gspca_main: sonixb-2.14.0 probing 0c45:602d
> sonixb 1-3:1.0: sd_config(sensor=01 bridge=00)

In case of an SENSOR_HV7131R `gspca_dev->exposure` is not setup.
Enabling auto-gain will result in the above OOPS.

1. Check for `gspca_dev->exposure != NULL` before dereferencing it.

Even after that there's 2nd OOPS:

> BUG: kernel NULL pointer dereference, address: 0000000000000034
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 1 UID: 1000 PID: 709 Comm: vlc Tainted: G            E       7.0.0+ #6 PREEMPT(lazy)
> Tainted: [E]=UNSIGNED_MODULE
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 2025.02-8+deb13u1 11/08/2025
> RIP: 0010:v4l2_ctrl_g_ctrl+0x36/0x80 [videodev]
> Code: 20 65 48 8b 05 63 17 b1 c8 48 89 44 24 18 31 c0 c7 44 24 14 00 00 00 00 48 c7 44 24 04 00 00 00 00 48 c7 44 24 0c 00 00 00 00 <f6> 47 34 20 74 2e 48 8d 74 24 04 c7 44 24 10 00 00 00 00 e8 72 fd

This is caused by v4l2_ctrl_g_ctrl() dereferencing gspca_dev->autogain,
which remains NULL as gspca_dev->exposure is NULL.

Check for `gspca_dev->autogain != NULL` before dereferencing it via
gspca_expo_autogain().

Signed-off-by: Philipp Matthias Hahn <pmhahn@pmhahn.de>
---
 drivers/media/usb/gspca/sonixb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
index 4d655e2da9cb..9a9aba5a35de 100644
--- a/drivers/media/usb/gspca/sonixb.c
+++ b/drivers/media/usb/gspca/sonixb.c
@@ -900,11 +900,11 @@ static void do_autogain(struct gspca_dev *gspca_dev)
 	if (sd->brightness)
 		desired_avg_lum = sd->brightness->val * desired_avg_lum / 127;
 
-	if (gspca_dev->exposure->maximum < 500) {
+	if (gspca_dev->exposure && gspca_dev->exposure->maximum < 500) {
 		if (gspca_coarse_grained_expo_autogain(gspca_dev, avg_lum,
 				desired_avg_lum, deadzone))
 			sd->autogain_ignore_frames = AUTOGAIN_IGNORE_FRAMES;
-	} else {
+	} else if (gspca_dev->autogain) {
 		int gain_knee = (s32)gspca_dev->gain->maximum * 9 / 10;
 		if (gspca_expo_autogain(gspca_dev, avg_lum, desired_avg_lum,
 				deadzone, gain_knee, sd->exposure_knee))
@@ -927,6 +927,8 @@ static int sd_config(struct gspca_dev *gspca_dev,
 	sd->sensor = id->driver_info >> 8;
 	sd->bridge = id->driver_info & 0xff;
 
+	dev_info(gspca_dev->v4l2_dev.dev, "sd_config(sensor=%02x bridge=%02x)\n", sd->sensor, sd->bridge);
+
 	cam = &gspca_dev->cam;
 	if (!(sensor_data[sd->sensor].flags & F_SIF)) {
 		cam->cam_mode = vga_mode;
@@ -958,7 +960,7 @@ static int sd_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	gspca_dev->usb_err = 0;
 
-	if (ctrl->id == V4L2_CID_AUTOGAIN && ctrl->is_new && ctrl->val) {
+	if (ctrl->id == V4L2_CID_AUTOGAIN && ctrl->is_new && ctrl->val && gspca_dev->exposure) {
 		/* when switching to autogain set defaults to make sure
 		   we are on a valid point of the autogain gain /
 		   exposure knee graph, and give this change time to
@@ -976,7 +978,7 @@ static int sd_s_ctrl(struct v4l2_ctrl *ctrl)
 		setbrightness(gspca_dev);
 		break;
 	case V4L2_CID_AUTOGAIN:
-		if (gspca_dev->exposure->is_new || (ctrl->is_new && ctrl->val))
+		if ((gspca_dev->exposure && gspca_dev->exposure->is_new) || (ctrl->is_new && ctrl->val))
 			setexposure(gspca_dev);
 		if (gspca_dev->gain->is_new || (ctrl->is_new && ctrl->val))
 			setgain(gspca_dev);
-- 
2.47.3


