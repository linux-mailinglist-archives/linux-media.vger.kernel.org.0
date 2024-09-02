Return-Path: <linux-media+bounces-17413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DAB968F4A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAAEF1F2326E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCA718893C;
	Mon,  2 Sep 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDOOUo6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE70187852;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=Rq3uXY/iIOy3MSpcJC5BC6PDLk4VCWAe4uAY1NiwywCn+AEfcizNS2/hHs2Rsy7CjcgTkikRUrANqltYR23cRlPHCSy/a/6MtXW6LitEBbAS84MHiT+p1z01jwjWrwpn1lu+9pDJ/Y5KNzRLuaRrHN2BjyJDUj3f62IipT36zoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=BdlvCXXWV7mq+oV+sxu0FqW8n03/s+nco/WQaiIhCjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz9pp2XMJouBeoeOgn0t0gio3wbAAKwho90Ob6DqTU6YlUbHUmLhcu+Tkfz/6n6hvue0mq9NwTS34vR+x2H7LNFv/Ui3aYjTAeRx+da9bqfcNoGODrI/1yMJWcQwZ+csKpmjaWj/7vewNEn5HDiRhrBVDiTHq3oZgvneXsFO7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDOOUo6Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1009C4CEC8;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=BdlvCXXWV7mq+oV+sxu0FqW8n03/s+nco/WQaiIhCjU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LDOOUo6ZLfErIqfuE+QCil/hdb3h8dbVfB5b+bLxIwj0IdCzQHyU3zqFiXf+Zs5wQ
	 oFWoUDe39L1mQz+FCuqhXN+eRZFEydgwRVa4r/K+y1xUEb34HHTibS0va7eW9MdnYJ
	 xWQJDjdg3iOXbfxjuOPgr5N7gOrMIGRqLccA7TrCyYzv1I1d7qd2RIC88t75CRvtaC
	 0dD1ortme5XcRWIjNtna+1dCbMOf9JtLtsaLnlaxcw+DB5VpZBRzYrTzG5IvAgGRJ6
	 poZIDNWS0Fc6OxUJOWkWzqKMQ616UHIfVJwK1etL0+2EcP1Y6SDSPEW018R7hWnSI/
	 3twLCYE4le+zA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EDDCD13CF;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:38 +0200
Subject: [PATCH 11/13] media: i2c: imx214: Add analogue/digital gain
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-11-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=9555;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=jWDQZugqko4LD/2y+dp/dp+IWFKd3VrZTfIM1Aovn4c=;
 b=NGYU8GqBZtKrV4uDmu9lCzvty31mcPn54/aCufcxRTteHZKReX+KKLtl7Z5aPgN2oQsc28AEt
 4fRxvq++EbtAN+BPy/vNDIYe9HEMilSTe6J5PUp5gmSZGlk/IvAH9VD
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The imx214 sensor supports analogue gain up to 8x and digital gain up to
16x. Implement the corresponding controls in the driver. Default gain
values are not modified by this patch.

Signed-off-by: André Apitzsch <git@apitzsch.eu>

---

With the analogue gain control added by this patch, the kernel log shows
the following message when closing megapixels and a similar one when
closing qcam (from libcamera):

[  100.042856] ------------[ cut here ]------------
[  100.042886] WARNING: CPU: 4 PID: 3444 at drivers/media/common/videobuf2/videobuf2-core.c:2182 __vb2_queue_cancel+0x228/0x2c0 [videobuf2_common]
[  100.042948] Modules linked in: rfcomm zstd zstd_compress zram zsmalloc rpmsg_wwan_ctrl q6voice_dai q6asm_dai q6voice q6afe_dai q6routing q6cvs q6adm q6asm q6cvp q6mvm snd_q6dsp_common q6voice_common q6afe q6core apr pdr_interface nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink algif_hash algif_skcipher af_alg bnep qcom_pd_mapper qcom_pdr_msg wcn36xx btqcomsmd btqca ipv6 wcnss_ctrl qcom_bam_dmux imx214 v4l2_cci ledtrig_pattern bmi160_i2c ak8975 leds_ktd202x bmi160_core ltr501 leds_sy7802 qcom_wcnss_pil qcom_camss qcom_q6v5_mss snd_soc_msm8916_digital snd_soc_msm8916_analog pm8xxx_vibrator v4l2_fwnode qcom_pil_info videobuf2_dma_sg qcom_common qcom_q6v5 videobuf2_memops videobuf2_v4l2 videobuf2_common i2c_qcom_cci leds_sgm3140 v4l2_flash_led_class led_class_flash v4l2_async videodev qcom_memshare mc usb_f_ncm u_ether panel_longcheer_truly_nt35695 atmel_mxt_ts smb1360 msm mdt_loader drm_exec drm_display_he
 lper gpu_sched libcomposite
