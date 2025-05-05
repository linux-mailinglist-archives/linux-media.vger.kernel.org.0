Return-Path: <linux-media+bounces-31799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845FAAB37A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2E93B1BCC
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A43B23AE87;
	Tue,  6 May 2025 00:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vd7EM44v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1328853E;
	Mon,  5 May 2025 23:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486312; cv=none; b=tp9hcMP03oz7d7gJQCtvxGvOvbmD4+LimKMfWV0/gvawb77yswkzt44OWzl+tzoNzjs19786L60da5rka43biAIdwodC0ZtbovFhYHuNihT84KXzrh4xfJ5XKEWtV07zcd+oSX6AdUSsARlTnK/AsEpntxAgNdlQ5G35RpFg+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486312; c=relaxed/simple;
	bh=fnPv1ivXF5Wy4niLq+LVRNLF7KRwPeRJVCaZmA7WfCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l8XegGYLuG1rvUeoQOwlrKmT6/1OcVhzt7z4Nhi+hUHHr0Rdw4XPizhNpVuYqos1Rn6nGu4SrJCfrfxesG6NWejkdOI9aXvtguu1L2V0ce71cUXLyVnZYcvcoHjqhkIkRkb9Ar+aKsSuzuNMPsWN3yA8diCwLZN4FJznWiI1C7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vd7EM44v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F149C4CEF1;
	Mon,  5 May 2025 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486312;
	bh=fnPv1ivXF5Wy4niLq+LVRNLF7KRwPeRJVCaZmA7WfCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vd7EM44vHxisd6tpwlBC4DX2UbyX/NrKHGB2DlmTS4JNlK1Ue/LKdh6VMZNCPAUax
	 aapoUMpSNtPP+VmdmkjBUMeRwfGQKmvYRZDqrte+pePo1+D7DOYQhGW/RjM68yDHEI
	 MCBqyexofmR29Bw6mfllU2JNhzt/CvSZ1nSjN0CNDILW+WrwDCVBaxoIB5QZLeBsY2
	 mpVsnA+cORZj/jDGdvl28hwSnA+SURDrho1//rOu/Ah+maqDmCMoSj/zC2CuqpE7oS
	 dWViHvccIL6ktPkDsS7gwoXsRWNCacXcYRd1CJ29IpTruWdBihni55g+WmT9q0HhaX
	 xV5HgAUr7+cbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Depeng Shao <quic_depengs@quicinc.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 254/294] media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is available
Date: Mon,  5 May 2025 18:55:54 -0400
Message-Id: <20250505225634.2688578-254-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Depeng Shao <quic_depengs@quicinc.com>

[ Upstream commit 2f1361f862a68063f37362f1beb400e78e289581 ]

There is no CSID TPG on some SoCs, so the v4l2 ctrl in CSID driver
shouldn't be registered. Checking the supported TPG modes to indicate
if the TPG hardware exists or not and only registering v4l2 ctrl for
CSID only when the TPG hardware is present.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 60 +++++++++++--------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 6360314f04a63..b90e2e690f3aa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -239,11 +239,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
-		if (ret < 0) {
-			dev_err(csid->camss->dev,
-				"could not sync v4l2 controls: %d\n", ret);
-			return ret;
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
+			ret = v4l2_ctrl_handler_setup(&csid->ctrls);
+			if (ret < 0) {
+				dev_err(csid->camss->dev,
+					"could not sync v4l2 controls: %d\n", ret);
+				return ret;
+			}
 		}
 
 		if (!csid->testgen.enabled &&
@@ -318,7 +320,8 @@ static void csid_try_format(struct csid_device *csid,
 		break;
 
 	case MSM_CSID_PAD_SRC:
-		if (csid->testgen_mode->cur.val == 0) {
+		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
+		    csid->testgen_mode->cur.val == 0) {
 			/* Test generator is disabled, */
 			/* keep pad formats in sync */
 			u32 code = fmt->code;
@@ -368,7 +371,8 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 
 		code->code = csid->formats[code->index].code;
 	} else {
-		if (csid->testgen_mode->cur.val == 0) {
+		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
+		    csid->testgen_mode->cur.val == 0) {
 			struct v4l2_mbus_framefmt *sink_fmt;
 
 			sink_fmt = __csid_get_format(csid, sd_state,
@@ -750,7 +754,8 @@ static int csid_link_setup(struct media_entity *entity,
 
 		/* If test generator is enabled */
 		/* do not allow a link from CSIPHY to CSID */
-		if (csid->testgen_mode->cur.val != 0)
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED &&
+		    csid->testgen_mode->cur.val != 0)
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
@@ -843,24 +848,27 @@ int msm_csid_register_entity(struct csid_device *csid,
 		 MSM_CSID_NAME, csid->id);
 	v4l2_set_subdevdata(sd, csid);
 
-	ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
-	if (ret < 0) {
-		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
-		return ret;
-	}
+	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
+		ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
+		if (ret < 0) {
+			dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
+			return ret;
+		}
 
-	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
-				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				csid->testgen.nmodes, 0, 0,
-				csid->testgen.modes);
+		csid->testgen_mode =
+			v4l2_ctrl_new_std_menu_items(&csid->ctrls,
+						     &csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
+						     csid->testgen.nmodes, 0, 0,
+						     csid->testgen.modes);
 
-	if (csid->ctrls.error) {
-		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
-		ret = csid->ctrls.error;
-		goto free_ctrl;
-	}
+		if (csid->ctrls.error) {
+			dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
+			ret = csid->ctrls.error;
+			goto free_ctrl;
+		}
 
-	csid->subdev.ctrl_handler = &csid->ctrls;
+		csid->subdev.ctrl_handler = &csid->ctrls;
+	}
 
 	ret = csid_init_formats(sd, NULL);
 	if (ret < 0) {
@@ -891,7 +899,8 @@ int msm_csid_register_entity(struct csid_device *csid,
 media_cleanup:
 	media_entity_cleanup(&sd->entity);
 free_ctrl:
-	v4l2_ctrl_handler_free(&csid->ctrls);
+	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
+		v4l2_ctrl_handler_free(&csid->ctrls);
 
 	return ret;
 }
@@ -904,5 +913,6 @@ void msm_csid_unregister_entity(struct csid_device *csid)
 {
 	v4l2_device_unregister_subdev(&csid->subdev);
 	media_entity_cleanup(&csid->subdev.entity);
-	v4l2_ctrl_handler_free(&csid->ctrls);
+	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
+		v4l2_ctrl_handler_free(&csid->ctrls);
 }
-- 
2.39.5