[  100.043688] CPU: 4 UID: 10000 PID: 3444 Comm: megapixels Not tainted 6.11.0-rc3-msm8916 #312
[  100.043716] Hardware name: BQ Aquaris M5 (Longcheer L9100) (DT)
[  100.043730] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  100.043756] pc : __vb2_queue_cancel+0x228/0x2c0 [videobuf2_common]
[  100.043787] lr : __vb2_queue_cancel+0x28/0x2c0 [videobuf2_common]
[  100.043815] sp : ffff80008450ba50
[  100.043826] x29: ffff80008450ba50 x28: 0000000000000001 x27: ffff00000f946180
[  100.043867] x26: 0000000000000000 x25: ffff00000f946780 x24: ffff00000f946910
[  100.043906] x23: ffff00000175a620 x22: ffff0000036ddc90 x21: ffff0000036e4410
[  100.043946] x20: ffff0000036e44b8 x19: ffff0000036e4410 x18: ffff80008450ba98
[  100.043985] x17: ffffffffffffffff x16: 0000000000000000 x15: 0000000000000040
[  100.044023] x14: 0256932925642338 x13: ffff00000f946200 x12: 0000000000000001
[  100.044062] x11: ffff00000f946200 x10: 0000000000000a20 x9 : 0000000000000000
[  100.044100] x8 : ffff0000bf964880 x7 : 0000000000000020 x6 : 0000000000000100
[  100.044138] x5 : ffff0000036e4b68 x4 : 0000000000000000 x3 : ffff00000f946180
[  100.044176] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 000000000000000f
[  100.044214] Call trace:
[  100.044226]  __vb2_queue_cancel+0x228/0x2c0 [videobuf2_common]
[  100.044257]  vb2_core_queue_release+0x20/0x74 [videobuf2_common]
[  100.044285]  _vb2_fop_release+0x68/0xb0 [videobuf2_v4l2]
[  100.044314]  vb2_fop_release+0x28/0x50 [videobuf2_v4l2]
[  100.044341]  video_release+0x20/0x40 [qcom_camss]
[  100.044406]  v4l2_release+0xb4/0xf4 [videodev]
[  100.044481]  __fput+0xbc/0x274
[  100.044510]  ____fput+0xc/0x14
[  100.044533]  task_work_run+0x78/0xc0
[  100.044563]  do_exit+0x2dc/0x8b0
[  100.044590]  do_group_exit+0x30/0x8c
[  100.044615]  get_signal+0x7b4/0x8a0
[  100.044643]  do_signal+0x94/0xd14
[  100.044672]  do_notify_resume+0xd0/0x120
[  100.044697]  el0_svc+0x44/0x60
[  100.044730]  el0t_64_sync_handler+0x118/0x124
[  100.044753]  el0t_64_sync+0x14c/0x150
[  100.044775] ---[ end trace 0000000000000000 ]---
[  100.044793] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
[  100.045722] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
[  100.046587] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active state
[  100.047439] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 3 in active state
[  100.048288] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 4 in active state
[  100.049242] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 5 in active state
[  100.050098] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 6 in active state
[  100.050945] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 7 in active state
[  100.051793] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 8 in active state
[  100.052692] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 14 in active state
[  100.053548] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 15 in active state
[  100.054396] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 16 in active state
[  100.055244] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 17 in active state
[  100.056137] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 18 in active state
[  100.056988] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 19 in active state

From the log it looks like the cause is in some other module and not in
the imx214 driver, that's why the patch wasn't dropped from this series.
---
 drivers/media/i2c/imx214.c | 53 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4a1433728cd5..ce6d8a90f4a1 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -53,12 +53,20 @@
 /* Analog gain control */
 #define IMX214_REG_ANALOG_GAIN		CCI_REG16(0x0204)
 #define IMX214_REG_SHORT_ANALOG_GAIN	CCI_REG16(0x0216)
+#define IMX214_ANA_GAIN_MIN		0
+#define IMX214_ANA_GAIN_MAX		448
+#define IMX214_ANA_GAIN_STEP		1
+#define IMX214_ANA_GAIN_DEFAULT		0x0
 
 /* Digital gain control */
 #define IMX214_REG_DIG_GAIN_GREENR	CCI_REG16(0x020e)
 #define IMX214_REG_DIG_GAIN_RED		CCI_REG16(0x0210)
 #define IMX214_REG_DIG_GAIN_BLUE	CCI_REG16(0x0212)
 #define IMX214_REG_DIG_GAIN_GREENB	CCI_REG16(0x0214)
+#define IMX214_DGTL_GAIN_MIN		0x0100
+#define IMX214_DGTL_GAIN_MAX		0x0fff
+#define IMX214_DGTL_GAIN_DEFAULT	0x0100
+#define IMX214_DGTL_GAIN_STEP		1
 
 #define IMX214_REG_ORIENTATION		CCI_REG8(0x0101)
 
@@ -271,13 +279,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
-	{ IMX214_REG_ANALOG_GAIN, 0 },
-	{ IMX214_REG_DIG_GAIN_GREENR, 256 },
-	{ IMX214_REG_DIG_GAIN_RED, 256 },
-	{ IMX214_REG_DIG_GAIN_BLUE, 256 },
-	{ IMX214_REG_DIG_GAIN_GREENB, 256 },
-	{ IMX214_REG_SHORT_ANALOG_GAIN, 0 },
-
 	{ CCI_REG8(0x4170), 0x00 },
 	{ CCI_REG8(0x4171), 0x10 },
 	{ CCI_REG8(0x4176), 0x00 },
@@ -327,13 +328,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
-	{ IMX214_REG_ANALOG_GAIN, 0 },
-	{ IMX214_REG_DIG_GAIN_GREENR, 256 },
-	{ IMX214_REG_DIG_GAIN_RED, 256 },
-	{ IMX214_REG_DIG_GAIN_BLUE, 256 },
-	{ IMX214_REG_DIG_GAIN_GREENB, 256 },
-	{ IMX214_REG_SHORT_ANALOG_GAIN, 0 },
-
 	{ CCI_REG8(0x4170), 0x00 },
 	{ CCI_REG8(0x4171), 0x10 },
 	{ CCI_REG8(0x4176), 0x00 },
@@ -757,6 +751,18 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
+{
+	int ret = 0;
+
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_GREENR, val, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_RED, val, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_BLUE, val, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_GREENB, val, &ret);
+
+	return ret;
+}
+
 static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx214 *imx214 = container_of(ctrl->handler,
@@ -788,6 +794,15 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(imx214->regmap, IMX214_REG_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		cci_write(imx214->regmap, IMX214_REG_SHORT_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = imx214_update_digital_gain(imx214, ctrl->val);
+		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val, &ret);
 		break;
@@ -834,7 +849,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 10);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 12);
 	if (ret)
 		return ret;
 
@@ -871,6 +886,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 					     IMX214_EXPOSURE_STEP,
 					     exposure_def);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  IMX214_ANA_GAIN_MIN, IMX214_ANA_GAIN_MAX,
+			  IMX214_ANA_GAIN_STEP, IMX214_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  IMX214_DGTL_GAIN_MIN, IMX214_DGTL_GAIN_MAX,
+			  IMX214_DGTL_GAIN_STEP, IMX214_DGTL_GAIN_DEFAULT);
+
 	imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
 	if (imx214->hflip)

-- 
2.46.0



